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
			build_type_definition,
			append_description_to_string
		end

create

	make

feature -- Access

	name: ET_CURRENT
			-- AST node corresponding to the Result

feature -- Basic operations

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		do
			a_builder.add_class (current_class, Current)
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.current_keyword.text)
			a_string.append_character (':')
			a_string.append_character (' ')
			current_class.append_canonical_to_string (a_string)
		end

end
