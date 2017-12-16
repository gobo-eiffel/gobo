note
	description:

		"Objects that output complex content."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2016, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPLEX_CONTENT_OUTPUTTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_SEQUENCE_RECEIVER
		redefine
			open, start_document, is_name_code_ok_for_start_element, mark_as_written
		end

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_AXIS

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

	-- This class is used for generating complex content, that is, the content of an
	--  element or document node. It enforces the rules on the order of events within
	--  complex content (attributes and namespaces must come first), and it implements
	--  part of the namespace fixup rules, in particular, it ensures that there is a
	--  namespace node for the namespace used in the element name and in each attribute name.

	-- The same XM_XSLT_COMPLEX_CONTENT_OUTPUTTER may be used for generating an entire XML
	--  document; it is not necessary to create a new outputter for each element node.

create

	make

feature {NONE} -- Initialization

	make (a_underlying_receiver: XM_XPATH_RECEIVER)
			-- Establish invariant.
		require
			underlying_receiver_not_void: a_underlying_receiver /= Void
		do
			next_receiver := a_underlying_receiver
			pending_start_tag := -2
			document_uri := a_underlying_receiver.document_uri
			base_uri := a_underlying_receiver.base_uri
			create pending_attributes_name_codes.make_filled (0, 1, Initial_arrays_size)
			create pending_attributes_type_codes.make_filled (0, 1, Initial_arrays_size)
			create pending_attributes_values.make_filled (Void, 1, Initial_arrays_size)
			create pending_attributes_properties.make_filled (0, 1, Initial_arrays_size)
			create pending_namespaces.make_filled (0, 1, 3)
		ensure
			next_receiver_set: next_receiver = a_underlying_receiver
			no_pending_start_tag: pending_start_tag = -2
		end

feature {XM_XSLT_TRANSFORMER} -- Access

	next_receiver: XM_XPATH_RECEIVER
			-- Next receiver in pipeline

feature -- Status report

	is_name_code_ok_for_start_element (a_name_code: INTEGER): BOOLEAN
			-- Is `a_name_code' valid for `start_element'?
		do

			-- This is redefined by receivers capable of skipping an element

			Result := a_name_code = -10 or else a_name_code >= 0
		end

feature -- Status setting

	mark_as_written
			-- Mark as output has been written.
		do
			is_written := True
			next_receiver.mark_as_written
		end

feature -- Events

	on_error (a_message: STRING)
			-- Event producer detected an error.
		do
			next_receiver.on_error (a_message)
		end

	open
			-- Notify start of event stream.
		do
			is_open := True
			is_top_level := True
			next_receiver.open
			previous_atomic := False
		end

	start_document
			-- New document
		do
			is_document_started := True
			if pending_start_tag < 0 then
				next_receiver.start_document
			else
				start_content
			end
			previous_atomic := False
		end

	start_nested_document
			-- Start a copy of a new document within `Current'.
		require
			nested_document: is_document_started
		do
			start_content
			pending_start_tag := -2
			is_top_level := True
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element.
		do
			is_top_level := False
			if a_name_code = -10 then

				-- This is used on error recovery when there is a bad element name. It is needed so that
            --  the outputter can suppress any subsequent namespace and attribute nodes

				suppress_attributes := True
			else
				suppress_attributes := False
				if pending_start_tag >= 0 then start_content end
				debug ("XSLT content output")
					std.error.put_string ("Starting element " + shared_name_pool.display_name_from_name_code (a_name_code))
					std.error.put_new_line
				end
				start_element_properties := properties
				pending_attributes_lists_size := 0
				pending_namespaces_list_size := 0
				pending_start_tag := a_name_code
				is_element_in_null_namespace := Void -- i.e. not yet computed
				current_simple_type := a_type_code
				previous_atomic := False
			end
			mark_as_written
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
		local
			reject_these_duplicates, reject: BOOLEAN
			another_namespace_code, an_index: INTEGER
			a_uri_code, a_prefix_code: INTEGER -- _16
			l_is_element_in_null_namespace: like is_element_in_null_namespace
		do
			if not suppress_attributes then
				if pending_start_tag < 0 then
					if is_top_level then
						on_error ("XTDE0420: Cannot write a namespace declaration when the parent is a document node")
					else
						on_error ("XTDE0410: Namespace declarations must be created before the element's children")
					end
				else

					-- Handle declarations whose prefix is duplicated for this element.

					reject_these_duplicates := are_duplicates_rejected (properties)
					a_uri_code := uri_code_from_namespace_code (a_namespace_code)
					a_prefix_code := prefix_code_from_namespace_code (a_namespace_code)
					from
						an_index := 1
					until
						reject or else an_index > pending_namespaces_list_size
					loop
						another_namespace_code := pending_namespaces.item (an_index)
						if a_namespace_code = another_namespace_code then

							-- same prefix and URI: ignore this duplicate

							reject := True
						else
							if a_prefix_code = prefix_code_from_namespace_code (another_namespace_code) then

								-- same prefix

								if reject_these_duplicates then
									on_error ("XTDE0430: Cannot create two namespace nodes with the same name")
								end
								reject := True
							else
								an_index := an_index + 1
							end
						end
					end
					if not reject then

						-- It is an error to output a namespace node for the default namespace if the element
						--  itself is in the null namespace, as the resulting element could not be serialized

						if a_prefix_code = 0 and then a_uri_code /= 0 then
							l_is_element_in_null_namespace := is_element_in_null_namespace
							if l_is_element_in_null_namespace = Void then
								create l_is_element_in_null_namespace.make (shared_name_pool.namespace_code_from_name_code (pending_start_tag) = 0)
								is_element_in_null_namespace := l_is_element_in_null_namespace
							end
							if l_is_element_in_null_namespace.item then
								on_error ("XTDE0440: Cannot output a namespace node for the default namespace when the element is in no namespace")
								reject := True
							end
						end
					end
					if not reject then

						-- If it's not a duplicate namespace, add it to the list for this start tag.

						pending_namespaces_list_size := pending_namespaces_list_size + 1
						if pending_namespaces_list_size > pending_namespaces.count then
							INTEGER_ARRAY_.resize_with_default (pending_namespaces, 0, 1, 2 * pending_namespaces_list_size)
						end
						pending_namespaces.put (a_namespace_code, pending_namespaces_list_size)
						previous_atomic := False
					end
				end
			end
			mark_as_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		local
			an_index, a_new_size: INTEGER
			duplicate_found: BOOLEAN
		do
			if not suppress_attributes then
				if pending_start_tag < 0 then
					if is_top_level then
						on_error ("XTDE0420: Cannot write an attribute declaration when the parent is a document node")
					else
						on_error ("XTDE0410: Attributes must be created before the element's children")
					end
				else

					-- If this is a duplicate attribute, overwrite the original, unless
					--  the REJECT_DUPLICATES option is set.

					from
						an_index := 1
					until
						duplicate_found or else an_index > pending_attributes_lists_size
					loop
						if pending_attributes_name_codes.item (an_index) = a_name_code then
							check
								duplicate_attributes_suppressed: not are_duplicates_rejected (properties)
								-- But XQuery can behave differently
							end
							pending_attributes_type_codes.put (a_type_code, an_index)
							pending_attributes_values.put (a_value, an_index)
							pending_attributes_properties.put (properties, an_index)
							duplicate_found := True
						else
							an_index := an_index + 1
						end
					end

					if not duplicate_found then
						if pending_attributes_lists_size >= pending_attributes_type_codes.upper then
							a_new_size := 2 * pending_attributes_type_codes.upper
							INTEGER_ARRAY_.resize_with_default (pending_attributes_name_codes, 0, 1, a_new_size)
							INTEGER_ARRAY_.resize_with_default (pending_attributes_type_codes, 0, 1, a_new_size)
							STRING_ARRAY_.resize_with_default (pending_attributes_values, Void, 1, a_new_size)
							INTEGER_ARRAY_.resize_with_default (pending_attributes_properties, 0, 1, a_new_size)
						end
						pending_attributes_lists_size := pending_attributes_lists_size + 1
						pending_attributes_name_codes.put (a_name_code, pending_attributes_lists_size)
						pending_attributes_type_codes.put (a_type_code, pending_attributes_lists_size)
						pending_attributes_values.put (a_value, pending_attributes_lists_size)
						pending_attributes_properties.put (properties, pending_attributes_lists_size)
						previous_atomic := False
					end
				end
			end
			mark_as_written
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			properties, an_index: INTEGER
			a_name_code: INTEGER
		do
			if pending_start_tag >= 0 then
				check_proposed_prefix (pending_start_tag, 0)
				properties := start_element_properties
				if not is_namespace_declared (properties) then
					properties := properties + Namespace_ok
				end
				next_receiver.start_element (last_checked_namecode, current_simple_type, properties)
				from
					an_index := 1
				until
					an_index > pending_attributes_lists_size
				loop
					a_name_code := pending_attributes_name_codes.item (an_index)
					if shared_name_pool.name_code_to_prefix_index (a_name_code) /= 0 then
						check_proposed_prefix (a_name_code, an_index)
						pending_attributes_name_codes.put (last_checked_namecode, an_index)
					end
					an_index := an_index + 1
				end
				from
					an_index := 1
				until
					an_index > pending_namespaces_list_size
				loop
					next_receiver.notify_namespace (pending_namespaces.item (an_index), 0)
					an_index := an_index + 1
				end
				from
					an_index := 1
				until
					an_index > pending_attributes_lists_size
				loop
					check attached pending_attributes_values.item (an_index) as l_pending_attributes_value then
						next_receiver.notify_attribute (pending_attributes_name_codes.item (an_index),
															  pending_attributes_type_codes.item (an_index),
															  l_pending_attributes_value,
															  pending_attributes_properties.item (an_index))
					end
					an_index := an_index + 1
				end
				next_receiver.start_content
				pending_start_tag := -1
				pending_attributes_lists_size := 0
				previous_atomic := False
			end
			mark_as_written
		end

	end_element
			-- Notify the end of an element.
		do
			if pending_start_tag >=0 then start_content end
			next_receiver.end_element
			previous_atomic := False
			mark_as_written
		end

	notify_characters (chars: STRING; properties: INTEGER)
			-- Notify character data.
		do
			previous_atomic := False
			if chars.count > 0 then
				if pending_start_tag >= 0 then start_content end
				next_receiver.notify_characters (chars, properties)
			end
			mark_as_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		do
			if pending_start_tag >= 0 then start_content end
			next_receiver.notify_processing_instruction (a_name, a_data_string, properties)
			previous_atomic := False
			mark_as_written
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		do
			if pending_start_tag >= 0 then start_content end
			next_receiver.notify_comment (a_content_string, properties)
			previous_atomic := False
			mark_as_written
		end

	end_document
			-- Notify the end of the document.
		do
			next_receiver.end_document
			is_document_started := False
			previous_atomic := False
		end

	end_nested_document
			-- Notify end of nested document copy.
		do
		end

	close
			-- Notify end of event stream.
		do
			next_receiver.close
			is_open := False
			previous_atomic := False
		end

	append_item (an_item: XM_XPATH_ITEM)
			-- Output an item (atomic value or node) to the sequence.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			if an_item.is_atomic_value then
				if previous_atomic then notify_characters (" ", 0) end
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
			elseif attached an_item.error_value as l_error_value then
				check is_error: an_item.is_error end
				on_error (l_error_value.error_message)
			else
				check
					node: an_item.is_node
					-- items are atomic values or nodes
				end
				an_item.as_node.copy_node (Current, All_namespaces, True)
				previous_atomic := False
			end
		end

feature -- Element change

	set_document_locator (a_locator: XM_XPATH_LOCATOR)
			-- Set the locator.
		do
			-- do nothing
		end

feature {NONE} -- Implementation

	pending_start_tag: INTEGER
			-- Name code of pending start tag

	is_element_in_null_namespace: detachable DS_CELL [BOOLEAN]
			-- Is current element in null namespace?

	suppress_attributes: BOOLEAN
			-- Should attribute output be suppressed?

	start_element_properties: INTEGER
			-- Properties supplied to `start_element'

	pending_attributes_lists_size: INTEGER
			-- Size of following 4 arrays

	pending_attributes_name_codes: ARRAY [INTEGER]
			-- Pending attribute name codes

	pending_attributes_type_codes: ARRAY [INTEGER]
			-- Pending attribute type codes

	pending_attributes_values: ARRAY [detachable STRING]
			-- Pending attribute values

	pending_attributes_properties: ARRAY [INTEGER]
			-- Pending attribute properties

	pending_namespaces_list_size: INTEGER
			-- Size of `pending_namespaces'

	pending_namespaces: ARRAY [INTEGER]
			-- Pending namespace codes

	Initial_arrays_size: INTEGER = 5
			-- Initial size for arrays

	current_simple_type: INTEGER
			-- Simple type of current start tag, or 0

	last_checked_namecode: INTEGER
			-- Possibly different name code as a result of `check_proposed_prefix'

	is_top_level: BOOLEAN
			-- Are we dealing with a document node or not?

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
			l_index: INTEGER
			l_namespace_code, l_other_namespace_code, l_prefix_code, l_uri_code: INTEGER -- _16
			l_prefix, l_uri, l_local_name: STRING
			l_finished: BOOLEAN
		do
			last_checked_namecode := a_name_code
			if not shared_name_pool.is_namespace_code_allocated_for_name_code (a_name_code) then
				shared_name_pool.allocate_namespace_code_for_name_code (a_name_code)
			end
			l_namespace_code := shared_name_pool.namespace_code_from_name_code (a_name_code)
			l_prefix_code := prefix_code_from_namespace_code (l_namespace_code)
			l_uri_code := uri_code_from_namespace_code (l_namespace_code)
			from
				l_index := l_index + 1
			until
				l_finished or else l_index > pending_namespaces_list_size
			loop
				l_other_namespace_code := pending_namespaces.item (l_index)
				if l_prefix_code = prefix_code_from_namespace_code (l_other_namespace_code) then
					if l_uri_code = uri_code_from_namespace_code (l_other_namespace_code) then
						l_finished := True
					else
						l_prefix := substituted_prefix (l_namespace_code, a_sequence_number)
						l_local_name := shared_name_pool.local_name_from_name_code (a_name_code)
						l_uri_code := shared_name_pool.uri_code_from_name_code (a_name_code)
						l_uri := shared_name_pool.uri_from_uri_code (l_uri_code)
						if shared_name_pool.is_name_code_allocated_using_uri_code (l_prefix, l_uri_code, l_local_name) then
							last_checked_namecode := shared_name_pool.name_code (l_prefix, l_uri, l_local_name)
						else
							shared_name_pool.allocate_name_using_uri_code (l_prefix, l_uri_code, l_local_name)
							last_checked_namecode := shared_name_pool.last_name_code
						end
						if not shared_name_pool.is_namespace_code_allocated_for_name_code (last_checked_namecode) then
							shared_name_pool.allocate_namespace_code_for_name_code (last_checked_namecode)
						end
						notify_namespace (shared_name_pool.namespace_code_from_name_code (last_checked_namecode), 0)
						l_finished := True
					end
				else
					l_index := l_index + 1
				end
			end
			if not l_finished then
				notify_namespace (l_namespace_code, 0)
			end
		ensure
			last_checked_namecode: last_checked_namecode > -1
		end

	substituted_prefix (a_namespace_code: INTEGER; a_sequence_number: INTEGER): STRING
			-- Substituted prefix for `a_name_code'
		require
			valid_namespace_code: shared_name_pool.is_valid_namespace_code (a_namespace_code)
			positive_sequence_number: a_sequence_number >= 0
		local
			an_xml_prefix: STRING
		do

			-- This routine substitutes an alternative prefix by appending an underscore followed
			--  by the supplied sequence number to the existing prefix name

			an_xml_prefix := shared_name_pool.prefix_from_namespace_code (a_namespace_code)
			Result := STRING_.concat (an_xml_prefix, "_")
			Result := STRING_.appended_string (Result, a_sequence_number.out)
		ensure
			valid_prefix: Result /= Void and then Result.count > 0
		end

invariant

	next_receiver_not_void: next_receiver /= Void
	attribute_lists: pending_attributes_name_codes /= Void and then
		pending_attributes_type_codes /= Void and then
		pending_attributes_values /= Void and then
		pending_attributes_properties /= Void and then
		pending_attributes_name_codes.count = pending_attributes_type_codes.count and then
		pending_attributes_name_codes.count = pending_attributes_values.count and then
		pending_attributes_name_codes.count = pending_attributes_properties.count
		namespaces_list: pending_namespaces /= Void

end
