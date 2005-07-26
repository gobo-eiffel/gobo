indexing
	description:

		"Objects that output complex content."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPLEX_CONTENT_OUTPUTTER	

inherit
	
	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XSLT_OUTPUTTER	
		redefine
			start_document, is_name_code_ok_for_start_element
		end

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_AXIS

	XM_XPATH_STANDARD_NAMESPACES
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

	make (an_underlying_receiver: XM_XPATH_RECEIVER) is
			-- Establish invariant.
		require
			underlying_receiver_not_void: an_underlying_receiver /= Void
		do
			next_receiver := an_underlying_receiver
			pending_start_tag := -1
			system_id := an_underlying_receiver.system_id
		ensure
			next_receiver_set: next_receiver = an_underlying_receiver
			no_pending_start_tag: pending_start_tag = -1
		end

feature -- Events
	
	is_name_code_ok_for_start_element (a_name_code: INTEGER): BOOLEAN is
			-- Is `a_name_code' valid for `start_element'?
		do

			-- This is redefined by receivers capable of skipping an element

			Result := a_name_code = -10 or else a_name_code >= 0
		end
	
feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			next_receiver.on_error (a_message)
		end

	start_document is
			-- New document
		do
			debug ("XSLT content output")
				std.error.put_string ("Starting document.")
				std.error.put_new_line
			end
			is_document_started := True
			next_receiver.start_document
			previous_atomic := False
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element.
		do
			if a_name_code = -10 then

				-- This is used on error recovery when there is a bad element name. It is needed so that
            --  the outputter can suppress any subsequent namespace and attribute nodes

				suppress_attributes := True
			else
				suppress_attributes := False
				start_element_properties := properties
				if pending_start_tag /= -1 then start_content end
				debug ("XSLT content output")
					std.error.put_string ("Starting element " + shared_name_pool.display_name_from_name_code (a_name_code))
					std.error.put_new_line
				end
				create pending_attribute_name_codes.make_default
				create pending_attribute_type_codes.make_default
				create pending_attribute_values.make_default
				pending_attribute_values.set_equality_tester (string_equality_tester)
				create pending_attribute_properties.make_default
				create pending_namespaces.make_default
				pending_start_tag := a_name_code
				current_simple_type := a_type_code
				previous_atomic := False
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		local
			reject_these_duplicates, reject: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			another_namespace_code: INTEGER
			a_uri_code, a_prefix_code: INTEGER -- _16
		do
			if not suppress_attributes then
				if pending_start_tag = -1 then
					on_error ("XTDE????: (TODO - code) Cannot write a namespace declaration when there is no open start tag")
				else
					debug ("XSLT content output")
						std.error.put_string ("Namespace declaration " + shared_name_pool.uri_from_namespace_code (a_namespace_code))
						std.error.put_new_line
					end
					
					-- Handle declarations whose prefix is duplicated for this element.

					reject_these_duplicates := are_duplicates_rejected (properties)
					a_uri_code := uri_code_from_namespace_code (a_namespace_code)
					a_prefix_code := prefix_code_from_namespace_code (a_namespace_code)
					from
						a_cursor := pending_namespaces.new_cursor; a_cursor.start
					variant
						pending_namespaces.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						another_namespace_code := a_cursor.item
						if a_namespace_code = another_namespace_code then

							-- same prefix and URI: ignore this duplicate
							
							reject := True
							a_cursor.go_after
						else
							if a_prefix_code = prefix_code_from_namespace_code (another_namespace_code) then

								-- same prefix

								if reject_these_duplicates then
									on_error ("XTDE0430: Cannot create two namespace nodes with the same name")
								end
								reject := True
								a_cursor.go_after
							else
								a_cursor.forth
							end							
						end
					end
					if not reject then

						-- It is an error to output a namespace node for the default namespace if the element
						--  itself is in the null namespace, as the resulting element could not be serialized

						if a_prefix_code = 0 and then a_uri_code /= 0 then
							another_namespace_code := shared_name_pool.namespace_code_from_name_code (pending_start_tag)
							if another_namespace_code = 0 then
								on_error ("XTDE????: TODO (code) Cannot output a namespace node for the default namespace when the element is in no namespace")
								reject := True
							end
						end
					end
					if not reject then
						
						-- If it's not a duplicate namespace, add it to the list for this start tag.

						pending_namespaces.force_last (a_namespace_code)
						previous_atomic := False
					end
				end
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			duplicate_found: BOOLEAN
		do
			if not suppress_attributes then
				if pending_start_tag = -1 then
					debug ("XSLT stripper")
						std.error.put_string ("Failing attribute is " + shared_name_pool.display_name_from_name_code (a_name_code))
						std.error.put_new_line
					end
					on_error ("XTDE????: TODO (code) Cannot write an attribute when there is no open start tag")
				else
					debug ("XSLT content output")
						std.error.put_string ("Notifying attribute " + shared_name_pool.display_name_from_name_code (a_name_code))
						std.error.put_new_line
					end
				
					-- If this is a duplicate attribute, overwrite the original, unless
					--  the REJECT_DUPLICATES option is set.

					from
						a_cursor := pending_attribute_name_codes.new_cursor; a_cursor.start
					variant
						pending_attribute_name_codes.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						if a_cursor.item = a_name_code then
							if are_duplicates_rejected (properties) then
								on_error (STRING_.concat ("XTDE????: TODO (code) Duplicate attribute: ", shared_name_pool.display_name_from_name_code (a_name_code)))
							else
								pending_attribute_type_codes.replace (a_type_code, a_cursor.index)
								pending_attribute_values.replace (a_value, a_cursor.index)
								pending_attribute_properties.replace (properties, a_cursor.index)
							end
							duplicate_found := True
							a_cursor.go_after
						else
							a_cursor.forth
						end
					end

					if not duplicate_found then
						pending_attribute_name_codes.force_last (a_name_code)
						pending_attribute_type_codes.force_last (a_type_code)
						pending_attribute_values.force_last (a_value)
						pending_attribute_properties.force_last (properties)
						previous_atomic := False
					end
				end
			end
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			properties: INTEGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
		do
			debug ("XSLT content output")
				std.error.put_string ("Starting content")
				std.error.put_new_line
			end
			if pending_start_tag /= -1 then
				debug ("XSLT content output")
					std.error.put_string ("Pending start tag is " + shared_name_pool.display_name_from_name_code (pending_start_tag))
					std.error.put_new_line
				end
				check_proposed_prefix (pending_start_tag, 0)
				properties := start_element_properties
				if not is_namespace_declared (properties) then
					properties := properties + Namespace_ok
				end
				next_receiver.start_element (last_checked_namecode, current_simple_type, properties)
				from
					a_cursor := pending_attribute_name_codes.new_cursor; a_cursor.start
				variant
					pending_attribute_name_codes.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_name_code := a_cursor.item
					if prefix_code_from_namespace_code (a_name_code) /= 0 then -- non-null prefix
						check_proposed_prefix (a_name_code, a_cursor.index)
						a_cursor.replace (last_checked_namecode)
					end
					a_cursor.forth
				end
				from
					a_cursor := pending_namespaces.new_cursor; a_cursor.start
				variant
					pending_namespaces.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					next_receiver.notify_namespace (a_cursor.item, 0)
					a_cursor.forth
				end
				from
					a_cursor := pending_attribute_name_codes.new_cursor; a_cursor.start
				variant
					pending_attribute_name_codes.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					next_receiver.notify_attribute (a_cursor.item,
															  pending_attribute_type_codes.item (a_cursor.index),
															  pending_attribute_values.item (a_cursor.index),
															  pending_attribute_properties.item (a_cursor.index))
					a_cursor.forth
				end
				next_receiver.start_content
				pending_start_tag := -1
				previous_atomic := False
			end
		end

	end_element is
			-- Notify the end of an element.
		do
			debug ("XSLT content output")
				std.error.put_string ("Ending element")
				std.error.put_new_line
			end
			if pending_start_tag /= -1 then start_content end
			next_receiver.end_element
			previous_atomic := False
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			previous_atomic := False
			if chars.count > 0 then
				if pending_start_tag /= -1 then start_content end
				debug ("XSLT content output")
					std.error.put_string ("Notifying content " + chars + "###")
					std.error.put_new_line
				end
				next_receiver.notify_characters (chars, properties)
			end
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			if pending_start_tag /= -1 then start_content end
			next_receiver.notify_processing_instruction (a_name, a_data_string, properties)
			previous_atomic := False	
		end
	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			if pending_start_tag /= -1 then start_content end
			next_receiver.notify_comment (a_content_string, properties)
			previous_atomic := False			
		end

	end_document is
			-- Notify the end of the document.
		do
			next_receiver.end_document
			previous_atomic := False
		end

	append_item (an_item: XM_XPATH_ITEM) is
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
				
				-- Now free the document from memory
				
				shared_name_pool.remove_document_from_pool (an_item.as_document.document_number)					
			elseif an_item.is_error then
				on_error (an_item.error_value.error_message)
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

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			-- do nothing
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			-- do nothing
		end

feature {NONE} -- Implementation

	next_receiver: XM_XPATH_RECEIVER
			-- Next receiver in pipeline

	pending_start_tag: INTEGER
			-- Name code of pending start tag

	suppress_attributes: BOOLEAN
			-- Should attribute output be suppressed?

	start_element_properties: INTEGER
			-- Properties supplied to `start_element'

	pending_attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Pending attribute name codes

	pending_attribute_type_codes: DS_ARRAYED_LIST [INTEGER]
			-- Pending attribute type codes

	pending_attribute_values: DS_ARRAYED_LIST [STRING]
			-- Pending attribute values

	pending_attribute_properties: DS_ARRAYED_LIST [INTEGER]
			-- Pending attribute properties

	pending_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Pending namespace codes

	current_simple_type: INTEGER
			-- Simple type of current start tag, or 0

	last_checked_namecode: INTEGER
			-- Possibly different name code as a result of `check_proposed_prefix'

	check_proposed_prefix (a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Check that the prefix for an element or attribute is acceptable,
			--  allocating a substitute prefix if not.
			-- The prefix is acceptable unless a namespace declaration has been
			--  written that assignes this prefix to a different namespace URI.
			-- This routine also checks that the element or attribute namespace
			-- has been declared, and declares it if not.
		require
			valid_name_code: a_name_code > -1
			positive_sequence_number: a_sequence_number >= 0
		local
			a_namespace_code: INTEGER
			a_prefix_code, a_uri_code: INTEGER -- _16
			a_prefix: STRING
			finished: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			last_checked_namecode := a_name_code
			if not shared_name_pool.is_namespace_code_allocated_for_name_code (a_name_code) then
				shared_name_pool.allocate_namespace_code_for_name_code (a_name_code)
			end
			a_namespace_code := shared_name_pool.namespace_code_from_name_code (a_name_code)
			a_prefix_code := prefix_code_from_namespace_code (a_namespace_code)
			a_uri_code := uri_code_from_namespace_code (a_namespace_code)
			from
				a_cursor := pending_namespaces.new_cursor; a_cursor.start
			variant
				pending_namespaces.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if a_prefix_code = prefix_code_from_namespace_code (a_cursor.item) then
					if a_uri_code = uri_code_from_namespace_code (a_cursor.item) then
						last_checked_namecode := a_name_code
						finished := True
						a_cursor.go_after
					else
						a_prefix := substituted_prefix (a_namespace_code, a_sequence_number)
						shared_name_pool.allocate_name_using_uri_code (a_prefix,
																					  shared_name_pool.uri_code_from_name_code (a_name_code),
																					  shared_name_pool.local_name_from_name_code (a_name_code))
						last_checked_namecode := shared_name_pool.last_name_code
						if not shared_name_pool.is_namespace_code_allocated_for_name_code (last_checked_namecode) then
							shared_name_pool.allocate_namespace_code_for_name_code (last_checked_namecode)
						end
						notify_namespace (shared_name_pool.namespace_code_from_name_code (last_checked_namecode), 0)
						finished := True
						a_cursor.go_after
					end
				else
					a_cursor.forth
				end
			end
			if not finished then
				notify_namespace (a_namespace_code, 0)
			end
		ensure
			last_checked_namecode: last_checked_namecode > -1
		end

	substituted_prefix (a_namespace_code: INTEGER; a_sequence_number: INTEGER): STRING is
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
	attribute_lists: pending_attribute_name_codes /= Void implies
		pending_attribute_type_codes /= Void and then
		pending_attribute_values /= Void and then
		pending_attribute_properties /= Void and then
		pending_attribute_name_codes.count = pending_attribute_type_codes.count and then
		pending_attribute_name_codes.count = pending_attribute_values.count and then
		pending_attribute_name_codes.count = pending_attribute_properties.count

end
