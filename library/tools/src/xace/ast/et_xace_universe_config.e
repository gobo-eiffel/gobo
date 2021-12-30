note

	description:

		"Xace universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_XACE_UNIVERSE_CONFIG

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

feature {NONE} -- Initialization

	make (a_target: ET_XACE_TARGET)
			-- Create a new Xace universe.
		require
			a_target_not_void: a_target /= Void
		do
			create targets.make (a_target)
			name := a_target.name
			selected_target := a_target
			create options.make
			create clusters.make_empty
			create libraries.make_empty
		end

feature -- Access

	name: STRING
			-- Name of universe

	options: ET_XACE_OPTIONS
			-- Options

	clusters: ET_XACE_CLUSTERS
			-- Clusters.
			-- Contains the clusters declared in selected target and its parents,
			-- and those declared in `libraries' after `mount_libraries' has been
			-- called (marked as 'is_mounted' in class ET_XACE_CLUSTER).

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries.
			-- Contains the mounted libraries declared in selected target
			-- and its parents (the first 'root_count' items) and (recursively)
			-- the mounted libraries they depend on.

	targets: ET_XACE_TARGETS
			-- Targets that appear in the Xace file

	selected_target: ET_XACE_TARGET
			-- Selected target

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_options (a_options: like options)
			-- Set `options' to `a_options'.
		require
			a_options_not_void: a_options /= Void
		do
			options := a_options
		ensure
			options_set: options = a_options
		end

	set_clusters (a_clusters: like clusters)
			-- Set `clusters' to `a_clusters'.
		require
			a_clusters_not_void: a_clusters /= Void
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries)
			-- Set `libraries' to `a_libraries'.
		require
			a_libraries_not_void: a_libraries /= Void
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

feature -- Basic operations

	select_target (a_target: ET_XACE_TARGET; a_error_handler: ET_XACE_ERROR_HANDLER)
			-- Select `a_target'.
			-- Set `options', `clusters' and `libraries' accordingly.
		require
			a_target_not_void: a_target /= Void
			valid_target: targets.has (a_target)
			a_error_handler_not_void: a_error_handler /= Void
		local
			i, nb: INTEGER
			l_library_list: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
		do
			selected_target := a_target
			options := a_target.options
			a_target.merge_libraries (libraries, a_error_handler)
			libraries.set_root_count (libraries.count)
			l_library_list := libraries.libraries
			nb := l_library_list.count
			from i := 1 until i > nb loop
				l_library_list.item (i).library.merge_libraries (libraries, a_error_handler)
				i := i + 1
			end
			a_target.clusters.do_all (agent clusters.put_last)
		ensure
			target_selected: selected_target = a_target
		end

	mount_libraries
			-- Add clusters of `libraries' to `clusters'.
			-- Mark these clusters as mounted.
		do
			libraries.mount_libraries (clusters)
		end

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; a_error_handler: ET_XACE_ERROR_HANDLER)
			-- Add `libraries' to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `a_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			a_error_handler_not_void: a_error_handler /= Void
		do
			libraries.merge_libraries (a_libraries, a_error_handler)
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS)
			-- Merge current universe's externals, and those of
			-- all clusters and subclusters, to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		do
			if attached options.multivalue ({ET_XACE_OPTION_NAMES}.c_compiler_options_option_name) as l_multivalue then
				across l_multivalue as i_c_compiler_option loop
					an_externals.put_c_compiler_options (i_c_compiler_option)
				end
			end
			if attached options.multivalue ({ET_XACE_OPTION_NAMES}.header_option_name) as l_multivalue then
				across l_multivalue as i_include loop
					an_externals.put_include_directory (i_include)
				end
			end
			if attached options.multivalue ({ET_XACE_OPTION_NAMES}.link_option_name) as l_multivalue then
				across l_multivalue as i_link loop
					an_externals.put_link_library (i_link)
				end
			end
			clusters.merge_externals (an_externals)
			libraries.merge_externals (an_externals)
		end

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	targets_not_void: targets /= Void
	targets_not_empty: not targets.is_empty
	options_not_void: options /= Void
	clusters_not_void: clusters /= Void
	libraries_not_void: libraries /= Void

end
