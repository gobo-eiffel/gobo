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

	make (a_cluster: like clusters) is
			-- Create a new cluster list with initially
			-- one cluster `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters := a_cluster
		ensure
			clusters_set: clusters = a_cluster
		end

feature -- Access

	clusters: ET_CLUSTER
			-- Clusters

feature -- Element change

	put_first (a_cluster: like clusters) is
			-- Add `a_cluster' to the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			a_cluster.set_next (clusters)
			clusters := a_cluster
		ensure
			one_more: clusters.next = old clusters
			cluster_added: clusters = a_cluster
		end

feature -- Parsing

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all clusters in `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_cluster: ET_CLUSTER
		do
			from
				a_cluster := clusters
			until
				a_cluster = Void
			loop
				a_cluster.parse_all (a_universe)
				a_cluster := a_cluster.next
			end
		end

feature {ET_CLUSTER} -- Setting

	set_parent (a_parent: ET_CLUSTER) is
			-- Set parent of all clusters to `a_parent'.
		local
			a_cluster: ET_CLUSTER
		do
			from
				a_cluster := clusters
			until
				a_cluster = Void
			loop
				a_cluster.set_parent (a_parent)
				a_cluster := a_cluster.next
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
			a_cluster: ET_CLUSTER
		do
			from
				a_cluster := clusters
			until
				a_cluster = Void
			loop
				a_cluster.print_flat_cluster (a_file)
				a_cluster := a_cluster.next
			end
		end

invariant

	clusters_not_void: clusters /= Void

end -- class ET_CLUSTERS
