indexing

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTERS

creation

	make, make_empty

feature {NONE} -- Initialization

	make (a_cluster: like cluster) is
			-- Create a new cluster list with initially
			-- one cluster `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			!! clusters.make (Initial_clusters_capacity)
			clusters.put_last (a_cluster)
		ensure
			one_cluster: clusters.count = 1
			clusters_set: clusters.last = a_cluster
		end

	make_empty is
			-- Create a new empty cluster list.
		do
			!! clusters.make (Initial_clusters_capacity)
		ensure
			is_empty: clusters.is_empty
		end

feature -- Access

	cluster (i: INTEGER): ET_CLUSTER is
			-- `i'-th cluster
		require
			i_large_enough: i >= 1
			i_small_enough: i <= clusters.count
		do
			Result := clusters.item (i)
		ensure
			cluster_not_void: Result /= Void
		end

	clusters: DS_ARRAYED_LIST [like cluster]
			-- Clusters

feature {ET_CLUSTER} -- Setting

	set_parent (a_parent: like cluster) is
			-- Set parent of all clusters to `a_parent'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_parent (a_parent)
				i := i + 1
			end
		end

feature -- Element change

	put_last (a_cluster: like cluster) is
			-- Add `a_cluster' to the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters.force_last (a_cluster)
		ensure
			one_more: clusters.count = old clusters.count + 1
			cluster_added: clusters.last = a_cluster
		end

feature -- Removal

	remove (a_cluster: like cluster) is
			-- Remove `a_cluster' from the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters.delete (a_cluster)
		ensure
			removed: not clusters.has (a_cluster)
		end

feature -- Parsing

	preparse_shallow (a_universe: ET_UNIVERSE) is
			-- Traverse current clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `a_universe.classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		require
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).preparse_shallow (a_universe)
				i := i + 1
			end
		end

	preparse_single (a_universe: ET_UNIVERSE) is
			-- Traverse current clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `a_universe.classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly
			-- one class.
		require
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).preparse_single (a_universe)
				i := i + 1
			end
		end

	preparse_multiple (a_universe: ET_UNIVERSE) is
			-- Traverse current clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `a_universe.classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		require
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).preparse_multiple (a_universe)
				i := i + 1
			end
		end

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all classes in current clusters.
		require
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).parse_all (a_universe)
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_clusters_capacity: INTEGER is 50
			-- Initial capacity for `clusters'

invariant

	clusters_not_void: clusters /= Void
	not_void_cluster: not clusters.has (Void)

end
