indexing

	description:

		"Objects that receive XPath events and forward them to another XM_XPATH_RECEIVER"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XPATH_PROXY_RECEIVER

inherit

	XM_XPATH_RECEIVER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	base_receiver: XM_XPATH_RECEIVER

feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			base_receiver.on_error (a_message)
		end

	open is
			-- Notify start of event stream.
		do
			is_open := True
			base_receiver.open
		end

	start_document is
			-- New document
		do
			is_document_started := True
			base_receiver.start_document
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI.
		do
			base_receiver.set_unparsed_entity (a_name, a_system_id, a_public_id)
			is_written := True
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			base_receiver.start_element (a_name_code, a_type_code, properties)
			is_written := True
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			base_receiver.notify_namespace (a_namespace_code, properties)
			is_written := True
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			base_receiver.notify_attribute (a_name_code, a_type_code, a_value, properties)
			is_written := True
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			base_receiver.start_content
			is_written := True
		end

	end_element is
			-- Notify the end of an element.
		do
			base_receiver.end_element
			is_written := True
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			base_receiver.	notify_characters (chars, properties)
			is_written := True
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			base_receiver.notify_processing_instruction (a_name, a_data_string, properties)
			is_written := True
		end
	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			base_receiver.	notify_comment (a_content_string, properties)
			is_written := True
		end

	end_document is
			-- Notify the end of the document
		do
			base_receiver.end_document
			is_document_started := False
		end

	close is
			-- Notify end of event stream.
		do
			base_receiver.close
			is_open := False
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			if not STRING_.same_string(a_system_id, system_id) then
				system_id := a_system_id
				base_receiver.set_system_id (system_id)
			end
		ensure then
			system_id_set: STRING_.same_string(a_system_id, system_id)
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			base_receiver.set_document_locator (a_locator)			
		end

invariant

	base_receiver_not_void: base_receiver /= Void

end


