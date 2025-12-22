note

	description:

		"Browsable function results"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_RESULT

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		redefine
			name
		end

create

	make

feature -- Access

	name: ET_RESULT
			-- AST node corresponding to the Result

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached current_closure as l_closure and then attached l_closure.type as l_type then
				a_string.append_string (tokens.result_keyword.text)
				a_string.append_character (':')
				a_string.append_character (' ')
				l_type.named_type_with_type_mark (tokens.detachable_keyword, current_class).append_canonical_with_leading_type_mark_to_string (a_string)
			end
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			if attached current_closure as l_closure and then attached l_closure.type as l_type then
				Result := [l_type, current_class]
			end
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_base_class: ET_CLASS
		do
			if attached current_closure as l_closure and then attached l_closure.type as l_type then
				l_base_class := l_type.base_class (current_class)
				Result := [l_base_class.name, l_base_class]
			end
		end

end
