note

	description:

		"Fileset"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_FILESET

inherit

	ANY

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Create a new fileset.
		local
			a_tester: UC_STRING_EQUALITY_TESTER
		do
			project := a_project
			create {DS_HASH_SET [GEANT_FILESET_ENTRY]} filenames.make_equal (20)
			create {DS_HASH_SET [STRING]} single_includes.make (20)
			create a_tester
			single_includes.set_equality_tester (a_tester)
			create {DS_HASH_SET [STRING]} single_excludes.make (20)
			single_excludes.set_equality_tester (a_tester)
			set_filename_variable_name ("fs.filename")
			set_mapped_filename_variable_name ("fs.mapped_filename")
			force := True
		ensure
			filename_variable_name_set: filename_variable_name.same_string ("fs.filename")
			mapped_filename_variable_name_set: mapped_filename_variable_name.same_string ("fs.mapped_filename")
			force_is_true: force = True
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

	dir_name: detachable STRING
			-- Current working directory for execution

	directory_name: detachable STRING
			-- Name of directory serving as root for recursive scanning

	include_wc_string: detachable STRING
			-- Wildcard against which filenames are matched for inclusion

	exclude_wc_string: detachable STRING
			-- Wildcard against which filenames are matched for exclusion

	convert_to_filesystem: BOOLEAN
			-- Are `item_filename' and `item_mapped_filename' in the format
			-- of the current filesystem?
			-- Note: Result = false implies that both features' Result is in unix format

	map: detachable GEANT_MAP
			-- Map for filenames

	has_map: BOOLEAN
			-- Does current fileset has a map?
		do
			Result := map /= Void
		ensure
			definition: Result = (map /= Void)
		end

	force: BOOLEAN
			-- Should all selected files be included in `filenames' regardless of their timestamp?
			-- True: all selected files are included in `filenames'.
			-- False: only those files are included in `filename' for which the timestamp is
			--   newer than the timestamp of their corresponding files specified by `map'.
			--   If `map' is Void the mapped filename and the source filename are the same
			--   which means no file is included.
			-- default value: False

	concat: BOOLEAN
			-- Should `directory_name' be prepended to matched filenames?

	filename_directory_name: detachable STRING
			-- Name of directory prepended to matched filenames

	mapped_filename_directory_name: detachable STRING
			-- Name of directory prepended to mapped filenames

	filename_variable_name: STRING
			-- Name of project variable to which `item_filename' is assigned to
			-- during iterations;
			-- default: 'fs.filename'

	mapped_filename_variable_name: STRING
			-- Name of project variable to which `item_mapped_filename' is assigned to
			-- during iterations;
			-- default: 'fs.mapped_filename'

	item_filename: STRING
			-- Filename at current cursor
		require
			not_off: not off
		do
			if not convert_to_filesystem then
				Result := filenames.item_for_iteration.filename
			else
				Result := filenames.item_for_iteration.filename_converted
			end
		ensure
			item_filename_not_void: Result /= Void
		end

	item_mapped_filename: STRING
			-- Mapped filename at current cursor
		require
			not_off: not off
		do
			if not convert_to_filesystem then
				Result := filenames.item_for_iteration.mapped_filename
			else
				Result := filenames.item_for_iteration.mapped_filename_converted
			end
		ensure
			item_mapped_filename_not_void: Result /= Void
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can element be executed?
		do
			Result := is_in_gobo_31_format or else is_in_gobo_32_format
			if Result then
				if is_in_gobo_31_format then
					Result := (attached directory_name as l_directory_name and then l_directory_name.count > 0)
					if not Result then
						project.log (<<"  [fileset] error: attribute 'directory' is mandatory">>)
					end
				end
			end
			if Result then
				Result := not attached include_wildcard as l_include_wildcard or else l_include_wildcard.is_compiled
				if not Result then
					project.log (<<"  [fileset] error: attribute 'include' is not valid">>)
				end
			end
			if Result then
				Result := not attached exclude_wildcard as l_exclude_wildcard or else l_exclude_wildcard.is_compiled
				if not Result then
					project.log (<<"  [fileset] error: attribute 'exclude' is not valid">>)
				end
			end
			if Result then
				Result := not attached map as l_map or else l_map.is_executable
				if not Result then
					project.log (<<"  [fileset] error: element 'map' is not defined correctly">>)
				end
			end
		ensure
			directory_name_not_void_and_not_empty: (Result and is_in_gobo_31_format) implies attached directory_name as l_directory_name and then l_directory_name.count > 0
			include_wildcard_compiled: Result implies (not attached include_wildcard as l_include_wildcard or else l_include_wildcard.is_compiled)
			exclude_wildcard_compiled: Result implies (not attached exclude_wildcard as l_exclude_wildcard or else l_exclude_wildcard.is_compiled)
			map_executable: Result implies (not attached map as l_map or else l_map.is_executable)
			correct_format: Result implies is_in_gobo_31_format or else is_in_gobo_32_format
		end

	is_in_gobo_31_format: BOOLEAN
			-- Is fileset setup for obsolete GOBO 3.1 format?
		do
			Result := directory_name /= Void and then filename_directory_name = Void and then
				mapped_filename_directory_name = Void and then dir_name = Void
		ensure
			definition: Result implies directory_name /= Void and then
				filename_directory_name = Void and then mapped_filename_directory_name = Void and then
				dir_name = Void
		end

	is_in_gobo_32_format: BOOLEAN
			-- Is fileset setup for GOBO 3.2 format?
		do
			Result := directory_name = Void and then not concat
		ensure
			definition: Result implies directory_name = Void and then not concat
		end

	are_project_variables_up_to_date: BOOLEAN
			-- If not `off' is project variable named `filename_variable_name' set to `item_filename' and
			-- project variable named `mapped_filename_variable_name' set to `item_mapped_filename'?
			-- And if `off' are project variables named `filename_variable_name' and
			-- `mapped_filename_variable_name' not existing?
		do
			if not off then
				Result := project.variables.has (filename_variable_name) and then
					STRING_.same_string (project.variables.item (filename_variable_name), item_filename) and then
					project.variables.has (mapped_filename_variable_name) and then
					STRING_.same_string (project.variables.item (mapped_filename_variable_name), item_mapped_filename)
			else
				Result := not (project.variables.has (filename_variable_name) or
					project.variables.has (mapped_filename_variable_name))
			end
		ensure
			filename_variable_name_exists: not off implies
				(Result implies project.variables.has (filename_variable_name))
			filename_variable_name_set: not off implies (Result implies
				STRING_.same_string (project.variables.item (filename_variable_name), item_filename))
			mapped_filename_variable_name_exists: not off implies
				(Result implies project.variables.has (mapped_filename_variable_name))
			mapped_filename_variable_name_set: not off implies (Result implies
				STRING_.same_string (project.variables.item (mapped_filename_variable_name), item_mapped_filename))
			filename_variable_name_not_exists: off implies
				(Result implies not project.variables.has (filename_variable_name))
			mapped_filename_variable_name_not_exists: off implies
				(Result implies not project.variables.has (mapped_filename_variable_name))
		end

	is_empty: BOOLEAN
			-- Is fileset empty?
		do
			Result := filenames.is_empty
		end

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := filenames.after
		end

	off: BOOLEAN
			-- Is there no item at internal cursor position?
		do
			Result := filenames.off
		end

feature -- Element change

	set_dir_name (a_dir_name: STRING)
			-- Set `dir_name' to `a_dir_name'.
		require
			dir_name_not_void: a_dir_name /= Void
		do
			dir_name := a_dir_name
		ensure
			dir_name_set: dir_name = a_dir_name
		end

	set_directory_name (a_directory_name: STRING)
			-- Set `directory_name' to `a_directory_name'.
		require
			directory_name_not_void: a_directory_name /= Void
		do
			directory_name := a_directory_name
		ensure
			directory_name_set: directory_name = a_directory_name
		end

	set_include_wc_string (a_include_wc_string: STRING)
			-- Set `include_wc_string' to `a_include_wc_string' and
			-- make a compiled version available in `include_wildcard'
		require
			a_include_wc_string_not_void : a_include_wc_string /= Void
			a_include_wc_string_not_empty: a_include_wc_string.count > 0
		local
			l_include_wildcard: like include_wildcard
		do
			include_wc_string := a_include_wc_string
				-- Setup wildcard for include patterns:
			create {LX_DFA_WILDCARD} l_include_wildcard.compile (a_include_wc_string, True)
			include_wildcard := l_include_wildcard
			if not l_include_wildcard.is_compiled then
				project.log (<<"  [fileset] error: invalid include wildcard: '", a_include_wc_string, "%'">>)
			end
		ensure
			include_wc_string_set: include_wc_string = a_include_wc_string
		end

	set_exclude_wc_string (a_exclude_wc_string: STRING)
			-- Set `exclude_wc_string' to `a_exclude_wc_string' and
			-- make a compiled version available in `exclude_wildcard'
		require
			a_exclude_wc_string_not_void : a_exclude_wc_string /= Void
			a_exclude_wc_string_not_empty: a_exclude_wc_string.count > 0
		local
			l_exclude_wildcard: like exclude_wildcard
		do
			exclude_wc_string := a_exclude_wc_string
				-- Setup wildcard for exclude patterns:
			create {LX_DFA_WILDCARD} l_exclude_wildcard.compile (a_exclude_wc_string, True)
			exclude_wildcard := l_exclude_wildcard
			if not l_exclude_wildcard.is_compiled then
				project.log (<<"  [fileset] error: invalid exclude wildcard: '", a_exclude_wc_string, "%'">>)
			end
		ensure
			exclude_wc_string_set: exclude_wc_string = a_exclude_wc_string
		end

	set_convert_to_filesystem (b: BOOLEAN)
			-- Set `convert_to_filesystem' to `b'.
		do
			convert_to_filesystem := b
		ensure
			convert_to_filesystem_set: convert_to_filesystem = b
		end

	set_map (a_map: like map)
			-- Set `map' to `a_map'.
		require
			a_map_not_void: a_map /= Void
		do
			map := a_map
		ensure
			map_set: map = a_map
		end

	set_force (b: BOOLEAN)
			-- Set `force' to `b'.
		do
			force := b
		ensure
			force_set: force = b
		end

	set_concat (b: BOOLEAN)
			-- Set `concat' to `b'.
		do
			concat := b
		ensure
			concat_set: concat = b
		end

	set_filename_directory_name (a_filename_directory_name: STRING)
			-- Set `filename_directory_name' to `a_filename_directory_name'.
		require
			filename_directory_name_not_void: a_filename_directory_name /= Void
		do
			filename_directory_name := a_filename_directory_name
		ensure
			filename_directory_name_set: filename_directory_name = a_filename_directory_name
		end

	set_mapped_filename_directory_name (a_mapped_filename_directory_name: STRING)
			-- Set `mapped_filename_directory_name' to `a_mapped_filename_directory_name'.
		require
			mapped_filename_directory_name_not_void: a_mapped_filename_directory_name /= Void
		do
			mapped_filename_directory_name := a_mapped_filename_directory_name
		ensure
			mapped_filename_directory_name_set: mapped_filename_directory_name = a_mapped_filename_directory_name
		end

	set_filename_variable_name (a_filename_variable_name: STRING)
			-- Set `filename_variable_name' to `a_filename_variable_name'.
		require
			a_filename_variable_name_not_void: a_filename_variable_name /= Void
			a_filename_variable_name_not_empty: a_filename_variable_name.count > 0
		do
			filename_variable_name := a_filename_variable_name
		ensure
			filename_variable_name_set: filename_variable_name = a_filename_variable_name
		end

	set_mapped_filename_variable_name (a_mapped_filename_variable_name: STRING)
			-- Set `mapped_filename_variable_name' to `a_mapped_filename_variable_name'.
		require
			a_mapped_filename_variable_name_not_void: a_mapped_filename_variable_name /= Void
			a_mapped_filename_variable_name_not_empty: a_mapped_filename_variable_name.count > 0
		do
			mapped_filename_variable_name := a_mapped_filename_variable_name
		ensure
			mapped_filename_variable_name_set: mapped_filename_variable_name = a_mapped_filename_variable_name
		end

feature -- Element change

	add_fileset_entry_if_necessary (a_filename: STRING)
			-- Add new GEANT_FILESET_ENTRY created from `a_filename'
			-- to `filenames'.
			-- If force is set to 'false' do this only if the file named
			--   `map.mapped_filename (a_filename)' (if map /= Void)
			--   `a_filename' (if map = Void)
			-- is older than the file name `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		local
			a_entry: GEANT_FILESET_ENTRY
			an_filename: STRING
			an_mapped_filename: STRING
		do
			project.trace_debug (<<"  [*fileset] trying to add: '", a_filename, "%'">>)
			an_filename := a_filename
			if attached map as l_map then
				an_mapped_filename := l_map.mapped_filename (an_filename)
			else
				an_mapped_filename := an_filename
			end
				-- Remove support for 'gobo32_format' after obsolete period:
			if concat and attached directory_name as l_directory_name then
				an_mapped_filename := unix_file_system.pathname (l_directory_name, an_mapped_filename)
			end

			if attached filename_directory_name as l_filename_directory_name then
				an_filename := unix_file_system.pathname (l_filename_directory_name, an_filename)
			end
			if attached mapped_filename_directory_name as l_mapped_filename_directory_name then
				an_mapped_filename := unix_file_system.pathname (l_mapped_filename_directory_name,
					an_mapped_filename)
			end
			if force or else is_file_outofdate (an_filename, an_mapped_filename) then
				create a_entry.make (an_filename, an_mapped_filename)
				filenames.force_last (a_entry)
			end
		end

	remove_fileset_entry (a_filename: STRING)
			-- Remove entry with name equal to `a_filename' if existing.
		local
			a_entry: GEANT_FILESET_ENTRY
		do
			project.trace_debug (<<"  [*fileset] removing: '", a_filename, "%'">>)
			create a_entry.make (a_filename, a_filename)
			filenames.remove (a_entry)
		end

	add_single_include (a_filename: STRING)
			-- Add `a_filename' to list of single filenames to include into fileset.
		require
			a_filename_not_void: a_filename /= Void
		do
			single_includes.force_last (a_filename)
		end

	add_single_exclude (a_filename: STRING)
			-- Add `a_filename' to list of single filenames to exclude from fileset.
		require
			a_filename_not_void: a_filename /= Void
		do
			single_excludes.force_last (a_filename)
		end

feature -- Cursor movement

	start
			-- Move cursor to first position.
		do
			filenames.start
			if off then
				remove_project_variables
			else
				update_project_variables
			end
		ensure
			empty_behavior: is_empty implies after
			project_variables_up_to_date: are_project_variables_up_to_date
		end

	forth
	   		-- Move cursor to next position.
		require
			not_after: not after
		do
			filenames.forth
			if off then
				remove_project_variables
			else
				update_project_variables
			end
		ensure
			project_variables_up_to_date: are_project_variables_up_to_date
		end

	go_after
			-- Move cursor to `after' position.
		do
			remove_project_variables
			filenames.go_after
		ensure
			project_variables_up_to_date: are_project_variables_up_to_date
		end

feature -- Execution

	execute
			-- Populate `filenames'.
		local
			al_directory_name: STRING
			cs: DS_SET_CURSOR [STRING]
			a_old_cwd: STRING
		do
			remove_project_variables

			a_old_cwd := file_system.current_working_directory
				-- Change to directory `dir_name' if specified:
			if attached dir_name as l_dir_name then
				project.trace_debug (<<"  [*fileset] dir: '", l_dir_name, "%'">>)
				project.trace_debug (<<"  [*fileset] changing to directory: '", l_dir_name, "%'">>)
				file_system.set_current_working_directory (l_dir_name)
			end
			if attached directory_name as l_directory_name then
				project.trace_debug (<<"  [*fileset] directory_name: ", l_directory_name>>)
			end
			if attached include_wc_string as l_include_wc_string then
				project.trace_debug (<<"  [*fileset] include_wc_string: ", l_include_wc_string>>)
			end
			if attached filename_directory_name as l_filename_directory_name then
				project.trace_debug (<<"  [*fileset] filename_directory: ", l_filename_directory_name>>)
			end
			if attached mapped_filename_directory_name as l_mapped_filename_directory_name then
				project.trace_debug (<<"  [*fileset] mapped_filename_directory: ", l_mapped_filename_directory_name>>)
			end
			if attached directory_name as l_directory_name then
				al_directory_name := unix_file_system.canonical_pathname (l_directory_name)
			else
				create al_directory_name.make_from_string (".")
			end
				-- Add entries from filesystem scan:
			scan_internal (al_directory_name, al_directory_name)
				-- Add single includes:
			cs := single_includes.new_cursor
			from cs.start until cs.after loop
				add_fileset_entry_if_necessary (cs.item)
				cs.forth
			end
				-- Remove single excludes:
			cs := single_excludes.new_cursor
			from cs.start until cs.after loop
				remove_fileset_entry (cs.item)
				cs.forth
			end
			if project.options.debug_mode then
				from start until after loop
					project.trace_debug (<<"  [*fileset] entry: [", item_filename, ", ", item_mapped_filename, "]">>)
					forth
				end
			end
				-- Change back to previous directory:
			project.trace_debug (<<"  [*fileset] changing to directory: '", a_old_cwd, "%'">>)
			file_system.set_current_working_directory (a_old_cwd)
		end

	include_wildcard: detachable LX_WILDCARD
			-- Expression defining filenames for inclusion

	exclude_wildcard: detachable LX_WILDCARD
			-- Expression defining filenames for exclusion

feature {NONE} -- Implementation/Access

	filenames: DS_SET [GEANT_FILESET_ENTRY]
			-- Files underneath directory named `directory_name' (if `is_in_gobo_31_format')
			-- Files underneath current working directory (if `is_in_gobo_32_format')
			-- matching expressions in `include_wc_string' and not matching
			-- expressions in `exclude_wc_string' with their corresponding
			-- mapped filename if `has_map';
			-- available after execute has been performed.

	single_includes: DS_SET [STRING]
			-- Filenames to be included in `filenames'

	single_excludes: DS_SET [STRING]
			-- Filenames to be excluded from `filenames'

feature {NONE} -- Implementation/Processing

	scan_internal (a_directory_name, a_root_directory_name: STRING)
			-- Scan directory named `a_directory_name' recursivley;
			-- put filenames found matching `include_wildcard' and not matching `exclude_wildcard'
			-- into `filenames';
		require
			a_directory_name_not_void: a_directory_name /= Void
			a_root_directory_name_not_void: a_root_directory_name /= Void
		local
			a_dir: KL_DIRECTORY
			a_name: STRING
			s: STRING
			smatch: STRING
		do
			create a_dir.make (a_directory_name)
			a_dir.open_read
			if a_dir.is_open_read then
				from a_dir.read_entry until a_dir.end_of_input loop
					a_name := a_dir.last_entry
					if
						not STRING_.same_string (a_name, file_system.relative_current_directory) and
						not STRING_.same_string (a_name, file_system.relative_parent_directory)
					then
						s := unix_file_system.pathname (a_directory_name, a_name)
							-- Recurse for directories:
						if file_system.is_directory_readable (s) then
							scan_internal (s, a_root_directory_name)
						else
								-- Handle files:
--!!							project.trace_debug (<<"filename: ", s, "%N">>)
							if is_in_gobo_31_format then
								smatch := s.substring (a_root_directory_name.count + 2, s.count)	-- 2 because of '/'
							else
								smatch := s.substring (3, s.count)	-- 3 because of './'
							end
--!!							project.trace_debug (<<"  trying to match: ", smatch, "%N">>)
							if attached include_wildcard as l_include_wildcard and then l_include_wildcard.recognizes (smatch) then
								add_fileset_entry_if_necessary (smatch)
							end
							if attached exclude_wildcard as l_exclude_wildcard and then l_exclude_wildcard.recognizes (smatch) then
								remove_fileset_entry (smatch)
							end
						end
					end
					a_dir.read_entry
				end
				a_dir.close
			end
		end

	is_file_outofdate (a_first_filename, a_second_filename: STRING): BOOLEAN
			-- Is timestamp of file named `a_second_filename' older than
			-- timestamp of file named `a_first_filename' or doesn't exist at all?
		require
			a_first_filename_not_void: a_first_filename /= Void
			a_second_filename_not_void: a_second_filename /= Void
			-- first_file_exists: file_system.file_exists (first_filename)
		local
			a_first_time: INTEGER
			a_second_time: INTEGER
		do
			if not file_system.file_exists (a_second_filename) then
				Result := True
			else
				a_first_time := file_system.file_time_stamp (a_first_filename)
				a_second_time := file_system.file_time_stamp (a_second_filename)
				Result := a_second_time < a_first_time
			end
		end

	update_project_variables
			-- Set project variable with name `filename_variable_name' to `item_filename' and
			-- project variable with name `mapped_filename_variable_name' to `item_mapped_filename'.
		require
			not_off: not off
		do
			project.variables.set_variable_value (filename_variable_name, item_filename)
			project.variables.set_variable_value (mapped_filename_variable_name, item_mapped_filename)
		ensure
			project_variables_set: are_project_variables_up_to_date
		end

	remove_project_variables
			-- Remove project variable with name `filename_variable_name' and
			-- project variable with name `mapped_filename_variable_name'.
		do
			project.trace_debug (<<"  [*fileset] removing project variables '",
				filename_variable_name, "' and '", mapped_filename_variable_name, "'">>)
			project.variables.remove (filename_variable_name)
			project.variables.remove (mapped_filename_variable_name)
		ensure
			project_variables_removed: not project.variables.has (filename_variable_name) and
				not project.variables.has (mapped_filename_variable_name)
		end

invariant

	filename_variable_name_not_void: filename_variable_name /= Void
	filename_variable_name_not_empty: filename_variable_name.count > 0
	mapped_filename_variable_name_not_void: mapped_filename_variable_name /= Void
	mapped_filename_variable_name_not_empty: mapped_filename_variable_name.count > 0

end
