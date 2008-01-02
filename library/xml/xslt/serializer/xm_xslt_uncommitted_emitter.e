indexing

	description:

	"Emitters that write (X)HTML or XML accoridng to the document element."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_UNCOMMITTED_EMITTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XSLT_EMITTER
		rename
			outputter as encoder
		redefine
			suppress_late_open
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

	XM_XPATH_TYPE

	DT_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_serializer: XM_XSLT_SERIALIZER; a_outputter: XM_OUTPUT; a_output_properties: XM_XSLT_OUTPUT_PROPERTIES;
		a_character_map_index: like character_map_index; a_factory: like emitter_factory) is
			-- Initialize `Current'.
		require
			serializer_not_void: a_serializer /= Void
			a_outputter_not_void: a_outputter /= Void
			a_output_properties_not_void: a_output_properties /= Void
			a_character_map_index: not a_output_properties.used_character_maps.is_empty implies a_character_map_index /= Void
			a_factory_not_void: a_factory /= Void
		do
			serializer := a_serializer
			outputter := a_outputter
			output_properties := a_output_properties
			character_map_index := a_character_map_index
			emitter_factory := a_factory
			base_uri := "" -- TODO - set_base_uri
		ensure
			not_yet_committed: not committed
			serializer_set: serializer = a_serializer
			outputter_set: outputter = a_outputter
			output_properties_set: output_properties = a_output_properties
			character_map_index_set: character_map_index = a_character_map_index
			emitter_factory_set: emitter_factory = a_factory
		end

feature -- Events

	open is
			-- Notify start of event stream.
		do
			is_open := True
		end

	close is
			-- Notify end of event stream.
		do
			is_open := False
			base_receiver.close
		end

	start_document is
			-- New document
		do
			is_document_started := True
			if committed then
				base_receiver.start_document
			end
		end

	end_document is
			-- Notify the end of the document
		do
			if not committed then

				-- empty output: must send a begin_document/end_document pair to the content handler

				switch_to_xml
			end
			check
				committed: committed
			end
			base_receiver.end_document
			is_document_started := False
		ensure then
			committed: committed
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_pending_event: XM_XSLT_PENDING_EVENT
		do
			if not committed then
				check_pending_event_list
				create a_pending_event.make (chars, "", Text_node, properties)
				pending_event_list.force_last (a_pending_event)
				if not is_all_whitespace (chars) then
					switch_to_xml
				end
			else
				base_receiver.notify_characters (chars, properties)
			end
			mark_as_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_pending_event: XM_XSLT_PENDING_EVENT
		do
			if not committed then
				check_pending_event_list
				create a_pending_event.make (a_data_string, a_name, Processing_instruction_node, properties)
				pending_event_list.force_last (a_pending_event)
			else
				base_receiver.notify_processing_instruction (a_name, a_data_string, properties)
			end
			mark_as_written
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		local
			a_pending_event: XM_XSLT_PENDING_EVENT
		do
			if not committed then
				check_pending_event_list
				create a_pending_event.make (a_content_string, "", Comment_node, properties)
				pending_event_list.force_last (a_pending_event)
			else
				base_receiver.notify_comment (a_content_string, properties)
			end
			mark_as_written
		end	

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			a_name: STRING
			a_uri_code: INTEGER
		do
			if not committed then
				a_name := shared_name_pool.local_name_from_name_code (a_name_code)
				a_uri_code := shared_name_pool.uri_code_from_name_code (a_name_code)
				if a_uri_code = Xhtml_uri_code and then STRING_.same_string (a_name, "html") then
					switch_to_xhtml
				else
					a_name.to_lower
					if a_uri_code = Default_uri_code and then STRING_.same_string (a_name, "html") then
						switch_to_html
					else
						switch_to_xml
					end
				end
			end
			check
				committed: committed
			end
			base_receiver.start_element (a_name_code, a_type_code, properties)
			mark_as_written
		ensure then
			committed: committed			
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace declaration.
		do
			check
				committed: committed
			end
			base_receiver.notify_namespace (a_namespace_code, properties)
			mark_as_written
		ensure then
			committed: committed
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			check
				committed: committed
			end
			base_receiver.notify_attribute (a_name_code, a_type_code, a_value, properties)
			mark_as_written
		ensure then
			committed: committed
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			check
				committed: committed
			end
			base_receiver.start_content
			mark_as_written
		ensure then
			committed: committed
		end

	end_element is
			-- Notify the end of an element.
		do
			check
				committed: committed
			end
			base_receiver.end_element
			mark_as_written
		ensure then
			committed: committed
		end

feature -- Basic operations

	suppress_late_open is
			-- Suppress writing of XML declaration on close.
		do
			is_no_declaration_on_close := True
			if committed then
				base_emitter.suppress_late_open
			end
		end
	
feature {NONE} -- Implementation

	committed: BOOLEAN
			-- Have we committed yet?

	emitter_factory: XM_XSLT_EMITTER_FACTORY
			-- Factory for producing `base_emitter' and `base_receiver'

	base_receiver: XM_XPATH_RECEIVER
			-- Emitter/indenter to which events are forwarded

	base_emitter: XM_XSLT_EMITTER
			-- Emitter to which events are ultimately forwarded

	outputter: XM_OUTPUT
			-- Writer of encoded strings

	character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]
			-- Table of character maps

	pending_event_list: DS_ARRAYED_LIST [XM_XSLT_PENDING_EVENT]
			-- Pending events

	check_pending_event_list is
			-- Ensure `pending_event_list' is created.
		do
			if pending_event_list = Void then
				create pending_event_list.make_default
			end
		ensure
			pending_event_list_not_void: pending_event_list /= Void
		end

	switch_to_xml is
			-- Switch to an XML emitter.
		require
			not_yet_committed: not committed
		local
			l_pair: DS_PAIR [XM_XPATH_RECEIVER, XM_XSLT_EMITTER]
		do
			output_properties.set_xml_defaults (Platform.Maximum_integer)
			l_pair := emitter_factory.new_xml_emitter (serializer, outputter, output_properties, character_map_index)
			base_receiver := l_pair.first
			base_emitter := l_pair.second
			switch
		ensure
			committed: committed
		end

	switch_to_html is
			-- Switch to an HTML emitter.
		require
			not_yet_committed: not committed
		local
			l_pair: DS_PAIR [XM_XPATH_RECEIVER, XM_XSLT_EMITTER]
		do
			output_properties.set_html_defaults (Platform.Maximum_integer)
			l_pair := emitter_factory.new_html_emitter (serializer, outputter, output_properties, character_map_index)
			base_receiver := l_pair.first
			base_emitter := l_pair.second
			switch
		ensure
			committed: committed
		end

	switch_to_xhtml is
			-- Switch to an XHTML emitter.
		require
			not_yet_committed: not committed
		local
			l_pair: DS_PAIR [XM_XPATH_RECEIVER, XM_XSLT_EMITTER]
		do
			output_properties.set_xhtml_defaults (Platform.Maximum_integer)
			l_pair := emitter_factory.new_xhtml_emitter (serializer, outputter, output_properties, character_map_index)
			base_receiver := l_pair.first
			base_emitter := l_pair.second
			switch
		ensure
			committed: committed
		end

	switch is
			-- Switch to using `base_receiver'.
		require
			base_receiver_not_void: base_receiver /= Void
			not_yet_committed: not committed
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_PENDING_EVENT]
			l_event: XM_XSLT_PENDING_EVENT
		do
			committed := True
			if is_no_declaration_on_close then
				suppress_late_open
			end
			base_receiver.open
			base_receiver.start_document
			if pending_event_list /= Void then
				from
					l_cursor := pending_event_list.new_cursor l_cursor.start
				variant
					pending_event_list.count + 1 - l_cursor.index
				until
					l_cursor.after
				loop
					l_event := l_cursor.item
					inspect
						l_event.node_type
					when Comment_node then
						base_receiver.notify_comment (l_event.content, l_event.properties)
					when Processing_instruction_node then
						base_receiver.notify_processing_instruction (l_event.name, l_event.content, l_event.properties)
					when Text_node then
						base_receiver.notify_characters (l_event.content, l_event.properties)
					end
					l_cursor.forth	
				end
				pending_event_list := Void
			end
		ensure
			committed: committed
		end

invariant

	base_receiver: committed implies base_receiver /= Void
	base_emitter: committed implies base_emitter /= Void
	outputter: outputter /= Void
	character_map_index: not output_properties.used_character_maps.is_empty implies character_map_index /= Void
	emitter_factory_not_void: emitter_factory /= Void

end

				
