indexing

	description:

		"Objects that represent a collection of documents handled during a single transformation"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_DOCUMENT_POOL

	-- The document pool ensures that the document() function,
	--  when called twice with the same URI, returns the same document each time.
	-- For this purpose we use a hash table from URI to Document object.

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create document_name_map.make (5)
		end

feature -- Access

	is_mapped (a_uri: STRING): BOOLEAN is
			-- Has `a_uri' been mapped to a document?
		require
			uri_not_void: a_uri /= Void
		do
			Result := document_name_map.has (a_uri)
		end

	document (a_uri: STRING): XM_XPATH_DOCUMENT is
			-- Document corresponding to `a_uri'
		require
			uri_not_void: a_uri /= Void
			uri_mapped: is_mapped (a_uri)
		do
			Result := document_name_map.item (a_uri)
		ensure
			document_not_void: Result /= Void
		end

feature -- Element change

	add (a_document: XM_XPATH_DOCUMENT; a_uri: STRING) is
			-- Add document to `Current'.
		require
			uri_not_void: a_uri /= Void
			not_mapped: not is_mapped (a_uri)
			document_not_void: a_document /= Void
		do
			document_name_map.put (a_document, a_uri)
		ensure
			uri_mapped: is_mapped (a_uri)
		end

feature -- Removal

	discard  (a_document: XM_XPATH_DOCUMENT) is
			-- Release `a_document' from the pool
		require
			document_not_void: a_document /= Void
		do
			document_name_map.start
			if not document_name_map.off then
				document_name_map.search_forth (a_document)
				if not document_name_map.after then
					document_name_map.remove (document_name_map.key_for_iteration)
				end
			end
		end

feature {NONE} -- Implementation

	document_name_map: DS_HASH_TABLE [XM_XPATH_DOCUMENT, STRING]
			-- Map of SYSTEM ids to documents

invariant

	document_name_map_not_void: document_name_map /= Void

end

