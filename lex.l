/******************************************************************
* Author: Eric Hansson
* File: lex.l
* Date: 09/27/2024
* Purpose: This code is used to look for valid tokens which is then
associted with the tokens correct type.
*******************************************************************/
%{
#include <iostream>
using namespace std;
%}

%option c++
%option noyywrap

ID          [a-zA-Z][a-z0-9A-Z]*
DIGIT       [0-9]
NZDIGIT     [1-9]
WSPACE      [\ \t\n]

%%
<<EOF>>                 {return 23;}    /*If EOF, send rc 23 */
void                    {return 24;}    /*Keyword for void, rc 24*/
int                     {return 25;}    /*Keyword for int, rc 25*/
float                   {return 26;}    /*Keyword for float, rc 26*/
begin                   {return 27;}    /*Keyword for begin, rc 27*/
end                     {return 28;}    /*Keyword for end, rc 28*/
if                      {return 29;}    /*Keyword for if, rc 29*/
then                    {return 30;}    /*Keyword for then, rc 30*/
else                    {return 31;}    /*Keyword for else, rc 31*/
while                   {return 32;}    /*Keyword for whilie, rc 32*/

"#".*                     {}    /*Expression for comments*/


{ID}                    {return 1;}     /*Expression for Tokens of type ID_T*/
"0"                     {return 2;}     /*Expression for Tokens of type INT_T*/
{NZDIGIT}{DIGIT}*       {return 2;}     /*Expression for Tokens of type INT_T*/
{DIGIT}+"."{DIGIT}*     {return 4;}     /*Expression for Tokens of type FLOAT_T*/
"+"                     {return 5;}     /*Expression for Tokens of type ADDOP_T*/
"-"                     {return 5;}     /*Expression for Tokens of type ADDOP_T*/
"*"                     {return 6;}     /*Expression for Tokens of type MULTOP_T*/
"/"                     {return 6;}     /*Expression for Tokens of type MULTOP_T*/
"="{2}                  {return 8;}     /*Expression for Tokens of type RELOP_T*/
"<""="                  {return 8;}     /*Expression for Tokens of type RELOP_T*/
">""="                  {return 8;}     /*Expression for Tokens of type RELOP_T*/
"<"                     {return 10;}    /*Expression for Tokens of type RELOP_T*/
">"                     {return 7;}     /*Expression for Tokens of type RELOP_T*/
"<-"                    {return 11;}    /*Expression for Tokens of type ASSIGNOP_T*/
"&"{2}                  {return 13;}    /*Expression for Tokens of type AND_T*/
"|"{2}                  {return 15;}    /*Expression for Tokens of type OR_T*/
";"                     {return 16;}    /*Expression for Tokens of type SEMICOLON_T*/
"["                     {return 17;}    /*Expression for Tokens of type LBRACK_T*/
"]"                     {return 18;}    /*Expression for Tokens of type RBRACK_T*/
","                     {return 19;}    /*Expression for Tokens of type COMMA_T*/
"("                     {return 20;}    /*Expression for Tokens of type LPAREN_T*/
")"                     {return 21;}    /*Expression for Tokens of type RPAREN_T*/
"~"                     {return 22;}    /*Expression for Tokens of type NOT_T*/

{WSPACE}+               {}

.                       {cout << "UNKNOWN: <" << yytext[0] << ">" << endl; return 0;}

%%
