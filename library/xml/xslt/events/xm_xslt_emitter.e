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

	UC_UNICODE_ROUTINES

feature -- Access

	system_id: STRING
			-- SYSTEM-id of the document

	outputter: XM_XSLT_OUTPUT_ENCODER
			-- Outputter which writes to the destination stream

	output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- Output properties

	-- TODO character_set: XM_XSLT_CHARACTER_SET
	
feature -- Status report

	is_error: BOOLEAN
			-- has an error occured?

feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			transformer.report_fatal_error (a_message, Void)
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
		do
			output_properties := some_output_properties
		ensure
			output_properties_set: output_properties = some_output_properties
		end

feature {NONE} -- Implementation

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

invariant

	system_id_not_void: system_id /= Void
	name_pool_not_void: name_pool /= Void
	output_properties_not_void: output_properties /= Void
	transformer_not_void: transformer /= Void

end

