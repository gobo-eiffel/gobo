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
			has_child_nodes, is_nilled, first_child
		redefine
			has_attributes
		end

	XM_XPATH_TINY_COMPOSITE_NODE
		undefine
			type_annotation, has_attributes, local_part, base_uri
		end

	XM_XPATH_RECEIVER_OPTIONS

creation

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
		ensure
			document_set: document = a_document
			node_number_set: node_number = a_node_number
		end

feature -- Access
	
	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		do
			Result := attribute_value (document.name_pool.fingerprint (a_uri, a_local_name))
		end

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		local
			an_alpha_value, a_name_code: INTEGER
			finished: BOOLEAN
		do
			an_alpha_value := document.alpha_value (node_number)
			if an_alpha_value < 0 then
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

	output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN) is
			-- Output all namespace nodes associated with this element.
		local
			a_namespace: INTEGER
			a_parent: XM_XPATH_ELEMENT
		do
			a_namespace := document.beta_value (node_number)
			if a_namespace > 0 then
				from
				until
					a_namespace >= document.number_of_namespaces or else document.namespace_parent (a_namespace) = node_number
				loop
					a_receiver.notify_namespace (document.namespace_code_for_node (a_namespace), 0)
					a_namespace := a_namespace + 1
				end
			end

			-- Now add the namespaces defined on the ancestor nodes.
			-- We rely on the receiver to eliminate multiple declarations of the same prefix.

			if include_ancestors then
				a_parent ?= parent
				if a_parent /= Void then
					a_parent.output_namespace_nodes (a_receiver, true)
				end
			end
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
					do_nothing
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

end
