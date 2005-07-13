indexing

	description:

		"Tiny tree Element nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ELEMENT

inherit

	XM_XPATH_ELEMENT
		undefine
			has_child_nodes, is_nilled, first_child, is_tiny_node, as_tiny_node
		redefine
			has_attributes
		end

	XM_XPATH_TINY_COMPOSITE_NODE
		undefine
			type_annotation, has_attributes, local_part, base_uri, is_element, as_element
		redefine
			is_tiny_element, as_tiny_element
		end

	XM_XPATH_RECEIVER_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_DOCUMENT; a_node_number: INTEGER) is
		require
			valid_document: a_document /= Void
			valid_node_number: a_node_number > 1 and a_node_number <= a_document.last_node_added
		do
			document := a_document
			node_number := a_node_number
			node_type := Element_node
			are_namespaces_accumulated := True
		ensure
			document_set: document = a_document
			node_number_set: node_number = a_node_number
		end

feature -- Access

	is_tiny_element: BOOLEAN is
			-- Is `Current' an element?
		do
			Result := True
		end

	as_tiny_element: XM_XPATH_TINY_ELEMENT is
			-- `Current' seen as an element
		do
			Result := Current
		end

	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		do
			Result := attribute_value (shared_name_pool.fingerprint (a_uri, a_local_name))
		end

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		local
			an_alpha_value, a_name_code: INTEGER
			finished: BOOLEAN
		do
			an_alpha_value := document.alpha_value (node_number)
			if an_alpha_value = 0 then
				Result := Void
			else
				from
					finished := False
				variant
					document.number_of_attributes	+ 1 - an_alpha_value
				until
					finished or else an_alpha_value > document.number_of_attributes
						or else document.attribute_parent (an_alpha_value) /= node_number
				loop
					a_name_code := document.attribute_name_code (an_alpha_value)
					if fingerprint_from_name_code (a_name_code) = a_fingerprint then
						Result := document.attribute_value (an_alpha_value)
						finished := True
					end
					an_alpha_value := an_alpha_value + 1
				end
			end
		end

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER is
			-- URI code for `a_prefix_code'
		local
			a_namespace_node, a_namespace_code: INTEGER
			a_composite: XM_XPATH_TINY_COMPOSITE_NODE
		do
			Result := -1 -- not found
			if a_prefix_code = Xml_prefix_index - 1 then
				Result := Xml_uri_code
			else
				a_namespace_node := document.beta_value (node_number)
				if a_namespace_node > 0 then
					from
					until
						Result > -1 or else a_namespace_node > document.number_of_namespaces or else document.namespace_parent (a_namespace_node) /= node_number
					loop
						a_namespace_code := document.namespace_code_for_node (a_namespace_node)
						if a_prefix_code = prefix_code_from_namespace_code (a_namespace_code) then
							Result := uri_code_from_namespace_code (a_namespace_code)
						end
						a_namespace_node := a_namespace_node + 1
					end
				end
			end
			
			-- If we have got so far, without finding `a_prefix_code',
			--  then we must look at the parent element

			if Result = -1 then
				a_composite := parent
				if not a_composite.is_element then
					
					-- Document node
					
					if a_prefix_code = 0 then
						Result := Default_uri_code
					end
				else
					Result := a_composite.as_element.uri_code_for_prefix_code (a_prefix_code)
				end
			end
		end

	output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN) is
			-- Output all namespace nodes associated with this element.
		local
			a_namespace_node: INTEGER
			a_node: XM_XPATH_TINY_COMPOSITE_NODE
		do
			a_namespace_node := document.beta_value (node_number)
			if a_namespace_node > 0 then
				from
				until
					a_namespace_node > document.number_of_namespaces or else document.namespace_parent (a_namespace_node) /= node_number
				loop
					a_receiver.notify_namespace (document.namespace_code_for_node (a_namespace_node), 0)
					a_namespace_node := a_namespace_node + 1
				end
			end

			-- Now add the namespaces defined on the ancestor nodes.
			-- We rely on the receiver to eliminate multiple declarations of the same prefix.

			if include_ancestors then
				a_node := parent
				if a_node.is_element then
					a_node.as_element.output_namespace_nodes (a_receiver, true)
				end
			end
		end

	namespace_codes_in_scope: DS_ARRAYED_LIST [INTEGER] is
			-- Namespace codes in scope for `Current'
		local
			a_namespace_node: INTEGER
			a_node: XM_XPATH_TINY_NODE
		do
			create Result.make (0)
			a_namespace_node := document.beta_value (node_number)
			if a_namespace_node > 0 then
				from
				until
					a_namespace_node > document.number_of_namespaces or else document.namespace_parent (a_namespace_node) /= node_number
				loop
					Result.force_last (document.namespace_code_for_node (a_namespace_node))
					a_namespace_node := a_namespace_node + 1
				end
			end
			a_node := parent
			if a_node.is_tiny_element then
				a_node.as_tiny_element.accumulate_namespace_codes (Result)
			end

			-- Now add the xml namespace

			Result.force_last (created_namespace_code (Xml_uri_code, Xml_prefix_index - 1))
		end

feature -- Status report

	has_attributes: BOOLEAN is
			-- Does `Current' have any attributes?
		do
			Result := document.alpha_value (node_number) > 0
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER) is
			-- Set `name_code'.
			-- Needed (indirectly, through `XM_XPATH_TINY_ELEMENT') by `XM_XSLT_STRIPPER'.
		do
			document.set_name_code_for_node (a_name_code, node_number)
		ensure then
			name_code_set: document.name_code_for_node (node_number) = a_name_code
		end

feature -- Element change

	ensure_namespace_nodes is
			-- Ensure `namespace_codes_in_scope' may be called.
		do
			-- do nothing
		end

	accumulate_namespace_codes (a_list: DS_ARRAYED_LIST [INTEGER]) is
			-- Accumulate further namespaces in scope, avoiding already-declared prefixes.
		require
			accumulation_list_not_void: a_list /= Void
		local
			a_namespace_node, a_namespace_code: INTEGER
			a_prefix_code: INTEGER -- _16
			a_prefix_code_list: DS_ARRAYED_LIST [INTEGER] -- _16
			a_node: XM_XPATH_TINY_NODE
		do
			a_namespace_node := document.beta_value (node_number)
			if a_namespace_node > 0 then
				a_prefix_code_list := prefix_codes_from_namespace_codes (a_list)
				from
				until
					a_namespace_node > document.number_of_namespaces or else document.namespace_parent (a_namespace_node) /= node_number
				loop
					a_namespace_code := document.namespace_code_for_node (a_namespace_node)
					a_prefix_code := prefix_code_from_namespace_code (a_namespace_code)
					if not is_in_list (a_prefix_code, a_prefix_code_list) then
						a_list.force_last (a_namespace_code)
					end
					a_namespace_node := a_namespace_node + 1
				end
			end
			a_node := parent
			if a_node.is_tiny_element then
				a_node.as_tiny_element.accumulate_namespace_codes (a_list)
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		local
			a_level, a_node_level, a_start_level, a_next_node, a_start_index: INTEGER
			close_pending, first, finished: BOOLEAN
			a_node: XM_XPATH_TINY_NODE
		do
			from
				a_level := -1; first := True; a_next_node := node_number;
				a_start_level := document.depth_of (node_number)
			variant
				document.number_of_nodes + 1 - a_next_node
			until
				finished
			loop
				a_node_level := document.depth_of (a_next_node)
				if close_pending then a_level := a_level + 1 end
				from
				variant
					a_level
				until
					a_level = a_node_level
				loop
					a_receiver.end_element
					a_level := a_level - 1
				end

				-- output depends on node type

				inspect
					document.retrieve_node_kind (a_next_node)
				when Element_node then
					copy_element (first, a_next_node, a_receiver, which_namespaces, copy_annotations)
					first := False
					close_pending := True
				when Text_node then
					close_pending := False
					a_start_index := document.alpha_value (a_next_node)
					a_receiver.notify_characters (document.character_buffer.substring (a_start_index, a_start_index + document.beta_value (a_next_node)), 0)
				when Comment_node then
					close_pending := False
					a_start_index := document.alpha_value (a_next_node)
					a_receiver.notify_comment (document.comment_buffer.substring (a_start_index, a_start_index + document.beta_value (a_next_node)), 0)
				when Processing_instruction_node then
					close_pending := False
					a_node := document.retrieve_node (a_next_node)
					a_receiver.notify_processing_instruction (a_node.local_part, a_node.string_value, 0)
				else
					-- do nothing
				end
				a_next_node := a_next_node + 1
				finished := a_next_node > document.number_of_nodes or else document.depth_of (a_next_node) > a_start_level
			end
			if close_pending then a_level := a_level + 1 end
			from
			variant
				a_level
			until
				a_level = a_start_level
			loop
				a_receiver.end_element
				a_level := a_level - 1
			end
		end
	
feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

feature {NONE} -- Implementation

	copy_element (first: BOOLEAN; a_next_node: INTEGER; a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy child element to `a_receiver'.
		require
			receiver_not_void: a_receiver /= Void
			which_namespaces: which_namespaces = No_namespaces
				or else which_namespaces = Local_namespaces or else  which_namespaces = All_namespaces
		local
			a_type_code, a_namespace, an_attribute, properties: INTEGER
		do
			if copy_annotations then
				a_type_code := document.element_annotation (a_next_node)
			else
				a_type_code := -1
			end
			if first then properties := Disinherit_namespaces end
			a_receiver.start_element (document.retrieve_name_code (a_next_node), a_type_code, properties)

			-- output namespaces

			if which_namespaces /= No_namespaces then
				if first then
					output_namespace_nodes (a_receiver, which_namespaces = All_namespaces)
				else
					a_namespace := document.beta_value (a_next_node)
					if a_namespace > 0 then
						from
						until
							a_namespace >= document.number_of_namespaces or else document.namespace_parent (a_namespace) /= a_next_node
						loop
							a_receiver.notify_namespace (document.namespace_code_for_node (a_namespace), 0)
							a_namespace := a_namespace + 1
						end
					end
				end
			end

			-- output attributes

			an_attribute := document.alpha_value (a_next_node)
			if an_attribute >= 0 then
				from
				until
					an_attribute >= document.number_of_attributes or else document.attribute_parent (an_attribute) /= a_next_node
				loop
					if copy_annotations then
						a_type_code := document.attribute_annotation (a_next_node)
					else
						a_type_code := -1
					end	
					a_receiver.notify_attribute (document.attribute_name_code (an_attribute), a_type_code, document.attribute_value (an_attribute), 0)
					an_attribute := an_attribute + 1
				end
			end

			a_receiver.start_content
		end

	prefix_codes_from_namespace_codes (a_list: DS_ARRAYED_LIST [INTEGER]): DS_ARRAYED_LIST [INTEGER] is -- _16
			-- List of prefix codes from `a_list' of namespace codes
		require
			namespace_code_list_not_void: a_list /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			create Result.make (a_list.count)
			from
				a_cursor := a_list.new_cursor; a_cursor.start
			variant
				a_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				Result.put_last (prefix_code_from_namespace_code (a_cursor.item))
				a_cursor.forth
			end
		ensure
			same_count: Result /= Void and then Result.count = a_list.count
		end
	
	is_in_list (a_prefix_code: INTEGER; a_list: DS_ARRAYED_LIST [INTEGER]): BOOLEAN is
			-- Is `a_prefix_code' on `a_list'?
		require
			list_not_void:  a_list /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				a_cursor := a_list.new_cursor; a_cursor.start
			variant
				a_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				Result :=  a_prefix_code = a_cursor.item
				if Result then
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end				
		end

end
