note

	description:

		"XPath Document nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

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

	hash_code: INTEGER
		do
			Result := document_number \\ 7
		end

	base_uri: detachable STRING
			-- Base URI of document entity as per W3C XML:Base REC
		deferred
		end

	node_kind: STRING
			-- Kind of node
		do
			Result := "document"
		ensure then
			node_kind_is_document: Result /= Void and then Result.is_equal ("document")
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		do
			Result := document_node_kind_test
		end

	all_elements (a_fingerprint: INTEGER): DS_ARRAYED_LIST [XM_XPATH_ELEMENT]
			-- An enumeration of all elements with a given name
		deferred
		ensure
			element_list_not_void: Result /= Void
		end

	unparsed_entity_system_id (a_entity_name: STRING): detachable STRING
			-- System identifier of an unparsed external entity
		require
			a_entity_name_not_void: a_entity_name /= Void
		deferred
		end

	unparsed_entity_public_id (a_entity_name: STRING): detachable STRING
			-- Public identifier of an unparsed external entity
		require
			a_entity_name_not_void: a_entity_name /= Void
		deferred
		end

	document_uri: detachable UT_URI
			-- Absoulte URI of the source from which the document was constructed
		deferred
		ensure
			absolute_uri: Result /= Void implies Result.is_absolute
		end

	selected_id (a_id: STRING): detachable XM_XPATH_ELEMENT
			-- Element with ID value of `id'
		require
			a_id_not_void: a_id /= Void
		deferred
		end

	idrefs_nodes (a_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Sequence of nodes in document order with an IDREF in `a_idrefs'
		require
			idrefs_not_empty: a_idrefs /= Void and then not a_idrefs.is_empty
		deferred
		ensure
			sequence_before: Result /= Void and then Result.before
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		do
			Result := "/"
		end

feature -- Status report

	is_document: BOOLEAN
			-- Is `Current' a document?
		do
			Result := True
		end

feature -- Conversion

	as_document: XM_XPATH_DOCUMENT
			-- `Current' seen as a document
		do
			Result := Current
		end

feature {XM_XPATH_NAME_POOL, XM_XPATH_TINY_FOREST} -- Restricted

	set_document_number (a_number: INTEGER)
			-- Set `document_number' to `a_number'.
		do
			document_number := a_number
		ensure
			document_number_set: document_number = a_number
		end

end
