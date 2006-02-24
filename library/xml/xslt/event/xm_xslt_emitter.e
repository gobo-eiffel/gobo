indexing

	description:

		"Objects that send receiver events to an output destination."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_EMITTER

inherit

	XM_XPATH_RECEIVER

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	UC_IMPORTED_UNICODE_ROUTINES
		export {NONE} all end

	ST_IMPORTED_UNICODE_NORMALIZATION_ROUTINES
		export {NONE} all end

	ST_UNICODE_NORMALIZATION_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	outputter: XM_XSLT_OUTPUT_ENCODER
			-- Outputter which writes to the destination stream

	output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- Output properties

	character_map_expander: XM_XSLT_CHARACTER_MAP_EXPANDER
			-- Optional character-map expander

	normalization_form: INTEGER
			-- Requested_normalization form

	No_normalization: INTEGER is -1
			-- Default for `normalization_form'

	normalized_string (a_value: STRING): STRING is
			-- Unicode-normalized version of `a_value'
		require
			value_not_void: a_value /= Void
			-- and then URI escaping and character mapping has not been performed
		do
			if a_value.is_empty then
				Result := a_value
			else
				inspect
					normalization_form
				when No_normalization then
					Result := a_value
				when Nfc then
					Result := normalization.to_nfc (a_value)
				when Nfkc then
					Result := normalization.to_nfkc (a_value)
				when Nfd then
					Result := normalization.as_nfd (a_value)
				when Nfkd then
					Result := normalization.as_nfkd (a_value)
				end
			end
		ensure
			normalized_string_not_void: Result /= Void
		end

	is_xml_emitter: BOOLEAN is
			-- Is `Current' an XML emitter?
		do
			Result := False
		end

	as_xml_emitter: XM_XSLT_XML_EMITTER is
			-- `Current' seen as an XML emitter
		require
			xml_emitter: is_xml_emitter
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature -- Status report

	is_error: BOOLEAN
			-- has an error occured?

feature -- Events

		on_error (a_message: STRING) is
			-- Event producer detected an error.
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_uri, a_code, a_text: STRING
			an_index, a_second_index: INTEGER
		do
			an_index := a_message.index_of (':', 1)
			if a_message.count > an_index + 1 and then STRING_.same_string (a_message.substring (1, 1), "X") and then an_index > 0 then
				a_uri := Xpath_errors_uri
				a_code := a_message.substring (1, an_index - 1)
				a_text := a_message.substring (an_index + 2, a_message.count)
			elseif a_message.count > 0 and then a_message.index_of ('#', 2) > 0 then
				an_index := a_message.index_of ('#', 2)
				a_uri := a_message.substring (1, an_index - 1)
				a_second_index := a_message.index_of (':', an_index + 1)
				check
					colon_found: a_second_index > an_index + 1
				end
				a_code := a_message.substring (an_index + 1, a_second_index - 1)
				STRING_.left_adjust (a_code)
				STRING_.right_adjust (a_code)
				a_text := a_message.substring (a_second_index + 1, a_message.count)
			else
				a_text := a_message
				a_uri := Gexslt_eiffel_type_uri
				a_code := "SERIALIZATION_ERROR"
			end
			create an_error.make_from_string (a_text, a_uri, a_code, Dynamic_error)
			if not system_id.is_empty then an_error.set_location (system_id, 0) end
			transformer.report_fatal_error (an_error)
			is_error := True
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI.
		do
			-- Not used by emitters
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			system_id := a_system_id
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			-- Not used by emitters
		end

	set_output_properties (some_output_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Set `output_properties'.
		require
			output_properties_not_void: some_output_properties /= Void
		local
			an_encoding: STRING
			an_outputter: XM_OUTPUT
		do
			output_properties := some_output_properties
			an_encoding := output_properties.encoding
			an_outputter := outputter.outputter
			outputter := transformer.configuration.encoder_factory.outputter (an_encoding, an_outputter)
		ensure
			output_properties_set: output_properties = some_output_properties
		end

	set_normalization_form is
			-- Set `normalization_form'.
		local
			a_request, a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_request := output_properties.normalization_form
			if a_request = Void then
				normalization_form := No_normalization
			elseif STRING_.same_string (a_request, "none") then
				normalization_form := No_normalization
			elseif STRING_.same_string (a_request, "NFC") then
				normalization_form := Nfc
			elseif STRING_.same_string (a_request, "NFD") then
				normalization_form := Nfd
			elseif STRING_.same_string (a_request, "NFKC") then
				normalization_form := Nfkc
			elseif STRING_.same_string (a_request, "NFKD") then
				normalization_form := Nfkd
			else
				a_message := STRING_.concat ("The value for the 'normalization-form' attribute is not supported by the serializser. Found: ", a_request)
				a_message := STRING_.appended_string (a_message, "%N. Only 'NFC', 'NFKC', 'NFD', 'NFKD' and 'none' are supported")
				create an_error.make_from_string (a_message, Xpath_errors_uri, "SESU0011", Dynamic_error)
				transformer.report_fatal_error (an_error)
			end
		end

feature {NONE} -- Implementation

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

invariant

	system_id_not_void: system_id /= Void
	output_properties_not_void: output_properties /= Void
	transformer_not_void: transformer /= Void
	normalization_form: normalization_form >= No_normalization and normalization_form <= Nfkd

end

