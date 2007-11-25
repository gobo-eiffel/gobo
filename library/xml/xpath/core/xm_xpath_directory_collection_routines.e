indexing

	description:

		"Objects that support the default collection and file: collections"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
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

	XM_XPATH_TYPE
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
			l_files, l_directories: ARRAY [STRING]
			l_extent: XM_XPATH_SEQUENCE_EXTENT
			l_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			l_count: INTEGER
		do
			last_collection := Void
			l_files := a_directory.filenames
			l_directories := a_directory.directory_names
			if l_files = Void and l_directories = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_collection.make
			else
				if l_files /= Void then
					l_count := l_count + l_files.count
				end
				if l_directories /= Void then
					l_count := l_count + l_directories.count
				end
				create l_list.make (l_count)
				l_files.do_all (agent add_file (l_list, ?, a_uri))
				l_directories.do_all (agent add_directory (l_list, ?, a_uri))
				if last_collection = Void then
					create l_extent.make_from_list (l_list)
					a_context.available_documents.add_collection (l_extent, a_uri.full_uri)
					last_collection := a_context.available_documents.collection (a_uri.full_uri)
				end
			end
		end

	add_file (a_list: DS_ARRAYED_LIST [XM_XPATH_NODE]; a_filename: STRING; a_base_uri: UT_URI) is
			-- Add node for `a_filename' to `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_extendible: a_list.extendible (1)
			a_filename_not_void: a_filename /= Void
			base_uri_not_void: a_base_uri /= Void and then a_base_uri.is_absolute
		local
			l_builder: XM_XPATH_TINY_BUILDER
			l_uri: UT_URI
		do
			create l_builder.make (a_base_uri.full_uri, a_base_uri)
			l_builder.open
			l_builder.start_document
			l_builder.start_element (Gexslt_file_element_type_code, Untyped_type_code, 0)
			create l_uri.make_resolve (a_base_uri, a_filename)
			l_builder.notify_attribute (Xml_base_type_code, Untyped_atomic_type_code, l_uri.full_uri, 0)
			l_builder.start_content
			l_builder.notify_characters (a_filename, 0)
			l_builder.end_element
			l_builder.end_document
			l_builder.close
			a_list.put_last (l_builder.tiny_document)
		ensure
			one_more: a_list.count = old a_list.count + 1
		end

	add_directory (a_list: DS_ARRAYED_LIST [XM_XPATH_NODE]; a_directory: STRING; a_base_uri: UT_URI) is
			-- Add node for `a_directory' to `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_extendible: a_list.extendible (1)
			a_directory_not_void: a_directory /= Void
			base_uri_not_void: a_base_uri /= Void and then a_base_uri.is_absolute
		local
			l_builder: XM_XPATH_TINY_BUILDER
			l_uri: UT_URI
		do
			create l_builder.make (a_base_uri.full_uri, a_base_uri)
			l_builder.open
			l_builder.start_document
			l_builder.start_element (Gexslt_directory_element_type_code, Untyped_type_code, 0)
			create l_uri.make_resolve (a_base_uri, STRING_.concat (a_directory, "/"))
			l_builder.notify_attribute (Xml_base_type_code, Untyped_atomic_type_code, l_uri.full_uri, 0)
			l_builder.start_content
			l_builder.notify_characters (a_directory, 0)
			l_builder.end_element
			l_builder.end_document
			l_builder.close
			a_list.put_last (l_builder.tiny_document)
		ensure
			one_more: a_list.count = old a_list.count + 1
		end
end
