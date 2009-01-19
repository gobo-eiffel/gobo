indexing

	description:

		"Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_CLUSTER

inherit

	ET_CLUSTER
		redefine
			prefixed_name,
			parent, subclusters,
			is_valid_eiffel_filename,
			is_valid_directory_name
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname; a_universe: ET_UNIVERSE) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			pathname := a_pathname
			is_relative := (a_pathname = Void)
			universe := a_universe
			library_prefix := empty_prefix
			cluster_prefix := empty_prefix
			set_scm_mapping_constraint_enabled (True)
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			universe_set: universe = a_universe
			prefixed_name_set: prefixed_name = a_name
			is_relative: is_relative = (a_pathname = Void)
			no_library_prefix: library_prefix.count = 0
			no_cluster_prefix: cluster_prefix.count = 0
			scm_mapping_constraint_enabled: scm_mapping_constraint_enabled
		end

feature -- Access

	name: STRING
			-- Name

	prefixed_name: STRING is
			-- Cluster name with possible prefixes
		do
			if library_prefix.count > 0 then
				if cluster_prefix.count > 0 then
					Result := STRING_.new_empty_string (library_prefix, library_prefix.count + cluster_prefix.count + name.count)
					Result.append_string (library_prefix)
					Result := STRING_.appended_string (Result, cluster_prefix)
					Result := STRING_.appended_string (Result, name)
				else
					Result := STRING_.concat (library_prefix, name)
				end
			else
				if cluster_prefix.count > 0 then
					Result := STRING_.concat (cluster_prefix, name)
				else
					Result := name
				end
			end
		ensure then
			-- TODO:
			--definition: STRING_.same_string (Result, STRING_.concat_n (<<library_prefix, cluster_prefix, name>>))
		end

	library_prefix: STRING
			-- Cluster name prefix specified in <mount>

	cluster_prefix: STRING
			-- Cluster name prefix specified in <cluster>

	pathname: STRING
			-- Directory pathname (may be Void)

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

	options: ET_XACE_OPTIONS
			-- Options

	class_options: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
			-- Class options

feature -- Status report

	is_mounted: BOOLEAN
			-- Has cluster been mounted?

	is_fully_ecf_abstract: BOOLEAN is
			-- Are current cluster and recursively all its subclusters either abstract,
			-- override, or the root of a library otherwise described by an ECF file?
			-- Useful when generating ECF files out of Xace because this kind of cluster
			-- should not appear as a cluster in the generated ECF file.
		local
			i, nb: INTEGER
			a_cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
		do
			if is_override then
				Result := True
			elseif options /= Void and then options.is_ecf_library_declared then
				Result := True
			elseif is_abstract then
				Result := True
				if subclusters /= Void then
					a_cluster_list := subclusters.clusters
					nb := a_cluster_list.count
					from i := 1 until i > nb loop
						if not a_cluster_list.item (i).is_fully_ecf_abstract then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN is
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		local
			an_exclude: DS_HASH_SET [STRING]
		do
			if precursor (a_filename) then
				if options /= Void and then options.is_exclude_declared then
					an_exclude := options.exclude
					if operating_system.is_windows then
						Result := not has_case_insensitive (an_exclude, a_filename)
					else
						Result := not an_exclude.has (a_filename)
					end
				else
					Result := True
				end
			end
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN is
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		local
			an_exclude: DS_HASH_SET [STRING]
		do
			if precursor (a_dirname) then
				if options /= Void and then options.is_exclude_declared then
					an_exclude := options.exclude
					if operating_system.is_windows then
						Result := not has_case_insensitive (an_exclude, a_dirname)
					else
						Result := not an_exclude.has (a_dirname)
					end
				else
					Result := True
				end
			end
		end

feature -- Nested

	parent: ET_XACE_CLUSTER
			-- Parent cluster

	subclusters: ET_XACE_CLUSTERS
			-- Subclusters

feature -- Setting

	set_libraries (a_libraries: like libraries) is
			-- Set `libraries' to `a_libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_options (an_options: like options) is
			-- Set `options' to `an_options'.
		do
			options := an_options
		ensure
			options_set: options = an_options
		end

	set_library_prefix (a_prefix: STRING) is
			-- Set `library_prefix' to `a_prefix',
			-- and recursively in the subclusters.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			library_prefix := a_prefix
			if subclusters /= Void then
				subclusters.set_library_prefix (a_prefix)
			end
		ensure
			library_prefix_set: library_prefix = a_prefix
		end

	set_cluster_prefix (a_prefix: STRING) is
			-- Set `cluster_prefix' to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			cluster_prefix := a_prefix
		ensure
			cluster_prefix_set: cluster_prefix = a_prefix
		end

feature -- Element change

	put_class_option (an_option: ET_XACE_CLASS_OPTIONS) is
			-- Add `an_option' to `class_options'.
		require
			an_option_not_void: an_option /= Void
		do
			if class_options = Void then
				create class_options.make
			end
			class_options.put_last (an_option)
		end

feature -- Status setting

	set_mounted (b: BOOLEAN) is
			-- Set `is_mounted' to `b'.
		do
			is_mounted := b
			if subclusters /= Void then
				subclusters.set_mounted (b)
			end
		ensure
			mounted_set: is_mounted = b
		end

feature -- Basic operations

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER) is
			-- Add `libraries', and recursively the libraries of subclusters, to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			if libraries /= Void then
				libraries.merge_libraries (a_libraries, an_error_handler)
			end
			if subclusters /= Void then
				subclusters.merge_libraries (a_libraries, an_error_handler)
			end
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS) is
			-- Merge current cluster's externals and those
			-- of subclusters to `an_externals'.
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
			if subclusters /= Void then
				subclusters.merge_externals (an_externals)
			end
		end

	merge_exported_features (an_export: DS_LIST [ET_XACE_EXPORTED_FEATURE]) is
			-- Merge current cluster's exported features and those
			-- of subclusters to `an_export'.
		require
			an_export_not_void: an_export /= Void
			no_void_export: not an_export.has (Void)
		local
			an_exported_feature: ET_XACE_EXPORTED_FEATURE
			a_class_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS]
			a_class_options: ET_XACE_CLASS_OPTIONS
			a_feature_options_list: DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS]
			a_feature_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS]
			a_feature_options: ET_XACE_FEATURE_OPTIONS
			an_options: ET_XACE_OPTIONS
		do
			if class_options /= Void then
				a_class_cursor := class_options.new_cursor
				from a_class_cursor.start until a_class_cursor.after loop
					a_class_options := a_class_cursor.item
					a_feature_options_list := a_class_options.feature_options
					if a_feature_options_list /= Void then
						a_feature_cursor := a_feature_options_list.new_cursor
						from a_feature_cursor.start until a_feature_cursor.after loop
							a_feature_options := a_feature_cursor.item
							an_options := a_feature_options.options
							if an_options.is_export_option_declared then
								create an_exported_feature.make (a_class_options.class_name, a_feature_options.feature_name, an_options.export_option)
								an_export.force_last (an_exported_feature)
							end
							a_feature_cursor.forth
						end
					end
					a_class_cursor.forth
				end
			end
			if subclusters /= Void then
				subclusters.merge_exported_features (an_export)
			end
		ensure
			no_void_export: not an_export.has (Void)
		end

	merge_components (a_components: DS_LIST [ET_XACE_COMPONENT]) is
			-- Merge current cluster's components and those
			-- of subclusters to `a_components'.
		require
			a_components_not_void: a_components /= Void
			no_void_component: not a_components.has (Void)
		local
			a_component: ET_XACE_COMPONENT
		do
			if options /= Void then
				if options.is_component_declared then
					create a_component.make (name, options.component)
					a_components.force_last (a_component)
				end
			end
			if subclusters /= Void then
				subclusters.merge_components (a_components)
			end
		ensure
			no_void_component: not a_components.has (Void)
		end

	merge_assemblies (an_assemblies: DS_LIST [ET_XACE_ASSEMBLY]) is
			-- Merge current cluster's assemblies and those
			-- of subclusters to `an_assemblies'.
		require
			an_assemblies_not_void: an_assemblies /= Void
			no_void_assembly: not an_assemblies.has (Void)
		local
			an_assembly: ET_XACE_ASSEMBLY
		do
			if options /= Void then
				if options.is_assembly_declared then
					create an_assembly.make (name, options.assembly, options.version,
						options.culture, options.public_key_token, options.prefix_option)
					if pathname /= Void then
						an_assembly.set_assembly_pathname (full_pathname)
					end
					an_assemblies.force_last (an_assembly)
				end
			end
			if subclusters /= Void then
				subclusters.merge_assemblies (an_assemblies)
			end
		ensure
			no_void_assembly: not an_assemblies.has (Void)
		end

	merge_override_clusters (an_override_clusters: DS_LIST [ET_XACE_CLUSTER]) is
			-- Add current cluster to `an_override_clusters' if it is an
			-- override cluster. Otherwise add top level override clusters
			-- found recursively in its subclusters.
		require
			an_override_clusters_not_void: an_override_clusters /= Void
			no_void_override_cluster: not an_override_clusters.has (Void)
		do
			if is_override then
				an_override_clusters.force_last (Current)
			elseif subclusters /= Void then
				subclusters.merge_override_clusters (an_override_clusters)
			end
		ensure
			no_void_override_cluster: not an_override_clusters.has (Void)
		end

	merge_ecf_clusters (an_ecf_clusters: DS_LIST [ET_XACE_CLUSTER]) is
			-- Add current cluster and any of its subclusters to
			-- `an_ecf_clusters' if they are the root of a library
			-- that is otherwise described by the ECF file.
		require
			an_ecf_clusters_not_void: an_ecf_clusters /= Void
			no_void_ecf_cluster: not an_ecf_clusters.has (Void)
		do
			if options /= Void and then options.is_ecf_library_declared then
				an_ecf_clusters.force_last (Current)
			end
			if subclusters /= Void then
				subclusters.merge_ecf_clusters (an_ecf_clusters)
			end
		ensure
			no_void_ecf_cluster: not an_ecf_clusters.has (Void)
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current is
			-- New recursive cluster
		do
			create Result.make (a_name, Void, universe)
			Result.set_parent (Current)
			Result.set_options (options)
			Result.set_recursive (True)
			Result.set_implicit (True)
			Result.set_override (is_override)
			Result.set_read_only (is_read_only)
		end

	has_case_insensitive (a_set: DS_HASH_SET [STRING]; v: STRING): BOOLEAN is
			-- Does `a_set' contain `v' in a case-insensitive way?
		require
			a_set_not_void: a_set /= Void
			no_void_item: not a_set.has (Void)
			v_not_void: v /= Void
		local
			a_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			a_cursor := a_set.new_cursor
			from a_cursor.start until a_cursor.after loop
				if STRING_.same_case_insensitive (a_cursor.item, v) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Constants

	empty_prefix: STRING is ""
			-- Empty prefix

invariant

	library_prefix_not_void: library_prefix /= Void
	cluster_prefix_not_void: cluster_prefix /= Void
	no_void_class_option: class_options /= Void implies not class_options.has (Void)

end
