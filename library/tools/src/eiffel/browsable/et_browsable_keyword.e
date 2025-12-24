note

	description:

		"Browsable keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_KEYWORD

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		redefine
			name
		end

create

	make

feature -- Access

	name: ET_KEYWORD
			-- AST node corresponding to the Result

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		do
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		do
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
		end

end
