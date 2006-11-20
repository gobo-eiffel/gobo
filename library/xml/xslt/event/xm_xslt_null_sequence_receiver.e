indexing

	description:

		"Dummy receivers for use in testing only."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_NULL_SEQUENCE_RECEIVER

inherit

	XM_XPATH_SEQUENCE_RECEIVER
		redefine
			start_document, set_unparsed_entity
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `Current'.
		do
			-- TODO - set_system_id
			system_id := ""
		end

feature -- Events

	append_item (an_item: XM_XPATH_ITEM) is
			-- Output an item (atomic value or node) to the sequence.
		do
			-- do_nothing
		end

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			-- do_nothing
		end

	start_document is
			-- New document
		do
			is_document_started := True
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI.
		do
			mark_as_written
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element.
		do
			mark_as_written
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			mark_as_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			mark_as_written
		end

	start_content is
			-- Notify the start of the content.
		do
			mark_as_written
		end

	end_element is
			-- Notify the end of an element.
		do
			mark_as_written
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			mark_as_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			mark_as_written
		end
	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			mark_as_written
		end

	end_document is
			-- Notify the end of the document.
		do
			is_document_started := False
		end

	close is
			-- Notify end of event stream.
		do
			previous_atomic := False
			is_open := False
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			-- do_nothing
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			-- do_nothing
		end
	
end
	
