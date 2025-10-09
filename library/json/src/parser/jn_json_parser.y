%{
note

	description:

		"JSON parsers"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_JSON_PARSER

inherit

	JN_JSON_PARSER_SKELETON
		undefine
			read_token
		end

	JN_JSON_SCANNER
		rename
			make as make_json_scanner,
			make_with_error_handler as make_json_scanner_with_error_handler
		undefine
			reset
		end

create

	make,
	make_with_error_handler

%}

%type <detachable JN_ARRAY> Array
%type <detachable JN_OBJECT> Object
%type <detachable JN_VALUE> Value
%token <detachable JN_BOOLEAN> T_TRUE T_FALSE
%token <detachable JN_NULL> T_NULL
%token <detachable JN_NUMBER> T_NUMBER
%token <detachable JN_STRING> T_STRING
%token T_UNKNOWN

%start Root_value

%%
------------------------------------------------------------------------------------

Root_value: Value
		{
			last_value := $1
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
