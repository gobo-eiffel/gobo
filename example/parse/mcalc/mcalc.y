%{
indexing

	description:

		"Calculator with memory"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1999, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class MCALC

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		end

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make, execute

%}

	-- geyacc declarations.
%token <DOUBLE> NUM  -- Double precision number
%token <STRING> VAR  -- Memory name
%type <DOUBLE> exp

%right ASSIGN        -- Assignment sign `:='
%left '-' '+'
%left '*' '/'
%left NEG            -- negation--unary minus
%right '^'           -- exponentiation

%%

input: -- Empty
	| input line
	;

line: '\n'
	| exp '\n'		{ print ($1); print ('%N') }
	| error '\n'	{ recover }
	;

exp: NUM				{ $$ := $1 }
	| VAR				{ $$ := memory_value ($1) }
	| VAR ASSIGN exp	{ $$ := $3; set_memory_value ($$, $1) }
	| exp '+' exp		{ $$ := $1 + $3 }
	| exp '-' exp		{ $$ := $1 - $3 }
	| exp '*' exp		{ $$ := $1 * $3 }
	| exp '/' exp		{ $$ := $1 / $3 }
	| '-' exp %prec NEG	{ $$ := -$2 }
	| '(' exp ')'		{ $$ := $2 }
	;

%%

feature {NONE} -- Initialization

	make is
			-- Create a new calculator with memory.
		do
			make_parser_skeleton
			!! memory_values.make (10)
		end

	execute is
			-- Run calculator.
		do
			make
			parse
		end

feature -- Memory management

	memory_value (a_name: STRING): DOUBLE is
			-- Value associated with memory a_name;
			-- 0.0 if no value has been stored in a_name yet
		require
			a_name_not_void: a_name /= Void
		do
			if memory_values.has (a_name) then
				Result := memory_values.item (a_name)
			else
				Result := 0.0
			end
		end

	set_memory_value (a_value: DOUBLE; a_name: STRING) is
			-- Store a_value into a_name.
		require
			a_name_not_void: a_name /= Void
		do
			memory_values.force (a_value, a_name)
		ensure
			memory_value_set: memory_value (a_name) = a_value
		end

feature {NONE} -- Scanner

	read_token is
			-- Lexical analyzer returns a double floating point
			-- number on the stack and the token NUM, a STRING and
			-- and the token VAR, a token ASSIGN, or the ASCII
			-- character read if not a number. Skips all blanks
			-- and tabs, returns 0 for EOF.
		local
			c: CHARACTER
			buffer: STRING
		do
				-- Skip white space
			from
				if has_pending_character then
					c := pending_character
					has_pending_character := False
				elseif not INPUT_STREAM_.end_of_input (std.input) then
					std.input.read_character
					c := std.input.last_character
				end
			until
				INPUT_STREAM_.end_of_input (std.input) or else
				(c /= ' ' and c /= '%T')
			loop
				std.input.read_character
				c := std.input.last_character
			end
			if INPUT_STREAM_.end_of_input (std.input) then
					-- Return end-of-file
				last_token := 0
			else
				inspect c
				when '0'..'9' then
						-- Process numbers
					last_token := NUM
					from
						buffer := STRING_.make (10)
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					until
						INPUT_STREAM_.end_of_input (std.input) or else
						(c < '0' or c > '9')
					loop
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					end
					if not INPUT_STREAM_.end_of_input (std.input) and then c = '.' then
						from
							buffer.append_character ('.')
							std.input.read_character
							c := std.input.last_character
						until
							INPUT_STREAM_.end_of_input (std.input) or else
							(c < '0' or c > '9')
						loop
							buffer.append_character (c)
							std.input.read_character
							c := std.input.last_character
						end
					end
					if not INPUT_STREAM_.end_of_input (std.input) then
						pending_character := c
						has_pending_character := True
					end
					last_value := buffer.to_double
				when 'a'..'z', 'A'..'Z' then
						-- Process variables.
					last_token := VAR
					from
						!! buffer.make (10)
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					until
						INPUT_STREAM_.end_of_input (std.input) or else
						not (('a' <= c and c <= 'z') or
							('A' <= c and c <= 'Z') or
							('0' <= c and c <= '9'))
					loop
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					end
					if not INPUT_STREAM_.end_of_input (std.input) then
						pending_character := c
						has_pending_character := True
					end
					last_value := buffer
				when ':' then
					std.input.read_character
					c := std.input.last_character
					if not INPUT_STREAM_.end_of_input (std.input) then
						if c = '=' then
								-- Found ":="
							last_token := ASSIGN
						else
								-- Return single character
							last_token := (':').code
							pending_character := c
							has_pending_character := True
						end
					else
							-- Return single character
						last_token := (':').code 
					end
				when '%R' then
						-- Bug in Visual Eiffel 2.1: when the Enter Key
						-- is pressed, `read_character' gets '%R' instead
						-- of '%N' or instead of the sequence '%R''%N'.
					last_token := ('%N').code
				else
						-- Return single character
					last_token := c.code
				end
			end
		end

	last_token: INTEGER
			-- Last token read

	last_value: ANY
			-- Semantic value of last token read

feature {NONE} -- Implementation

	pending_character: CHARACTER
	has_pending_character: BOOLEAN

	memory_values: DS_HASH_TABLE [DOUBLE, STRING]
			-- Values already stored so far

invariant

	memory_values_not_void: memory_values /= Void

end -- class MCALC
