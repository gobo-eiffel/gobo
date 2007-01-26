indexing

	description:

		"Objects that test for a match against nodes with a specific  content-type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTENT_TYPE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			node_kind, content_type, is_content_test, as_content_test
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make

		-- TODO:
		-- Make use of `is_nillable' in schema-aware version

feature {NONE} -- Initialization

	make (a_node_kind: INTEGER; a_type: XM_XPATH_SCHEMA_TYPE) is
		require
			valid_node_type: a_node_kind = Element_node or else a_node_kind = Attribute_node
			valid_type: a_type /= Void
		do
			node_kind := a_node_kind
			content_type := a_type
			original_text := a_type.description
		ensure
			node_kind_set: node_kind = a_node_kind
			content_type_set: content_type = a_type
			original_text_set: STRING_.same_string (original_text, a_type.description)
		end

feature -- Access

	node_kind: INTEGER
			-- Type of nodes to which this pattern applies

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := INTEGER_.bit_shift_left (1, node_kind)
		end

	content_type: XM_XPATH_SCHEMA_TYPE
			-- Content type

	is_content_test: BOOLEAN is
			-- Is `Current' a content test?
		do
			Result := True
		end

	as_content_test: XM_XPATH_CONTENT_TYPE_TEST is
			-- `Current' seen as a content test
		do
			Result := Current
		end

feature -- Status report

	is_nillable: BOOLEAN
			-- Can `Current' match nillable nodes?

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := False
		end

feature -- Status setting

	set_nillable (a_nillable: BOOLEAN) is
			-- Set `is_nillable' to `a_nillable'.
		do
			is_nillable := a_nillable
		ensure
			set: is_nillable = a_nillable
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_name_code: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		local
			l_schema_type: XM_XPATH_SCHEMA_TYPE
		do
			if node_kind /= a_node_kind then
				Result := False
			elseif content_type.is_any_type then
				Result := True
			elseif a_node_type = content_type.fingerprint then
				Result := True
			else
				l_schema_type := type_factory.schema_type (a_node_type)
				Result := l_schema_type /= Void and then is_sub_type (l_schema_type, content_type)
			end
		end

end
