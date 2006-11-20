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
		redefine
			is_proxy, as_proxy, mark_as_written
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	base_receiver: XM_XPATH_RECEIVER

feature -- Status report

	is_proxy: BOOLEAN is
			-- Is `Current' an `XM_XPATH_PROXY_RECEIVER'?
		do
			Result := True
		end

feature -- Status setting

	mark_as_written is
			-- Mark as output has been written.
		do
			is_written := True
			base_receiver.mark_as_written
		end

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
			mark_as_written
			base_receiver.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			mark_as_written
			base_receiver.start_element (a_name_code, a_type_code, properties)
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			mark_as_written
			base_receiver.notify_namespace (a_namespace_code, properties)
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			mark_as_written
			base_receiver.notify_attribute (a_name_code, a_type_code, a_value, properties)
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			mark_as_written
			base_receiver.start_content
		end

	end_element is
			-- Notify the end of an element.
		do
			mark_as_written
			base_receiver.end_element
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			mark_as_written
			base_receiver.	notify_characters (chars, properties)
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			mark_as_written
			base_receiver.notify_processing_instruction (a_name, a_data_string, properties)
		end
	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			mark_as_written
			base_receiver.	notify_comment (a_content_string, properties)
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

feature -- Conversion

	as_proxy: XM_XPATH_PROXY_RECEIVER is
			-- `Current' as a proxy
		do
			Result := Current
		end

invariant

	base_receiver_not_void: base_receiver /= Void

end


