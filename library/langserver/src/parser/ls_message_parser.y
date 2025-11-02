%{
note

	description:

		"LSP message parsers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_MESSAGE_PARSER

inherit

	LS_MESSAGE_PARSER_SKELETON
		undefine
			read_token
		end

	LS_MESSAGE_SCANNER
		rename
			make as make_message_scanner
		undefine
			reset
		end

create

	make

%}

%type <detachable LS_ARRAY> Array
%type <detachable LS_OBJECT> Object
%type <detachable LS_ANY> Value
%token <detachable LS_BOOLEAN> T_TRUE T_FALSE
%token <detachable LS_NULL> T_NULL
%token <detachable LS_NUMBER> T_NUMBER
%token <detachable LS_STRING> T_STRING
%token T_UNKNOWN

%start Root_value

%%
------------------------------------------------------------------------------------

Root_value: Object
		{
			last_object := $1
		}
	;

Value: Array
		{ $$ := $1 }
	| Object
		{ $$ := $1 }
	| T_STRING
		{ $$ := $1 }
	| T_NUMBER
		{ $$ := $1 }
	| T_TRUE
		{ $$ := $1 }
	| T_FALSE
		{ $$ := $1 }
	| T_NULL
		{ $$ := $1 }
	;

Array: '[' ']'
		{
			$$ := new_array (0)
		}
	| Open_bracket Array_values ']'
		{
			$$ := new_array (counter_value)
			remove_counter
		}
	;

Open_bracket: '['
		{
			add_counter
		}
	;

Array_values: Value
		{
			if attached $1 as l_value then
				increment_counter
				array_values.force_last (l_value)
			end
		}
	| Value ',' Array_values
		{
			if attached $1 as l_value then
				increment_counter
				array_values.force_last (l_value)
			end
		}
	;

Object: '{' '}'
		{
			$$ := new_object (0)
		}
	| Open_brace Object_values '}'
		{
			$$ := new_object (counter_value)
			remove_counter
		}
	;

Open_brace: '{'
		{
			add_counter
		}
	;

Object_values: T_STRING ':' Value
		{
			if attached $1 as l_key and attached $3 as l_value then
				increment_counter
				object_keys.force_last (l_key)
				object_values.force_last (l_value)
			end
		}
	| T_STRING ':' Value ',' Object_values
		{
			if attached $1 as l_key and attached $3 as l_value then
				increment_counter
				object_keys.force_last (l_key)
				object_values.force_last (l_value)
			end
		}
	;

%%

end
