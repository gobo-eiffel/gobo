indexing

	description:

		"Objects that output a sequence of XM_PATH_ITEMs."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SEQUENCE_OUTPUTTER	

inherit
	
	XM_XSLT_OUTPUTTER	
		redefine
			start_document
		end

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_AXIS

	XM_XPATH_DEBUGGING_ROUTINES

	-- This outputter is used when writing a sequence of atomic values and nodes,
	--  e.g. when xsl:variable is used with content and an "as" attribute. The outputter
	--  builds the sequence and provides access to it. (It isn't really an outputter at all,
	--  it doesn't pass the events to anyone, it merely constructs the sequence in memory
	--  and provides access to it). Note that the event sequence can include calls such as
	--  start_element and end_element that require trees to be built. If nodes such as attributes
	--  and text nodes are received while an element is being constructed, the nodes are added
	--  to the tree. Otherwise, "orphan" nodes (nodes with no parent) are created and added
	--  directly to the sequence.
 
	-- This class is not used to build temporary trees. For that, the XM_XSLT_COMPLEX_CONTENT_OUTPUTTER is used.

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create output_list.make_default
		end

feature -- Access

	system_id: STRING
			-- SYSTEM ID of output sequence

	sequence: XM_XPATH_VALUE is
			-- Built sequence
		do
			inspect
				output_list.count
			when 0 then
				create {XM_XPATH_EMPTY_SEQUENCE} Result.make
			when 1 then
				Result := output_list.item (1).as_value
			else
				create {XM_XPATH_SEQUENCE_EXTENT} Result.make_from_list (output_list)
			end
		ensure
			sequence_not_void: Result /= Void
		end

	first_item: XM_XPATH_ITEM is
			-- First item of output sequence
		do
			if output_list.count > 0 then
				Result := output_list.item (1)
			end
		end
			
feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			if tree /= Void then
				tree.on_error (a_message)
			end
		end

	start_document is
			-- New document
		do
			do_nothing
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element.
		local
			a_reducer: XM_XSLT_NAMESPACE_REDUCER
			a_complex_outputter: XM_XSLT_COMPLEX_CONTENT_OUTPUTTER
		do
			if in_start_tag then
				start_content
			end
			if tree = Void then
				create builder.make
				builder.set_defaults (50, 10, 5, 200)
				create a_reducer.make (builder)
				create a_complex_outputter.make (a_reducer)
				tree := a_complex_outputter
				tree.set_system_id (system_id)
				tree.start_document
				tree.start_element (a_name_code, a_type_code, properties)
			else
				tree.start_element (a_name_code, a_type_code, properties)
			end
			level := level + 1
			in_start_tag := True
			previous_atomic := False
		end

		end_element is
			-- Notify the end of an element.
		local
			a_document: XM_XPATH_TINY_DOCUMENT
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_element: XM_XPATH_NODE
			a_tiny_element: XM_XPATH_TINY_ELEMENT
		do
			if in_start_tag then
				start_content
			end
			level := level - 1
			if level = 0 then
				tree.end_element
				tree.end_document
				a_document := builder.tiny_document
				tree := Void
				builder := Void
				an_iterator := a_document.new_axis_iterator (Child_axis); an_iterator.start
				an_element := an_iterator.item
				a_tiny_element ?= an_element
				check
					tiny_element: a_tiny_element /= Void
				end
				a_document.set_root_node (a_tiny_element)
				append_item (an_element)
			else
				tree.end_element
			end
			previous_atomic := False
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			if tree = Void then
				todo ("notify_namespace", true)
			else
				tree.notify_namespace (a_namespace_code, properties)
			end
			previous_atomic := False
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			if tree = Void then
				todo ("notify_attribute", true)
			else
				tree.notify_attribute (a_name_code, a_type_code, a_value, properties)
			end
			previous_atomic := False
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			in_start_tag := False
			tree.start_content
			previous_atomic := False
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			an_orphan: XM_XPATH_ORPHAN
		do
			if chars.count /= 0 then
				if in_start_tag then start_content end
				if tree = Void then
					create an_orphan.make (Text_node, chars)
					append_item (an_orphan)
				else
					tree.notify_characters (chars, properties)
				end
				previous_atomic := False
			end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			if in_start_tag then start_content end
			if tree = Void then
					todo ("notify_comment", true)
				else
					tree.notify_comment (a_content_string, properties)
			end
			previous_atomic := False
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			if in_start_tag then start_content end
			if tree = Void then
					todo ("notify_comment", true)
				else
					tree.notify_processing_instruction (a_name, a_data_string, properties)
			end
			previous_atomic := False
		end

	end_document is
			-- Notify the end of the document.
		do
			previous_atomic := False
		end

	append_item (an_item: XM_XPATH_ITEM) is
			-- Output an item (atomic value or node) to the sequence.
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_node: XM_XPATH_NODE
		do

			-- If an atomic value is written to a tree, and the previous item was also
			--  an atomic value, then add a single space to separate them

			an_atomic_value ?= an_item
			if previous_atomic and then tree /= Void and then an_atomic_value /= Void then
				tree.notify_characters (" ", 0)
			end
			previous_atomic := an_atomic_value /= Void
			if tree = Void then
				output_list.put_last (an_item)
			else
				if an_atomic_value /= Void then
					tree.notify_characters (an_atomic_value.string_value, 0)
				else
					a_node ?= an_item
					check
						node: a_node /= Void
						-- Items are atomic values or nodes
					end
					a_node.copy_node (tree, All_namespaces, True)
				end
			end
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			system_id := a_system_id
		ensure then
			system_id_set: system_id = a_system_id
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			do_nothing
		end

feature {NONE} -- Implementation

	output_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- Output list

	in_start_tag: BOOLEAN
			-- Are we within an element?

	tree: XM_XPATH_RECEIVER
			-- Output tree

	builder: XM_XPATH_TINY_BUILDER
			-- Tree builder

	level: INTEGER
			-- Element nesting level

invariant

	output_list_not_void: output_list /= Void

end
	
