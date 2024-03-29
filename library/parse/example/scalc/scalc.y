﻿%{
note

	description:

		"Scientific calculator"

	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class SCALC

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		end

create

	make, execute

%}

	-- geyacc declarations.
%token <DOUBLE> NUM         -- Double precision number
%token <DOUBLE> PI "pi: π"  -- 3.141592
%token <STRING> VAR         -- Memory name
%type <DOUBLE> exp

%right ASSIGNMENT    -- Assignment sign `:='
%left '-' '+'
%left '*' '/'
%left NEG            -- negation--unary minus
%left '√'            -- square root
%right '^'           -- exponentiation

%%

input: -- Empty
	| input line
	;

line: '\n'
	| exp '\n'		{ print ($1); print ("%N") }
	| error '\n'	{ recover }
	;

exp: NUM					{ $$ := $1 }
	| "pi: π"				{ $$ := {DOUBLE} 3.141592 }
	| VAR					{ $$ := memory_value ($1) }
	| VAR ASSIGNMENT exp	{ $$ := $3; set_memory_value ($$, $1) }
	| exp '+' exp			{ $$ := $1 + $3 }
	| exp '-' exp			{ $$ := $1 - $3 }
	| exp '*' exp			{ $$ := $1 * $3 }
	| exp '/' exp			{ $$ := $1 / $3 }
	| '-' exp %prec NEG		{ $$ := -$2 }
	| '√' exp			{ $$ := Current √ $2 }
	| '(' exp ')'			{ $$ := $2 }
	;

%%

feature {NONE} -- Initialization

	make
			-- Create a new scientific calculator.
		do
			make_parser_skeleton
			last_string_value := ""
			create memory_values.make (10)
		end

	execute
			-- Run calculator.
		do
			make
			parse
		end

feature -- Operators

	square_root alias "√" (d: DOUBLE): DOUBLE
			-- Square root of `d', or 0.0 if negative.
			-- Use the Unicode alias √.
		do
			if d >= 0.0 then
				Result := {DOUBLE_MATH}.sqrt (d)
			else
				Result := 0.0
			end
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
			-- and the token VAR, a token ASSIGNMENT, or the
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
				when '%/207/' then
					std.input.read_character
					c := std.input.last_character
					if not std.input.end_of_file then
						if c = '%/128/' then
								-- UTF-8 encoding for 'π'.
							last_token := PI
						else
								-- Return single character
							last_token := ('%/207/').code
							pending_character := c
							has_pending_character := True
						end
					else
							-- Return single character
						last_token := ('%/207/').code 
					end
				when '%/226/' then
					std.input.read_character
					c := std.input.last_character
					if not std.input.end_of_file then
						if c = '%/136/' then
							std.input.read_character
							c := std.input.last_character
							if not std.input.end_of_file then
								if c = '%/154/' then
										-- UTF-8 encoding for '√'.
									last_token := ({CHARACTER_32} '√').code
								else
										-- Unsupported Unicode character.
									last_token := -1
								end
							else
									-- Return single character
								last_token := ('%/226/').code
								pending_character := '%/136/'
								has_pending_character := True
							end
						else
								-- Return single character
							last_token := ('%/226/').code
							pending_character := c
							has_pending_character := True
						end
					else
							-- Return single character
						last_token := ('%/226/').code 
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
