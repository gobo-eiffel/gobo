indexing

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_CLUSTERS

inherit

	ET_CLUSTERS
		redefine
			cluster
		end

	UT_STRING_ROUTINES
		export {NONE} all end

creation

	make, make_empty

feature -- Access

	cluster (i: INTEGER): ET_XACE_CLUSTER is
			-- `i'-th cluster
		do
			Result := clusters.item (i)
		end

feature -- Setting

	set_name_prefix (a_prefix: STRING) is
			-- Set the name prefix of current clusters, and
			-- recursively of their subclusters, to `a_prefix'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_name_prefix (a_prefix)
				i := i + 1
			end
		end

feature -- Removal

	remove_cluster (a_cluster_name: STRING) is
			-- Remove cluster `a_cluster_name' from clusters.
			-- `a_cluster_name' is the dot-separated full name
			-- of the cluster.
		require
			a_cluster_name_not_void: a_cluster_name /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [like cluster]
			a_cluster: like cluster
			a_pair: DS_PAIR [STRING, STRING]
			a_name, a_subname: STRING
		do
			a_pair := split_on_first (a_cluster_name, '.')
			a_name := a_pair.first
			a_subname := a_pair.second
			a_cursor := clusters.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cluster := a_cursor.item
				if a_cluster.name.is_equal (a_name) then
					if a_subname /= Void then
						a_cluster.remove_cluster (a_subname)
						a_cursor.forth
					else
						a_cursor.remove
					end
				else
					a_cursor.forth
				end
			end
		end

feature -- Basic operations

	mount_libraries (a_clusters: ET_XACE_CLUSTERS; a_prefix: STRING) is
			-- Add current clusters to `a_clusters'. Mark these clusters
			-- as mounted and recursively set their name prefix to `a_prefix'.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			i, nb: INTEGER
			a_cluster: ET_XACE_CLUSTER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				a_cluster := clusters.item (i)
				a_cluster.set_mounted (True)
				a_cluster.set_name_prefix (a_prefix)
				a_clusters.put_last (a_cluster)
				i := i + 1
			end
		end

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER) is
			-- Add recursively the libraries of current clusters to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_libraries (a_libraries, an_error_handler)
				i := i + 1
			end
		end

	merge_externals (an_externals: ET_XACE_EXTERNALS) is
			-- Merge clusters' externals to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_externals (an_externals)
				i := i + 1
			end
		end

end
