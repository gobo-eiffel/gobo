indexing

	description:

		"Objects that implement the XPath KindTest production"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_KIND_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			node_kind, content_type, is_node_kind_test, as_node_kind_test
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make, make_document_test, make_element_test, make_attribute_test, make_text_test,
	make_processing_instruction_test, make_comment_test, make_namespace_test

feature {NONE} -- Initialization

	make (a_node_type: INTEGER) is
			-- Establish invariant
		require
			valid_node_type: is_node_type (a_node_type) and then a_node_type /= Any_node -- Use XM_XPATH_SHARED_ANY_NODE_TEST for that
		do
			node_kind := a_node_type
			original_text := node_kind_description (a_node_type)
		ensure
			kind_set: node_kind = a_node_type
		end

	make_document_test is
			-- Make a test that matches document nodes.
		do
			make (Document_node)
		ensure
			matches_documents: node_kind = Document_node
		end

	make_element_test is
			-- Make a test that matches element nodes.
		do
			make (Element_node)
		ensure
			matches_elements: node_kind = Element_node
		end

	make_attribute_test is
			-- Make a test that matches attribute nodes.
		do
			make (Attribute_node)
		ensure
			matches_attributes: node_kind = Attribute_node
		end

	make_namespace_test is
			-- Make a test that matches namespace nodes.
		do
			make (Namespace_node)
		ensure
			matches_namespaces: node_kind = Namespace_node
		end

	make_text_test is
			-- Make a test that matches text nodes.
		do
			make (Text_node)
		ensure
			matches_text: node_kind = Text_node
		end

	make_comment_test is
			-- Make a test that matches comment nodes.
		do
			make (Comment_node)
		ensure
			matches_comments: node_kind = Comment_node
		end

	make_processing_instruction_test is
			-- Make a test that matches processing-instruction nodes.
		do
			make (Processing_instruction_node)
		ensure
			matches_processing_instructions: node_kind = Processing_instruction_node
		end

feature -- Access

	node_kind: INTEGER
			-- Type of nodes to which this pattern applies

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := INTEGER_.bit_shift_left (1, node_kind)
		end

	content_type: XM_XPATH_SCHEMA_TYPE is
			-- Content type
		do
			if node_kind = Attribute_node then
				create {XM_XPATH_ANY_SIMPLE_TYPE} Result.make 
			else
				Result := Precursor
			end
		end

	is_node_kind_test: BOOLEAN is
			-- Is `Current' a node kind test?
		do
			Result := True
		end

	as_node_kind_test: XM_XPATH_NODE_KIND_TEST is
			-- `Current' seen as a node kind test
		do
			Result := Current
		end

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := node_kind = Text_node
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			Result := node_kind = a_node_kind
		end	

invariant

	valid_node_type: is_node_type (node_kind) and then node_kind /= Any_node -- Use XM_XPATH_SHARED_ANY_NODE_TEST for that

end
