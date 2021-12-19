.set OrigStackFrameSize, 0x20
.set MTXSize, 0x40
.set StackFrameSize, OrigStackFrameSize + MTXSize

.set Stack_MTX, OrigStackFrameSize + 0x0