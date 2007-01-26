indexing

	description:

		"Objects that hold available documents and avaialable collections in the dynamic context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XPATH_DOCUMENT_POOL

inherit

	ANY

	XM_XPATH_ISOLATION_LEVELS

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

		-- The document pool ensures that the doc() function,
		--  when called twice with the same URI, returns the same document each time.
		-- Likewise for collection().

create

	make

feature {NONE} -- Initialization

	make (an_isolation_level: INTEGER) is
			-- Establish invariant.
		require
			isolation_level_small_enough: an_isolation_level <= Serializable
			isolation_level_large_enough: an_isolation_level >= Read_uncommitted
		do
			create document_name_map.make_with_equality_testers (5, Void, string_equality_tester)
			create collection_name_map.make_with_equality_testers (5, Void, string_equality_tester)
			create media_type_name_map.make_with_equality_testers (5, Void, string_equality_tester)
			isolation_level := an_isolation_level
		ensure
			isolation_level_set: isolation_level = an_isolation_level
		end

feature -- Access

	is_collection_mapped (a_uri: STRING): BOOLEAN is
			-- Has `a_uri' been mapped to a collection?
		require
			uri_not_void: a_uri /= Void-- and then is_absolute
		do
			Result := collection_name_map.has (a_uri)
		end

	is_document_mapped (a_uri: STRING): BOOLEAN is
			-- Has `a_uri' been mapped to a document?
		require
			uri_not_void: a_uri /= Void -- and then is_absolute
		do
			Result := document_name_map.has (a_uri)
		ensure
			media_type_mapped: Result = media_type_name_map.has (a_uri)
		end


	collection (a_uri: STRING): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Collection corresponding to `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			uri_mapped: is_collection_mapped (a_uri)
		do
			Result := collection_name_map.item (a_uri).node_iterator (False)
		ensure
			collection_before:  isolation_level < Serializable implies Result /= Void and then Result.before
		end
	
	document (a_uri: STRING): XM_XPATH_DOCUMENT is
			-- Document corresponding to `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			uri_mapped: is_document_mapped (a_uri)
			isolation_level_high_enough: isolation_level >= Repeatable_read
		do
			Result := document_name_map.item (a_uri)
		ensure
			document_not_void:  isolation_level < Serializable implies Result /= Void
		end

	media_type (a_uri: STRING): UT_MEDIA_TYPE is
			-- Media type corresponding to `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			uri_mapped: is_document_mapped (a_uri)
		do
			Result := media_type_name_map.item (a_uri)
		ensure
			media_type_may_be_void: True
		end

	isolation_level: INTEGER
			-- Isolation-level for `a_uri'

feature -- Element change

	add (a_document: XM_XPATH_DOCUMENT; a_media_type: UT_MEDIA_TYPE; a_uri: STRING) is
			-- Add `a_document' to `Current'.
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			not_mapped: not is_document_mapped (a_uri)
			document_not_void: isolation_level < Serializable implies a_document /= Void
			isolation_level_high_enough: isolation_level >= Repeatable_read
		do
			document_name_map.force (a_document, a_uri)
			media_type_name_map.force (a_media_type, a_uri)
		ensure
			uri_mapped: is_document_mapped (a_uri)
		end

	add_collection (a_collection: XM_XPATH_SEQUENCE_EXTENT; a_uri: STRING) is
			-- Add `a_document' to `Current'.
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			not_mapped: not is_collection_mapped (a_uri)
			collection:  isolation_level < Serializable implies a_collection /= Void
			isolation_level_high_enough: isolation_level >= Repeatable_read
		do
			collection_name_map.force (a_collection, a_uri)
		ensure
			uri_mapped: is_collection_mapped (a_uri)
		end

feature {XM_XPATH_TRANSFORMER} -- Removal

	remove (a_uri: STRING) is
			-- Remove `a_uri' from `Current'.
			-- CAUTION: This breaks the guarentee of Unique URI to document mapping.
			--          Hence the export restriction
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			mapped: is_document_mapped (a_uri)
		do
			document_name_map.remove (a_uri)
			media_type_name_map.remove (a_uri)
		ensure
			uri_not_mapped: not is_document_mapped (a_uri)
		end

feature {NONE} -- Implementation

	document_name_map: DS_HASH_TABLE [XM_XPATH_DOCUMENT, STRING]
			-- Map of SYSTEM ids to documents

	collection_name_map: DS_HASH_TABLE [XM_XPATH_SEQUENCE_EXTENT, STRING]
			-- Map of SYSTEM ids to collections

	media_type_name_map: DS_HASH_TABLE [UT_MEDIA_TYPE, STRING]
			-- Map of SYSTEM ids to media types

invariant

	document_name_map_not_void: document_name_map /= Void
	media_type_name_map_not_void: media_type_name_map /= Void
	isolation_level_small_enough: isolation_level <= Serializable
	isolation_level_large_enough: isolation_level >= Read_uncommitted

end

