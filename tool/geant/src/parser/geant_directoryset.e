note

	description:

		"Directorysets"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_DIRECTORYSET

inherit

	ANY

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Create a new directoryset.
		local
			a_tester: UC_STRING_EQUALITY_TESTER
		do
			project := a_project
			create {DS_HASH_SET [GEANT_FILESET_ENTRY]} directory_names.make_equal (20)
			create {DS_HASH_SET [STRING]} single_includes.make (20)
			create a_tester
			single_includes.set_equality_tester (a_tester)
			create {DS_HASH_SET [STRING]} single_excludes.make (20)
			single_excludes.set_equality_tester (a_tester)
			set_directory_name_variable_name ("fs.directoryname")
		ensure
			directory_name_variable_name_set: directory_name_variable_name.is_equal ("fs.directoryname")
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

feature -- Status report

	is_executable: BOOLEAN
			-- Can element be executed?
		do
			Result := (directory_name /= Void and then directory_name.count > 0)
			if not Result then
				project.log (<<"  [directoryset] error: attribute 'directory' is mandatory">>)
			end
			if Result then
				Result := include_wildcard = Void or else include_wildcard.is_compiled
				if not Result then
					project.log (<<"  [directoryset] error: attribute 'include' is not valid">>)
				end
			end
			if Result then
				Result := exclude_wildcard = Void or else exclude_wildcard.is_compiled
				if not Result then
					project.log (<<"  [directoryset] error: attribute 'exclude' is not valid">>)
				end
			end
		ensure
			directory_name_not_void: Result implies directory_name /= Void
			directory_name_not_empty: Result implies directory_name.count > 0
			include_wildcard_compiled: Result implies (include_wildcard = Void or else include_wildcard.is_compiled)
			exclude_wildcard_compiled: Result implies (exclude_wildcard = Void or else exclude_wildcard.is_compiled)
		end

feature -- Access

	directory_name: STRING
			-- Name of directory serving as root for recursive scanning

	include_wc_string: STRING
			-- Wildcard against which directory_names are matched for inclusion

	exclude_wc_string: STRING
			-- Wildcard against which directory_names are matched for exclusion

	convert_to_filesystem: BOOLEAN
			-- Is `item_directory_name' in the format of the current filesystem?
			-- Note: Result = false implies that `item_directory_name' is in unix format

	concat: BOOLEAN
			-- Should `directory_name' be prepended to matched directory_names?

	directory_name_variable_name: STRING
			-- Name of project variable to which `item_directory_name' is assigned to
			-- during iterations;
			-- default: 'fs.directoryname'

	is_empty: BOOLEAN
			-- Is set empty?
		do
			Result := directory_names.is_empty
		end

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := directory_names.after
		end

	item_directory_name: STRING
			-- Directoryname at current cursor
		require
			not_after: not after
		do
			if not convert_to_filesystem then
				Result := directory_names.item_for_iteration.filename
			else
				Result := directory_names.item_for_iteration.filename_converted
			end
		ensure
			item_directory_name_not_void: Result /= Void
		end

	are_project_variables_up_to_date: BOOLEAN
			-- If not `after': is project variable named `directory_name_variable_name'
			--   set to `item_directory_name'?
			-- If `after' is project variables named `directory_name_variable_name' not existing?
		do
			if not after then
				Result := project.variables.has (directory_name_variable_name) and then
					STRING_.same_string (project.variables.value (directory_name_variable_name),
						item_directory_name)
			else
				Result := not project.variables.has (directory_name_variable_name)
			end
		ensure
			directory_name_variable_name_exists: not after implies
				(Result implies project.variables.has (directory_name_variable_name))
			directory_name_variable_name_set: not after implies (Result implies
				STRING_.same_string (project.variables.value (directory_name_variable_name), item_directory_name))
			directory_name_variable_name_not_exists: after implies
				(Result implies not project.variables.has (directory_name_variable_name))
		end

feature -- Setting

	set_directory_name (a_directory_name: STRING)
			-- Set `directory_name' to `a_directory_name'.
		require
			directory_name_not_void: a_directory_name /= Void
		do
			directory_name := a_directory_name
		ensure
			directory_name_set: directory_name.is_equal (a_directory_name)
		end

	set_include_wc_string (a_include_wc_string: like include_wc_string)
			-- Set `include_wc_string' to `a_include_wc_string' and
			-- make a compiled version available in `include_wildcard'
		require
			a_include_wc_string_not_void : a_include_wc_string /= Void
			a_include_wc_string_not_empty: a_include_wc_string.count > 0
		do
			include_wc_string := a_include_wc_string
				-- Setup wildcard for include patterns:
			create {LX_DFA_WILDCARD} include_wildcard.compile (include_wc_string, True)
			if not include_wildcard.is_compiled then
				project.log (<<"  [directoryset] error: invalid include wildcard: '", include_wc_string, "%'">>)
			end
		ensure
			include_wc_string_set: include_wc_string = a_include_wc_string
		end

	set_exclude_wc_string (a_exclude_wc_string: like exclude_wc_string)
			-- Set `exclude_wc_string' to `a_exclude_wc_string' and
			-- make a compiled version available in `exclude_wildcard'
		require
			a_exclude_wc_string_not_void : a_exclude_wc_string /= Void
			a_exclude_wc_string_not_empty: a_exclude_wc_string.count > 0
		do
			exclude_wc_string := a_exclude_wc_string
				-- Setup wildcard for exclude patterns:
			create {LX_DFA_WILDCARD} exclude_wildcard.compile (exclude_wc_string, True)
			if not exclude_wildcard.is_compiled then
				project.log (<<"  [directoryset] error: invalid exclude wildcard: '", exclude_wc_string, "%'">>)
			end
		ensure
			exclude_wc_string_set: exclude_wc_string = a_exclude_wc_string
		end

	set_convert_to_filesystem (b: BOOLEAN)
			-- Set `convert_to_filesystem' to `b'.
			-- Note: `convert_to_filesystem' should be set only once.
			-- Therefore this is a once command.
		once
			convert_to_filesystem := b
		ensure
			convert_to_filesystem_set: convert_to_filesystem = b
		end

	set_concat (b: BOOLEAN)
			-- Set `concat' to `b'.
		do
			concat := b
		ensure
			concat_set: concat = b
		end

	set_directory_name_variable_name (a_directory_name_variable_name: STRING)
			-- Set `directory_name_variable_name' to `a_directory_name_variable_name'.
		require
			a_directory_name_variable_name_not_void: a_directory_name_variable_name /= Void
			a_directory_name_variable_name_not_empty: a_directory_name_variable_name.count > 0
		do
			directory_name_variable_name := a_directory_name_variable_name
		ensure
			directory_name_variable_name_set: directory_name_variable_name = a_directory_name_variable_name
		end

feature -- Element change

	add_fileset_entry_if_necessary (a_directory_name: STRING)
			-- Add new GEANT_FILESET_ENTRY created from `a_directory_name'
			-- to `directory_names'.
		require
			a_directory_name_not_void: a_directory_name /= Void
			a_directory_name_not_empty: a_directory_name.count > 0
		local
			a_entry: GEANT_FILESET_ENTRY
			an_directory_name: STRING
		do
			if concat then
				an_directory_name := unix_file_system.pathname (directory_name, a_directory_name)
			else
				an_directory_name := a_directory_name
			end
			project.trace_debug (<<"  [*directoryset] adding: '", an_directory_name, "%'">>)
			create a_entry.make (an_directory_name, an_directory_name)
			directory_names.force_last (a_entry)
		end

	remove_fileset_entry (a_directory_name: STRING)
			-- Remove entry with name equal to `a_directory_name' if existing.
		local
			a_entry: GEANT_FILESET_ENTRY
		do
			project.trace_debug (<<"  [*directoryset] removing: '", a_directory_name, "%'">>)
			create a_entry.make (a_directory_name, a_directory_name)
			directory_names.remove (a_entry)
		end

	add_single_include (a_directory_name: STRING)
			-- Add `a_directory_name' to list of single directory_names to include into fileset.
		require
			a_directory_name_not_void: a_directory_name /= Void
		do
			single_includes.force_last (a_directory_name)
		end

	add_single_exclude (a_directory_name: STRING)
			-- Add `a_directory_name' to list of single directory_names to exclude from fileset.
		require
			a_directory_name_not_void: a_directory_name /= Void
		do
			single_excludes.force_last (a_directory_name)
		end

feature -- Cursor movement

	start
			-- Move cursor to first position.
		do
			directory_names.start
			update_project_variables
		ensure
			empty_behavior: is_empty implies after
			project_variables_up_to_date: are_project_variables_up_to_date
		end

	forth
	   		-- Move cursor to next position.
		require
			not_after: not after
		do
			directory_names.forth
			update_project_variables
		ensure
			project_variables_up_to_date: are_project_variables_up_to_date
		end

feature -- Execution

	execute
			-- Populate `directory_names'.
		local
			al_directory_name: STRING
			cs: DS_SET_CURSOR [STRING]
		do
			project.trace_debug (<<"  [*directoryset] directory_name: ", directory_name>>)
			if include_wc_string /= Void then
				project.trace_debug (<<"  [*directoryset] include_wc_string: ", include_wc_string>>)
			end
			al_directory_name := unix_file_system.canonical_pathname (directory_name)
				-- Add entries from filesystem scan:
			scan_internal (al_directory_name)
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
					project.trace_debug (<<"  [*directoryset] entry: [", item_directory_name, "]">>)
					forth
				end
			end
		end

	include_wildcard: LX_WILDCARD
			-- Expression defining directory_names for inclusion

	exclude_wildcard: LX_WILDCARD
			-- Expression defining directory_names for exclusion

feature {NONE} -- Implementation/Access

	directory_names: DS_SET [GEANT_FILESET_ENTRY]
			-- Directories underneath directory named `directory_name'
			-- matching expressions in `include_wc_string' and not matching
			-- expressions in `exclude_wc_string';
			-- available after execute has been performed.

	single_includes: DS_SET [STRING]
			-- Directory_names to be included in `directory_names'

	single_excludes: DS_SET [STRING]
			-- Directory_names to be excluded from `directory_names'

feature {NONE} -- Implementation/Processing

	scan_internal (a_directory_name: STRING)
			-- Scan directory named `directory_name' recursivley;
			-- put directory_names found matching `include_wildcard' and not matching
			-- `exclude_wildcard' into `directory_names';
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
								-- Handle files:
--!!				project.trace_debug (<<"directoryname: ", s>>)
							smatch := s.substring (directory_name.count + 2, s.count)	-- 2 because of '/'
--!!				project.trace_debug (<<"  trying to match: ", smatch>>)
							if include_wildcard /= Void and then include_wildcard.recognizes (smatch) then
								add_fileset_entry_if_necessary (smatch)
							end
							if exclude_wildcard /= Void and then exclude_wildcard.recognizes (smatch) then
								remove_fileset_entry (smatch)
							end
							scan_internal (s)
						else
							-- Files are not handled
						end
					end
					a_dir.read_entry
				end
				a_dir.close
			end
		end

	update_project_variables
			-- Set project variable with name `directory_name_variable_name' to `item_directory_name'.
		do
			if not after then
				project.variables.set_variable_value (directory_name_variable_name, item_directory_name)
			else
				project.variables.remove (directory_name_variable_name)
			end
		ensure
			project_variables_set: are_project_variables_up_to_date
		end

invariant

	directory_name_variable_name_not_void: directory_name_variable_name /= Void
	directory_name_variable_name_not_empty: directory_name_variable_name.count > 0

end
