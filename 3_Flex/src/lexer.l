%option noyywrap

%{
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX
    
    #ifdef ONLY_FOR_LEX
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>

    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include <iomanip>
    using namespace std;
    extern FILE *yyin; 
    extern FILE *yyout;

    int offset=0;
    int lineno=0;

    void DEBUG_FOR_LAB4(std::string s){
        if(lineno!=yylineno){
            lineno=yylineno;
            offset=0;
            }
        if(s==""){}
        else{
            std::string DEBUG_INFO = "[DEBUG LAB4]:" + s + "\t\t" +
            to_string(yylineno) + "\t\t" + to_string(offset)+ "\n";
            fputs(DEBUG_INFO.c_str(), yyout);
        }
    }
    #endif
%}

CONST "const"
INT "int"
VOID "void"
IF "if"
ELSE "else"
WHILE "while"
BREAK "break"
CONTINUE "continue"
RETURN "return"

LPAREN "("
RPAREN ")"
LBRACKET "["
RBRACKET "]"
LBRACE "{"
RBRACE "}"
SEMICOLON ";"
COMMA ","

EQUAL "=="
GREQU ">="
LEEQU "<="
NTEQU "!="
ASSIGN "="
GREA ">"
LESS "<"
ADD "+"
SUB "-"
MUL "*"
DIV "/"
MOD "%"
AND "&&"
OR "||"
NOT "!"

ID [[:alpha:]_][[:alpha:][:digit:]|_]*

OCTNUMBER 0[0-7]*
DECIMIAL [1-9][0-9]*
HEXADECIMAL 0(x|X)[0-9a-zA-Z]+

EOL (\r\n|\n|\r)
WHITE [\t ]
blockcommentbegin "/*"
blockcommentelement .
blockcommentelementEOL \n
blockcommentend "*/"
linecommentbegin "//"
linecommentelement .
linecommentend \n
%x BLOCKCOMMENT
%x LINECOMMENT

%%

"const" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONST\tconst");
        offset += 5;
    #else
        return INT;
    #endif
}
"int" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INT\tint");
        offset += 3;
    #else
        return INT;
    #endif 
}

"void" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("VOID\tvoid");
        offset += 4;
    #else
        return VOID;
    #endif 
}

"if" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("IF\t\tif");
        offset += 2;
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ELSE\telse");
        offset += 4;
    #else
        return ELSE;
    #endif
};
"while" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("WHILE\twhile");
        offset += 5;
    #else
        return WHILE;
    #endif
};
"break" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BREAK\tbreak");
        offset += 5;
    #else
        return BREAK;
    #endif
};
"continue" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
        offset += 8;
    #else
        return CONTINUE;
    #endif
};
"return" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RETURN\treturn");
        offset += 6;
    #else
        return RETURN;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("EQUAL\t==");
        offset += 2;
    #else
        return EQUAL;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREQU\t>=");
        offset += 2;
    #else
        return GREQU;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LEEQU\t<=");
        offset += 2;
    #else
        return LEEQU;
    #endif
}
"!=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NTEQU\t!=");
        offset += 2;
    #else
        return NTEQU;
    #endif
}
"=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ASSIGN\t=");
        offset += 1;
    #else
        return ASSIGN;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREA\t>");
        offset += 1;
    #else
        return GREA;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESS\t<");
        offset += 1;
    #else
        return LESS;
    #endif
}
"+" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD\t+");
        offset += 1;
    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SUB\t-");
        offset += 1;
    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MUL\t*");
        offset += 1;
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DIV\t/");
        offset += 1;
    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOD\t%");
        offset += 1;
    #else
        return MOD;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AND\t&&");
        offset += 1;
    #else
        return AND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("OR\t\t||");
        offset += 2;
    #else
        return OR;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOT\t!");
        offset += 1;
    #else
        return NOT;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SEMICOLON\t;");
        offset += 1;
    #else
        return SEMICOLON;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LPAREN\t(");
        offset += 1;
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RPAREN\t)");
        offset += 1;
    #else
        return RPAREN;
    #endif
}
"[" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LBRACKET\t[");
        offset += 1;
    #else
        return LBRACKET;
    #endif
}
"]" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RBRACKET\t]");
        offset += 1;
    #else
        return RBRACKET;
    #endif
}

"{" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LBRACE\t{");
        offset += 1;
    #else
        return LBRACE;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RBRACE\t}");
        offset += 1;
    #else
        return RBRACE;
    #endif
}
"," {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("COMMA\t,");
        offset += 1;
    #else
        return COMMA;
    #endif
}

{EOL} yylineno++;
{WHITE} {DEBUG_FOR_LAB4("");offset++;}


{ID} {
    #ifdef ONLY_FOR_LEX
    DEBUG_FOR_LAB4("ID\t\t"+std::string(yytext));
    offset += strlen(yytext);
    #else
        return ID;
    #endif
}


{OCTNUMBER} {
    #ifdef ONLY_FOR_LEX
        string oct=yytext;
        int dec=0;
        int i=1;
        while(oct[i]!='\0')
    {
        dec = dec*8 + oct[i]-48;
        i++;
    }
    sprintf(yytext,"%d",dec);
    DEBUG_FOR_LAB4("NUM\t"+std::string(yytext));
    offset += strlen(yytext);
    #else
        return NUM;
    #endif
}
{DECIMIAL} {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NUM\t"+std::string(yytext));
        offset += strlen(yytext);
    #else
        return NUM;
    #endif
}
{HEXADECIMAL} {
    #ifdef ONLY_FOR_LEX
        string hex=yytext;
    int temp=0;
    int dec=0;
    int i=2;
    while(hex[i]!='\0')
    {
        if(hex[i]>='0'&&hex[i]<='9')
    {
        temp=hex[i]-'0';
    }
    else if(hex[i]>='a'&&hex[i]<='f')
    {
    temp=hex[i]-'a'+10;
    }
    else if(hex[i]>='A'&&hex[i]<='F')
    {
    temp=hex[i]-'A'+10;
    }
    dec = dec*16 + temp;
    i++;
}
    sprintf(yytext,"%d",dec);
    DEBUG_FOR_LAB4("NUM\t"+std::string(yytext));
    offset += strlen(yytext);
    #else
        return NUM;
    #endif
}
{blockcommentbegin} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{blockcommentelement} {}
<BLOCKCOMMENT>{blockcommentelementEOL} {
    yylineno++;
    offset=0;
}
<BLOCKCOMMENT>{blockcommentend} {BEGIN INITIAL;}
{linecommentbegin} {BEGIN LINECOMMENT;}
<LINECOMMENT>{linecommentbegin} {}
<LINECOMMENT>{linecommentelement} {}
<LINECOMMENT>{linecommentend} {
    yylineno++;
    offset = 0;
BEGIN INITIAL;}

%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    // 判断读取文件是否成功
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }
    fprintf(yyout,"%18s\t%6s\t%14s\t%14s\n","token","lexeme","lineno","offset");

    yylex();
    return 0;
}
#endif

