note

	description:

		"Xace systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SYSTEM_CONFIG

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new Xace system.
		do
		end

feature -- Access

	system_name: STRING
			-- Name of system

	root_class_name: STRING
			-- Name of root class

	creation_procedure_name: STRING
			-- Name of root creation procedure

	options: ET_XACE_OPTIONS
			-- Options

	clusters: ET_XACE_CLUSTERS
			-- Clusters

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

feature -- Setting

	set_system_name (a_name: like system_name) is
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_root_class_name (a_name: like root_class_name) is
			-- Set `root_class_name' to `a_name'.
		do
			root_class_name := a_name
		ensure
			root_class_name_set: root_class_name = a_name
		end

	set_creation_procedure_name (a_name: like creation_procedure_name) is
			-- Set `creation_procedure_name' to `a_name'.
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
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
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries) is
			-- Set `a_libraries' to `libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
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

	merge_externals (an_externals: ET_XACE_EXTERNALS) is
			-- Merge current system's externals, and those of
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
			-- Merge current system's exported features and those
			-- all clusters and subclusters to `an_export'.
		require
			an_export_not_void: an_export /= Void
			no_void_export: not an_export.has_void
		do
			if clusters /= Void then
				clusters.merge_exported_features (an_export)
			end
		ensure
			no_void_export: not an_export.has_void
		end

end
