indexing

	description:

		"XPath Document nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_DOCUMENT

inherit

	XM_XPATH_COMPOSITE_NODE

	XM_XPATH_BASE_URI

	XM_XPATH_NAMELESS_NODE

	XM_XPATH_UNTYPED_ATOMIC_STRING_VALUE -- for typed value - add this class

	XM_XPATH_TYPELESS_NODE

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	base_uri: ANY_URI is
			-- Base URI
		do
			Result := base_uri_property
		ensure then
			base_uri_property: Result = base_uri_property
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "document"
		ensure then
			node_kind_is_document: STRING_.same_string (Result, "document")
		end

	parent: XM_XPATH_NODE is
			-- Parent of current node
		do
			Result := Void
		ensure then
			parent_is_void: Result = Void
		end

	string_value: STRING is
			-- String-value
		do
			-- Return the concatentation of the string value of all it's
			-- text-node descendants.
			-- TODO
		end

	unparsed_entity_system_id (entity_name: STRING): STRING is
			-- System identifier of an unparsed external entity
		require
			entity_name_not_void: entity_name /= Void
		deferred
		end

	unparsed_entity_public_id (entity_name: STRING): STRING is
			-- Public identifier of an unparsed external entity
		require
			entity_name_not_void: entity_name /= Void		
		deferred
		end

	document_uri: STRING is
			-- Absoulte URI of the source from which the document was constructed
		deferred
		end

end
