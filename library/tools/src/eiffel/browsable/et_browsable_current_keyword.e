note

	description:

		"Browsable 'Current' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_CURRENT_KEYWORD

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

	name: ET_CURRENT
			-- AST node corresponding to the Result

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.current_keyword.text)
			a_string.append_character (':')
			a_string.append_character (' ')
			current_class.append_canonical_to_string (a_string)
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		do
			Result := [current_class.name, current_class]
		end

end
