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
			set_name_pool
		end

feature -- Access

	system_id: STRING
			-- SYSTEM-id of the document

feature -- Events

	start_document: XM_XPATH_DOCUMENT is
			-- New document
		do
			Result := base_receiver.start_document
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI.
		do
			base_receiver.set_unparsed_entity (a_name, a_system_id, a_public_id)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			base_receiver.start_element (a_name_code, a_type_code, properties)
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			base_receiver.notify_namespace (a_namespace_code, properties)
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			base_receiver.notify_attribute (a_name_code, a_type_code, a_value, properties)
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			base_receiver.start_content
		end


	end_element is
			-- Notify the end of an element.
		do
			base_receiver.end_element
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			base_receiver.	notify_characters (chars, properties)
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			base_receiver.notify_processing_instruction (a_name, a_data_string, properties)
		end

	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.

		do
			base_receiver.	notify_comment (a_content_string, properties)
		end

	end_document is
			-- Notify the end of the document
		do
			base_receiver.end_document
		end

feature -- Element change

	set_name_pool (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool in which all name codes can be found
		do
			if a_name_pool /= name_pool then
				name_pool := a_name_pool
				base_receiver.set_name_pool (name_pool)
			end
		end

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree
		do
			if a_system_id /= system_id then
				system_id := a_system_id
				base_receiver.set_system_id (system_id)
			end
		end

feature {NONE} -- Implementation

	base_receiver: XM_XPATH_RECEIVER

invariant

	base_receiver_not_void: base_receiver /= Void

end


