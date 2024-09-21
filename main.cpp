#include <FlexLexer.h>
#include <fstream>
#include <iostream>

#include "Token.hpp"

using namespace std;

int main(int argc, char ** argv)
{
    ifstream ifile(argv[1]);
    yyFlexLexer scanner( &ifile );

    int rc  = scanner.yylex();
    while( rc!=EOF_T )
    {
      Token t(rc, scanner.YYText());
      cout << t << endl;
      rc = scanner.yylex();
    }

    return 0;
}
