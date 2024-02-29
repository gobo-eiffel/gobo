note

	description:

		"Objects that create Unicode normalizers."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_NORMALIZER_FACTORY

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize `Current'.
		do
			-- Nothing to do in this default implementation.
			-- This may change in the future.
		end

feature -- Status report

	is_supported (a_form: STRING): BOOLEAN
			-- Is `a_from' a Unicode normalization form supported by `Current'?
		require
			a_form_not_void: a_form /= Void
		do
			if STRING_.same_string (a_form, "NFC") then
				Result := True
			elseif STRING_.same_string (a_form, "NFKC") then
				Result := True
			elseif STRING_.same_string (a_form, "NFD") then
				Result := True
			elseif STRING_.same_string (a_form, "NFKD") then
				Result := True
			end
		end

feature -- Access

	normalizer (a_form: STRING): XM_XSLT_UNICODE_NORMALIZER
			-- Unicode normalizer for `a_form'.
		require
			a_form_not_void: a_form /= Void
			a_form_supported: is_supported (a_form)
		do
			if STRING_.same_string (a_form, "NFC") then
				create {XM_XSLT_NFC_NORMALIZER} Result.make
			elseif STRING_.same_string (a_form, "NFKC") then
				create {XM_XSLT_NFKC_NORMALIZER} Result.make
			elseif STRING_.same_string (a_form, "NFD") then
				create {XM_XSLT_NFD_NORMALIZER} Result.make
			elseif STRING_.same_string (a_form, "NFKD") then
				create {XM_XSLT_NFKD_NORMALIZER} Result.make
			else
				check a_form_supported: False then end
			end
		ensure
			normalizer_not_void: Result /= Void
			correct_normalization_form: STRING_.same_string (Result.normalization_form, a_form)
		end

end
