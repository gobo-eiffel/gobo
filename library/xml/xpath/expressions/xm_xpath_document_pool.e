indexing

	description:

		"Objects that available documents in the dynamic context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XPATH_DOCUMENT_POOL

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

	-- The document pool ensures that the doc() function,
	--  when called twice with the same URI, returns the same document each time.
	-- For this purpose we use a hash table from URI to Document object.

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create document_name_map.make_with_equality_testers (5, Void, string_equality_tester)
			create media_type_name_map.make_with_equality_testers (5, Void, string_equality_tester)
		end

feature -- Access

	is_mapped (a_uri: STRING): BOOLEAN is
			-- Has `a_uri' been mapped to a document?
		require
			uri_not_void: a_uri /= Void -- and then is_absolute
		do
			Result := document_name_map.has (a_uri)
		ensure
			media_type_mapped: Result = media_type_name_map.has (a_uri)
		end

	document (a_uri: STRING): XM_XPATH_DOCUMENT is
			-- Document corresponding to `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			uri_mapped: is_mapped (a_uri)
		do
			Result := document_name_map.item (a_uri)
		ensure
			document_not_void: Result /= Void
		end

	media_type (a_uri: STRING): UT_MEDIA_TYPE is
			-- Media type corresponding to `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			uri_mapped: is_mapped (a_uri)
		do
			Result := media_type_name_map.item (a_uri)
		ensure
			media_type_may_be_void: True
		end

feature -- Element change

	add (a_document: XM_XPATH_DOCUMENT; a_media_type: UT_MEDIA_TYPE; a_uri: STRING) is
			-- Add document to `Current'.
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			not_mapped: not is_mapped (a_uri)
			document_not_void: a_document /= Void
		do
			document_name_map.force (a_document, a_uri)
			media_type_name_map.force (a_media_type, a_uri)
		ensure
			uri_mapped: is_mapped (a_uri)
		end

feature {NONE} -- Implementation

	document_name_map: DS_HASH_TABLE [XM_XPATH_DOCUMENT, STRING]
			-- Map of SYSTEM ids to documents

	media_type_name_map: DS_HASH_TABLE [UT_MEDIA_TYPE, STRING]
			-- Map of SYSTEM ids to media types

invariant

	document_name_map_not_void: document_name_map /= Void
	media_type_name_map_not_void: media_type_name_map /= Void

end

