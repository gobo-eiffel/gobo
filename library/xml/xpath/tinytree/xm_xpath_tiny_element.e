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
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_node_number: INTEGER) is
		require
			valid_document: a_document /= Void
			valid_node_number: a_node_number > 0 and a_node_number <= a_document.last_node_added
		do
			tree := a_document
			node_number := a_node_number
			node_type := Element_node
		ensure
			document_set: tree = a_document
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
			an_alpha_value := tree.alpha_value (node_number)
			if an_alpha_value = 0 then
				Result := Void
			else
				from
					finished := False
				variant
					tree.number_of_attributes	+ 1 - an_alpha_value
				until
					finished or else an_alpha_value > tree.number_of_attributes
						or else tree.attribute_parent (an_alpha_value) /= node_number
				loop
					a_name_code := tree.attribute_name_code (an_alpha_value)
					if fingerprint_from_name_code (a_name_code) = a_fingerprint then
						Result := tree.attribute_value (an_alpha_value)
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
				a_namespace_node := tree.beta_value (node_number)
				if a_namespace_node > 0 then
					from
					until
						Result > -1 or else a_namespace_node > tree.number_of_namespaces or else tree.namespace_parent (a_namespace_node) /= node_number
					loop
						a_namespace_code := tree.namespace_code_for_node (a_namespace_node)
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

	declared_namespaces: DS_ARRAYED_LIST [INTEGER] is
			-- Codes for namespaces declared on `Current'
		local
			a_namespace_code, a_namespace_node: INTEGER
		do
			create Result.make_default
			a_namespace_node := tree.beta_value (node_number)
			if a_namespace_node > 0 then
				from  until a_namespace_node > tree.number_of_namespaces or else tree.namespace_parent (a_namespace_node) /= node_number loop
					a_namespace_code := tree.namespace_code_for_node (a_namespace_node)
					Result.force_last (a_namespace_code)
					a_namespace_node := a_namespace_node + 1	
				end
			end
		end

	namespace_codes_in_scope: DS_ARRAYED_LIST [INTEGER] is
			-- Namespace codes in scope for `Current'
		do
			create Result.make_default
			accumulate_namespace_codes (node_number, Result)
			Result.put_last (Xml_namespace_code)
		end

feature -- Status report

	has_attributes: BOOLEAN is
			-- Does `Current' have any attributes?
		do
			Result := tree.alpha_value (node_number) > 0
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER) is
			-- Set `name_code'.
			-- Needed (indirectly, through `XM_XPATH_TINY_ELEMENT') by `XM_XSLT_STRIPPER'.
		do
			tree.set_name_code_for_node (a_name_code, node_number)
		ensure then
			name_code_set: tree.name_code_for_node (node_number) = a_name_code
		end

feature -- Element change
	
	output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN) is
			-- Output all namespace nodes associated with this element.
		local
			a_namespace_node: INTEGER
			a_node: XM_XPATH_TINY_COMPOSITE_NODE
		do
			if tree.are_namespaces_used then
				a_namespace_node := tree.beta_value (node_number)
				if a_namespace_node > 0 then
					from
					until
						a_namespace_node > tree.number_of_namespaces or else tree.namespace_parent (a_namespace_node) /= node_number
					loop
						a_receiver.notify_namespace (tree.namespace_code_for_node (a_namespace_node), 0)
						a_namespace_node := a_namespace_node + 1
					end
				end
				
				-- Now add the namespaces defined on the ancestor nodes.
				-- We rely on the receiver to eliminate multiple declarations of the same prefix.
				
				if include_ancestors then
					a_node := parent
					if a_node /= Void and then a_node.is_element then
						a_node.as_element.output_namespace_nodes (a_receiver, true)
					end
				end
			end
		end
	
feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		local
			a_level, a_node_level, a_start_level, a_next_node, a_start_index, a_node_count: INTEGER
			close_pending, first, finished: BOOLEAN
			a_node: XM_XPATH_TINY_NODE
		do
			from
				a_level := -1; first := True; a_next_node := node_number;
				a_start_level := tree.depth_of (node_number)
				
				-- in case the target is another tree in the same forest:
				a_node_count := tree.number_of_nodes 
			variant
				a_node_count + 1 - a_next_node
			until
				finished
			loop
				a_node_level := tree.depth_of (a_next_node)
				if close_pending then a_level := a_level + 1 end
				from
				variant
					1 + a_level
				until
					a_level <= a_node_level
				loop
					a_receiver.end_element
					a_level := a_level - 1
				end
				a_level := a_node_level

				-- output depends on node type

				inspect
					tree.retrieve_node_kind (a_next_node)
				when Element_node then
					copy_element (first, a_next_node, a_receiver, which_namespaces, copy_annotations)
					first := False
					close_pending := True
				when Text_node then
					close_pending := False
					a_start_index := tree.alpha_value (a_next_node)
					a_receiver.notify_characters (tree.character_buffer.substring (a_start_index + 1, a_start_index + tree.beta_value (a_next_node)), 0)
				when Comment_node then
					close_pending := False
					a_start_index := tree.alpha_value (a_next_node)
					a_receiver.notify_comment (tree.comment_buffer.substring (a_start_index + 1, a_start_index + tree.beta_value (a_next_node)), 0)
				when Processing_instruction_node then
					close_pending := False
					a_node := tree.retrieve_node (a_next_node)
					a_receiver.notify_processing_instruction (a_node.local_part, a_node.string_value, 0)
				else
					-- do nothing
				end
				a_next_node := a_next_node + 1
				finished := a_next_node > a_node_count or else tree.depth_of (a_next_node) <= a_start_level
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
				a_type_code := tree.element_annotation (a_next_node)
			else
				a_type_code := -1
			end
			if first then properties := Disinherit_namespaces end
			a_receiver.start_element (tree.retrieve_name_code (a_next_node), a_type_code, properties)

			-- output namespaces

			if which_namespaces /= No_namespaces and then tree.are_namespaces_used then
				if first then
					output_namespace_nodes (a_receiver, which_namespaces = All_namespaces)
				else
					a_namespace := tree.beta_value (a_next_node)
					if a_namespace > 0 then
						from
						until
							a_namespace >= tree.number_of_namespaces or else tree.namespace_parent (a_namespace) /= a_next_node
						loop
							a_receiver.notify_namespace (tree.namespace_code_for_node (a_namespace), 0)
							a_namespace := a_namespace + 1
						end
					end
				end
			end

			-- output attributes

			an_attribute := tree.alpha_value (a_next_node)
			if an_attribute > 0 then
				from
				until
					an_attribute > tree.number_of_attributes or else tree.attribute_parent (an_attribute) /= a_next_node
				loop
					if copy_annotations then
						a_type_code := tree.attribute_annotation (an_attribute)
					else
						a_type_code := -1
					end	
					a_receiver.notify_attribute (tree.attribute_name_code (an_attribute), a_type_code, tree.attribute_value (an_attribute), 0)
					an_attribute := an_attribute + 1
				end
			end

			a_receiver.start_content
		end

	accumulate_namespace_codes (a_node_number: INTEGER; a_buffer: DS_ARRAYED_LIST [INTEGER]) is
			-- Accumulate namespace codes for `a_node_number' into a`_buffer'.
		require
			buffer_exists: a_buffer /= Void
			valid_node_number: a_node_number > 0 and a_node_number <= tree.last_node_added
		local
			a_namespace_node, a_namespace_code, another_node_number: INTEGER
			a_prefix_code: INTEGER -- _16
			duplicated: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if tree.are_namespaces_used then
				from
					another_node_number := a_node_number
				until
					another_node_number = -1 -- = no parent node
				loop
					a_namespace_node := tree.beta_value (another_node_number) -- by convention
					if a_namespace_node > 0 then
						from
						until
							a_namespace_node > tree.number_of_namespaces or else tree.namespace_parent (a_namespace_node) /= another_node_number
						loop
							a_namespace_code := tree.namespace_code_for_node (a_namespace_node)
							
							-- See if the prefix has already been declared; if so, this declaration is ignored
							
							a_prefix_code := prefix_code_from_namespace_code (a_namespace_code);	duplicated := False
							from
								a_cursor := a_buffer.new_cursor; a_cursor.start
							until
								duplicated or else a_cursor.after
							loop
								if prefix_code_from_namespace_code (a_cursor.item) = a_prefix_code then
									duplicated := True
								else
									a_cursor.forth
								end
							end
							if not duplicated then a_buffer.force_last (a_namespace_code) end
							a_namespace_node := a_namespace_node + 1
						end
					end
					another_node_number := tree.parent_node_number (another_node_number)
				end

				-- The list of namespaces we have built up includes undeclarations as well as declarations.
            -- We now remove the undeclarations (which have a URI code of zero).

				from
					a_cursor := a_buffer.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					if uri_code_from_namespace_code (a_cursor.item) = Default_uri_code then
						a_cursor.remove
					else
						a_cursor.forth
					end
				end
			end
		end

end
