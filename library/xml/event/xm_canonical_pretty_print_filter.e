indexing

	description:

		"Pretty printer as in James Clark's canonical XML"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_CANONICAL_PRETTY_PRINT_FILTER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			on_comment,
			is_escaped
		end

creation

	make_null,
	set_next

feature -- Meta

	on_comment (a_content: UC_STRING) is
			-- Do not print comment.
		do
			next.on_comment (a_content)
		end

feature {NONE} -- Escaped

	is_escaped (a_char: INTEGER): BOOLEAN is
			-- Is this escaped, including line separators and tab?
		do
			Result := Precursor (a_char)
					or a_char = 9
					or a_char = 10
					or a_char = 13
					or a_char = Quot_char.code -- always escape quote
		end

end
