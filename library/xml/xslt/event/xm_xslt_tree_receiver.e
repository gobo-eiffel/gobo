indexing

	description:

		"Objects that act as a bridge between a sequence receiver and a plain receiver."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_TREE_RECEIVER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			open, close, start_document, end_document, start_element, notify_namespace,
			notify_attribute, start_content, end_element, notify_characters,
			notify_processing_instruction, notify_comment
		end

	XM_XPATH_SEQUENCE_RECEIVER
		undefine
			open, start_document, set_unparsed_entity, is_proxy, as_proxy, mark_as_written,
			set_document_uri, set_base_uri
		end

	XM_XPATH_AXIS

create

	make

feature {NONE} -- Initialization

	make (a_receiver: XM_XPATH_RECEIVER) is
			-- Establish invariant.
		require
			underlying_receiver_not_void: a_receiver /= Void
		do
			base_receiver := a_receiver
			base_uri := a_receiver.base_uri
			document_uri := a_receiver.document_uri
		ensure
			base_receiver_set: base_receiver = a_receiver
		end

feature -- Events

	open is
			-- Notify start of event stream.
		do
			Precursor {XM_XPATH_PROXY_RECEIVER}
			previous_atomic := False
		end

	start_document is
			-- New document
		do
			Precursor {XM_XPATH_PROXY_RECEIVER}
			previous_atomic := False
		end
	
	end_document is
			-- Notify the end of the document
		do
			Precursor
			previous_atomic := False
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			Precursor (a_name_code, a_type_code, properties)
			previous_atomic := False
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			Precursor (a_namespace_code, properties)
			previous_atomic := False
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			Precursor (a_name_code, a_type_code, a_value, properties)
			previous_atomic := False
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			Precursor
			previous_atomic := False
		end

	end_element is
			-- Notify the end of an element.
		do
			Precursor
			previous_atomic := False
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			Precursor (chars, properties)
			previous_atomic := False
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			Precursor (a_name, a_data_string, properties)
			previous_atomic := False
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			Precursor (a_content_string, properties)
			previous_atomic := False
		end

	close is
			-- Notify end of event stream.
		do
			Precursor
			previous_atomic := False
		end

	append_item (an_item: XM_XPATH_ITEM) is
			-- Output an item (atomic value or node) to the sequence.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			if an_item.is_atomic_value then
				if previous_atomic then
					notify_characters (" ", 0)
				end
				notify_characters (an_item.as_atomic_value.string_value, 0)
				previous_atomic := True
			elseif an_item.is_document then
				from
					an_iterator := an_item.as_document.new_axis_iterator (Child_axis); an_iterator.start
				until
					an_iterator.after
				loop
					append_item (an_iterator.item)
					an_iterator.forth
				end
			else
				check
					is_node: an_item.is_node
					-- It can't be anything else
				end
				an_item.as_node.copy_node (Current, All_namespaces, True)
				previous_atomic := False
			end
		end

end
	
