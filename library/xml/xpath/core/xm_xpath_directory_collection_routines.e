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

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	UT_SHARED_URL_ENCODING
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	XM_XPATH_TYPE
		export {NONE} all end

feature -- Status report

	last_collection: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Last collection retrieved by `resolve_directory'

feature {NONE} -- Implementation

	protection_code: INTEGER
			-- Fingerprint for "protection" attribute

	type_code: INTEGER
			-- Fingerprint for "type" attribute

	size_code: INTEGER
			-- Fingerprint for "size" attribute

	inode_code: INTEGER
			-- Fingerprint for "inode" attribute

	user_code: INTEGER
			-- Fingerprint for "user" attribute

	group_code: INTEGER
			-- Fingerprint for "group" attribute

	date_code: INTEGER
			-- Fingerprint for "date" attribute

	access_date_code: INTEGER
			-- Fingerprint for "access-date" attribute

	change_date_code: INTEGER
			-- Fingerprint for "change-date" attribute

	device_code: INTEGER
			-- Fingerprint for "device" attribute

	device_type_code: INTEGER
			-- Fingerprint for "device-type" attribute

	links_code: INTEGER
			-- Fingerprint for "links" attribute

	owner_name_code: INTEGER
			-- Fingerprint for "owner-name" attribute

	group_name_code: INTEGER
			-- Fingerprint for "group-name" attribute

	
	Protection_attribute: STRING is "protection"
			-- Attribute name for `protection_code'
	
	Unix_type_attribute: STRING is "type"
			-- Attribute name for `type_code'
	
	Inode_attribute: STRING is "inode"
			-- Attribute name for `inode_code'

	Size_attribute: STRING is "size"
			-- Attribute name for `size_code'
	
	User_attribute: STRING is "user"
			-- Attribute name for `user_code'

	Group_attribute: STRING is "group"
			-- Attribute name for `group_code'
	
	Date_attribute: STRING is "date"
			-- Attribute name for `date_code'
	
	Access_date_attribute: STRING is "access-date"
			-- Attribute name for `access_date_code'
		
	Change_date_attribute: STRING is "change-date"
			-- Attribute name for `change_date_code'
		
	Device_attribute: STRING is "device"
			-- Attribute name for `device_code'
	
	Device_Type_attribute: STRING is "device-type"
			-- Attribute name for `device_type_code'
	
	Links_attribute: STRING is "links"
			-- Attribute name for `links_code'

	Owner_name_attribute: STRING is "owner-name"
			-- Attribute name for `owner_name_code'

	Group_name_attribute: STRING is "group-name"
			-- Attribute name for `group_name_code'
	
	ensure_protection_code is
			-- Ensure `protection_code' is set.
		do
			if protection_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Protection_attribute) then
					protection_code := shared_name_pool.name_code (Null_uri, Null_uri, Protection_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Protection_attribute)
					protection_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			protection_code_strictly_positive: protection_code > 0
		end

	ensure_type_code is
			-- Ensure `type_code' is set.
		do
			if type_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Unix_type_attribute) then
					type_code := shared_name_pool.name_code (Null_uri, Null_uri, Unix_type_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Unix_type_attribute)
					type_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			type_code_strictly_positive: type_code > 0
		end

	ensure_inode_code is
			-- Ensure `inode_code' is set.
		do
			if inode_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Inode_attribute) then
					inode_code := shared_name_pool.name_code (Null_uri, Null_uri, Inode_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Inode_attribute)
					inode_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			inode_code_strictly_positive: inode_code > 0
		end

	ensure_size_code is
			-- Ensure `size_code' is set.
		do
			if size_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Size_attribute) then
					size_code := shared_name_pool.name_code (Null_uri, Null_uri, Size_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Size_attribute)
					size_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			size_code_strictly_positive: size_code > 0
		end

	ensure_user_code is
			-- Ensure `user_code' is set.
		do
			if user_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, User_attribute) then
					user_code := shared_name_pool.name_code (Null_uri, Null_uri, User_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, User_attribute)
					user_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			user_code_strictly_positive: user_code > 0
		end

	ensure_group_code is
			-- Ensure `group_code' is set.
		do
			if group_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Group_attribute) then
					group_code := shared_name_pool.name_code (Null_uri, Null_uri, Group_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Group_attribute)
					group_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			group_code_strictly_positive: group_code > 0
		end

	ensure_date_code is
			-- Ensure `date_code' is set.
		do
			if date_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Date_attribute) then
					date_code := shared_name_pool.name_code (Null_uri, Null_uri, Date_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Date_attribute)
					date_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			date_code_strictly_positive: date_code > 0
		end

	ensure_access_date_code is
			-- Ensure `access_date_code' is set.
		do
			if access_date_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Access_date_attribute) then
					access_date_code := shared_name_pool.name_code (Null_uri, Null_uri, Access_date_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Access_date_attribute)
					access_date_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			access_date_code_strictly_positive: access_date_code > 0
		end

	ensure_change_date_code is
			-- Ensure `change_date_code' is set.
		do
			if change_date_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Change_date_attribute) then
					change_date_code := shared_name_pool.name_code (Null_uri, Null_uri, Change_date_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Change_date_attribute)
					change_date_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			change_date_code_strictly_positive: change_date_code > 0
		end

	ensure_device_code is
			-- Ensure `device_code' is set.
		do
			if device_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Device_attribute) then
					device_code := shared_name_pool.name_code (Null_uri, Null_uri, Device_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Device_attribute)
					device_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			device_code_strictly_positive: device_code > 0
		end

	ensure_device_type_code is
			-- Ensure `device_type_code' is set.
		do
			if device_type_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Device_Type_attribute) then
					device_type_code := shared_name_pool.name_code (Null_uri, Null_uri, Device_Type_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Device_Type_attribute)
					device_type_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			device_type_code_strictly_positive: device_type_code > 0
		end

	ensure_links_code is
			-- Ensure `links_code' is set.
		do
			if links_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Links_attribute) then
					links_code := shared_name_pool.name_code (Null_uri, Null_uri, Links_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Links_attribute)
					links_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			links_code_strictly_positive: links_code > 0
		end

	ensure_owner_name_code is
			-- Ensure `owner_name_code' is set.
		do
			if owner_name_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Owner_name_attribute) then
					owner_name_code := shared_name_pool.name_code (Null_uri, Null_uri, Owner_name_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Owner_name_attribute)
					owner_name_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			owner_name_code_strictly_positive: owner_name_code > 0
		end

	ensure_group_name_code is
			-- Ensure `group_name_code' is set.
		do
			if group_name_code = 0 then
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Group_name_attribute) then
					group_name_code := shared_name_pool.name_code (Null_uri, Null_uri, Group_name_attribute)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, Group_name_attribute)
					group_name_code := shared_name_pool.last_name_code 
				end
			end
		ensure
			group_name_code_strictly_positive: group_name_code > 0
		end

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
			write_attributes (l_uri, l_builder)
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
			write_attributes (l_uri, l_builder)
			l_builder.start_content
			l_builder.notify_characters (a_directory, 0)
			l_builder.end_element
			l_builder.end_document
			l_builder.close
			a_list.put_last (l_builder.tiny_document)
		ensure
			one_more: a_list.count = old a_list.count + 1
		end

	write_attributes (a_uri: UT_URI; a_builder: XM_XPATH_TINY_BUILDER) is
			-- Write file information attributes for `a_uri' using `a_builder'.
		require
			a_uri_not_void: a_uri /= Void
			a_builder_not_void: a_builder /= Void
		local
			l_file: RAW_FILE
			l_info: UNIX_FILE_INFO
		do
			a_builder.notify_attribute (Xml_base_type_code, Untyped_atomic_type_code, a_uri.full_uri, 0)
			create l_file.make (File_uri.uri_to_filename (a_uri))
			l_info := l_file.file_info
			ensure_protection_code
			a_builder.notify_attribute (protection_code, Untyped_atomic_type_code, l_info.protection.out, 0)
			ensure_type_code
			a_builder.notify_attribute (type_code, Untyped_atomic_type_code, l_info.type.out, 0)			
			ensure_inode_code
			a_builder.notify_attribute (inode_code, Untyped_atomic_type_code, l_info.inode.out, 0)
			ensure_size_code
			a_builder.notify_attribute (size_code, Untyped_atomic_type_code, l_info.size.out, 0)
			ensure_user_code
			a_builder.notify_attribute (user_code, Untyped_atomic_type_code, l_info.user_id.out, 0)						
			ensure_group_code
			a_builder.notify_attribute (group_code, Untyped_atomic_type_code, l_info.group_id.out, 0)
			ensure_date_code
			a_builder.notify_attribute (date_code, Untyped_atomic_type_code, l_info.date.out, 0)
			ensure_access_date_code
			a_builder.notify_attribute (access_date_code, Untyped_atomic_type_code, l_info.access_date.out, 0)
			ensure_change_date_code
			a_builder.notify_attribute (change_date_code, Untyped_atomic_type_code, l_info.change_date.out, 0)
			ensure_device_code
			a_builder.notify_attribute (device_code, Untyped_atomic_type_code, l_info.device.out, 0)																		
			ensure_device_type_code
			a_builder.notify_attribute (device_type_code, Untyped_atomic_type_code, l_info.device_type.out, 0)
			ensure_links_code
			a_builder.notify_attribute (links_code, Untyped_atomic_type_code, l_info.links.out, 0)
			ensure_owner_name_code
			a_builder.notify_attribute (owner_name_code, Untyped_atomic_type_code, l_info.owner_name.out, 0)																								
			ensure_group_name_code
			a_builder.notify_attribute (group_name_code, Untyped_atomic_type_code, l_info.group_name.out, 0)
		end

end
