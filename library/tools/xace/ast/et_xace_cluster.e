indexing

	description:

		"Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_CLUSTER

inherit

	ET_CLUSTER
		redefine
			prefixed_name,
			parent, subclusters
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
			pathname := a_pathname
			is_relative := (a_pathname = Void)
			library_prefix := empty_prefix
			cluster_prefix := empty_prefix
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			prefixed_name_set: prefixed_name = a_name
			is_relative: is_relative = (a_pathname = Void)
			no_library_prefix: library_prefix.count = 0
			no_cluster_prefix: cluster_prefix.count = 0
		end

feature -- Access

	name: STRING
			-- Name

	prefixed_name: STRING is
			-- Cluster name with possible prefixes
		do
			if library_prefix.count > 0 then
				if cluster_prefix.count > 0 then
					Result := STRING_.make (library_prefix.count + cluster_prefix.count + name.count)
					Result.append_string (library_prefix)
					Result.append_string (cluster_prefix)
					Result.append_string (name)
				else
					Result := STRING_.make (library_prefix.count + name.count)
					Result.append_string (library_prefix)
					Result.append_string (name)
				end
			else
				if cluster_prefix.count > 0 then
					Result := STRING_.make (cluster_prefix.count + name.count)
					Result.append_string (cluster_prefix)
					Result.append_string (name)
				else
					Result := name
				end
			end
		ensure then
			definition: Result.is_equal (library_prefix + cluster_prefix + name)
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

	externals: ET_XACE_EXTERNALS
			-- External clause

feature -- Status report

	is_mounted: BOOLEAN
			-- Has cluster been mounted?

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

	set_externals (an_externals: like externals) is
			-- Set `externals' to `an_externals'.
		do
			externals := an_externals
		ensure
			externals_set: externals = an_externals
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

feature -- Status setting

	set_mounted (b: BOOLEAN) is
			-- Set `is_mounted' to `b'.
		do
			is_mounted := b
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

	merge_externals (an_externals: like externals) is
			-- Merge current cluster's externals to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		do
			if externals /= Void then
				an_externals.merge (externals)
			end
			if subclusters /= Void then
				subclusters.merge_externals (an_externals)
			end
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current is
			-- New recursive cluster
		do
			!! Result.make (a_name, Void)
			Result.set_parent (Current)
			Result.set_recursive (True)
		end

feature {NONE} -- Constants

	empty_prefix: STRING is ""
			-- Empty prefix

invariant

	library_prefix_not_void: library_prefix /= Void
	cluster_prefix_not_void: cluster_prefix /= Void

end
