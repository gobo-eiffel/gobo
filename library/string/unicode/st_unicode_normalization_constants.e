indexing

	description:

		"Constants for normalizing Unicode strings"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNICODE_NORMALIZATION_CONSTANTS

feature -- Constants

	Nfd: INTEGER is 0
	Nfc: INTEGER is 1
	Nfkd: INTEGER is 2
	Nfkc: INTEGER is 3
			-- Normal forms

end
