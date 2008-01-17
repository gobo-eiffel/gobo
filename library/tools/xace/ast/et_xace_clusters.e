indexing

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_CLUSTERS

inherit

	ET_CLUSTERS
		redefine
			cluster
		end

create

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

	set_mounted (b: BOOLEAN) is
			-- Set `is_mounted' in current clusters, and
			-- recursively in the subclusters, to `b'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_mounted (b)
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
			-- Merge clusters' externals and those
			-- of subclusters to `an_externals'.
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

	merge_exported_features (an_export: DS_LIST [ET_XACE_EXPORTED_FEATURE]) is
			-- Merge current clusters' exported features and those
			-- of subclusters to `an_export'.
		require
			an_export_not_void: an_export /= Void
			no_void_export: not an_export.has (Void)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_exported_features (an_export)
				i := i + 1
			end
		ensure
			no_void_export: not an_export.has (Void)
		end

	merge_components (a_components: DS_LIST [ET_XACE_COMPONENT]) is
			-- Merge current clusters' components and those
			-- of subclusters to `a_components'.
		require
			a_components_not_void: a_components /= Void
			no_void_component: not a_components.has (Void)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_components (a_components)
				i := i + 1
			end
		ensure
			no_void_component: not a_components.has (Void)
		end

	merge_assemblies (an_assemblies: DS_LIST [ET_XACE_ASSEMBLY]) is
			-- Merge current clusters' assemblies and those
			-- of subclusters to `an_assemblies'.
		require
			an_assemblies_not_void: an_assemblies /= Void
			no_void_assembly: not an_assemblies.has (Void)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_assemblies (an_assemblies)
				i := i + 1
			end
		ensure
			no_void_assembly: not an_assemblies.has (Void)
		end

	merge_override_clusters (an_override_clusters: DS_LIST [ET_XACE_CLUSTER]) is
			-- Add current clusters and any of their subclusters to
			-- `an_override_clusters' if they are top level override clusters.
		require
			an_override_clusters_not_void: an_override_clusters /= Void
			no_void_override_cluster: not an_override_clusters.has (Void)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_override_clusters (an_override_clusters)
				i := i + 1
			end
		ensure
			no_void_override_cluster: not an_override_clusters.has (Void)
		end

	merge_ecf_clusters (an_ecf_clusters: DS_LIST [ET_XACE_CLUSTER]) is
			-- Add current clusters and any of their subclusters to
			-- `an_ecf_clusters' if they are the root of a library
			-- that is otherwise described by the ECF file.
		require
			an_ecf_clusters_not_void: an_ecf_clusters /= Void
			no_void_ecf_cluster: not an_ecf_clusters.has (Void)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).merge_ecf_clusters (an_ecf_clusters)
				i := i + 1
			end
		ensure
			no_void_ecf_cluster: not an_ecf_clusters.has (Void)
		end

end
