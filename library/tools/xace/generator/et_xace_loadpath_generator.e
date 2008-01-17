indexing

	description:

		"Loadpath file generators from Xace files"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_LOADPATH_GENERATOR

inherit

	ET_XACE_GENERATOR

create

	make

feature -- Access

	default_system_output_filename: STRING is "loadpath.se"
			-- Name of generated loadpath file

	default_library_output_filename: STRING is "loadpath.se"
			-- Name of generated loadpath file

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new loadpath file from `a_system'.
		local
			a_clusters: ET_XACE_CLUSTERS
		do
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
			end
		end

	generate_library (a_library: ET_XACE_LIBRARY; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new loadpath file from `a_library'.
		local
			a_clusters: ET_XACE_CLUSTERS
		do
			a_clusters := a_library.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
			end
		end

feature {NONE} -- Output

	print_clusters (a_clusters: ET_XACE_CLUSTERS; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_clusters' to loadpath `a_file'.
		require
			a_clusters_not_void: a_clusters /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			a_cluster: ET_XACE_CLUSTER
		do
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				a_cluster := cluster_list.item (i)
				if not a_cluster.is_implicit then
						-- This cluster has been explicitly declared.
					print_cluster (a_cluster, a_file)
				end
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_cluster' to loadpath `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			subclusters: ET_XACE_CLUSTERS
		do
			if not a_cluster.is_abstract then
				a_file.put_line (a_cluster.full_pathname)
			end
			subclusters := a_cluster.subclusters
			if subclusters /= Void then
				print_clusters (subclusters, a_file)
			end
		end

end
