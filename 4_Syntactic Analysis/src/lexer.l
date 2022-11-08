%option noyywrap
%{
    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    #include "parser.h"
    #include <ostream>
    #include <fstream>
    #include <cstdio>
    using namespace std;

    extern FILE *yyin; 
    extern FILE *yyout;
    extern bool dump_tokens;
	
    int offset = 0;
	
    void DEBUG_FOR_LAB4(std::string s){
        printf("!!!\n");
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
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

OCTNUMBER 0[0-7]*
HEXADECIMAL 0(x|X)[0-9a-zA-Z]+

DECIMIAL ([1-9][0-9]*|0)
ID [[:alpha:]_][[:alpha:][:digit:]_]*
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
    if(dump_tokens){
		DEBUG_FOR_LAB4("CONST\tconst");
		offset += 5;
	}
    return INT;
}
"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    if(dump_tokens){
		DEBUG_FOR_LAB4("INT\tint");
		offset += 3;
	}
    return INT;
}
"void" {
    if(dump_tokens){
		DEBUG_FOR_LAB4("VOID\tvoid");
		offset += 4;
	}
    return VOID;
}
"if" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("IF\tif");
		offset += 2;
	}
    return IF;
};
"else" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("ELSE\telse");
		offset += 4;
	}
    return ELSE;
};
"return" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("RETURN\treturn");
		offset += 6;
	}
    return RETURN;
}
"while" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("WHILE\twhile");
        offset += 5;
    }
    return WHILE;
};
"break" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("BREAK\tbreak");
        offset += 5;
    }
    return BREAK;
};
"continue" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
        offset += 8;
    }
    return CONTINUE;
};

"==" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("EQUAL\t==");
        offset += 2;
    }
    return EQUAL;
}
">=" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("GREQU\t>=");
        offset += 2;
    }
    return GREQU;
}
"<=" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("LEEQU\t<=");
        offset += 2;
    }
    return LEEQU;
}
"!=" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("NTEQU\t!=");
        offset += 2;
    }
    return NTEQU;
}

"=" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("ASSIGN\t=");
		offset += 1;
	}
    return ASSIGN;
}
">" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("GREA\t>");
        offset += 1;
    }
    return GREA;
}
"<" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("LESS\t<");
		offset += 1;
	}
    return LESS;
}
"+" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("ADD\t+");
		offset += 1;
	}
    return ADD;
}
"-" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("SUB\t-");
        offset += 1;
	}
    return SUB;
}
"*" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("MUL\t*");
        offset += 1;
    }
    return MUL;
}
"/" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("DIV\t/");
        offset += 1;
    }
    return DIV;
}
"%" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("MOD\t%");
        offset += 1;
    }
    return MOD;
}
"&&" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("AND\t&&");
        offset += 1;
    }
    return AND;
}
"||" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("OR\t||");
        offset += 2;
    }
    return OR;
}
"!" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("NOT\t!");
        offset += 1;
    }
    return NOT;
}
";" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("SEMICOLON\t;");
		offset += 1;
	}
    return SEMICOLON;
}
"(" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("LPAREN\t(");
		offset += 1;
	}
    return LPAREN;
}
")" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("RPAREN\t)");
		offset += 1;
	}
    return RPAREN;
}
"[" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("LBRACE\t[");
        offset += 1;
    }
    return LBRACE;
}
"]" {
    if(dump_tokens){
        DEBUG_FOR_LAB4("RBRACE\t]");
        offset += 1;
    }
    return RBRACE;
}
"{" {
    if(dump_tokens){
        //tag++;
		//scope_stack.push(tag);
		DEBUG_FOR_LAB4("LBRACE\t{");
		offset += 1;
	}
    return LBRACE;
}
"}" {
    if(dump_tokens){
        //scope_stack.pop();
		DEBUG_FOR_LAB4("RBRACE\t}");
		offset += 1;
	}
    return RBRACE;
}
"," {
    if(dump_tokens){
        DEBUG_FOR_LAB4("COMMA\t,");
        offset += 1;
    }
    return COMMA;
}

"getint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("I/O Function: getint()");

    char *lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    SymbolTable* globalTable = identifiers;
    for(; globalTable->getPrev(); globalTable = globalTable->getPrev());
    // Find the root of SymbolTable *identifiers
    if(globalTable->lookup(yytext) == nullptr)
    {
        // int getint()
        Type* funcType = new FunctionType(TypeSystem::intType, {});
        SymbolEntry* entry = new IdentifierSymbolEntry(funcType, yytext, 0); //作用域GLOBAL(0)
        globalTable->install(yytext, entry);
    }
    return ID;
}
"getch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("I/O Function: getch()");

    char *lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    SymbolTable* globalTable = identifiers;
    for(; globalTable->getPrev(); globalTable = globalTable->getPrev());
    // Find the root of SymbolTable *identifiers
    if(globalTable->lookup(yytext) == nullptr)
    {
        // int getch()
        Type* funcType = new FunctionType(TypeSystem::intType, {});
        SymbolEntry* entry = new IdentifierSymbolEntry(funcType, yytext, 0); //作用域GLOBAL(0)
        globalTable->install(yytext, entry);
    }
    return ID;
}

"putint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("I/O Function: putint()");

    char *lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    SymbolTable* globalTable = identifiers;
    for(; globalTable->getPrev(); globalTable = globalTable->getPrev());
    // Find the root of SymbolTable *identifiers
    if(globalTable->lookup(yytext) == nullptr)
    {
        // void putint(int)
		std::vector<Type*> paramsType;
		paramsType.push_back(TypeSystem::intType);		
		FunctionType *funcType = new FunctionType(TypeSystem::voidType, paramsType);
		SymbolEntry *entry = new IdentifierSymbolEntry(funcType, yytext, 0);
        globalTable->install(yytext, entry);
    }
    return ID;
}
"putch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("I/O Function: putch()");

    char *lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    SymbolTable* globalTable = identifiers;
    for(; globalTable->getPrev(); globalTable = globalTable->getPrev());
    // Find the root of SymbolTable *identifiers
    if(globalTable->lookup(yytext) == nullptr)
    {
        // void putch(int)
		std::vector<Type*> paramsType;
		paramsType.push_back(TypeSystem::intType);		
		FunctionType *funcType = new FunctionType(TypeSystem::voidType, paramsType);
		SymbolEntry *entry = new IdentifierSymbolEntry(funcType, yytext, 0);
        globalTable->install(yytext, entry);
    }
    return ID;
}

{OCTNUMBER} {
    int dec=0;
    if(dump_tokens){
        string oct=yytext;
        
        int i=1;
        while(oct[i]!='\0')
		{
			dec = dec*8 + oct[i]-48;
			i++;
		}
		//sprintf(yytext,"%d",dec);
		DEBUG_FOR_LAB4("INTEGER" + std::string(yytext));
		offset += strlen(yytext);
    }
    yylval.itype = dec;
    return INTEGER;
}
{DECIMIAL} {
    if(dump_tokens){
        DEBUG_FOR_LAB4("INTEGER" + std::string(yytext));
        offset += strlen(yytext);
    }
    yylval.itype = atoi(yytext);
    return INTEGER;
}
{HEXADECIMAL} {
    int dec=0;
    if(dump_tokens){
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
		//sprintf(yytext,"%d",dec);
		DEBUG_FOR_LAB4("INTEGER" + std::string(yytext));
		offset += strlen(yytext);
    }
    yylval.itype = dec;
    return INTEGER;
}
{ID} {
    if(dump_tokens){
		//DEBUG_FOR_LAB4("ID" + std::string(yytext) + std::to_string(scope_stack.top()));
		offset += strlen(yytext);
	}
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    return ID;
}
{EOL} yylineno++;
{WHITE} {}
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
<LINECOMMENT>{linecommentend} {BEGIN INITIAL;}
%%
