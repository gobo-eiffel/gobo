--
--	grammar for simple calculator
--
%{
-- a simple calculator
deferred class CALC_PARSER inherit

	LALR1_PARSER[INTEGER]
		redefine
			print_item
	end

feature {ANY}

%}
%start	calculate
%token	NUMBER
%token	EOL
%left	'+' '-'
%left	'*' '/'
%right	UMINUS

%%

calculate
	:
	  {	io.putstring("Enter expression:%N") }
	| calculate expr_eol
	  {	io.putstring("Enter another expression:%N") }
	;

expr_eol
	: expr EOL
	  {	io.putint($1)
		io.new_line
	  }
	| error EOL
	  {	clear_error }
	| EOL
	  {	set_accepted }
	;

expr
	: NUMBER
	| '-' NUMBER %prec UMINUS
	  {	$$ := $2 * -1 }
	| expr '+' expr
	  {	$$ := $1 + $3 }
	| expr '-' expr
	  {	$$ := $1 - $3 }
	| expr '*' expr
	  {	$$ := $1 * $3 }
	| expr '/' expr
	  {	$$ := $1 // $3 }
	| '(' expr ')'
	  {	$$ := $2 }
	;

%%
feature {NONE} -- debuging

	print_item (v: INTEGER) is
			-- print item 'v'
		do
			io.putint(v)
			io.putchar(' ')
		end -- print_item

feature {ANY} -- creation

	make is
			-- start calculator
		do
			reset
			parse
		end -- make

end -- class CALC_PARSER
