%option noyywrap

%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
using namespace std;

int line_count=1;

FILE *logout;
FILE *tokenout;

%}

WHITESPACE [ \t\f\r\v]+ 
LETTER [a-zA-Z]
DIGIT [0-9]
NEWLINE \n
oquote [']

%%

{NEWLINE} {line_count++;}


"if"	{
			fprintf(tokenout,"<IF>");
			fprintf(logout,"Line no %d: TOKEN <IF> Lexeme %s found\n",line_count,yytext);
		}
		
"else"	{
			fprintf(tokenout,"<ELSE>");
			fprintf(logout,"Line no %d: TOKEN <ELSE> Lexeme %s found\n",line_count,yytext);
	}

"for"	{
			fprintf(tokenout,"<FOR>");
			fprintf(logout,"Line no %d: TOKEN <FOR> Lexeme %s found\n",line_count,yytext);
	}

"while"	{
			fprintf(tokenout,"<WHILE>");
			fprintf(logout,"Line no %d: TOKEN <WHILE> Lexeme %s found\n",line_count,yytext);
	}

"do" {
			fprintf(tokenout,"<DO>");
			fprintf(logout,"Line no %d: TOKEN <DO> Lexeme %s found\n",line_count,yytext);
	}

"break"	{
			fprintf(tokenout,"<BREAK>");
			fprintf(logout,"Line no %d: TOKEN <BREAK> Lexeme %s found\n",line_count,yytext);
	}

"int"	{
			fprintf(tokenout,"<INT>");
			fprintf(logout,"Line no %d: TOKEN <INT> Lexeme %s found\n",line_count,yytext);
	}

"char"	{
			fprintf(tokenout,"<CHAR>");
			fprintf(logout,"Line no %d: TOKEN <CHAR> Lexeme %s found\n",line_count,yytext);
	}

"float"	{
			fprintf(tokenout,"<FLOAT>");
			fprintf(logout,"Line no %d: TOKEN <FLOAT> Lexeme %s found\n",line_count,yytext);
	}

"double"	{
			fprintf(tokenout,"<DOUBLE>");
			fprintf(logout,"Line no %d: TOKEN <DOUBLE> Lexeme %s found\n",line_count,yytext);
	}

"void"	{
			fprintf(tokenout,"<VOID>");
			fprintf(logout,"Line no %d: TOKEN <VOID> Lexeme %s found\n",line_count,yytext);
	}

"return"	{
			fprintf(tokenout,"<RETURN>");
			fprintf(logout,"Line no %d: TOKEN <RETURN> Lexeme %s found\n",line_count,yytext);
	}

"switch"	{
			fprintf(tokenout,"<SWITCH>");
			fprintf(logout,"Line no %d: TOKEN <SWITCH> Lexeme %s found\n",line_count,yytext);
	}

"case"	{
			fprintf(tokenout,"<CASE>");
			fprintf(logout,"Line no %d: TOKEN <CASE> Lexeme %s found\n",line_count,yytext);
	}

"default"	{
			fprintf(tokenout,"<DEFAULT>");
			fprintf(logout,"Line no %d: TOKEN <DEFAULT> Lexeme %s found\n",line_count,yytext);
	}

"continue"	{
			fprintf(tokenout,"<CONTINUE>");
			fprintf(logout,"Line no %d: TOKEN <CONTINUE> Lexeme %s found\n",line_count,yytext);
	}

\'{LETTER}\'	{
				yytext[0]=yytext[1];
				yytext[1]='\0';
				fprintf(tokenout,"<CONST_CHAR,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <CONST_CHAR> Lexeme %s found\n",line_count,yytext);
			}

{DIGIT}*+"."{DIGIT}+	{
				fprintf(tokenout,"<CONST_FLOAT,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <CONST_FLOAT> Lexeme %s found\n",line_count,yytext);
			}

{DIGIT}+[E][-]{0,1}{DIGIT}+	{
				fprintf(tokenout,"<CONST_FLOAT,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <CONST_FLOAT> Lexeme %s found\n",line_count,yytext);
			}

{DIGIT}+ 	{
				fprintf(tokenout,"<CONST_INT,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <CONST_INT> Lexeme %s found\n",line_count,yytext);
			}

[+]{2}|[-]{2}		{
				fprintf(tokenout,"<INCOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <INCOP> Lexeme %s found\n",line_count,yytext);
			}

[*/%] 		{
				fprintf(tokenout,"<MULOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <MULOP> Lexeme %s found\n",line_count,yytext);
			}


[+-]		{
				fprintf(tokenout,"<ADDOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <ADDOP> Lexeme %s found\n",line_count,yytext);
			}

[=]		{
				fprintf(tokenout,"<ASSIGNOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <ASSIGNOP> Lexeme %s found\n",line_count,yytext);
		}

[!]		{
				fprintf(tokenout,"<NOT,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <NOT> Lexeme %s found\n",line_count,yytext);
		}

[><!=][=]{0,1}	{
				fprintf(tokenout,"<RELOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <RELOP> Lexeme %s found\n",line_count,yytext);
			}

[&]{2}|[|]{2}	{
				fprintf(tokenout,"<LOGICOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <LOGICOP> Lexeme %s found\n",line_count,yytext);
		}

[&|^]{1}|[<]{2}|[>]{2}	{
				fprintf(tokenout,"<BITOP,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <BITOP> Lexeme %s found\n",line_count,yytext);
		}

[,]		{
				fprintf(tokenout,"<COMMA,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <COMMA> Lexeme %s found\n",line_count,yytext);
		}

[;]		{
				fprintf(tokenout,"<SEMICOLON,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <SEMICOLON> Lexeme %s found\n",line_count,yytext);
		}

[(]		{
				fprintf(tokenout,"<LPAREN,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <LPAREN> Lexeme %s found\n",line_count,yytext);
		}

[)]		{
				fprintf(tokenout,"<RPAREN,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <RPAREN> Lexeme %s found\n",line_count,yytext);
		}


[{]		{
				fprintf(tokenout,"<LCURL,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <LCURL> Lexeme %s found\n",line_count,yytext);
		}


[}]		{
				fprintf(tokenout,"<RCURL,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <RCURL> Lexeme %s found\n",line_count,yytext);
		}


[[]		{
				fprintf(tokenout,"<LTHIRD,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <LTHIRD> Lexeme %s found\n",line_count,yytext);
		}


[]]		{
				fprintf(tokenout,"<RTHIRD,%s>",yytext);
				fprintf(logout,"Line no %d: TOKEN <RTHIRD> Lexeme %s found\n",line_count,yytext);
		}












%%


int main(int argc,char *argv[]){
	
	if(argc!=2){
		printf("Please provide input file name and try again\n");
		return 0;
	}
	
	FILE *fin=fopen(argv[1],"r");
	if(fin==NULL){
		printf("Cannot open specified file\n");
		return 0;
	}
	
	logout= fopen("log.txt","w");
	tokenout= fopen("token.txt","w");

	yyin= fin;
	yylex();
	fclose(yyin);
	fclose(tokenout);
	fclose(logout);
	return 0;
}
