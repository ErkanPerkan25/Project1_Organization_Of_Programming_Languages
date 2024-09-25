%{
#include <iostream>
using namespace std;
%}

%option c++
%option noyywrap

ID          [a-zA-Z][a-z0-9]*
DIGIT       [0-9]
NZDIGIT     [1-9]
WSPACE      [\ \t\n]

%%
<<EOF>>                 {return 23;}
void                    {return 24;}
int                     {return 25;}
float                   {return 26;}
begin                   {return 27;}
end                     {return 28;}
if                      {return 29;}
then                    {return 30;}
else                    {return 31;}
while                   {return 32;}

{ID}                    {return 1;}
"0"                     {return 2;}
{NZDIGIT}{DIGIT}*       {return 2;}
{DIGIT}+"."{DIGIT}*     {return 4;}
"+"                     {return 5;} 
"-"                     {return 5;} 
"*"                     {return 6;}
"/"                     {return 6;}
"="{2}                  {return 8;}
"<""="                  {return 8;}
">""="                  {return 8;}
"<"                     {return 10;}
">"                     {return 7;}
"<-"                    {return 11;}
"&"{2}                  {return 13;}
"|"{2}                  {return 15;}
";"                     {return 16;}
"["                     {return 17;}
"]"                     {return 18;}
","                     {return 19;}
"("                     {return 20;}
")"                     {return 21;}
"~"                     {return 22;}

{WSPACE}+               {}

.                       {cout << "UNKNOWN: <" << yytext[0] << ">" << endl; return 0;}

%%
