note

	description:

		"Browsable function results"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_RESULT

inherit

	ET_BROWSABLE_KEYWORD
		redefine
			name,
			build_definition,
			build_type_definition,
			append_description_to_string
		end

create

	make

feature -- Access

	name: ET_RESULT
			-- AST node corresponding to the Result

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		do
			if attached current_closure as l_closure and then attached l_closure.type as l_type then
				a_builder.add_result_type (l_type, Current)
			end
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		local
			l_base_class: ET_CLASS
		do
			if attached current_closure as l_closure and then attached l_closure.type as l_type then
				l_base_class := l_type.base_class (current_class)
				a_builder.add_class (l_base_class, Current)
			end
		end

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

end
