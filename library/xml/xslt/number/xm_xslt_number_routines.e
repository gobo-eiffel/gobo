indexing

	description:

		"Support rountines for xsl:number"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBER_ROUTINES

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	Single_level: INTEGER is 1
	Multiple_levels: INTEGER is 2
	Any_level: INTEGER is 3
	Simple_numbering: INTEGER is 4
			-- Level-numbering values from xsl:number

	selected_numberer (a_language: STRING): XM_XSLT_NUMBERER is
			-- Numberer corresponding to `a_language'
		require
			language_not_void: a_language /= Void
			-- TODO: is_valid string for xml:lang (i.e. RFC 3066 compliant)
		do

			-- TODO: use a plug-in table, with regxep perhaps?
			--  can provide a parrot scripting facility within gestalt
			-- Do we need the country argument from format-dateTime as well?
			-- Probably not - this can be an argument to the routines


			if a_language.count > 1 and then STRING_.same_string (a_language.substring (1, 2), "en") then
				create {XM_XSLT_NUMBERER_EN} Result
			end
		end

	is_zeros_plus_one (a_picture: STRING): BOOLEAN is
			-- Does `a_picture' consist of zero or more zeros followed by a one?
		require
			picture_not_empty: a_picture /= Void and then not a_picture.is_empty
		local
			a_unit, a_zero, a_count, an_index: INTEGER
		do
			a_unit := a_picture.item_code (a_picture.count)
			if is_one (a_unit) then
				from
					an_index := 1; Result := True; a_zero := a_unit - 1; a_count := a_picture.count
				until Result = False or else an_index = a_count loop
					Result := a_picture.item_code (an_index) = a_zero
					an_index := an_index + 1
				end
			end
		end

feature {NONE} -- Implementation

	is_one (an_integer: INTEGER): BOOLEAN is
			-- Is `an_integer' a Unicode codepoint of decimal value 1?
			-- This will be replaced by a generated Unicode routine
		do
			Result := an_integer = 49
		end

end
	
