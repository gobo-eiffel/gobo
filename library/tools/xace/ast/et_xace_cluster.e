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
			prefixed_name := a_name
			pathname := a_pathname
			is_relative := (a_pathname = Void)
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			prefixed_name_set: prefixed_name = a_name
			is_relative: is_relative = (a_pathname = Void)
		end

feature -- Access

	name: STRING
			-- Name

	prefixed_name: STRING
			-- Prefixed cluster name

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

	mounted_parent: ET_XACE_CLUSTER
			-- Mounted parent cluster
			-- (Void if current cluster has not been mounted)

	mounted_subclusters: ET_XACE_MOUNTED_CLUSTERS
			-- Mounted subclusters

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

	set_mounted_subclusters (a_subclusters: like mounted_subclusters) is
			-- Set `mounted_subclusters' to `a_subclusters'.
		do
			if mounted_subclusters /= Void then
				mounted_subclusters.unmount
			end
			mounted_subclusters := a_subclusters
			if mounted_subclusters /= Void then
				mounted_subclusters.mount (Current)
			end
		ensure
			mounted_subclusters_set: mounted_subclusters = a_subclusters
		end

	set_name_prefix (a_prefix: STRING) is
			-- Prepend `a_prefix' to cluster name, and recursively
			-- to the name of the subclusters.
		do
			if a_prefix = Void then
				prefixed_name := name
			else
				prefixed_name := STRING_.make (a_prefix.count + name.count)
				prefixed_name.append_string (a_prefix)
				prefixed_name.append_string (name)
			end
			if subclusters /= Void then
				subclusters.set_name_prefix (a_prefix)
			end
		ensure
			prefixed_name_set: a_prefix /= Void implies prefixed_name.is_equal (a_prefix + name)
			non_prefixed_name_set: a_prefix = Void implies prefixed_name = name
		end

feature -- Status setting

	set_mounted (b: BOOLEAN) is
			-- Set `is_mounted' to `b'.
		do
			is_mounted := b
		ensure
			mounted_set: is_mounted = b
		end

feature {ET_XACE_MOUNTED_CLUSTER} -- Mount

	mount (a_parent: like mounted_parent) is
			-- Mount current cluster to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_subclusters: like subclusters
		do
			mounted_parent := a_parent
			is_mounted := True
			a_subclusters := a_parent.subclusters
			if a_subclusters = Void then
				!! a_subclusters.make_empty
				a_parent.set_subclusters (a_subclusters)
			end
			a_subclusters.put_last (Current)
		ensure
			mounted: is_mounted
			mounted_parent_set: mounted_parent = a_parent
		end

	mount_root (a_universe: ET_XACE_SYSTEM) is
			-- Mount current cluster at the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_clusters: like subclusters
		do
			mounted_parent := Void
			is_mounted := True
			a_clusters := a_universe.clusters
			if a_clusters = Void then
				!! a_clusters.make (Current)
				a_universe.set_clusters (a_clusters)
			else
				a_clusters.put_last (Current)
			end
		ensure
			mounted: is_mounted
			mounted_parent_set: mounted_parent = Void
		end

	unmount is
			-- Unmount current cluster.
		local
			a_subclusters: like subclusters
		do
			if mounted_parent /= Void then
				a_subclusters := mounted_parent.subclusters
				if a_subclusters /= Void then
					a_subclusters.remove (Current)
					if a_subclusters.clusters.is_empty then
						mounted_parent.set_subclusters (Void)
					end
				end
				mounted_parent := Void
			end
			is_mounted := False
		ensure
			unmounted: not is_mounted
			mounted_parent_unset: mounted_parent = Void
		end

	unmount_root (a_universe: ET_XACE_SYSTEM) is
			-- Unmount current cluster from the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_clusters: like subclusters
		do
			a_clusters := a_universe.clusters
			if a_clusters /= Void then
				a_clusters.remove (Current)
				if a_clusters.clusters.is_empty then
					a_universe.set_clusters (Void)
				end
			end
			mounted_parent := Void
			is_mounted := False
		ensure
			unmounted: not is_mounted
			mounted_parent_unset: mounted_parent = Void
		end

feature -- Removal

	remove_cluster (a_cluster_name: STRING) is
			-- Remove cluster `a_cluster_name' from `subclusters'.
			-- `a_cluster_name' is the dot-separated full name
			-- of the cluster.
		require
			a_cluster_name_not_void: a_cluster_name /= Void
		do
			if subclusters /= Void then
				subclusters.remove_cluster (a_cluster_name)
			end
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

invariant

	prefixed_name_not_void: prefixed_name /= Void
	prefixed_name_not_empty: prefixed_name.count > 0

end
