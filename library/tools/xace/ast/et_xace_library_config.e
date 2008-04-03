indexing

	description:

		"Xace libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_LIBRARY_CONFIG

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new Xace library.
		do
			library_prefix := empty_prefix
		ensure
			no_library_prefix: library_prefix.count = 0
		end

feature -- Access

	name: STRING
			-- Name of library

	options: ET_XACE_OPTIONS
			-- Options

	clusters: ET_XACE_CLUSTERS
			-- Clusters

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

	library_prefix: STRING
			-- Prefix to be applied to the names of the
			-- clusters of the current library when mounted

feature -- Setting

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_options (an_options: like options) is
			-- Set `options' to `an_options'.
		do
			options := an_options
		ensure
			options_set: options = an_options
		end

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		do
			clusters := a_clusters
			if clusters /= Void then
				clusters.set_library_prefix (library_prefix)
			end
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries) is
			-- Set `libraries' to `a_libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_library_prefix (a_prefix: like library_prefix) is
			-- Set `library_prefix' to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			library_prefix := a_prefix
			if clusters /= Void then
				clusters.set_library_prefix (library_prefix)
			end
		ensure
			library_prefix_set: library_prefix = a_prefix
		end

feature -- Basic operations

	mount_libraries is
			-- Add clusters `libraries' to `clusters'.
			-- Mark these clusters as mounted.
		do
			if libraries /= Void then
				if clusters = Void then
					create clusters.make_empty
				end
				libraries.mount_libraries (clusters)
			end
		end

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER) is
			-- Add `libraries' to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			if libraries /= Void then
				libraries.merge_libraries (a_libraries, an_error_handler)
			end
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS) is
			-- Merge current library's externals, and those of
			-- all clusters and subclusters, to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		local
			a_cursor: DS_HASH_SET_CURSOR [STRING]
			a_link_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
		do
			if options /= Void then
				a_cursor := options.c_compiler_options.new_cursor
				from a_cursor.start until a_cursor.after loop
					an_externals.put_c_compiler_options (a_cursor.item)
					a_cursor.forth
				end
				a_cursor := options.header.new_cursor
				from a_cursor.start until a_cursor.after loop
					an_externals.put_include_directory (a_cursor.item)
					a_cursor.forth
				end
				a_link_cursor := options.link.new_cursor
				from a_link_cursor.start until a_link_cursor.after loop
					an_externals.put_link_library (a_link_cursor.item)
					a_link_cursor.forth
				end
			end
			if clusters /= Void then
				clusters.merge_externals (an_externals)
			end
			if libraries /= Void then
				libraries.merge_externals (an_externals)
			end
		end

	merge_exported_features (an_export: DS_LIST [ET_XACE_EXPORTED_FEATURE]) is
			-- Merge current library's exported features and those
			-- all clusters and subclusters to `an_export'.
		require
			an_export_not_void: an_export /= Void
			no_void_export: not an_export.has (Void)
		do
			if clusters /= Void then
				clusters.merge_exported_features (an_export)
			end
		ensure
			no_void_export: not an_export.has (Void)
		end

feature {NONE} -- Constants

	empty_prefix: STRING is ""
			-- Empty prefix

invariant

	library_prefix_not_void: library_prefix /= Void

end
