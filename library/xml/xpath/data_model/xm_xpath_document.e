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

	XM_XPATH_NODE
	
	XM_XPATH_COMPOSITE_NODE

	XM_XPATH_BASE_URI

	XM_XPATH_TYPELESS_NODE

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

feature -- Access

	document_number: INTEGER
			-- Uniquely identifies this document.

	base_uri: STRING is
			-- Base URI
		do
			-- TODO - make this deferred
			Result := base_uri_property
		ensure then
			base_uri_property: Result = base_uri_property
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "document"
		ensure then
			node_kind_is_document: Result /= Void and then ( Result.count = 0 or else Result.is_equal ("document"))
		end

	item_type: INTEGER is
			-- Type
		do
			Result := Document_node
		end
	
	unparsed_entity_system_id (an_entity_name: STRING): STRING is
			-- System identifier of an unparsed external entity
		require
			entity_name_not_void: an_entity_name /= Void
		deferred
		end

	unparsed_entity_public_id (an_entity_name: STRING): STRING is
			-- Public identifier of an unparsed external entity
		require
			entity_name_not_void: an_entity_name /= Void		
		deferred
		end

	document_uri: STRING is
			-- Absoulte URI of the source from which the document was constructed
		deferred
		end

	select_id (an_id: STRING): XM_XPATH_ELEMENT is
			-- Element with ID value of `id'
		require
			id_not_void: an_id /= Void
		deferred
		end

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool used to build `Current'


feature -- Element change

	set_name_pool (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool.
		require
			name_pool_not_void: a_name_pool /= Void
		deferred
		ensure
			name_pool_set: name_pool = a_name_pool
		end
		
end
