grammar fool;

@header{
    import java.util.Vector;
}

@members{
    void print(String str){
        System.out.println(str);
    }
}

program
    : 'void' 'main' '('')''{' ((statement ';')+ | loop | comment )+ '}'
    ;
statement
    : assignment
    | write
    | read
    ;
assignment
    : id=VARNAME '=' calculation
    ;
calculation
    : CONST
    | VARNAME
    | calculation ('+' | '-' | '*' | '/') calculation
    | '-' calculation
    | '(' calculation ')'
    ;
write
    : 'write' '(' STR (',' STR )* ')'
    ;
read
    : 'read' '(' INTEG ')'
    ;
loop
    : 'loop'
    ;

comment
    : 'comment'
    ;
    
STR
    : '"' [a-zA-Z0-9' '?!/@#$~;:%^&*())_+=][a-zA-Z0-9' '?!/@#$~:;%^&*()_+=]* '"'
    | '"''"'
    ;
INTEG
    : [1-9][0-9]*
    ;
VARNAME:
    [a-zA-Z_][a-zA-Z0-9_]*
    ;
CONST:
    [0-9]('.'[0-9]+)*
    ;
WS:
    [ \r\t\n]+ -> skip
    ;
