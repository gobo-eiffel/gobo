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

	Single_level, Multiple_levels, Any_level, Simple_numbering: INTEGER is unique
			-- Level-numbering values

	selected_numberer (a_language: STRING): XM_XSLT_NUMBERER is
			-- Numberer corresponding to `a_language'
		require
			language_not_void: a_language /= Void
		do
			if STRING_.same_string (a_language, "en") then
				create {XM_XSLT_NUMBERER_EN} Result
			end
		end

end
	
