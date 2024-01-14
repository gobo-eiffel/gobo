note

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"

class ET_LACE_CLUSTERS

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_CLUSTERS
		redefine
			cluster
		end

create

	make, make_empty

feature -- Access

	cluster (i: INTEGER): ET_LACE_CLUSTER
			-- `i'-th cluster
		do
			Result := clusters.item (i)
		end

feature -- Output

	print_flat_clusters (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print a flattened version of current
			-- clusters in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).print_flat_cluster (a_file)
				i := i + 1
			end
		end

end
