indexing

	description:

	"[
		Eiffel qualified anchored types of the form 'like a.b.c'
		or 'like Current.b.c' or 'like {A}.b.c'
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_LIKE_TYPE

inherit

	ET_QUALIFIED_LIKE_IDENTIFIER

create

	make

feature {NONE} -- Initialization

	make (a_type: like target_type; a_name: like qualified_name) is
			-- Create a new 'like a.b.c' type.
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

	type_mark: ET_TYPE_MARK is
			-- '!' or '?' symbol
		do
			Result := target_type.type_mark
		end

	like_keyword: ET_KEYWORD is
			-- 'like' keyword
		do
			Result := target_type.like_keyword
		end

	target_type: ET_LIKE_TYPE
			-- Target anchored type

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			target_type.append_to_string (a_string)
			a_string.append_character ('.')
			a_string.append_string (name.lower_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_qualified_like_type (Current)
		end

end
