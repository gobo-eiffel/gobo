%{
note

	description:

		"Calculator with memory"

	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class MCALC

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		end

	KL_IMPORTED_STRING_ROUTINES

create

	make, execute

%}

	-- geyacc declarations.
%token <DOUBLE> NUM  -- Double precision number
%token <STRING> VAR  -- Memory name
%type <DOUBLE> exp

%right ASSIGNMENT    -- Assignment sign `:='
%left '-' '+'
%left '*' '/'
%left NEG            -- negation--unary minus
%right '^'           -- exponentiation

%%

input: -- Empty
	| input line
	;

line: '\n'
	| exp '\n'		{ print ($1.out); print ("%N") }
	| error '\n'	{ recover }
	;

exp: NUM					{ $$ := $1 }
	| VAR					{ $$ := memory_value ($1) }
	| VAR ASSIGNMENT exp	{ $$ := $3; set_memory_value ($$, $1) }
	| exp '+' exp			{ $$ := $1 + $3 }
	| exp '-' exp			{ $$ := $1 - $3 }
	| exp '*' exp			{ $$ := $1 * $3 }
	| exp '/' exp			{ $$ := $1 / $3 }
	| '-' exp %prec NEG		{ $$ := -$2 }
	| '(' exp ')'			{ $$ := $2 }
	;

%%

feature {NONE} -- Initialization

	make
			-- Create a new calculator with memory.
		do
			make_parser_skeleton
			create memory_values.make (10)
		end

	execute
			-- Run calculator.
		do
			make
			parse
		end

feature -- Memory management

	memory_value (a_name: STRING): DOUBLE
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

	set_memory_value (a_value: DOUBLE; a_name: STRING)
			-- Store a_value into a_name.
		require
			a_name_not_void: a_name /= Void
		do
			memory_values.force (a_value, a_name)
		ensure
			memory_value_set: memory_value (a_name) = a_value
		end

feature {NONE} -- Scanner

	read_token
			-- Lexical analyzer returns a double floating point
			-- number on the stack and the token NUM, a STRING and
			-- and the token VAR, a token ASSIGNMENT, or the ASCII
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
				elseif not std.input.end_of_file then
					std.input.read_character
					c := std.input.last_character
				end
			until
				std.input.end_of_file or else
				(c /= ' ' and c /= '%T')
			loop
				std.input.read_character
				c := std.input.last_character
			end
			if std.input.end_of_file then
					-- Return end-of-file
				last_token := 0
			else
				inspect c
				when '0'..'9' then
						-- Process numbers
					last_token := NUM
					from
						create buffer.make (10)
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					until
						std.input.end_of_file or else
						(c < '0' or c > '9')
					loop
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					end
					if not std.input.end_of_file and then c = '.' then
						from
							buffer.append_character ('.')
							std.input.read_character
							c := std.input.last_character
						until
							std.input.end_of_file or else
							(c < '0' or c > '9')
						loop
							buffer.append_character (c)
							std.input.read_character
							c := std.input.last_character
						end
					end
					if not std.input.end_of_file then
						pending_character := c
						has_pending_character := True
					end
					last_double_value := buffer.to_double
				when 'a'..'z', 'A'..'Z' then
						-- Process variables.
					last_token := VAR
					from
						create buffer.make (10)
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					until
						std.input.end_of_file or else
						not (('a' <= c and c <= 'z') or
							('A' <= c and c <= 'Z') or
							('0' <= c and c <= '9'))
					loop
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					end
					if not std.input.end_of_file then
						pending_character := c
						has_pending_character := True
					end
					last_string_value := buffer
				when ':' then
					std.input.read_character
					c := std.input.last_character
					if not std.input.end_of_file then
						if c = '=' then
								-- Found ":="
							last_token := ASSIGNMENT
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
				else
						-- Return single character
					last_token := c.code
				end
			end
		end

	last_token: INTEGER
			-- Last token read

feature {NONE} -- Implementation

	pending_character: CHARACTER
	has_pending_character: BOOLEAN

	memory_values: DS_HASH_TABLE [DOUBLE, STRING]
			-- Values already stored so far

invariant

	memory_values_not_void: memory_values /= Void

end
