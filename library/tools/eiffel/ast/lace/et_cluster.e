indexing

	description:

		"Eiffel clusters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_CLUSTER

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	is_abstract: BOOLEAN
			-- Is there no classes in current cluster?
			-- (i.e. 'abstract' keyword in HACT's LACE.)

	is_recursive: BOOLEAN
			-- Is current cluster recursive, in other words
			-- should subdirectories be considered as subclusters?
			-- (i.e. 'all' keyword in ISE's LACE.)

feature -- Access

	name: STRING is
			-- Name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	pathname: STRING is
			-- Directory pathname (May be Void)
		deferred
		end

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
			a_pathname: STRING
			parent_pathname: STRING
			a_basename: STRING
		do
			a_pathname := pathname
			if a_pathname /= Void and then a_pathname.count > 0 then
				Result := a_pathname
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

	classes (a_universe: ET_UNIVERSE): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes of `a_universe' which are in current cluster
		require
			a_universe_not_void: a_universe /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_IDENTIFIER]
			a_class: ET_CLASS
		do
			!! Result.make (Initial_classes_capacity)
			a_cursor := a_universe.classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.cluster = Current then
					Result.force_last (a_class)
				end
				a_cursor.forth
			end
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has (Void)
		end

feature -- Nested

	parent: ET_CLUSTER
			-- Parent cluster

	subclusters: ET_CLUSTERS
			-- Subclusters

feature -- Status setting

	set_abstract (b: BOOLEAN) is
			-- Set `is_abstract' to `b'.
		do
			is_abstract := b
		ensure
			abstract_set: is_abstract = b
		end

	set_recursive (b: BOOLEAN) is
			-- Set `is_recursive' to `b'.
		do
			is_recursive := b
		ensure
			recursive_set: is_recursive = b
		end

feature -- Setting

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

feature {ET_CLUSTER, ET_CLUSTERS} -- Setting

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Parsing

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all classes in cluster.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			a_cluster: ET_CLUSTER
		do
			if not is_abstract then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				!! dir.make (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if is_valid_eiffel_filename (s) then
							a_filename := clone (dir_name)
							a_filename.append_character ('/')
							a_filename.append_string (s)
							!! a_file.make (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								a_universe.parse_file (a_file, a_filename, Current)
								a_file.close
							else
								-- TODO.
							end
						elseif is_recursive and then is_valid_directory_name (s) then
							a_cluster := new_recursive_cluster (s)
							a_cluster.parse_all (a_universe)
						end
						dir.read_entry
					end
					dir.close
				else
					-- TODO.
				end
			end
			if subclusters /= Void then
				subclusters.parse_all (a_universe)
			end
		end

	parse_class (a_class: ET_CLASS; a_filename: STRING) is
			-- Try to parse `a_class' in `a_filename' in current
			-- cluster, or recursively in subclusters until the
			-- class is found.
		require
			a_class_not_void: a_class /= Void
			a_class_not_parsed: not a_class.is_parsed
			a_filename_not_void: a_filename /= Void
		local
			a_full_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			a_cluster: ET_CLUSTER
		do
			if not is_abstract then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				if is_valid_eiffel_filename (a_filename) then
					a_full_filename := clone (dir_name)
					a_full_filename.append_character ('/')
					a_full_filename.append_string (a_filename)
					!! a_file.make (a_full_filename)
					a_file.open_read
					if a_file.is_open_read then
						a_class.universe.parse_file (a_file, a_full_filename, Current)
						a_file.close
					end
				end
				if not a_class.is_parsed and is_recursive then
					!! dir.make (dir_name)
					dir.open_read
					if dir.is_open_read then
						from
							dir.read_entry
						until
							a_class.is_parsed or
							dir.end_of_input
						loop
							s := dir.last_entry
							if is_valid_directory_name (s) then
								a_cluster := new_recursive_cluster (s)
								a_cluster.parse_class (a_class, a_filename)
							end
							dir.read_entry
						end
						dir.close
					else
						-- TODO.
					end
				end
			end
			if not a_class.is_parsed and subclusters /= Void then
				subclusters.parse_class (a_class, a_filename)
			end
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current is
			-- New recursive cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		deferred
		ensure
			cluster_not_void: Result /= Void
			name_set: Result.name = a_name
			parent_set: Result.parent = Current
			recursive: Result.is_recursive
		end

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

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN is
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		require
			a_filename_not_void: a_filename /= Void
		do
			Result := has_eiffel_extension (a_filename)
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN is
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		require
			a_dirname_not_void: a_dirname /= Void
		do
			Result := a_dirname.count > 0 and
				not a_dirname.is_equal (dot_directory_name) and
				not a_dirname.is_equal (dot_dot_directory_name)
		end

feature {NONE} -- Constants

	Initial_classes_capacity: INTEGER is 20
			-- Initial capacity for `classes'

	dot_directory_name: STRING is "."
	dot_dot_directory_name: STRING is ".."
			-- Directory names

end -- class ET_CLUSTER
