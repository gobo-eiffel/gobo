indexing

	description:

		"Eiffel cluster lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLUSTERS

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_cluster: ET_CLUSTER) is
			-- Create a new cluster list with initially
			-- one cluster `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			!! clusters.make (Initial_clusters_capacity)
			clusters.put_last (a_cluster)
		ensure
			clusters_set: clusters.last = a_cluster
		end

feature -- Access

	clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			-- Clusters

feature -- Element change

	put_last (a_cluster: ET_CLUSTER) is
			-- Add `a_cluster' to the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters.force_last (a_cluster)
		ensure
			one_more: clusters.count = old clusters.count + 1
			cluster_added: clusters.last = a_cluster
		end

feature -- Parsing

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all clusters in `a_universe'.
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

feature {ET_CLUSTER} -- Setting

	set_parent (a_parent: ET_CLUSTER) is
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

feature -- Output

	print_flat_clusters (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print a flattened version of current
			-- clusters in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).print_flat_cluster (a_file)
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_clusters_capacity: INTEGER is 50
			-- Initial capacity for `clusters'

invariant

	clusters_not_void: clusters /= Void
	not_void_cluster: not clusters.has (Void)
	clusters_not_empty: not clusters.is_empty

end -- class ET_CLUSTERS
