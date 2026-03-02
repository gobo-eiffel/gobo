note

	description:

		"Browsable keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_KEYWORD

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		redefine
			name,
			build_completion
		end

create

	make

feature -- Access

	name: ET_KEYWORD
			-- AST node corresponding to the Result

	type_base_class: detachable ET_CLASS
			-- Base class of the type of the browsable name, if any
		do
			-- Result := Void
		end

feature -- Basic operations

	build_completion (a_builder: ET_BROWSABLE_COMPLETION_BUILDER)
			-- Build list of completion suggestions.
		do
			if not is_completion_disabled then
				a_builder.add_keyword (name, Current)
			end
			precursor (a_builder)
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
		end

feature -- Processing

	process (a_processor: ET_BROWSABLE_NAME_PROCESSOR)
			-- Process current name.
		do
			a_processor.process_keyword (Current)
		end

end
