indexing

	description:

		"Objects that normalize Unicode strings."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_UNICODE_NORMALIZER

inherit

	ANY
	
	ST_IMPORTED_UNICODE_NORMALIZATION_ROUTINES
		export {NONE} all end

feature -- Access

	normalization_form: STRING is
			-- Name of normalization form provided by `Current'
		deferred
		ensure
			normalization_form_not_void: Result /= Void
			normalization_form_not_empty: not Result.is_empty
		end

	normalized_string (a_string: STRING): UC_UTF8_STRING is
			-- Normalized version of `a_string' according to `normalization_form'
		require
			a_string_not_void: a_string /= Void
		deferred
		ensure
			normalized_string_not_void: Result /= Void
		end

end
