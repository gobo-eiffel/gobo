indexing

	description:

		"Eiffel cluster processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTER_PROCESSOR

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES
	KL_SHARED_OPERATING_SYSTEM
	KL_SHARED_FILE_SYSTEM

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new cluster processor.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	classes (a_cluster: ET_CLUSTER): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes of `universe' which are `a_cluster'
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_capacity)
			a_cursor := universe.classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.cluster = a_cluster then
					Result.force_last (a_class)
				end
				a_cursor.forth
			end
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has (Void)
		end

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Error handling

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Element change

	add_implicit_subclusters_to_clusters (a_clusters: ET_CLUSTERS) is
			-- Add (recursively) implicit subclusters `a_clusters' when they are recursive.
			-- Note that these subclusters will otherwise be added when running one of
			-- the `preparse_*' or `parse_*_all' routines.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
		do
			l_clusters := a_clusters.clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				add_implicit_subclusters_to_cluster (l_clusters.item (i))
				i := i + 1
			end
		end

	add_implicit_subclusters_to_cluster (a_cluster: ET_CLUSTER) is
			-- Add (recursively) implicit subclusters to `a_cluster' when it is recursive.
			-- Note that these subclusters will otherwise be added when running one of
			-- the `preparse_*' or `parse_*_all' routines.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			l_subclusters: ET_CLUSTERS
		do
			if not a_cluster.is_abstract and a_cluster.is_recursive then
				dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
				create dir.make (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if not has_eiffel_extension (s) and a_cluster.is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								a_cluster.add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					error_handler.report_gcaaa_error (a_cluster, dir_name)
				end
			end
			l_subclusters := a_cluster.subclusters
			if l_subclusters /= Void then
				add_implicit_subclusters_to_clusters (l_subclusters)
			end
		end

feature -- Parsing

	preparse_clusters_shallow (a_clusters: ET_CLUSTERS) is
			-- Traverse `a_clusters' and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `universe.classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
		do
			l_clusters := a_clusters.clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				preparse_cluster_shallow (l_clusters.item (i))
				i := i + 1
			end
		end

	preparse_cluster_shallow (a_cluster: ET_CLUSTER) is
			-- Traverse `a_cluster' and build a mapping between
			-- class names and filenames. Classes are added to
			-- `universe.classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			a_classname: ET_IDENTIFIER
			a_class: ET_CLASS
			l_subclusters: ET_CLUSTERS
		do
			if not a_cluster.is_abstract then
				universe.error_handler.report_preparsing_status (a_cluster)
				dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if a_cluster.is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							create a_classname.make (s.substring (1, s.count - 2))
							a_class := universe.eiffel_class (a_classname)
							if a_class.is_preparsed then
								if a_cluster.is_override then
									if a_class.cluster.is_override then
											-- Two classes with the same name in two override clusters.
										a_class.set_parsed
										a_class.set_syntax_error
										error_handler.report_vscn0a_error (a_class, a_cluster, a_filename)
									else
											-- Override.
										a_class.set_filename (a_filename)
										a_class.set_cluster (a_cluster)
									end
								elseif not a_class.cluster.is_override then
										-- Two classes with the same name in two non-override clusters.
									a_class.set_parsed
									a_class.set_syntax_error
									error_handler.report_vscn0a_error (a_class, a_cluster, a_filename)
								end
							else
								a_class.set_filename (a_filename)
								a_class.set_cluster (a_cluster)
							end
						elseif a_cluster.is_recursive and then a_cluster.is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								a_cluster.add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					error_handler.report_gcaaa_error (a_cluster, dir_name)
				end
			end
			l_subclusters := a_cluster.subclusters
			if l_subclusters /= Void then
				preparse_clusters_shallow (l_subclusters)
			end
		end

	preparse_clusters_single (a_clusters: ET_CLUSTERS) is
			-- Traverse `a_clusters' and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `universe.classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly
			-- one class.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
		do
			l_clusters := a_clusters.clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				preparse_cluster_single (l_clusters.item (i))
				i := i + 1
			end
		end

	preparse_cluster_single (a_cluster: ET_CLUSTER) is
			-- Traverse `a_cluster' and build a mapping between
			-- class names and filenames. Classes are added to 
			-- `universe.classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly
			-- one class.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			l_subclusters: ET_CLUSTERS
		do
			if not a_cluster.is_abstract then
				universe.error_handler.report_preparsing_status (a_cluster)
				dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if a_cluster.is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							a_file := tmp_file
							a_file.reset (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								universe.preparse_single_file (a_file, a_filename, a_cluster)
								a_file.close
							else
								error_handler.report_gcaab_error (a_cluster, a_filename)
							end
						elseif a_cluster.is_recursive and then a_cluster.is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								a_cluster.add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					error_handler.report_gcaaa_error (a_cluster, dir_name)
				end
			end
			l_subclusters := a_cluster.subclusters
			if l_subclusters /= Void then
				preparse_clusters_single (l_subclusters)
			end
		end

	preparse_clusters_multiple (a_clusters: ET_CLUSTERS) is
			-- Traverse `a_clusters' and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `universe.classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
		do
			l_clusters := a_clusters.clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				preparse_cluster_multiple (l_clusters.item (i))
				i := i + 1
			end
		end

	preparse_cluster_multiple (a_cluster: ET_CLUSTER) is
			-- Traverse `a_cluster' and build a mapping between
			-- class names and filenames. Classes are added to
			-- `universe.classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			l_subclusters: ET_CLUSTERS
		do
			if not a_cluster.is_abstract then
				error_handler.report_preparsing_status (a_cluster)
				dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if a_cluster.is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							a_file := tmp_file
							a_file.reset (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								universe.preparse_multiple_file (a_file, a_filename, a_cluster)
								a_file.close
							else
								error_handler.report_gcaab_error (a_cluster, a_filename)
							end
						elseif a_cluster.is_recursive and then a_cluster.is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								a_cluster.add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					error_handler.report_gcaaa_error (a_cluster, dir_name)
				end
			end
			l_subclusters := a_cluster.subclusters
			if l_subclusters /= Void then
				preparse_clusters_multiple (l_subclusters)
			end
		end

	parse_clusters_all (a_clusters: ET_CLUSTERS) is
			-- Parse all classes in `a_clusters'.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
		do
			l_clusters := a_clusters.clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				parse_cluster_all (l_clusters.item (i))
				i := i + 1
			end
		end

	parse_cluster_all (a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			l_subclusters: ET_CLUSTERS
		do
			debug ("GELINT")
				std.error.put_string ("Parse cluster '")
				std.error.put_string (a_cluster.full_pathname)
				std.error.put_line ("%'")
			end
			if not a_cluster.is_abstract then
				dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if a_cluster.is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							a_file := tmp_file
							a_file.reset (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								universe.parse_file (a_file, a_filename, a_cluster)
								a_file.close
							else
								error_handler.report_gcaab_error (a_cluster, a_filename)
							end
						elseif a_cluster.is_recursive and then a_cluster.is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								a_cluster.add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					error_handler.report_gcaaa_error (a_cluster, dir_name)
				end
			end
			l_subclusters := a_cluster.subclusters
			if l_subclusters /= Void then
				parse_clusters_all (l_subclusters)
			end
		end

feature {NONE} -- Constants

	initial_classes_capacity: INTEGER is
			-- Initial capacity for `classes'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

feature {NONE} -- Implementation

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

invariant

	universe_not_void: universe /= Void

end
