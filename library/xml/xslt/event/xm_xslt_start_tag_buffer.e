note

	description:

		"Event filters that buffer attributes and namespaces on a start tag - for use by use-when filters."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_START_TAG_BUFFER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_document, end_document,
			start_element, end_element,
			notify_namespace, notify_attribute, start_content, close
		end

	XM_XPATH_NAMESPACE_RESOLVER

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_receiver: like base_receiver)
			-- Initialize `Current'.
		require
			a_receiver_not_void: a_receiver /= Void
		do
			create buffered_attributes.make
			create namespace_count_stack.make_default
			create namespaces_stack.make_default
			base_receiver := a_receiver
			base_uri := base_receiver.base_uri
			document_uri := base_receiver.document_uri
		ensure
			base_receiver_set: base_receiver = a_receiver
		end

feature -- Access

	attribute_value (a_fingerprint: INTEGER): STRING
			-- Value of attribute identified by `a_fingerprint'
		do
			Result := buffered_attributes.attribute_value (a_fingerprint)
		end

	uri_for_defaulted_prefix (a_prefix: STRING; a_use_default_namespace: BOOLEAN): STRING
			-- Namespace URI corresponding to a given prefix
		local
			l_uri_code, l_prefix_code: INTEGER
		do
			if a_prefix.is_empty and not a_use_default_namespace then
				Result := ""
			elseif STRING_.same_string (a_prefix, "xml") then
				Result := Xml_uri
			else
				if not shared_name_pool.is_code_for_prefix_allocated (a_prefix) then
					shared_name_pool.allocate_code_for_prefix (a_prefix)
					l_prefix_code := shared_name_pool.last_prefix_code
				else
					l_prefix_code := shared_name_pool.code_for_prefix (a_prefix)
				end
				l_uri_code := uri_code_for_prefix_code (l_prefix_code)
				if l_uri_code = -1 then
					Result := Void
				else
					Result := shared_name_pool.	uri_from_uri_code (l_uri_code)
				end
			end
		end

	fingerprint (a_qname: STRING; a_use_default_namespace: BOOLEAN): INTEGER
			-- Fingerprint of `a_qname'
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_uri: STRING
		do
			create l_parser.make (a_qname)
			l_uri := uri_for_defaulted_prefix (l_parser.optional_prefix, a_use_default_namespace)
			if l_uri = Void then
				Result := -2
			else
				Result := shared_name_pool.fingerprint (l_uri, l_parser.local_name)
			end
		end

feature -- Events


	close
			-- Notify end of event stream.
		do
			if base_receiver.is_document_started then
				base_receiver.end_document
			end
			base_receiver.close
			is_open := False
		end

	start_document
			-- New document
		do
			is_document_started := True
			-- a document node in the content sequence of an element is ignored. However, we need
			-- to stop attributes being created within the document node.
			if nesting_depth = 0 then
				nesting_depth := nesting_depth + 1
				base_receiver.start_document
			end
			accepting_attributes := False
		end


	end_document
			-- Notify the end of the document
		do
			is_document_started := False
			if nesting_depth = 1 then
				nesting_depth := nesting_depth - 1
				base_receiver.end_document
			end
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; a_properties: INTEGER)
			-- Notify the start of an element
		do
			mark_as_written
			element_name_code := a_name_code
			element_type_code := a_type_code
			element_properties := a_properties
			buffered_attributes.wipe_out
			namespace_count_stack.force (0, nesting_depth)
			nesting_depth := nesting_depth + 1
			accepting_attributes := True
			-- Ensure that the element namespace is output, unless this is done
			-- automatically by the caller (which is true, for example, for a literal
			-- result element).
			if not is_namespace_declared (a_properties) then
				if not shared_name_pool.is_namespace_code_allocated_for_name_code (a_name_code) then
					shared_name_pool.allocate_namespace_code_for_name_code (a_name_code)
				end
				notify_namespace (shared_name_pool.namespace_code_from_name_code (a_name_code), 0)
			end
			attribute_count := 0
		end

	end_element
			-- Notify the end of an element.
		do
			mark_as_written
			base_receiver.end_element
			nesting_depth := nesting_depth - 1
			namespaces_stack_size := namespaces_stack_size - namespace_count_stack.item (nesting_depth)
		end


	notify_namespace (a_namespace_code: INTEGER; a_properties: INTEGER)
			-- Notify a namespace.
		local
			l_duplicates_found: BOOLEAN
			l_index, l_limit: INTEGER
		do
			mark_as_written
			check
				pending_elements: accepting_attributes
				-- relies on other filters obeying the rules
			end
			from
				l_limit := namespace_count_stack.item (nesting_depth - 1)
			until
				l_duplicates_found or l_index >= l_limit
			loop
				l_duplicates_found :=  namespaces_stack.item (namespaces_stack_size - l_index) = a_namespace_code
				l_index := l_index + 1
			variant
				namespaces_stack_size - l_index
			end
			if not l_duplicates_found then
				add_to_stack (a_namespace_code)
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER)
			-- Notify an attribute.
		do
			mark_as_written
			check
				pending_elements: accepting_attributes
				-- relies on other filters obeying the rules
			end
			-- Perform namespace fixup for the attribute
			if not is_namespace_declared (a_properties) and shared_name_pool.name_code_to_prefix_index (a_name_code) /= 0 then
				check_proposed_prefix (a_name_code, attribute_count)
				attribute_count := attribute_count + 1
			end
			buffered_attributes.add_attribute (a_name_code, a_type_code, a_value, a_properties)
			-- attributes might be duplicated - checking for this comes later in the pipeline
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
			-- But first, start the pending element, then notify all pending namespaces and attributes.
		local
			l_index: INTEGER
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_value: STRING
		do
			mark_as_written
			base_receiver.start_element (element_name_code, element_type_code, INTEGER_.bit_or (element_properties, Namespace_ok))
			from
				l_index := namespaces_stack_size - namespace_count_stack.item (nesting_depth - 1) + 1
			invariant
				stack_large_enough: namespaces_stack_size - namespace_count_stack.item (nesting_depth - 1) >= 0
				strictly_positive_index: l_index > 0
			until
				l_index > namespaces_stack_size
			loop
				base_receiver.notify_namespace (namespaces_stack.item (l_index), 0)
				l_index := l_index + 1
			variant
				namespaces_stack_size - l_index + 1
			end
			from
				l_cursor := buffered_attributes.name_code_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_value := buffered_attributes.attribute_value_by_index (l_cursor.index)
				if l_value /= Void then
					base_receiver.notify_attribute (l_cursor.item,
						buffered_attributes.attribute_type_code (l_cursor.index),
						l_value,
						INTEGER_.bit_or (buffered_attributes.attribute_properties (l_cursor.index), Namespace_ok))
				end
				l_cursor.forth
			end
			accepting_attributes := False
			base_receiver.start_content
		end

feature {NONE} -- Implementation

	nesting_depth: INTEGER
			-- Depth of element nesting (1 = document root, 2 = document element etc.)

	accepting_attributes: BOOLEAN
			-- Are we accepting attributes?

	element_name_code: INTEGER
			-- Name code of pending element

	element_type_code: INTEGER
			-- Type code of pending element

	element_properties: INTEGER
			-- Properties of pending element

	buffered_attributes: XM_XPATH_ATTRIBUTE_COLLECTION
			-- Attributes of pending element

	namespace_count_stack: DS_ARRAYED_LIST [INTEGER]
			-- Number of namespaces declared at each level

	attribute_count: INTEGER
			-- Number of attributes with substituted prefixes for current element

	namespaces_stack_size: INTEGER
			--	Number of namespaces to be declared at all levels

	namespaces_stack: DS_ARRAYED_LIST [INTEGER]
			--	Namespaces to be declared at all levels

feature {NONE} -- Contract support

	total_namespaces_stacked: INTEGER
			--	Total number of namespace declarations pending at all levels
		local
			l_index: INTEGER
		do
			from
				l_index := 1
			until
				l_index > nesting_depth - 1
			loop
				Result := Result + namespace_count_stack.item (l_index)
				l_index := l_index + 1
			variant
				nesting_depth - l_index
			end
		end

	add_to_stack (a_namespace_code: INTEGER)
			-- Add `a_namespace_code' to saved namespaces.
		do
			namespaces_stack_size := namespaces_stack_size + 1
			namespaces_stack.force (a_namespace_code, namespaces_stack_size)
			namespace_count_stack.force (namespace_count_stack.item (nesting_depth - 1) + 1, nesting_depth - 1)
		ensure
			one_more: namespaces_stack_size = old namespaces_stack_size + 1
			namespace_stacked: namespaces_stack.item (namespaces_stack_size) = a_namespace_code
			one_more_stacked_at_level: namespace_count_stack.item (nesting_depth - 1) = old namespace_count_stack.item (nesting_depth - 1) + 1
		end

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER
			-- URI code for `a_prefix_code' found by searching in-scope namespaces
		local
			l_index, l_code: INTEGER
			l_found: BOOLEAN
		do
			from
				l_index := namespaces_stack_size
			until
				l_found or l_index = 0
			loop
				l_code := prefix_code_from_namespace_code (namespaces_stack.item (l_index))
				if l_code = a_prefix_code then
					Result := uri_code_from_namespace_code (namespaces_stack.item (l_index))
					l_found := True
				end
				l_index := l_index - 1
			end
			if not l_found and a_prefix_code /= 0 then
				Result := -1
			end
		ensure
			nearly_positive_uri_code: Result >= -1
		end

	last_checked_namecode: INTEGER
			-- Possibly different name code as a result of `check_proposed_prefix'

	check_proposed_prefix (a_name_code: INTEGER; a_sequence_number: INTEGER)
			-- Check that the prefix for an element or attribute is acceptable,
			--  allocating a substitute prefix if not.
			-- The prefix is acceptable unless a namespace declaration has been
			--  written that assigns this prefix to a different namespace URI.
			-- This routine also checks that the element or attribute namespace
			-- has been declared, and declares it if not.
		require
			valid_name_code: a_name_code > -1
			positive_sequence_number: a_sequence_number >= 0
		local
			l_namespace_code, l_prefix_code, l_uri_code: INTEGER -- _16
			l_prefix: STRING
		do
			last_checked_namecode := a_name_code
			if not shared_name_pool.is_namespace_code_allocated_for_name_code (a_name_code) then
				shared_name_pool.allocate_namespace_code_for_name_code (a_name_code)
			end
			l_namespace_code := shared_name_pool.namespace_code_from_name_code (a_name_code)
			l_prefix_code := prefix_code_from_namespace_code (l_namespace_code)
			l_uri_code := uri_code_for_prefix_code (l_prefix_code)
			if l_uri_code = -1 then
				notify_namespace (l_namespace_code, 0)
			elseif uri_code_from_namespace_code (l_namespace_code) /= l_uri_code then
				l_prefix := substituted_prefix (l_namespace_code, a_sequence_number)
				shared_name_pool.allocate_name (l_prefix,
					shared_name_pool.namespace_uri_from_name_code (a_name_code),
					shared_name_pool.local_name_from_name_code (a_name_code))
				last_checked_namecode := shared_name_pool.last_name_code
			end
		end

	substituted_prefix (a_namespace_code: INTEGER; a_sequence_number: INTEGER): STRING
			-- Substituted prefix for `a_name_code'
		require
			valid_namespace_code: shared_name_pool.is_valid_namespace_code (a_namespace_code)
			positive_sequence_number: a_sequence_number >= 0
		local
			l_xml_prefix: STRING
		do

			-- This routine substitutes an alternative prefix by appending an underscore followed
			--  by the supplied sequence number to the existing prefix name

			l_xml_prefix := shared_name_pool.prefix_from_namespace_code (a_namespace_code)
			Result := STRING_.concat (l_xml_prefix, "_")
			Result := STRING_.appended_string (Result, a_sequence_number.out)
		ensure
			valid_prefix: Result /= Void and then Result.count > 0
		end

invariant

	buffered_attributes_not_void: buffered_attributes /= Void
	namespace_count_stack_not_void: namespace_count_stack /= Void
	namespace_count_stack_count: namespace_count_stack.count >= (nesting_depth - 1)
	namespaces_stack_not_void: namespaces_stack /= Void
	namespaces_stack_size_large_enough: namespaces_stack_size >= total_namespaces_stacked

end
