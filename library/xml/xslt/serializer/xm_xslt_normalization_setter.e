note

	description:

		"Objects that set a Unicode normalizer or issue an error."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NORMALIZATION_SETTER

inherit

	ANY

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_serializer: like serializer; a_properties: like output_properties)
			-- Initialize `Current'.
		require
			a_serializer_not_void: a_serializer /= Void
			a_properties_not_void: a_properties /= Void
		do
			serializer := a_serializer
			output_properties := a_properties
			set_normalizer
		ensure
			serializer_set: serializer = a_serializer
			output_properties_set: output_properties = a_properties
		end

	set_normalizer
			-- Set `normalizer' as specified in `a_properties' or issue error.
		local
			l_request, l_message: STRING
		do
			l_request := output_properties.normalization_form
			if l_request /= Void then
				if STRING_.same_string (l_request, "none") then
					-- nothing to do
				elseif STRING_.same_string (l_request, "NFC") then
					create {XM_XSLT_NFC_NORMALIZER} normalizer.make
				elseif STRING_.same_string (l_request, "NFD") then
					create {XM_XSLT_NFD_NORMALIZER} normalizer.make
				elseif STRING_.same_string (l_request, "NFKC") then
					create {XM_XSLT_NFKC_NORMALIZER} normalizer.make
				elseif STRING_.same_string (l_request, "NFKD") then
					create {XM_XSLT_NFKD_NORMALIZER} normalizer.make
				else
					l_message := STRING_.concat ("The value for the 'normalization-form' attribute is not supported by the serializer. Found: ", l_request)
					l_message := STRING_.appended_string (l_message, "%N. Only 'NFC', 'NFKC', 'NFD', 'NFKD' and 'none' are supported")
					serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (l_message, Xpath_errors_uri, "SESU0011", Dynamic_error))
				end
			end
		end

feature -- Access

	normalizer: XM_XSLT_UNICODE_NORMALIZER
			-- Unicode string normalization

feature {NONE} -- Implementation

	serializer: XM_XSLT_SERIALIZER
			-- Serializer for issuing error messages

	output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- Source of normalization-form request

invariant

	serializer_not_void: serializer /= Void
	output_properties_not_void: output_properties /= Void

end

