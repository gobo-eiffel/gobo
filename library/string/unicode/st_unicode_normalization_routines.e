indexing

	description:

		"Routines for normalizing Unicode strings"

	remark:

		"These routines will not work on UTF-16 strings - they will %
		%need a few modifications to account of surrogates."

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNICODE_NORMALIZATION_ROUTINES

inherit

	ST_UNICODE_V410_NORMALIZATION_ROUTINES
	
end
