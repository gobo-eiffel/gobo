indexing

	description:

		"Fileset"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FILESET

inherit

	ANY

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new fileset.
		do
			project := a_project
			!DS_HASH_SET [GEANT_FILESET_ENTRY]! filenames.make_equal (20)
			set_filename_variable_name (clone ("fs.filename"))
			set_mapped_filename_variable_name (clone ("fs.mapped_filename"))
			force := True
		ensure
			filename_variable_name_set:
				filename_variable_name.is_equal ("fs.filename")
			mapped_filename_variable_name_set:
				mapped_filename_variable_name.is_equal ("fs.mapped_filename")
			force_is_true: force = True
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

feature -- Status report

	is_executable: BOOLEAN is
			-- Can element be executed?
		do
			Result := (directory_name /= Void and then directory_name.count > 0)
			if not Result then
				project.log ("  [fileset] error: attribute 'directory' is mandatory%N")
			end
			if Result then
				Result := include_wildcard /= Void and then include_wildcard.compiled
				if not Result then
					project.log ("  [fileset] error: attribute 'include' is not valid%N")
				end
			end
			if Result then
				Result := exclude_wildcard = Void or else exclude_wildcard.compiled
				if not Result then
					project.log ("  [fileset] error: attribute 'exclude' is not valid%N")
				end
			end
			if Result then
				Result := map = Void or else map.is_executable
				if not Result then
					project.log ("  [fileset] error: element 'map' is not defined correctly%N")
				end
			end

		ensure
			directory_name_not_void: Result implies directory_name /= Void
			directory_name_not_empty: Result implies directory_name.count > 0
			include_wildcard_not_void: Result implies include_wildcard /= Void
			include_wildcard_compiled: Result implies include_wildcard.compiled
			exclude_wildcard_compiled: Result implies exclude_wildcard = Void or else
				exclude_wildcard.compiled
			map_executable: Result implies (map = Void or else map.is_executable)
		end

feature -- Access

	directory_name: STRING
			-- Name of directory serving as root for recursive scanning

	include_wc_string: STRING
			-- Wildcard against which filenames are matched for inclusion

	exclude_wc_string: like include_wc_string
			-- Wildcard against which filenames are matched for exclusion

	convert_to_filesystem: BOOLEAN
			-- Are `item_filename' and `item_mapped_filename' in the
			-- format of the current filesystem? If not they are in unix format.

	map: GEANT_MAP
			-- Map for filenames

	has_map: BOOLEAN is
			-- Does current fileset has a map?
		do
			Result := map /= Void
		ensure
			definition: Result = (map /= Void)
		end

	force: BOOLEAN
			-- Should all selected files be included in `filenames' regardless of their timestamp?
			-- True: all selected files are included in `filenames'
			-- False: only those files are included in `filename' for which the timestamp is
			--        newer than the timestamp of their corresponding files specified by `map'.
			--        If `map' is Void the mapped filename and the source filename are the same
			--        which means no file is included.
			-- default value: False

	concat: BOOLEAN
			-- Should `directory_name' be prepended to matched filenames?

	filename_variable_name: STRING
			-- Name of project variable to which `item_filename' is assigned to
			-- during iterations
			-- default: 'fs.filename'

	mapped_filename_variable_name: STRING
			-- Name of project variable to which `item_mapped_filename' is assigned to
			-- during iterations
			-- default: 'fs.mapped_filename'

	is_empty: BOOLEAN is
			-- Is fileset empty?
		do
			Result := filenames.is_empty
		end

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		do
			Result := filenames.after
		end

	item_filename : STRING is
			-- filename at current cursor
		require
			not_after: not after
		do
			if not convert_to_filesystem then
				Result := filenames.item_for_iteration.filename
			else
				Result := filenames.item_for_iteration.filename_converted
			end
		ensure
			item_filename_not_void: Result /= Void
		end

	item_mapped_filename : STRING is
			-- filename at current cursor
		require
			not_after: not after
		do
			if not convert_to_filesystem then
				Result := filenames.item_for_iteration.mapped_filename
			else
				Result := filenames.item_for_iteration.mapped_filename_converted
			end
		ensure
			item_mapped_filename_not_void: Result /= Void
		end

	are_project_variables_up_to_date: BOOLEAN is
			-- If not `after' is project variable named `filename_variable_name' set to `item_filename' and
			-- project variable named `mapped_filename_variable_name' set to `item_mapped_filename'?
			-- And if `after' are project variables named `filename_variable_name' and
			-- `mapped_filename_variable_name' not existing?
		do
			if not after then
				Result := project.variables.has_variable (filename_variable_name)
				Result := Result and then
					project.variables.variable_value (filename_variable_name).is_equal (item_filename)
				Result := Result and then project.variables.has_variable (mapped_filename_variable_name)
				Result := Result and then
					project.variables.variable_value (mapped_filename_variable_name).is_equal (item_mapped_filename)
			else
				Result := not (
					project.variables.has_variable (filename_variable_name) or
					project.variables.has_variable (mapped_filename_variable_name)
					)
			end
		ensure
			filename_variable_name_exists:
				not after implies
					(Result implies project.variables.has_variable (filename_variable_name))
			filename_variable_name_set:
				not after implies
					(Result implies project.variables.variable_value (filename_variable_name).is_equal (item_filename))
			mapped_filename_variable_name_exists:
				not after implies
					(Result implies project.variables.has_variable (mapped_filename_variable_name))
			mapped_filename_variable_name_set:
				not after implies
					(Result implies project.variables.variable_value (mapped_filename_variable_name).is_equal (item_mapped_filename))
			filename_variable_name_not_exists:
				after implies
					(Result implies not project.variables.has_variable (filename_variable_name))
			mapped_filename_variable_name_not_exists:
				after implies
					(Result implies not project.variables.has_variable (mapped_filename_variable_name))
		end

feature -- Setting

	set_directory_name (a_directory_name: STRING) is
			-- Set `directory_name' to `a_directory_name'.
		require
			directory_name_not_void: a_directory_name /= Void
		do
			directory_name := a_directory_name
		ensure
			directory_name_set: directory_name.is_equal (a_directory_name)
		end

	set_include_wc_string (a_include_wc_string: like include_wc_string) is
			-- Set `include_wc_string' to `a_include_wc_string' and
			-- make a compiled version available in `include_wildcard'
		require
			a_include_wc_string_not_void : a_include_wc_string /= Void
			a_include_wc_string_not_empty: a_include_wc_string.count > 0
		do
			include_wc_string := a_include_wc_string

				-- Setup wildcard for include patterns:
			!LX_DFA_WILDCARD! include_wildcard.compile (include_wc_string, True)
			if not include_wildcard.compiled then
				project.log ("  [fileset] error: invalid include wildcard: '" + include_wc_string + "'%N")
			end

		ensure
			include_wc_string_set: include_wc_string = a_include_wc_string
		end

	set_exclude_wc_string (a_exclude_wc_string: like exclude_wc_string) is
			-- Set `exclude_wc_string' to `a_exclude_wc_string' and
			-- make a compiled version available in `exclude_wildcard'
		require
			a_exclude_wc_string_not_void : a_exclude_wc_string /= Void
			a_exclude_wc_string_not_empty: a_exclude_wc_string.count > 0
		do
			exclude_wc_string := a_exclude_wc_string

				-- Setup wildcard for exclude patterns:
			!LX_DFA_WILDCARD! exclude_wildcard.compile (exclude_wc_string, True)
			if not exclude_wildcard.compiled then
				project.log ("  [fileset] error: invalid exclude wildcard: '" + exclude_wc_string + "'%N")
			end

		ensure
			exclude_wc_string_set: exclude_wc_string = a_exclude_wc_string
		end

	set_convert_to_filesystem (b: BOOLEAN) is
			-- Set `convert_to_filesystem' to `b'.
			-- NOTE: `convert_to_filesystem' should be set only once.
			--       Therefore this is a once command.
		once
			convert_to_filesystem := b
		ensure
			convert_to_filesystem_set: convert_to_filesystem = b
		end

	set_map (a_map: like map) is
			-- Set `map' to `a_map'.
		require
			a_map_not_void: a_map /= Void
		do
			map := a_map
		ensure
			map_set: map = a_map
		end

	set_force (b: BOOLEAN) is
			-- Set `force' to `b'.
		do
			force := b
		ensure
			force_set: force = b
		end

	set_concat (b: BOOLEAN) is
			-- Set `concat' to `b'.
		do
			concat := b
		ensure
			concat_set: concat = b
		end

	set_filename_variable_name (a_filename_variable_name: STRING) is
			-- Set `filename_variable_name' to `a_filename_variable_name'.
		require
			filename_variable_name_not_void: a_filename_variable_name /= Void
		do
			filename_variable_name := a_filename_variable_name
		ensure
			filename_variable_name_set: filename_variable_name.is_equal (a_filename_variable_name)
		end

	set_mapped_filename_variable_name (a_mapped_filename_variable_name: STRING) is
			-- Set `mapped_filename_variable_name' to `a_mapped_filename_variable_name'.
		require
			mapped_filename_variable_name_not_void: a_mapped_filename_variable_name /= Void
		do
			mapped_filename_variable_name := a_mapped_filename_variable_name
		ensure
			mapped_filename_variable_name_set: mapped_filename_variable_name.is_equal (a_mapped_filename_variable_name)
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		do
			filenames.start
			update_project_variables
		ensure
			empty_behavior: is_empty implies after
			project_variables_up_to_date: are_project_variables_up_to_date
		end

	forth is
	   		-- Move cursor to next position.
		require
			not_after: not after
		do
			filenames.forth
			update_project_variables
		ensure
			project_variables_up_to_date: are_project_variables_up_to_date
		end

feature -- Execution

	execute is
			-- Populate `filenames'.
		local
			al_directory_name: STRING
		do
			project.trace_debug ("  [*fileset] directory_name: " + directory_name + "%N")
			project.trace_debug ("  [*fileset] include_wc_string: " + include_wc_string + "%N")

			al_directory_name := unix_file_system.canonical_pathname (directory_name)
			scan_internal (al_directory_name)
		end

	include_wildcard: LX_WILDCARD
		-- Expression defining filenames for inclusion;
		-- if Void all filenames found underneath directory
		-- named `directory_name' will be included

	exclude_wildcard: LX_WILDCARD
		-- Expression defining filenames for exclusion

feature {NONE} -- Implementation/Access

	filenames: DS_SET [GEANT_FILESET_ENTRY]
			-- Files underneath directory named `directory_name'
			-- matching expressions in `include_wc_string' and not matching
			-- expressions in `exclude_wc_string' with their corresponding
			-- mapped filename if `has_map';
			-- available after execute has been performed.

feature {NONE} -- Implementation/Processing

	scan_internal (a_directory_name: STRING) is
			-- Scan directory named `directory_name' recursivley;
			-- put filenames found matching `regexp_pattern' into `filenames';
			-- if `filter' is Void all filenames will be put into `filenames'.
		local
			a_dir: KL_DIRECTORY
			a_name: STRING
			s: STRING
			smatch: STRING
		do
			!! a_dir.make (a_directory_name)
			a_dir.open_read
			if a_dir.is_open_read then

				from a_dir.read_entry until a_dir.end_of_input loop
					a_name := a_dir.last_entry
					if
						not a_name.is_equal (file_system.relative_current_directory) and
						not a_name.is_equal (file_system.relative_parent_directory)
					then
						s := unix_file_system.pathname (a_directory_name, a_name)

							-- recurse for directories:
						if file_system.is_directory_readable (s) then
							scan_internal (s)
						else
								-- Handle files:
--!!							project.trace_debug ("filename: " + s + "%N")
							smatch := s.substring (directory_name.count + 2, s.count)	-- 2 because of '/'
--!!							project.trace_debug ("  trying to match: " + smatch + "%N")
							if include_wildcard = Void then
								if exclude_wildcard = Void or else not exclude_wildcard.recognizes (smatch) then
									add_fileset_entry_if_necessary (smatch)
								end
							elseif include_wildcard.recognizes (smatch) then
								if exclude_wildcard = Void or else not exclude_wildcard.recognizes (smatch) then
									add_fileset_entry_if_necessary (smatch)
								end
							end
						end
					end
					a_dir.read_entry
				end
				a_dir.close
			end
		end

	add_fileset_entry_if_necessary (a_filename: STRING) is
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
			an_filename := a_filename
			if map /= Void then
				an_mapped_filename := map.mapped_filename (an_filename)
			else
				an_mapped_filename := clone (an_filename)
			end
			if concat then
				an_mapped_filename := unix_file_system.pathname (directory_name, an_mapped_filename)
			end
			if force or else map = Void or else is_file_outofdate (an_filename, an_mapped_filename) then
				project.trace_debug ("  [*fileset] adding entry: [" + an_filename + ", " + an_mapped_filename + "]%N")
				!! a_entry.make (an_filename, an_mapped_filename)
				filenames.force_last (a_entry)
			end
		end

	is_file_outofdate (a_first_filename, a_second_filename: STRING): BOOLEAN is
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

	update_project_variables is
			-- Set project variable with name `filename_variable_name' to `item_filename' and
			-- project variable with name `mapped_filename_variable_name' to `item_mapped_filename'.
		do
			if not after then
				project.variables.set_variable_value (filename_variable_name, item_filename)
				project.variables.set_variable_value (mapped_filename_variable_name, item_mapped_filename)
			else
				project.variables.remove_variable (filename_variable_name)
				project.variables.remove_variable (mapped_filename_variable_name)
			end
		ensure
			project_variables_set: are_project_variables_up_to_date
		end

invariant

	filename_variable_name_not_void: filename_variable_name /= Void
	filename_variable_name_not_empty: filename_variable_name.count > 0
	mapped_filename_variable_name_not_void: mapped_filename_variable_name /= Void
	mapped_filename_variable_name_not_empty: mapped_filename_variable_name.count > 0

end -- class GEANT_FILESET
