﻿note

	description:

		"Objects that convert strings to Unicode normalization form NFD."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_NFD_NORMALIZER

inherit

	XM_XSLT_UNICODE_NORMALIZER

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize `Current'.
		do
			-- nothing to do
		end

feature -- Access

	normalization_form: STRING = "NFD"
			-- Name of normalization form provided by `Current'

	normalized_string (a_string: STRING): UC_UTF8_STRING
			-- Normalized version of `a_string' according to `normalization_form'
		do
			Result := normalization.as_nfd (a_string)
		end

end
