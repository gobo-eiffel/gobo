indexing

	description:

		"Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLUSTER

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES
	KL_SHARED_OPERATING_SYSTEM
	KL_SHARED_FILE_SYSTEM
	KL_IMPORTED_STRING_ROUTINES
	HASHABLE
	DEBUG_OUTPUT

feature -- Status report

	is_abstract: BOOLEAN
			-- Is there no classes in current cluster?
			-- (i.e. 'abstract' keyword in HACT's LACE.)

	is_fully_abstract: BOOLEAN is
			-- Are current cluster and recursively all its
			-- subclusters abstract?
		local
			i, nb: INTEGER
			a_cluster_list: DS_ARRAYED_LIST [ET_CLUSTER]
		do
			if is_abstract then
				Result := True
				if subclusters /= Void then
					a_cluster_list := subclusters.clusters
					nb := a_cluster_list.count
					from i := 1 until i > nb loop
						if not a_cluster_list.item (i).is_fully_abstract then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	is_recursive: BOOLEAN
			-- Is current cluster recursive, in other words
			-- should subdirectories be considered as subclusters?
			-- (i.e. 'all' or 'library' keywords in ISE's LACE.)

	is_relative: BOOLEAN
			-- Is the pathname of current cluster relative to the
			-- pathname of its parent cluster?

	is_override: BOOLEAN
			-- Is current cluster an override cluster?
			-- In other words, do classes in this cluster and other override
			-- clusters take precedence over classes with same names but in
			-- non-override cluster? (see 'override_cluster' in ISE's LACE.)

	is_implicit: BOOLEAN
			-- Has current cluster not been explicitly declared
			-- but is instead the result of the fact that its
			-- parent is a recursive cluster?

feature -- Access

	name: STRING is
			-- Name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	prefixed_name: STRING is
			-- Cluster name with possible prefixes
		do
			Result := name
		ensure
			prefixed_name_not_void: Result /= Void
			prefixed_name_not_empty: Result.count > 0
		end

	pathname: STRING is
			-- Directory pathname (may be Void)
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
				Result := STRING_.new_empty_string (parent_name, parent_name.count + a_basename.count + 1)
				Result.append_string (parent_name)
				Result.append_character (a_separator)
				Result := STRING_.appended_string (Result, a_basename)
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
			if is_relative and parent /= Void then
				parent_pathname := parent.full_pathname
				if a_pathname /= Void and then a_pathname.count > 0 then
					a_basename := a_pathname
				else
					a_basename := name
				end
				Result := file_system.pathname (parent_pathname, a_basename)
			elseif a_pathname /= Void and then a_pathname.count > 0 then
				Result := a_pathname
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
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_capacity)
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

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := name.hash_code
		end

feature -- Nested

	parent: ET_CLUSTER
			-- Parent cluster

	subclusters: ET_CLUSTERS
			-- Subclusters

feature -- Measurement

	count: INTEGER is
			-- Number (recursively) of non-abstract clusters,
			-- including current cursor
		do
			if not is_abstract then
				Result := 1
			end
			if subclusters /= Void then
				Result := Result + subclusters.count
			end
		end

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

	set_relative (b: BOOLEAN) is
			-- Set `is_relative' to `b'.
		do
			is_relative := b
		ensure
			relative_set: is_relative = b
		end

	set_override (b: BOOLEAN) is
			-- Set `is_override' to `b'.
		do
			is_override := b
		ensure
			override_set: is_override = b
		end

	set_implicit (b: BOOLEAN) is
			-- Set `is_implicit' to `b'.
		do
			is_implicit := b
		ensure
			implicit_set: is_implicit = b
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

feature -- Element change

	add_subcluster (a_cluster: like parent) is
			-- Add `a_cluster' to the list of subsclusters.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_subclusters: like subclusters
		do
			if subclusters = Void then
				create a_subclusters.make_empty
				set_subclusters (a_subclusters)
			end
			subclusters.put_last (a_cluster)
			a_cluster.set_parent (Current)
		end

	add_implicit_subclusters (a_universe: ET_UNIVERSE) is
			-- Add (recursively) implicit subclusters when current cluster is recursive.
			-- Note that these subclusters will otherwise be added when running one of
			-- the `preparse_*' or `parse_all' routines.
		require
			a_universe_not_void: a_universe /= Void
		local
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			if not is_abstract and is_recursive then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				create dir.make (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if not has_eiffel_extension (s) and is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					a_universe.error_handler.report_gcaaa_error (Current, dir_name)
				end
			end
			if subclusters /= Void then
				subclusters.add_implicit_subclusters (a_universe)
			end
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

	preparse_shallow (a_universe: ET_UNIVERSE) is
			-- Traverse current cluster and build a mapping between
			-- class names and filenames. Classes are added to
			-- `a_universe.classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_filename: STRING
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			a_classname: ET_IDENTIFIER
			a_class: ET_CLASS
		do
			if not is_abstract then
				a_universe.error_handler.report_preparsing_status (Current)
				dir_name := Execution_environment.interpreted_string (full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							create a_classname.make (s.substring (1, s.count - 2))
							a_class := a_universe.eiffel_class (a_classname)
							if a_class.is_preparsed then
								if is_override then
									if a_class.cluster.is_override then
											-- Two classes with the same name in two override clusters.
										a_class.set_parsed
										a_class.set_syntax_error
										a_universe.error_handler.report_vscn0a_error (a_class, Current, a_filename)
									else
											-- Override.
										a_class.set_filename (a_filename)
										a_class.set_cluster (Current)
									end
								elseif not a_class.cluster.is_override then
										-- Two classes with the same name in two non-override clusters.
									a_class.set_parsed
									a_class.set_syntax_error
									a_universe.error_handler.report_vscn0a_error (a_class, Current, a_filename)
								end
							else
								a_class.set_filename (a_filename)
								a_class.set_cluster (Current)
							end
						elseif is_recursive and then is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					a_universe.error_handler.report_gcaaa_error (Current, dir_name)
				end
			end
			if subclusters /= Void then
				subclusters.preparse_shallow (a_universe)
			end
		end

	preparse_single (a_universe: ET_UNIVERSE) is
			-- Traverse current cluster and build a mapping between
			-- class names and filenames. Classes are added to 
			-- `a_universe.classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly
			-- one class.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			if not is_abstract then
				a_universe.error_handler.report_preparsing_status (Current)
				dir_name := Execution_environment.interpreted_string (full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							a_file := tmp_file
							a_file.reset (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								a_universe.preparse_single_file (a_file, a_filename, Current)
								a_file.close
							else
								a_universe.error_handler.report_gcaab_error (Current, a_filename)
							end
						elseif is_recursive and then is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					a_universe.error_handler.report_gcaaa_error (Current, dir_name)
				end
			end
			if subclusters /= Void then
				subclusters.preparse_single (a_universe)
			end
		end

	preparse_multiple (a_universe: ET_UNIVERSE) is
			-- Traverse current cluster and build a mapping between
			-- class names and filenames. Classes are added to
			-- `a_universe.classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			if not is_abstract then
				a_universe.error_handler.report_preparsing_status (Current)
				dir_name := Execution_environment.interpreted_string (full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							a_file := tmp_file
							a_file.reset (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								a_universe.preparse_multiple_file (a_file, a_filename, Current)
								a_file.close
							else
								a_universe.error_handler.report_gcaab_error (Current, a_filename)
							end
						elseif is_recursive and then is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					a_universe.error_handler.report_gcaaa_error (Current, dir_name)
				end
			end
			if subclusters /= Void then
				subclusters.preparse_multiple (a_universe)
			end
		end

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all classes in current cluster.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			debug ("GELINT")
				std.error.put_string ("Parse cluster '")
				std.error.put_string (full_pathname)
				std.error.put_line ("%'")
			end
			if not is_abstract then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							a_file := tmp_file
							a_file.reset (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								a_universe.parse_file (a_file, a_filename, Current)
								a_file.close
							else
								a_universe.error_handler.report_gcaab_error (Current, a_filename)
							end
						elseif is_recursive and then is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					a_universe.error_handler.report_gcaaa_error (Current, dir_name)
				end
			end
			if subclusters /= Void then
				subclusters.parse_all (a_universe)
			end
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := full_name ('.')
		end

feature {NONE} -- Implementation

	add_recursive_cluster (a_name: STRING) is
			-- Add recursive cluster named `s' to `subclusters'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			a_cluster: ET_CLUSTER
			a_cluster_list: DS_ARRAYED_LIST [ET_CLUSTER]
			found: BOOLEAN
			i, nb: INTEGER
		do
			if subclusters /= Void then
				a_cluster_list := subclusters.clusters
				nb := a_cluster_list.count
				from i := 1 until i > nb loop
					a_cluster := a_cluster_list.item (i)
					if a_cluster.is_implicit then
						if STRING_.same_string (a_name, a_cluster.name) then
							found := True
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
			if not found then
				add_subcluster (new_recursive_cluster (a_name))
			end
		end

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
			implicit: Result.is_implicit
		end

	has_eiffel_extension (a_filename: STRING): BOOLEAN is
			-- Has `a_filename' an Eiffel extension (.e)?
		require
			a_filename_not_void: a_filename /= Void
		local
			nb: INTEGER
			c: CHARACTER
		do
			nb := a_filename.count
			if nb > 2 and then a_filename.item (nb - 1) = '.' then
				c := a_filename.item (nb)
				if c = 'e' then
					Result := True
				elseif operating_system.is_windows and then c = 'E' then
					Result := True
				end
			end
		ensure
			definition: Result = (a_filename.count > 2 and then
				((a_filename.item (a_filename.count) = 'e' or
				(operating_system.is_windows and then
				a_filename.item (a_filename.count) = 'E')) and
				a_filename.item (a_filename.count - 1) = '.'))
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
				not STRING_.same_string (a_dirname, dot_directory_name) and
				not STRING_.same_string (a_dirname, dot_dot_directory_name)
		end

feature {NONE} -- Constants

	dot_directory_name: STRING is "."
	dot_dot_directory_name: STRING is ".."
			-- Directory names

	initial_classes_capacity: INTEGER is
			-- Initial capacity for `classes'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

feature {NONE} -- Implementation

	tmp_file: KL_TEXT_INPUT_FILE is
			-- Temporary file object
		do
			Result := shared_file
			if not Result.is_closed then
				create Result.make (dummy_name)
			end
		ensure
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	shared_file: KL_TEXT_INPUT_FILE is
			-- Shared file object
		once
			create Result.make (dummy_name)
		ensure
			file_not_void: Result /= Void
		end

	tmp_directory: KL_DIRECTORY is
			-- Temporary directory object
		do
			Result := shared_directory
			if not Result.is_closed then
				create Result.make (dummy_name)
			end
		ensure
			directory_not_void: Result /= Void
			directory_closed: Result.is_closed
		end

	shared_directory: KL_DIRECTORY is
			-- Shared directory object
		once
			create Result.make (dummy_name)
		ensure
			directory_not_void: Result /= Void
		end

	dummy_name: STRING is "dummy"
			-- Dummy name

end
