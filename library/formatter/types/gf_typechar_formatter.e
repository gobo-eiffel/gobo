indexing

	description: "Holds a formatter that is activated by a certain character."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	GF_TYPECHAR_FORMATTER


inherit

	GF_FORMAT_TABLE_ELEMENT
		rename
			make as fmt_el_make
		end

	HASHABLE


creation

	make

feature -- Initialization

	make (a_typechar: CHARACTER; a_fmt: GF_ABSTRACT_FORMATTER) is
			-- Initialize.
		require
			formatter_not_void: a_fmt /= Void
		do
			fmt_el_make (a_fmt)
			typechar := a_typechar
		end

feature -- Type character

	typechar: CHARACTER
			-- Formatter is activate by the presence of an escape
			-- character followed by this character.

feature -- Hash code

	hash_code: INTEGER is
		do
			Result := typechar.hash_code
		end

end
