indexing

	description:

		"Xace mounted cluster lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_MOUNTED_CLUSTERS

creation

	make, make_empty

feature {NONE} -- Initialization

	make (a_cluster: ET_XACE_MOUNTED_CLUSTER) is
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

	clusters: DS_ARRAYED_LIST [ET_XACE_MOUNTED_CLUSTER]
			-- Clusters

feature -- Element change

	put_last (a_cluster: ET_XACE_MOUNTED_CLUSTER) is
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

	remove (a_cluster: ET_XACE_MOUNTED_CLUSTER) is
			-- Remove `a_cluster' from the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters.delete (a_cluster)
		ensure
			removed: not clusters.has (a_cluster)
		end

feature {ET_XACE_CLUSTER} -- Mount

	mount (a_parent: ET_XACE_CLUSTER) is
			-- Mount clusters to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).mount (a_parent)
				i := i + 1
			end
		end

	unmount is
			-- Unmount clusters.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).unmount
				i := i + 1
			end
		end

feature {ET_XACE_UNIVERSE} -- Mount

	mount_root (a_universe: ET_XACE_UNIVERSE) is
			-- Mount clusters at the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).mount_root (a_universe)
				i := i + 1
			end
		end

	unmount_root (a_universe: ET_XACE_UNIVERSE) is
			-- Unmount clusters from the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).unmount_root (a_universe)
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_clusters_capacity: INTEGER is 50
			-- Initial capacity for `clusters'

invariant

	clusters_not_void: clusters /= Void
	not_void_cluster: not clusters.has (Void)

end -- class ET_XACE_MOUNTED_CLUSTERS
