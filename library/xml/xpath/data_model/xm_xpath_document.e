indexing

	description:

		"XPath Document nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_DOCUMENT

inherit

	XM_XPATH_COMPOSITE_NODE
	   undefine
			base_uri
		redefine
			is_document, as_document, base_uri
		end

		HASHABLE

feature -- Access

	document_number: INTEGER
			-- Uniquely identifies this document.

	is_document: BOOLEAN is
			-- Is `Current' a document?
		do
			Result := True
		end

	as_document: XM_XPATH_DOCUMENT is
			-- `Current' seen as a document
		do
			Result := Current
		end

	base_uri: STRING is
			-- Base URI of document entity
		deferred
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "document"
		ensure then
			node_kind_is_document: Result /= Void and then (Result.count = 0 or else Result.is_equal ("document"))
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			Result := document_node_kind_test
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

	document_uri: UT_URI is
			-- Absoulte URI of the source from which the document was constructed
		deferred
		ensure
			absolute_uri: Result /= Void implies Result.is_absolute
		end

	selected_id (an_id: STRING): XM_XPATH_ELEMENT is
			-- Element with ID value of `id'
		require
			id_not_void: an_id /= Void
		deferred
		end

	idrefs_nodes (some_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Sequence of nodes in document order with an IDREF in `some_idrefs'
		require
			idrefs_not_empty: some_idrefs /= Void and then some_idrefs.count > 0
		deferred
		ensure
			sequence_before: Result /= Void and then Result.before
		end

feature {XM_XPATH_NAME_POOL, XM_XPATH_TINY_FOREST} -- Restricted

	set_document_number (a_number: INTEGER) is
			-- Set `document_number' to `a_number'.
		do
			document_number := a_number
		ensure
			document_number_set: document_number = a_number
		end

end
