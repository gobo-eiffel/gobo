indexing

	description:

		"Eiffel qualified anchored types of the form 'like Current.b'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_LIKE_CURRENT

inherit

	ET_QUALIFIED_TYPE
		redefine
			has_qualified_type
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type: like target_type; a_name: like qualified_name) is
			-- Create a new 'like Current.b' type.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
			target_type := a_type
			qualified_name := a_name
		ensure
			target_type_set: target_type = a_type
			qualified_name_set: qualified_name = a_name
		end

feature -- Access

	like_keyword: ET_KEYWORD is
			-- 'like' keyword
		do
			Result := target_type.like_keyword
		end

	target_type: ET_LIKE_CURRENT
			-- Target anchored type

feature -- Status report

	has_qualified_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type a qualified anchored type (other than of
			-- the form 'like Current.b') when viewed from `a_context',
			-- or do its actual generic parameters (recursively)
			-- contain qualified types?
		do
			Result := False
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			target_type.append_to_string (a_string)
			a_string.append_character ('.')
			a_string.append_string (name.name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_qualified_like_current (Current)
		end

end
