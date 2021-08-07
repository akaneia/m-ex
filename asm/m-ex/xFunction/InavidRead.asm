#To be inserted at 80394bd4
.include "../../Globals.s"
.include "../Header.s"

.set SymbolMaxChar, 45

.set REG_SymbolName, 29

backup

    xFunc_Search:
    .set REG_xFuncLookup, 28
      lwz REG_xFuncLookup,OFST_XFunctionLookup(rtoc)
    # Check if this LR address in from any xFunctions
    .set REG_LoopCount, 27
    .set REG_xFuncNum, 26
    .set REG_Curr, 25
      li REG_LoopCount, 0
      lwz REG_xFuncNum,xFuncLookup_Num(REG_xFuncLookup)
      addi REG_Curr, REG_xFuncLookup, xFuncLookup_Start                  # get to xFunction ptr array
      b xFunc_Search_LoopCheck
    xFunc_Search_Loop:
    .set REG_xFunc, 24
    # get this xFunc
      lwz REG_xFunc,0x0(REG_Curr)
    # check if LR lies within this xFunctions codeblock
      lwz r3, ftX_Code(REG_xFunc)
      lwz	r4, 0x0198 (r30)        # instruction
      cmpw r4, r3
      blt xFunc_Search_LoopInc
      lwz r5, ftX_CodeSize(REG_xFunc)
      add r3, r3, r5
      cmpw r4, r3
      bgt xFunc_Search_LoopInc
        
        Symbol_Search:
        # Now find which function we're in
        .set REG_LoopCount2, 23
        .set REG_SymbolNum, 22
          li REG_LoopCount2, 0
          lwz REG_SymbolNum, ftX_DebugSymCount (REG_xFunc)
        Symbol_Search_Loop:
        .set REG_Symbol, 12
        # get this function symbol 
          lwz r3, ftX_DebugSym (REG_xFunc)
          mulli r4, REG_LoopCount2, ftX_DebugSym_Size
          add REG_Symbol, r3, r4
        # check func start
          lwz r3, ftX_Code(REG_xFunc)
          lwz r4, ftX_DebugSym_Start (REG_Symbol)
          add r3, r3, r4
          lwz	r4, 0x0198 (r30)        # instruction
          cmpw r4,r3
          blt Symbol_Search_LoopInc
        # check func end
          lwz r3, ftX_Code(REG_xFunc)
          lwz r4, ftX_DebugSym_End (REG_Symbol)
          add r3, r3, r4
          lwz	r4, 0x0198 (r30)        # instruction
          cmpw r4,r3
          bgt Symbol_Search_LoopInc

        # get func name and output it
          lwz r4, ftX_DebugSym_FuncName (REG_Symbol)
          b Output

        Symbol_Search_LoopInc:
          addi REG_LoopCount2, REG_LoopCount2, 1
        Symbol_Search_LoopCheck:
          cmpw REG_LoopCount2, REG_SymbolNum
          #blt Symbol_Search_Loop
          b Symbol_Search_Loop

    xFunc_Search_LoopInc:
      addi REG_LoopCount,REG_LoopCount,1
      addi REG_Curr,REG_Curr,xFuncLookup_Start_Size
    xFunc_Search_LoopCheck:
      cmpw REG_LoopCount,REG_xFuncNum
      blt xFunc_Search_Loop
    xFunc_Search_LoopEnd:

    DOLSearch:
    .set REG_SymbolStart, 28
    .set REG_SymbolEnd, 27
    .set REG_DOLLookup, 26
    .set REG_SymbolID, 25
    .set REG_IsLast, 24
      lwz r3, -0x5004(r13)
      cmpwi r3,0
      beq DOLSymbol_NotFound
      li REG_SymbolStart, 0
      li REG_IsLast, 0
      lwz REG_SymbolEnd,0x0(r3)
      lwz REG_DOLLookup,0x4(r3)
    # start in the middle of the symbols
      srawi r3,REG_SymbolEnd,1
      addze REG_SymbolID,r3

    DOLSymbol_Search:
    .set REG_ThisSymbol, 12
    # get this symbol
      mulli r3,REG_SymbolID,0xC
      add REG_ThisSymbol, r3, REG_DOLLookup
    # check address
      lwz r3,0x0(REG_ThisSymbol)
      lwz	r4, 0x0198 (r30)        # instruction
      cmpw r4,r3
      bge DOLSymbol_After

    DOLSymbol_Before:
    # slice in half
      mr REG_SymbolEnd, REG_SymbolID
      sub r3, REG_SymbolID, REG_SymbolStart
      cmpwi r3, 1                      
      bne DOLSymbol_BeforeCont
    # if this is 1, theres only one left
      li REG_IsLast, 1
    DOLSymbol_BeforeCont:
      srawi r3,r3,1
      addze r3,r3
      add REG_SymbolID, r3, REG_SymbolStart
      b DOLSymbol_Search

    DOLSymbol_After:
    # first check if this is the correct symbol
      lwz r3,0x4(REG_ThisSymbol)
      cmpw r4,r3
      blt DOLSymbol_Found
    # check if this was the last one
      cmpwi REG_IsLast, 1
      beq DOLSymbol_NotFound
    # move up by half
      mr REG_SymbolStart, REG_SymbolID
      sub r3, REG_SymbolEnd, REG_SymbolStart
      cmpwi r3, 1                      
      bne DOLSymbol_AfterCont
    # if this is 1, theres only one left
      li REG_IsLast, 1
    DOLSymbol_AfterCont:
      srawi r3,r3,1
      addze r3,r3
      add REG_SymbolID, r3, REG_SymbolStart
      b DOLSymbol_Search

    DOLSymbol_Found:
    # get func name and output it
      lwz REG_SymbolName, 0x8 (REG_ThisSymbol)
      cmpwi REG_SymbolName,0
      beq DOLSymbol_NotFound
      b Output   

    DOLSymbol_NotFound:
    # Get null string
      bl NullString
      mflr REG_SymbolName

Output:
# Ensure char num isnt over
  mr r3,REG_SymbolName
  branchl r12,strlen
  cmpwi r3,SymbolMaxChar
  ble Print
# Copy first X chars
  addi r3,sp,0x80
  mr r4,REG_SymbolName
  li r5,SymbolMaxChar
  branchl r12,memcpy
  addi REG_SymbolName,sp,0x80
Print:
# OSReport symbol name
  bl StackInfo
  mflr r3
  mr r4,REG_SymbolName
  branchl r12,OSReport

b Exit

StackInfo:
blrl
.string "Symbol: %s\n"
.align 2

NullString:
blrl
.string "N/A"
.align 2


Exit:
  restore
  rlwinm.	r0, r27, 0, 6, 6