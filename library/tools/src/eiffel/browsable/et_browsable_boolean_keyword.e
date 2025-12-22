note

	description:

		"Browsable boolean keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_BOOLEAN_KEYWORD

inherit

	ET_BROWSABLE_KEYWORD
		redefine
			name,
			append_description_to_string,
			type_definition_ast_node
		end

create

	make

feature -- Access

	name: ET_BOOLEAN_CONSTANT
			-- AST node corresponding to the Result

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (name.text)
			a_string.append_character (':')
			a_string.append_character (' ')
			current_class.universe.boolean_type.append_canonical_to_string (a_string)
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_base_class: ET_CLASS
		do
			l_base_class := current_class.universe.boolean_type.base_class
			Result := [l_base_class.name, l_base_class]
		end

end
