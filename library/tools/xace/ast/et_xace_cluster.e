indexing

	description:

		"Eiffel clusters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_CLUSTER

inherit

	ET_CLUSTER

	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
			pathname := a_pathname
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
		end

feature -- Status report

	is_abstract: BOOLEAN
			-- Is there no classes in current cluster?
			-- (i.e. 'abstract' keyword in HACT's LACE.)

feature -- Access

	name: STRING
			-- Name

	pathname: STRING
			-- Directory pathname (May be Void)

	full_name (a_separator: CHARACTER): STRING is
			-- Full name (use `a_separator' as separator
			-- between parents' names)
		local
			parent_name: STRING
			a_basename: STRING
		do
			if parent /= Void then
				parent_name := parent.full_name (a_separator)
				a_basename := name
				Result := STRING_.make (parent_name.count + a_basename.count + 1)
				Result.append_string (parent_name)
				Result.append_character (a_separator)
				Result.append_string (a_basename)
			else
				Result := name
			end
		ensure
			full_name_not_void: Result /= Void
			full_name_not_empty: Result.count > 0
		end

	full_pathname: STRING is
			-- Full directory pathname
		local
			parent_pathname: STRING
			a_basename: STRING
		do
			if pathname /= Void and then pathname.count > 0 then
				Result := pathname
			elseif parent /= Void then
				parent_pathname := parent.full_pathname
				a_basename := name
				Result := STRING_.make (parent_pathname.count + a_basename.count + 1)
				Result.append_string (parent_pathname)
				Result.append_character ('/')
				Result.append_string (a_basename)
			else
				Result := name
			end
		ensure
			full_pathname_not_void: Result /= Void
			full_pathname_not_empty: Result.count > 0
		end

feature -- Nested

	parent: ET_XACE_CLUSTER
			-- Parent cluster

	subclusters: ET_XACE_CLUSTERS
			-- Subclusters

	mounted_parent: ET_XACE_CLUSTER
			-- Mounted parent cluster
			-- (Void if current cluster has not been mounted)

	mounted_subclusters: ET_XACE_MOUNTED_CLUSTERS
			-- Mounted subclusters

feature -- Options

	options: ET_XACE_OPTIONS
			-- Options

	externals: ET_XACE_EXTERNALS
			-- External clause

feature -- Status setting

	set_abstract (b: BOOLEAN) is
			-- Set `is_abstract' to `b'.
		do
			is_abstract := b
		ensure
			abstract_set: is_abstract = b
		end

feature -- Setting

	set_options (an_options: like options) is
			-- Set `options' to `an_options'.
		do
			options := an_options
		ensure
			options_set: options = an_options
		end

	set_externals (an_externals: like externals) is
			-- Set `externals' to `an_externals'.
		do
			externals := an_externals
		ensure
			externals_set: externals = an_externals
		end

	set_subclusters (a_subclusters: like subclusters) is
			-- Set `subclusters' to `a_subclusters'.
		do
			if subclusters /= Void then
				subclusters.set_parent (Void)
			end
			subclusters := a_subclusters
			if subclusters /= Void then
				subclusters.set_parent (Current)
			end
		ensure
			subclusters_set: subclusters = a_subclusters
		end

	set_mounted_subclusters (a_subclusters: like mounted_subclusters) is
			-- Set `mounted_subclusters' to `a_subclusters'.
		do
			mounted_subclusters := a_subclusters
		ensure
			mounted_subclusters_set: mounted_subclusters = a_subclusters
		end

feature {ET_XACE_CLUSTER, ET_XACE_CLUSTERS} -- Setting

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Mount

	mount (a_parent: like mounted_parent; a_universe: ET_XACE_UNIVERSE) is
			-- Mount current cluster to `a_parent' in the
			-- context of `a_universe'.
		require
			a_parent_not_void: a_parent /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_subclusters: like subclusters
		do
			mounted_parent := a_parent
			a_subclusters := a_parent.subclusters
			if a_subclusters = Void then
				!! a_subclusters.make_empty
				a_parent.set_subclusters (a_subclusters)
			end
			a_subclusters.put_last (Current)
			if subclusters /= Void then
				subclusters.mount (a_universe)
			end
			if mounted_subclusters /= Void then
				mounted_subclusters.mount (Current, a_universe)
			end
		end

	mount_root (a_universe: ET_XACE_UNIVERSE) is
			-- Mount current cluster at the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_clusters: like subclusters
		do
			mounted_parent := Void
			a_clusters := a_universe.clusters
			if a_clusters = Void then
				!! a_clusters.make (Current)
				a_universe.set_clusters (a_clusters)
			else
				a_clusters.put_last (Current)
			end
			if subclusters /= Void then
				subclusters.mount (a_universe)
			end
			if mounted_subclusters /= Void then
				mounted_subclusters.mount (Current, a_universe)
			end
		end

	unmount (a_universe: ET_XACE_UNIVERSE) is
			-- Unmount current cluster in the
			-- context of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_subclusters: like subclusters
		do
			if mounted_subclusters /= Void then
				mounted_subclusters.unmount (a_universe)
			end
			if subclusters /= Void then
				subclusters.unmount (a_universe)
			end
			if mounted_parent /= Void then
				a_subclusters := mounted_parent.subclusters
				if a_subclusters /= Void then
					a_subclusters.remove (Current)
					if a_subclusters.clusters.is_empty then
						mounted_parent.set_subclusters (Void)
					end
				end
				mounted_parent := Void
			end
		end

	unmount_root (a_universe: ET_XACE_UNIVERSE) is
			-- Unmount current cluster from the root of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_clusters: like subclusters
		do
			if mounted_subclusters /= Void then
				mounted_subclusters.unmount (a_universe)
			end
			if subclusters /= Void then
				subclusters.unmount (a_universe)
			end
			a_clusters := a_universe.clusters
			if a_clusters /= Void then
				a_clusters.remove (Current)
				if a_clusters.clusters.is_empty then
					a_universe.set_clusters (Void)
				end
			end
			mounted_parent := Void
		end

feature -- Removal

	remove_cluster (a_cluster_name: STRING) is
			-- Remove cluster `a_cluster_name' from `subclusters'.
			-- `a_cluster_name' is the dot-separated full name
			-- of the cluster.
		require
			a_cluster_name_not_void: a_cluster_name /= Void
		do
			if subclusters /= Void then
				subclusters.remove_cluster (a_cluster_name)
			end
		end

feature -- Basic operations

	merge_externals (an_externals: like externals) is
			-- Merge current cluster's externals to `an_externals'.
		require
			an_externals_not_void: an_externals /= Void
		do
			if externals /= Void then
				an_externals.merge (externals)
			end
			if subclusters /= Void then
				subclusters.merge_externals (an_externals)
			end
		end

feature -- Parsing

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all classes in cluster.
		local
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			if not is_abstract then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				!! dir.make (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if has_eiffel_extension (s) then
							a_filename := clone (dir_name)
							a_filename.append_character ('/')
							a_filename.append_string (s)
							a_file := INPUT_STREAM_.make_file_open_read (a_filename)
							if INPUT_STREAM_.is_open_read (a_file) then
								a_universe.parse_file (a_file, a_filename, Current)
								INPUT_STREAM_.close (a_file)
							else
							end
						end
						dir.read_entry
					end
					dir.close
				else
				end
			end
			if subclusters /= Void then
				subclusters.parse_all (a_universe)
			end
		end

feature {NONE} -- Implementation

	has_eiffel_extension (a_filename: STRING): BOOLEAN is
			-- Has `a_filename' an Eiffel extension (.e)?
		require
			a_filename_not_void: a_filename /= Void
		local
			nb: INTEGER
		do
			nb := a_filename.count
			Result := nb > 2 and then
				(a_filename.item (nb) = 'e' and
				a_filename.item (nb - 1) = '.')
		end

invariant

	name_not_void: name /= Void
	name_not_empty: name.count > 0

end -- class ET_XACE_CLUSTER
