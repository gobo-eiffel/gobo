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
		redefine
			base_uri
		end

		HASHABLE

feature -- Access

	document_number: INTEGER
			-- Uniquely identifies this document.

	base_uri: STRING is
			-- Base URI
		do
			Result := system_id
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "document"
		ensure then
			node_kind_is_document: Result /= Void and then ( Result.count = 0 or else Result.is_equal ("document"))
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make_document_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	all_elements (a_fingerprint: INTEGER): DS_ARRAYED_LIST [XM_XPATH_ELEMENT] is
			-- An enumeration of all elements with a given name
		deferred
		ensure
			element_list_not_void: Result /= Void
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

invariant

	name_pool_not_void: name_pool /= Void

end
