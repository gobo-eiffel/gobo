indexing

	description:

		"Xace mounted clusters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_MOUNTED_CLUSTER

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_pathname: like pathname) is
			-- Create a new mounted cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_not_empty: a_pathname.count > 0
		do
			pathname := a_pathname
		ensure
			pathname_set: pathname = a_pathname
		end

feature -- Status report

	is_mounted: BOOLEAN is
			-- Have clusters been mounted?
		do
			Result := (clusters /= Void)
		ensure
			clusters_not_void: Result implies (clusters /= Void)
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
		do
			excluded := an_excluded
		ensure
			excluded_set: excluded = an_excluded
		end

feature -- Basic operations

	mount (a_parent: ET_XACE_CLUSTER; a_universe: ET_XACE_UNIVERSE) is
			-- Mount clusters to `a_parent' in the
			-- context of `a_universe'.
		require
			a_parent_not_void: a_parent /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_parser: ET_XACE_CLUSTER_PARSER
			a_cluster: ET_XACE_CLUSTER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
			variables: ET_XACE_VARIABLES
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			!! a_parser.make (a_universe.error_handler)
			a_filename := pathname
			variables := a_universe.variables
			if variables /= Void then
				a_filename := variables.expanded_variables (a_filename)
			end
			a_filename := Execution_environment.interpreted_string (a_filename)
			a_file := INPUT_STREAM_.make_file_open_read (a_filename)
			!! clusters.make_empty
			if INPUT_STREAM_.is_open_read (a_file) then
				a_parser.parse_file (a_file)
				INPUT_STREAM_.close (a_file)
				a_cluster := a_parser.last_cluster
				if a_cluster /= Void then
					clusters.put_last (a_cluster)
					cluster_list := clusters.clusters
					nb := cluster_list.count
					from i := 1 until i > nb loop
						cluster_list.item (i).mount (a_parent, a_universe)
						i := i + 1
					end
					if excluded /= Void then
						a_cursor := excluded.new_cursor
						from a_cursor.start until a_cursor.after loop
							clusters.remove_cluster (a_cursor.item)
							a_cursor.forth
						end
					end
				end
			else
				a_universe.error_handler.report_cannot_read_file_error (pathname)
			end
		ensure
			clusters_mounted: is_mounted
		end

	mount_root (a_universe: ET_XACE_UNIVERSE) is
			-- Mount clusters at the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_parser: ET_XACE_CLUSTER_PARSER
			a_cluster: ET_XACE_CLUSTER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
			variables: ET_XACE_VARIABLES
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			!! a_parser.make (a_universe.error_handler)
			a_filename := pathname
			variables := a_universe.variables
			if variables /= Void then
				a_filename := variables.expanded_variables (a_filename)
			end
			a_filename := Execution_environment.interpreted_string (a_filename)
			a_file := INPUT_STREAM_.make_file_open_read (a_filename)
			!! clusters.make_empty
			if INPUT_STREAM_.is_open_read (a_file) then
				a_parser.parse_file (a_file)
				INPUT_STREAM_.close (a_file)
				a_cluster := a_parser.last_cluster
				if a_cluster /= Void then
					clusters.put_last (a_cluster)
					cluster_list := clusters.clusters
					nb := cluster_list.count
					from i := 1 until i > nb loop
						cluster_list.item (i).mount_root (a_universe)
						i := i + 1
					end
					if excluded /= Void then
						a_cursor := excluded.new_cursor
						from a_cursor.start until a_cursor.after loop
							clusters.remove_cluster (a_cursor.item)
							a_cursor.forth
						end
					end
				end
			else
				a_universe.error_handler.report_cannot_read_file_error (pathname)
			end
		ensure
			clusters_mounted: is_mounted
		end

	unmount (a_universe: ET_XACE_UNIVERSE) is
			-- Unmount clusters in the context of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			i, nb: INTEGER
		do
			cluster_list := clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				cluster_list.item (i).unmount (a_universe)
				i := i + 1
			end
			clusters := Void
		ensure
			clusters_unmounted: not is_mounted
		end

	unmount_root (a_universe: ET_XACE_UNIVERSE) is
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
			clusters := Void
		ensure
			clusters_unmounted: not is_mounted
		end

invariant

	pathname_not_void: pathname /= Void
	pathname_not_empty: pathname.count > 0
	no_void_excluded: excluded /= Void implies not excluded.has (Void)

end -- class ET_XACE_MOUNTED_CLUSTER
