typedef struct MyCustomSymbol
{
    int param1;
    int param2;
    int param3;
} MyCustomSymbol;

__attribute__((used))
static MyCustomSymbol mySymbol =
{
    .param1 = 0,
    .param2 = 1,
    .param3 = 2,
};