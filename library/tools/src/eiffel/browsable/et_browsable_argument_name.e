note

	description:

		"Browsable names of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_ARGUMENT_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_formal_argument: like formal_argument; a_class: like current_class)
			-- Create a new browsable formal argument name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_argument: a_name.is_argument
			a_formal_argument_not_void: a_formal_argument /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			formal_argument := a_formal_argument
			current_class := a_class
		ensure
			name_set: name = a_name
			formal_argument_not_void: formal_argument = a_formal_argument
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the formal argument name

	formal_argument: ET_FORMAL_ARGUMENT
			-- Formal argument

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_character ('(')
			a_string.append_character (' ')
			a_string.append_string (name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			formal_argument.type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
			a_string.append_character (' ')
			a_string.append_character (')')
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			Result := [formal_argument.name, current_class]
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_base_class: ET_CLASS
		do
			l_base_class := formal_argument.type.base_class (current_class)
			Result := [l_base_class.name, l_base_class]
		end

invariant

	name_is_argument: name.is_argument
	formal_argument_not_void: formal_argument /= Void

end
