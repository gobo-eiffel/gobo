indexing

	description:

		"Fileset"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


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
			!DS_HASH_SET [STRING]! filenames.make_equal (20)
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

feature -- Status report

	is_executable: BOOLEAN is
			-- Can element be executed?
		do
			Result := (directory_name /= Void and then directory_name.count > 0) and then
				include_wildcard.compiled and then exclude_wildcard.compiled

		ensure
			directory_name_not_void: Result implies directory_name /= Void
			directory_name_not_empty: Result implies directory_name.count > 0
			include_wildcard_compiled: Result implies include_wildcard.compiled
			exclude_wildcard_compiled: Result implies exclude_wildcard.compiled
		end

feature -- Access

	directory_name: STRING
			-- Name of directory serving as root for recursive scanning

	include_wc_string: STRING
			-- Wildcard against which filenames are matched for inclusion

	exclude_wc_string: like include_wc_string
			-- Wildcard against which filenames are matched for exclusion

	filenames: DS_SET [STRING]
			-- Set of names of files underneath directory named `directory_name'
			-- matching expressions in `include_wc_string' and not matching
			-- expressions in `exclude_wc_string';
			-- available after execute has been performed.

	map: GEANT_MAP
			-- Map for filenames

	has_map: BOOLEAN is
			-- Does current fileset have a map?
		do
			Result := map /= Void
		ensure
			definition: Result = (map /= Void)
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

	set_map (a_map: like map) is
			-- Set `map' to `a_map'.
		require
			a_map_not_void: a_map /= Void
		do
			map := a_map
		ensure
			map_set: map = a_map
		end

feature -- Execution

	execute is
			-- Populate `filenames'.
		do
			project.trace_debug ("[fileset] directory_name: " + directory_name + "%N")
			project.trace_debug ("[fileset] include_wc_string: " + include_wc_string + "%N")
			scan_internal (directory_name)
		end

feature {NONE} -- Implementation/Access

	include_wildcard: LX_WILDCARD
		-- Expression defining filenames for inclusion;
		-- if Void all filenames found underneath directory
		-- named `directory_name' will be included

	exclude_wildcard: LX_WILDCARD
		-- Expression defining filenames for exclusion

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
							-- remove possibly leading './':
						s := unix_file_system.canonical_pathname (a_directory_name)
						if a_directory_name.is_equal (file_system.relative_current_directory) then
							s := clone ("")
						end
						s := unix_file_system.pathname (s, a_name)
						if file_system.is_directory_readable (s) then
							scan_internal (s)
						else
								-- Handle files:
--!!							project.trace_debug ("filename: " + s + "%N")
							smatch := s.substring (directory_name.count + 2, s.count)	-- 2 because of '/'
--!!							project.trace_debug ("  trying to match: " + smatch + "%N")
							if include_wildcard = Void then
								if exclude_wildcard = Void or else not exclude_wildcard.recognizes (smatch) then
									project.trace_debug ("[fileset] adding filename: " + smatch + "%N")
									filenames.force_last (s)
								end
							elseif include_wildcard.recognizes (smatch) then
								if exclude_wildcard = Void or else not exclude_wildcard.recognizes (smatch) then
									project.trace_debug ("[fileset] adding filename: " + smatch + "%N")
									filenames.force_last (smatch)
								end
							end
						end
					end
					a_dir.read_entry
				end
				a_dir.close
			end
		end

end -- class GEANT_FILESET

