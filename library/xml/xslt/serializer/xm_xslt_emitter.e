note

	description:

		"Objects that send receiver events to an output destination."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_EMITTER

inherit

	XM_XPATH_RECEIVER

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	outputter: XM_XSLT_OUTPUT_ENCODER
			-- Outputter which writes to the destination stream

	output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- Output properties

	is_xml_emitter: BOOLEAN
			-- Is `Current' an XML emitter?
		do
			Result := False
		end

	as_xml_emitter: XM_XSLT_XML_EMITTER
			-- `Current' seen as an XML emitter
		require
			xml_emitter: is_xml_emitter
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature -- Status report

	is_error: BOOLEAN
			-- has an error occurred?

feature -- Events

	on_error (a_message: STRING)
			-- Event producer detected an error.
		local
			l_error: XM_XPATH_ERROR_VALUE
			l_uri, l_code, l_text: STRING
			l_index, l_second_index: INTEGER
		do
			l_index := a_message.index_of (':', 1)
			if a_message.count > l_index + 1 and then STRING_.same_string (a_message.substring (1, 1), "X") and then l_index > 0 then
				l_uri := Xpath_errors_uri
				l_code := a_message.substring (1, l_index - 1)
				l_text := a_message.substring (l_index + 2, a_message.count)
			elseif a_message.count > 0 and then a_message.index_of ('#', 2) > 0 then
				l_index := a_message.index_of ('#', 2)
				l_uri := a_message.substring (1, l_index - 1)
				l_second_index := a_message.index_of (':', l_index + 1)
				check
					colon_found: l_second_index > l_index + 1
				end
				l_code := a_message.substring (l_index + 1, l_second_index - 1)
				STRING_.left_adjust (l_code)
				STRING_.right_adjust (l_code)
				l_text := a_message.substring (l_second_index + 1, a_message.count)
			else
				l_text := a_message
				l_uri := Gexslt_eiffel_type_uri
				l_code := "SERIALIZATION_ERROR"
			end
			create l_error.make_from_string (l_text, l_uri, l_code, Dynamic_error)
			if document_uri /= Void then
				l_error.set_location (document_uri.full_reference, 0)
			elseif not base_uri.is_empty then
				l_error.set_location (base_uri, 0)
			end
			serializer.report_fatal_error (l_error)
			is_error := True
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING)
			-- Notify an unparsed entity URI.
		do
			mark_as_written
		end

feature -- Element change

	set_document_locator (a_locator: XM_XPATH_LOCATOR)
			-- Set the locator.
		do
			-- Not used by emitters
		end

	set_output_properties (some_output_properties: XM_XSLT_OUTPUT_PROPERTIES)
			-- Set `output_properties'.
		require
			output_properties_not_void: some_output_properties /= Void
		local
			an_encoding: STRING
			an_outputter: XM_OUTPUT
		do
			output_properties := some_output_properties
			an_encoding := output_properties.encoding
			if outputter /= Void then
				an_outputter := outputter.outputter
				outputter := serializer.encoder_factory.outputter (an_encoding, an_outputter)
			end
		ensure
			output_properties_set: output_properties = some_output_properties
		end

feature -- Basic operations

	suppress_late_open
			-- Suppress writing of XML declaration on close.
		do
			is_no_declaration_on_close := True
		ensure
			no_declaration_written_on_close: is_no_declaration_on_close
		end

feature {NONE} -- Implementation

	serializer: XM_XSLT_SERIALIZER
			-- XML Serializer

	is_no_declaration_on_close: BOOLEAN
			-- Should writing of XML declaration be suppresed from `close'?

invariant

	output_properties_not_void: output_properties /= Void
	serializer_not_void: serializer /= Void

end

