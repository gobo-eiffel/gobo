indexing

	description:

		"Xace mounted clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_MOUNTED_CLUSTER

creation

	make

feature {NONE} -- Initialization

	make (a_pathname: like pathname; a_clusters: like clusters) is
			-- Create a new mounted cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_not_empty: a_pathname.count > 0
			a_clusters_not_void: a_clusters /= Void
		do
			pathname := a_pathname
			clusters := a_clusters
		ensure
			pathname_set: pathname = a_pathname
			clusters_set: clusters = a_clusters
		end

feature -- Access

	pathname: STRING
			-- Name of Xace file containing
			-- the clusters to be mounted

	excluded:  DS_LINKED_LIST [STRING]
			-- Names of mounted clusters to be excluded

	clusters: ET_XACE_CLUSTERS
			-- Mounted clusters

feature -- Setting

	set_excluded (an_excluded: like excluded) is
			-- Set `excluded' to `an_excluded'.
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
		do
			excluded := an_excluded
			if excluded /= Void then
				a_cursor := excluded.new_cursor
				from a_cursor.start until a_cursor.after loop
					clusters.remove_cluster (a_cursor.item)
					a_cursor.forth
				end
			end
		ensure
			excluded_set: excluded = an_excluded
		end

feature {ET_XACE_MOUNTED_CLUSTERS} -- Basic operations

	mount (a_parent: ET_XACE_CLUSTER) is
			-- Mount clusters to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		local
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			cluster_list := clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				cluster_list.item (i).mount (a_parent)
				i := i + 1
			end
		end

	mount_root (a_universe: ET_XACE_SYSTEM) is
			-- Mount clusters at the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			cluster_list := clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				cluster_list.item (i).mount_root (a_universe)
				i := i + 1
			end
		end

	unmount is
			-- Unmount clusters.
		local
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			cluster_list := clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				cluster_list.item (i).unmount
				i := i + 1
			end
		end

	unmount_root (a_universe: ET_XACE_SYSTEM) is
			-- Unmount clusters from the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			cluster_list := clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				cluster_list.item (i).unmount_root (a_universe)
				i := i + 1
			end
		end

invariant

	pathname_not_void: pathname /= Void
	pathname_not_empty: pathname.count > 0
	clusters_not_void: clusters /= Void
	no_void_excluded: excluded /= Void implies not excluded.has (Void)

end
