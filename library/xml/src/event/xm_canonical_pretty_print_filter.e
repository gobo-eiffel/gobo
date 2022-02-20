note

	description:

		"Pretty printers as in James Clark's canonical XML"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CANONICAL_PRETTY_PRINT_FILTER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			on_comment,
			is_escaped,
			escaped_char
		end

create

	make_null,
	make_next

feature -- Meta

	on_comment (a_content: STRING)
			-- Do not print comment.
		do
			next.on_comment (a_content)
		end

feature {NONE} -- Escaped

	is_escaped (a_char: NATURAL_32): BOOLEAN
			-- Is this character to be escaped?
			-- Include line separators and tab, quote, but not non-ascii characters.
		do
			Result := a_char = Lt_char.natural_32_code
				or a_char = Gt_char.natural_32_code
				or a_char = Amp_char.natural_32_code
				or a_char = 9
				or a_char = 10
				or a_char = 13
				or a_char = Quot_char.natural_32_code -- always escape quote
		end

	escaped_char (a_char: NATURAL_32): STRING
			-- Add quote escaping to Precursor version.
		do
			if a_char = Quot_char.natural_32_code then
				Result := Quot_entity
			else
				Result := Precursor (a_char)
			end
		end

end
