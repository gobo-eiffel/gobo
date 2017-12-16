note

	description:

		"Objects that output a sequence of XM_PATH_ITEMs."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SEQUENCE_OUTPUTTER

inherit

	XM_XPATH_SEQUENCE_RECEIVER
		redefine
			start_document
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	XM_XPATH_AXIS

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

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

create

	make, make_with_size

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER)
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
		do
			create output_list.make (50)
			base_uri := ""
			transformer := a_transformer
		ensure
			transformer_set: transformer = a_transformer
		end

	make_with_size (a_size: INTEGER; a_transformer: XM_XSLT_TRANSFORMER)
			-- Establish invariant.
		require
			strictly_positive_size: a_size > 0
			transformer_not_void: a_transformer /= Void
		do
			create output_list.make (a_size)
			base_uri := ""
			transformer := a_transformer
		ensure
			transformer_set: transformer = a_transformer
		end

feature -- Access

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer for error reporting

	sequence: XM_XPATH_VALUE
			-- Built sequence
		require
			not_under_construction: not is_under_construction
		local
			l_cached_sequence: like cached_sequence
		do
			l_cached_sequence := cached_sequence
			if l_cached_sequence = Void then
				inspect
					output_list.count
				when 0 then
					create {XM_XPATH_EMPTY_SEQUENCE} l_cached_sequence.make
				when 1 then
					l_cached_sequence := output_list.item (1).as_item_value
				else
					create {XM_XPATH_SEQUENCE_EXTENT} l_cached_sequence.make_from_list (output_list)
				end
				cached_sequence := l_cached_sequence
			end
			Result := l_cached_sequence
		ensure
			sequence_not_void: Result /= Void
		end

	first_item: detachable XM_XPATH_ITEM
			-- First item of output sequence
		do
			if output_list.count > 0 then
				Result := output_list.item (1)
			end
		end

	last_popped_item: detachable XM_XPATH_ITEM
			-- lasst item of output sequence just popped

feature -- Status report

	is_under_construction: BOOLEAN
			-- Is `sequence' under construction?
		do
			Result := level /= 0
		end

feature -- Events

	on_error (a_message: STRING)
			-- Event producer detected an error.
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_uri, a_code, a_text: STRING
			an_index, a_second_index: INTEGER
		do
			if attached tree as l_tree then
				l_tree.on_error (a_message)
			else
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
				if not base_uri.is_empty then an_error.set_location (base_uri, 0) end
				transformer.report_fatal_error (an_error)
			end
		end

	start_document
			-- New document
		do
			cached_sequence := Void
			is_document_started := True
			if tree = Void then
				create_tree
			end
			check attached tree as l_tree then
				if not l_tree.is_open then l_tree.open end
				if level = 0 then l_tree.start_document end
			end
			level := level + 1
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element.
		do
			if in_start_tag then
				start_content
			end
			if tree = Void then
				create_tree
			end
			check attached tree as l_tree then
				l_tree.start_element (a_name_code, a_type_code, properties)
			end
			level := level + 1
			in_start_tag := True
			previous_atomic := False
			mark_as_written
		end

	end_element
			-- Notify the end of an element.
		do
			if in_start_tag then
				start_content
			end
			check attached tree as l_tree then
				l_tree.end_element
			end
			level := level - 1
			if level = 0 then
				check attached builder as l_builder and then attached l_builder.current_root as l_current_root then
					append_item (l_current_root)
				end
			end
			mark_as_written
			previous_atomic := False
		end -- TODO: what about freeing document from document pool?

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
		local
			l_orphan: XM_XPATH_ORPHAN
			l_name_code: INTEGER
			l_prefix: STRING
		do
			if level = 0 then
				create l_orphan.make (Namespace_node, shared_name_pool.uri_from_namespace_code (a_namespace_code))
				l_prefix := shared_name_pool.prefix_from_namespace_code (a_namespace_code)
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, l_prefix) then
					l_name_code := shared_name_pool.name_code (Null_uri, Null_uri, l_prefix)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, l_prefix)
					l_name_code := shared_name_pool.last_name_code
				end
				l_orphan.set_name_code (l_name_code)
				append_item (l_orphan)
			else
				check
					tree_not_void: attached tree as l_tree
					-- Guarenteed by `start_element'
				then
					l_tree.notify_namespace (a_namespace_code, properties)
				end
			end
			mark_as_written
			previous_atomic := False
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		local
			l_orphan: XM_XPATH_ORPHAN
		do
			if level = 0 then
				create l_orphan.make (Attribute_node, a_value)
				l_orphan.set_name_code (a_name_code)
				append_item (l_orphan)
			else
				check
					tree_not_void: attached tree as l_tree
					-- Guarenteed by `start_element'
				then
					l_tree.notify_attribute (a_name_code, a_type_code, a_value, properties)
				end
			end
			mark_as_written
			previous_atomic := False
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			in_start_tag := False
			check attached tree as l_tree then
				l_tree.start_content
			end
			previous_atomic := False
			mark_as_written
		end

	notify_characters (chars: STRING; properties: INTEGER)
			-- Notify character data.
		local
			l_orphan: XM_XPATH_ORPHAN
		do
			if chars.count /= 0 then
				if in_start_tag then start_content end
				if level = 0 then
					create l_orphan.make (Text_node, chars)
					append_item (l_orphan)
				else
					check
						tree_not_void: attached tree as l_tree
						-- Guarenteed by `start_element' or `start_document'
					then
						l_tree.notify_characters (chars, properties)
					end
				end
			end
			mark_as_written
			previous_atomic := False
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		local
			l_orphan: XM_XPATH_ORPHAN
		do
			if in_start_tag then start_content end
			if level = 0 then
				create l_orphan.make (Comment_node, a_content_string)
				append_item (l_orphan)
			else
				check
					tree_not_void: attached tree as l_tree
					-- Guarenteed by `start_element' or `start_document'
				then
					l_tree.notify_comment (a_content_string, properties)
				end
			end
			mark_as_written
			previous_atomic := False
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		local
			l_orphan: XM_XPATH_ORPHAN
			l_name_code: INTEGER
		do
			if in_start_tag then start_content end
			if level = 0 then
				create l_orphan.make (Processing_instruction_node, a_data_string)
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, a_name) then
					l_name_code := shared_name_pool.name_code (Null_uri, Null_uri, a_name)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, a_name)
					l_name_code := shared_name_pool.last_name_code
				end
				l_orphan.set_name_code (l_name_code)
				append_item (l_orphan)
			else
				check
					tree_not_void: attached tree as l_tree
					-- Guarenteed by `start_element' or `start_document'
				then
					l_tree.notify_processing_instruction (a_name, a_data_string, properties)
				end
			end
			mark_as_written
			previous_atomic := False
		end

	end_document
			-- Notify the end of the document.
		do
			level := level - 1
			if level = 0 then
				check attached tree as l_tree then
					l_tree.end_document
				end
				check attached builder as l_builder and then attached l_builder.current_root as l_current_root then
					append_item (l_current_root)
				end
			end
			is_document_started := False
			previous_atomic := False
		end

	close
			-- Notify end of event stream.
		do
			is_open := False
			if attached tree as l_tree and then l_tree.is_open then
				l_tree.close
			end
		end

	append_item (an_item: XM_XPATH_ITEM)
			-- Output an item (atomic value or node) to the sequence.
		do
			if level = 0 then
				output_list.force_last (an_item)
				previous_atomic := False
			elseif an_item.is_atomic_value then
				check
					tree_not_void: attached tree as l_tree
					-- Guarenteed by `start_element' or `start_document'
				then


					-- If an atomic value is written to a tree, and the previous item was also
					--  an atomic value, then add a single space to separate them

					if previous_atomic then
						l_tree.notify_characters (" ", 0)
					end
					previous_atomic := True
					l_tree.notify_characters (an_item.as_atomic_value.string_value, 0)
				end
			else
				check
					node: an_item.is_node
					-- Items are atomic values or nodes
					attached tree as l_tree
				then
					an_item.as_node.copy_node (l_tree, All_namespaces, True)
					previous_atomic := True
				end
			end
		end

feature -- Element change

	set_document_locator (a_locator: XM_XPATH_LOCATOR)
			-- Set the locator.
		do
			-- do nothing
		end

	pop_last_item
			-- Remove last item in `output_list'.
			-- Removed item (if any) is `last_popped_item'.
		do
			if output_list.count = 0 then
				-- empty sequence
				last_popped_item := Void
			else
				last_popped_item := output_list.last
				output_list.remove_last
			end
		end

feature {NONE} -- Implementation

	output_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- Output list

	in_start_tag: BOOLEAN
			-- Are we within an element?

	tree: detachable XM_XPATH_RECEIVER
			-- Output tree

	builder: detachable XM_XPATH_TINY_BUILDER
			-- Tree builder

	level: INTEGER
			-- Element nesting level

	cached_sequence: detachable XM_XPATH_VALUE
			-- Result returned by `sequence'

	create_tree
			-- Create `tree'.
		require
			tree_not_created: tree = Void
		local
			a_reducer: XM_XSLT_NAMESPACE_REDUCER
			a_complex_outputter: XM_XSLT_COMPLEX_CONTENT_OUTPUTTER
			l_builder: like builder
			l_tree: like tree
		do
			create l_builder.make (base_uri, document_uri)
			builder := l_builder
			l_builder.set_defaults (50, 10, 5, 200)
			create a_reducer.make (l_builder)
			create a_complex_outputter.make (a_reducer)
			l_tree := a_complex_outputter
			tree := l_tree
			l_tree.set_base_uri (base_uri)
			l_tree.open
		end

invariant

	output_list_not_void: output_list /= Void
	transformer_not_void: transformer /= Void

end

