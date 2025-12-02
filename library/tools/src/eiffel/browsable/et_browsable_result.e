note

	description:

		"Browsable function results"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_RESULT

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_class: like current_class)
			-- Create a new browsable Result.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			type := a_type
			current_class := a_class
		ensure
			name_set: name = a_name
			type_not_void: type = a_type
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_RESULT
			-- AST node corresponding to the Result

	type: ET_TYPE
			-- Type of Result

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.result_keyword.text)
			a_string.append_character (':')
			a_string.append_character (' ')
			type.named_type_with_type_mark (tokens.detachable_keyword, current_class).append_canonical_with_leading_type_mark_to_string (a_string)
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			Result := [type, current_class]
		end

invariant

	type_not_void: type /= Void

end
