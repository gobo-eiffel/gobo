note

	description:

		"Xace Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2021, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_CLUSTER

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_CLUSTER
		redefine
			make,
			prefixed_name,
			parent, subclusters,
			is_valid_eiffel_filename,
			is_valid_directory_name,
			new_recursive_cluster
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname; a_universe: like universe)
			-- Create a new cluster.
		do
			library_prefix := empty_prefix
			cluster_prefix := empty_prefix
			precursor (a_name, a_pathname, a_universe)
		ensure then
			prefixed_name_set: prefixed_name = a_name
			no_library_prefix: library_prefix.count = 0
			no_cluster_prefix: cluster_prefix.count = 0
		end

feature -- Access

	prefixed_name: STRING
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

	libraries: detachable ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

	options: detachable ET_XACE_OPTIONS
			-- Options

	class_options: detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
			-- Class options

feature -- Status report

	is_mounted: BOOLEAN
			-- Has cluster been mounted?

	is_fully_ecf_abstract: BOOLEAN
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
			elseif attached options as l_options and then attached l_options.value ({ET_XACE_OPTION_NAMES}.ecf_library_option_name) then
				Result := True
			elseif is_abstract then
				Result := True
				if attached subclusters as l_subclusters then
					a_cluster_list := l_subclusters.clusters
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

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		do
			if precursor (a_filename) then
				if attached options as l_options and then attached l_options.multivalue ({ET_XACE_OPTION_NAMES}.exclude_option_name) as l_excludes then
					if operating_system.is_windows then
						Result := not has_case_insensitive (l_excludes, a_filename)
					else
						Result := not l_excludes.has (a_filename)
					end
				else
					Result := True
				end
			end
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		do
			if precursor (a_dirname) then
				if attached options as l_options and then attached l_options.multivalue ({ET_XACE_OPTION_NAMES}.exclude_option_name) as l_excludes then
					if operating_system.is_windows then
						Result := not has_case_insensitive (l_excludes, a_dirname)
					else
						Result := not l_excludes.has (a_dirname)
					end
				else
					Result := True
				end
			end
		end

feature -- Nested

	parent: detachable ET_XACE_CLUSTER
			-- Parent cluster

	subclusters: detachable ET_XACE_CLUSTERS
			-- Subclusters

feature -- Setting

	set_libraries (a_libraries: like libraries)
			-- Set `libraries' to `a_libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_options (an_options: like options)
			-- Set `options' to `an_options'.
		do
			options := an_options
		ensure
			options_set: options = an_options
		end

	set_library_prefix (a_prefix: STRING)
			-- Set `library_prefix' to `a_prefix',
			-- and recursively in the subclusters.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			library_prefix := a_prefix
			if attached subclusters as l_subclusters then
				l_subclusters.set_library_prefix (a_prefix)
			end
		ensure
			library_prefix_set: library_prefix = a_prefix
		end

	set_cluster_prefix (a_prefix: STRING)
			-- Set `cluster_prefix' to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			cluster_prefix := a_prefix
		ensure
			cluster_prefix_set: cluster_prefix = a_prefix
		end

feature -- Element change

	put_class_option (an_option: ET_XACE_CLASS_OPTIONS)
			-- Add `an_option' to `class_options'.
		require
			an_option_not_void: an_option /= Void
		local
			l_class_options: like class_options
		do
			l_class_options := class_options
			if l_class_options = Void then
				create l_class_options.make
				class_options := l_class_options
			end
			l_class_options.put_last (an_option)
		end

feature -- Status setting

	set_mounted (b: BOOLEAN)
			-- Set `is_mounted' to `b'.
		do
			is_mounted := b
			if attached subclusters as l_subclusters then
				l_subclusters.set_mounted (b)
			end
		ensure
			mounted_set: is_mounted = b
		end

feature -- Basic operations

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER)
			-- Add `libraries', and recursively the libraries of subclusters, to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			if attached libraries as l_libraries then
				l_libraries.merge_libraries (a_libraries, an_error_handler)
			end
			if attached subclusters as l_subclusters then
				l_subclusters.merge_libraries (a_libraries, an_error_handler)
			end
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS)
			-- Merge current cluster's externals and those
			-- of subclusters to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		do
			if attached options as l_options then
				if attached l_options.multivalue ({ET_XACE_OPTION_NAMES}.c_compiler_options_option_name) as l_multivalue then
					across l_multivalue as i_c_compiler_option loop
						an_externals.put_c_compiler_options (i_c_compiler_option)
					end
				end
				if attached l_options.multivalue ({ET_XACE_OPTION_NAMES}.header_option_name) as l_multivalue then
					across l_multivalue as i_include loop
						an_externals.put_include_directory (i_include)
					end
				end
				if attached l_options.multivalue ({ET_XACE_OPTION_NAMES}.link_option_name) as l_multivalue then
					across l_multivalue as i_link loop
						an_externals.put_link_library (i_link)
					end
				end
			end
			if attached subclusters as l_subclusters then
				l_subclusters.merge_externals (an_externals)
			end
		end

	merge_assemblies (an_assemblies: DS_LIST [ET_XACE_ASSEMBLY])
			-- Merge current cluster's assemblies and those
			-- of subclusters to `an_assemblies'.
		require
			an_assemblies_not_void: an_assemblies /= Void
			no_void_assembly: not an_assemblies.has_void
		local
			an_assembly: ET_XACE_ASSEMBLY
			l_version: STRING
			l_culture: STRING
			l_public_key_token: STRING
		do
			if attached options as l_options and then attached l_options.value ({ET_XACE_OPTION_NAMES}.assembly_option_name) as l_assembly then
				if attached l_options.value ({ET_XACE_OPTION_NAMES}.version_option_name) as l_value then
					l_version := l_value
				else
					l_version := {ET_XACE_OPTION_NAMES}.default_version_option_value
				end
				if attached l_options.value ({ET_XACE_OPTION_NAMES}.culture_option_name) as l_value then
					l_culture := l_value
				else
					l_culture := {ET_XACE_OPTION_NAMES}.neutral_option_value
				end
				if attached l_options.value ({ET_XACE_OPTION_NAMES}.public_key_token_option_name) as l_value then
					l_public_key_token := l_value
				else
					l_public_key_token := {ET_XACE_OPTION_NAMES}.default_public_key_token_option_value
				end
				create an_assembly.make (name, l_assembly, l_version, l_culture, l_public_key_token, l_options.value ({ET_XACE_OPTION_NAMES}.prefix_option_name))
				if pathname /= Void then
					an_assembly.set_assembly_pathname (full_pathname)
				end
				an_assemblies.force_last (an_assembly)
			end
			if attached subclusters as l_subclusters then
				l_subclusters.merge_assemblies (an_assemblies)
			end
		ensure
			no_void_assembly: not an_assemblies.has_void
		end

	merge_override_clusters (an_override_clusters: DS_LIST [ET_XACE_CLUSTER])
			-- Add current cluster to `an_override_clusters' if it is an
			-- override cluster. Otherwise add top level override clusters
			-- found recursively in its subclusters.
		require
			an_override_clusters_not_void: an_override_clusters /= Void
			no_void_override_cluster: not an_override_clusters.has_void
		do
			if is_override then
				an_override_clusters.force_last (Current)
			elseif attached subclusters as l_subclusters then
				l_subclusters.merge_override_clusters (an_override_clusters)
			end
		ensure
			no_void_override_cluster: not an_override_clusters.has_void
		end

	merge_ecf_clusters (an_ecf_clusters: DS_LIST [ET_XACE_CLUSTER])
			-- Add current cluster and any of its subclusters to
			-- `an_ecf_clusters' if they are the root of a library
			-- that is otherwise described by the ECF file.
		require
			an_ecf_clusters_not_void: an_ecf_clusters /= Void
			no_void_ecf_cluster: not an_ecf_clusters.has_void
		do
			if attached options as l_options and then attached l_options.value ({ET_XACE_OPTION_NAMES}.ecf_library_option_name) then
				an_ecf_clusters.force_last (Current)
			end
			if attached subclusters as l_subclusters then
				l_subclusters.merge_ecf_clusters (an_ecf_clusters)
			end
		ensure
			no_void_ecf_cluster: not an_ecf_clusters.has_void
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current
			-- New recursive cluster
		do
			create Result.make (a_name, Void, universe)
			Result.set_parent (Current)
			Result.set_options (options)
			Result.set_recursive (True)
			Result.set_implicit (True)
			Result.set_override (is_override)
			Result.set_read_only (is_read_only)
			Result.set_use_obsolete_syntax (use_obsolete_syntax)
		end

	has_case_insensitive (a_set: DS_HASH_SET [STRING]; v: STRING): BOOLEAN
			-- Does `a_set' contain `v' in a case-insensitive way?
		require
			a_set_not_void: a_set /= Void
			no_void_item: not a_set.has_void
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

	empty_prefix: STRING = ""
			-- Empty prefix

invariant

	library_prefix_not_void: library_prefix /= Void
	cluster_prefix_not_void: cluster_prefix /= Void
	no_void_class_option: attached class_options as l_class_options implies not l_class_options.has_void

end
