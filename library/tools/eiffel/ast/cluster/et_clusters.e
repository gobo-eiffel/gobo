indexing

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			create clusters.make (Initial_clusters_capacity)
			clusters.put_last (a_cluster)
		ensure
			one_cluster: clusters.count = 1
			clusters_set: clusters.last = a_cluster
		end

	make_empty is
			-- Create a new empty cluster list.
		do
			create clusters.make (Initial_clusters_capacity)
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

feature -- Measurement

	count: INTEGER is
			-- Number (recursively) of non-abstract clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).count
				i := i + 1
			end
		ensure
			count_non_negative: Result >= 0
		end

	override_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only override clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).override_count
				i := i + 1
			end
		ensure
			override_count_non_negative: Result >= 0
		end

	read_write_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).read_write_count
				i := i + 1
			end
		ensure
			read_write_count_non_negative: Result >= 0
		end

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

feature {NONE} -- Constants

	Initial_clusters_capacity: INTEGER is 50
			-- Initial capacity for `clusters'

invariant

	clusters_not_void: clusters /= Void
	not_void_cluster: not clusters.has (Void)

end
