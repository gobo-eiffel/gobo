indexing

	description:

		"Constants for normalizing Unicode strings"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNICODE_NORMALIZATION_CONSTANTS

feature -- Constants

	Nfd: INTEGER is 0
			-- Normal forms

	Nfc: INTEGER is 1
			-- Normal forms

	Nfkd: INTEGER is 2
			-- Normal forms

	Nfkc: INTEGER is 3
			-- Normal forms

end
