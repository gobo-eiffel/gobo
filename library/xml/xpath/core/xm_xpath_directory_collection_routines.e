indexing

	description:

		"Objects that support the default collection and file: collections"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DIRECTORY_COLLECTION_ROUTINES

inherit

	ANY

	XM_XPATH_ISOLATION_LEVELS
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	UT_SHARED_URL_ENCODING
		export {NONE} all end

feature -- Status report

	last_collection: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Last collection retrieved by `resolve_directory'

feature {NONE} -- Implementation

	resolve_directory (a_uri, a_base_uri: UT_URI; a_context: XM_XPATH_CONTEXT; a_directory: KL_DIRECTORY) is
			-- Resolve all XML files in `a_directory'.
		require
			absolute_uri_not_void: a_uri /= Void and then a_uri.is_absolute
			base_uri_not_void: a_base_uri /= Void and then a_base_uri.is_absolute
			dynamic_context_not_void: a_context /= Void
			directory_not_void: a_directory /= Void
		local
			a_file_name: STRING
			an_index: INTEGER
			entries: ARRAY [STRING]
			a_file_uri: UT_URI
			an_extent: XM_XPATH_SEQUENCE_EXTENT
			a_list: DS_ARRAYED_LIST [XM_XPATH_DOCUMENT]
			a_document: XM_XPATH_DOCUMENT
		do
			last_collection := Void
			entries := a_directory.filenames
			if entries = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_collection.make
			elseif a_context.available_documents.isolation_level < Repeatable_read then
				create {XM_XPATH_FILE_COLLECTION_ITERATOR} last_collection.make (entries, a_base_uri, a_context)
			else
				create a_list.make (entries.count)
				from an_index := entries.lower until an_index > entries.upper loop
					a_file_name := entries.item (an_index)
					if not Url_encoding.has_excluded_characters (a_file_name) then

						-- for now, we just ignore errors

						create a_file_uri.make_resolve (a_base_uri, a_file_name)
						if a_context.available_documents.is_document_mapped (a_file_uri.full_uri) then
							a_document := a_context.available_documents.document (a_file_uri.full_uri)
						else
							a_context.build_document (a_file_uri.full_reference)
							if a_context.is_build_document_error then
								a_document := Void -- for now, we just ignore errors
								if a_context.available_documents.isolation_level = Serializable then
									a_context.available_documents.add (Void, Void, a_file_uri.full_uri)
								end
							else
								a_document := a_context.last_parsed_document
								a_context.available_documents.add (a_document, a_context.last_parsed_media_type, a_document.document_uri.full_uri)
							end
						end
						if a_document /= Void then a_list.put_last (a_document) end
					end
					an_index := an_index + 1
				end
				if last_collection = Void then
					create an_extent.make_from_list (a_list)
					a_context.available_documents.add_collection (an_extent, a_uri.full_uri)
					last_collection := a_context.available_documents.collection (a_uri.full_uri)
				end

				-- TODO: use fragment identifier for filter on extent??
			end
		end

end
