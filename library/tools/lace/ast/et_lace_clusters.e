indexing

	description:

		"Eiffel cluster lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LACE_CLUSTERS

inherit

	ET_CLUSTERS
		redefine
			cluster
		end

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	make, make_empty

feature -- Access

	cluster (i: INTEGER): ET_LACE_CLUSTER is
			-- `i'-th cluster
		do
			Result := clusters.item (i)
		end

feature {ET_LACE_CLUSTER} -- Setting

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

end -- class ET_LACE_CLUSTERS
