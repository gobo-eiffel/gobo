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

creation

	make, make_empty

feature -- Access

	cluster (i: INTEGER): ET_XACE_CLUSTER is
			-- `i'-th cluster
		do
			Result := clusters.item (i)
		end

feature -- Setting

	set_library_prefix (a_prefix: STRING) is
			-- Set the library prefix of current clusters, and
			-- recursively in the subclusters, to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_library_prefix (a_prefix)
				i := i + 1
			end
		end

feature -- Basic operations

	mount_libraries (a_clusters: ET_XACE_CLUSTERS; a_prefix: STRING) is
			-- Add current clusters to `a_clusters'. Mark these clusters as
			-- mounted and recursively set their library prefix to `a_prefix'.
		require
			a_clusters_not_void: a_clusters /= Void
			a_prefix_not_void: a_prefix /= Void
		local
			i, nb: INTEGER
			a_cluster: ET_XACE_CLUSTER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				a_cluster := clusters.item (i)
				a_cluster.set_mounted (True)
				a_cluster.set_library_prefix (a_prefix)
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
