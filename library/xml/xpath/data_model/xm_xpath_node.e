indexing

	description:

		"XPath nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE

inherit

	XM_XPATH_ITEM
		redefine
			as_value
		end

	XM_XPATH_SHARED_TYPE_FACTORY

	XM_XPATH_AXIS

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_LOCATOR

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_DEBUGGING_ROUTINES

		-- This class represents a node in gexslt's object model.
		-- It combines the features of the XPath data model, 
		--  with some of the features from the W3C's dom::Node (for convenience),
		--  along with additional features to make life easier.

feature -- Access

	document: XM_XPATH_DOCUMENT is
			-- Document that owns this node
		deferred
		ensure
			document_not_void: Result /= Void
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order);
			-- Sequence numbers are monotonic but not consecutive.
			-- The sequence number must be unique within the document.
		deferred
		ensure
			strictly_positive_sequence_number: Result /= Void and then Result.is_positive
		end
	
	document_number: INTEGER is
			-- Uniquely identifies the owning document.
		deferred
		ensure
			strictly_positive_result: Result > 0
		end

	base_uri: STRING is
			-- Base URI
		require
			not_in_error: not is_error
		do
			if parent /= Void then
				Result := parent.base_uri
			else
				Result := ""
			end
		ensure
			base_uri_not_void: Result /= Void
		end

	node_type: INTEGER
			-- `node_kind' expressed as an integer

	node_kind: STRING is
			-- Kind of node
			-- Must be one of:
			-- "document", "element", "attribute",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		require
			not_in_error: not is_error
		deferred
		ensure
			node_kind_not_void: Result /= Void
		end

	node_name: STRING is
			-- Qualified name
		require
			not_in_error: not is_error
		deferred
		ensure
			node_name_may_be_void: True
		end

	parent: XM_XPATH_COMPOSITE_NODE is
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes or namespaces.
		require
			not_in_error: not is_error
		deferred
		ensure
			parent_may_be_void: True
		end
	
	root: XM_XPATH_NODE is
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		require
			not_in_error: not is_error
		deferred
		ensure
			root_node_not_void: Result /= Void
		end

	type_annotation: INTEGER is
			--Type annotation of this node
		require
			not_in_error: not is_error
		do
			Result := type_factory.untyped_atomic_type.fingerprint
		end

	fingerprint: INTEGER is
			-- Fingerprint of this node - used in matching names
		local
			a_name_code, top_bits: INTEGER
		do
			a_name_code := name_code
			if a_name_code = -1 then
				Result := -1
			else
				-- mask a_name_code with 0xfffff
				top_bits := (a_name_code // bits_20) * bits_20
				Result := a_name_code - top_bits
			end
		end
	
	name_code: INTEGER is
			-- Name code this node - used in displaying names
		require
			not_in_error: not is_error
		deferred
		end

	local_part: STRING is
			-- Local part of the name;
			-- For nodeless names, return the empty string
		do
			if name_code < 0 then
				Result := ""
			else
				Result := document.name_pool.local_name_from_name_code (name_code)
			end
		end


	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		require
			not_in_error: not is_error
		deferred
		end

	first_child: XM_XPATH_NODE is
			-- The first child of this node;
			-- If there are no children, return `Void'
		require
			not_in_error: not is_error
		do
			Result := Void
		end

	last_child: XM_XPATH_NODE is
			-- The last child of this node;
			-- If there are no children, return `Void'
		require
			not_in_error: not is_error
		do
			Result := Void
		end

	previous_sibling: XM_XPATH_NODE is
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		require
			not_in_error: not is_error
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			an_iterator := new_axis_iterator (Preceding_sibling_axis)
			an_iterator.start
			if not an_iterator.after then Result := an_iterator.item end
		end
	
	next_sibling: XM_XPATH_NODE is
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		require
			not_in_error: not is_error
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			an_iterator := new_axis_iterator (Following_sibling_axis)
			an_iterator.start
			if not an_iterator.after then Result := an_iterator.item end
		end
	
	document_element: XM_XPATH_ELEMENT is
			-- The top-level element;
			-- If the document is not well-formed
			-- (i.e. it is a document fragment), then
			-- return the last element child of the document root.
		require
			not_in_error: not is_error
		local
			a_root: XM_XPATH_DOCUMENT
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_element_node_test: XM_XPATH_NODE_KIND_TEST
		do
			a_root := document_root
			if a_root = Void or else a_root.is_error then
				debug ("XPath abstract node")
					if a_root = Void then
						std.error.put_string ("Document root is void%N")
					else
						std.error.put_string (a_root.error_value.error_message)
						std.error.put_new_line
					end
				end
				Result := Void
			else
				create an_element_node_test.make (Element_node)
				an_iterator := a_root.new_axis_iterator_with_node_test (Child_axis, an_element_node_test)
				debug ("XPath abstract node")
					std.error.put_string ("Document element: iterator is after? ")
					std.error.put_string (an_iterator.after.out)
					std.error.put_new_line
				end
				an_iterator.start
				Result ?= an_iterator.item
			end
		end
	
	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE] is
			-- Typed value
		local
			a_type: INTEGER
			a_string_value: XM_XPATH_STRING_VALUE
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
		do
			a_type := type_annotation
			if a_type = type_factory.untyped_atomic_type.fingerprint then
				create  an_untyped_atomic_value.make (string_value)
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_UNTYPED_ATOMIC_VALUE]} Result.make (an_untyped_atomic_value)
			elseif a_type = type_factory.untyped_type.fingerprint then
				create an_untyped_atomic_value.make (string_value)
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_UNTYPED_ATOMIC_VALUE]} Result.make (an_untyped_atomic_value)
			else
				-- TODO complex types should be dealt with properly
				todo ("typed_value", True)
			end
		end

	
	type_name: STRING is
			-- Type name for diagnostic purposes
		do
			inspect
				node_type
			when Document_node then
				Result := "document-node()"
			when Element_node then
				Result := STRING_.concat ("element(", node_name)
				Result := STRING_.appended_string (Result, ", ")
				if type_annotation = type_factory.untyped_atomic_type.fingerprint then
					Result := STRING_.appended_string (Result, "xdt:untyped)")
				else
					todo ("type_name", True)
				end
			when Attribute_node then
				Result := STRING_.concat ("attribute(", node_name)
				Result := STRING_.appended_string (Result, ")") -- TODO add type annotatio
			when Text_node then
				Result := "text()"
			when Comment_node then
				Result := "comment()"
			when Processing_instruction_node then
				Result := "processing-instruction()"
			when Namespace_node then
				Result := "namespace()"
			end
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		require
			not_in_error: not is_error
			valid_axis: is_axis_valid (an_axis_type)
		deferred
		ensure
			result_not_in_error: Result /= Void and then not Result.is_error
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		require
			not_in_error: not is_error
			node_test_not_void: a_node_test /= Void
			valid_axis: is_axis_valid (an_axis_type)
		deferred
		ensure
			result_not_in_error: Result /= Void and then not Result.is_error
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		require
			not_in_error: not is_error
			other_node_not_void: other /= Void
		deferred
		end

	three_way_comparison (other: XM_XPATH_NODE): INTEGER is
			-- If current object equal to other, 0;
			-- if smaller, -1; if greater, 1
		require
			other_exists: other /= Void
		do
			if sequence_number < other.sequence_number then
				Result := -1
			elseif sequence_number > other.sequence_number then
				Result := 1
			else
				Result := 0
			end
		ensure
			valid_result: -1 <= Result and then Result <= 1
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has item failed evaluation?

	error_value: XM_XPATH_ERROR_VALUE
			-- Error value

	is_nilled: BOOLEAN is
			-- Is current node "nilled"? (i.e. xsi: nill="true")
		require
			not_in_error: not is_error
		do
			Result := False
		end

	has_attributes: BOOLEAN is
			-- Does `Current' have any attributes?
		require
			not_in_error: not is_error
		do
			Result := False
		end

	has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		require
			not_in_error: not is_error
		do
			Result := False -- overriden for composite nodes
		end

feature -- Status setting

	set_last_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set `error_value'.
		do
			is_error := True
			error_value := an_error_value
		end

	set_last_error_from_string (a_message: STRING; a_code, an_error_type: INTEGER) is
			-- Set `error_value'.
		do
			is_error := True
			create error_value.make_from_string (a_message, a_code, an_error_type)
		end

feature -- Conversion
	
	as_value: XM_XPATH_VALUE is
			-- Convert to a value
		do
			create {XM_XPATH_SINGLETON_NODE} Result.make (Current)
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		require
			receiver_not_void: a_receiver /= Void
			which_namespaces: which_namespaces = No_namespaces
				or else which_namespaces = Local_namespaces or else  which_namespaces = All_namespaces 
		deferred
		end

feature {XM_XPATH_NODE} -- Local

	identity: INTEGER -- TODO: change to INTEGER_64 when all compilers support this
			-- Unique identifier within the document
			-- Increases with document order.
	
	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		require
			not_in_error: not is_error
		deferred
		end

end
