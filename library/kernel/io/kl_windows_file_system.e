indexing

	description:

		"Windows-like file systems"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_WINDOWS_FILE_SYSTEM

inherit

	KL_FILE_SYSTEM

create

	make

feature -- File handling

	new_input_file (a_name: STRING): KL_WINDOWS_INPUT_FILE is
			-- New input text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create Result.make (a_name)
		end

	new_output_file (a_name: STRING): KL_WINDOWS_OUTPUT_FILE is
			-- New output text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create Result.make (a_name)
		end

	eol: STRING is "%R%N"
			-- Line separator in current file system

feature -- Pathname handling

	is_absolute_pathname (a_pathname: STRING): BOOLEAN is
			-- Is `a_pathname' an absolute pathname (it needs
			-- to include the drive letter or the hostname)?
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			stop, found: BOOLEAN
			c: CHARACTER
		do
			nb := a_pathname.count
			if nb >= 4 and then a_pathname.item (1) = directory_separator then
					-- Maybe of the form \\hostname\foobar
				if
					a_pathname.item (2) = directory_separator and
					a_pathname.item (3) /= directory_separator
				then
					from
						i := 4
					until
						i > nb or Result
					loop
						if a_pathname.item (i) = directory_separator then
							Result := True
						else
							i := i + 1
						end
					end
				end
			elseif nb >= 3 then
					-- Maybe of the form C:\foobar
				c := a_pathname.item (1)
				if c /= directory_separator and c /= ':' then
					from
						i := 2
					until
						i > nb or stop or found
					loop
						inspect a_pathname.item (i)
						when directory_separator then
							stop := True
						when ':' then
							found := True
						else
							i := i + 1
						end
					end
					if found and i < nb then
						Result := (a_pathname.item (i + 1) = directory_separator)
					end
				end
			end
		end

	is_relative_pathname (a_pathname: STRING): BOOLEAN is
			-- Is `a_pathname' a relative pathname (relative
			-- to the current working directory)?
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		do
			if not is_absolute_pathname (a_pathname) then
				Result := (a_pathname.count = 0 or else a_pathname.item (1) /= directory_separator)
			end
		end

	is_root_directory (a_dirname: STRING): BOOLEAN is
			-- Is `a_dirname' a root directory (i.e. it has no parent directory)?
			-- (`a_dirname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			stop, found: BOOLEAN
			c: CHARACTER
		do
			nb := a_dirname.count
			if nb >= 4 and then a_dirname.item (1) = directory_separator then
					-- Maybe of the form \\hostname\rootdir
					-- Note that \\hostname and \\hostname\\rootdir are not
					-- valid Windows pathname, but \\hostname\rootdir\ and
					-- \\hostname\rootdir\\ are.
				if
					a_dirname.item (2) = directory_separator and
					a_dirname.item (3) /= directory_separator
				then
					from
						i := 4
					until
						i > nb or found
					loop
						if a_dirname.item (i) = directory_separator then
							found := True
						else
							i := i + 1
						end
					end
					if found then
						if i < nb and then a_dirname.item (i + 1) /= directory_separator then
							from
								found := False
								i := i + 1
							until
								i > nb or found
							loop
								if a_dirname.item (i) = directory_separator then
									found := True
								else
									i := i + 1
								end
							end
							if found then
									-- \\hostname\rootdir\
								from
									found := False
									i := i + 1
								until
									i > nb or found
								loop
									if a_dirname.item (i) /= directory_separator then
										found := True
									else
										i := i + 1
									end
								end
								Result := not found
							else
									-- \\hostname\rootdir
								Result := True
							end
						end
					end
				end
			elseif nb >= 3 then
					-- Maybe of the form C:\.
					-- Note that C:\\ is not a valid Windows pathname.
				c := a_dirname.item (1)
				if c /= directory_separator and c /= ':' then
					from
						i := 2
					until
						i > nb or stop or found
					loop
						inspect a_dirname.item (i)
						when directory_separator then
							stop := True
						when ':' then
							found := True
						else
							i := i + 1
						end
					end
					if found and (i + 1 = nb) then
						Result := (a_dirname.item (nb) = directory_separator)
					end
				end
			elseif nb = 1 then
					-- Note that \\ is not a valid Windows pathname.
				Result := (a_dirname.item (1) = directory_separator)
			end
		end

	basename (a_pathname: STRING): STRING is
			-- Pathname with any leading directory components removed
			-- (`a_pathname' should follow the Windows pathname convention.
			-- The result also follows this pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
		do
				-- TODO: Try to re-implement this routine with a forward traversal to
				-- have better performances when `a_pathname' is a UC_STRING. (ericb)
			if is_root_directory (a_pathname) then
				Result := root_directory
			else
				from
					i := a_pathname.count
				until
					i < 1 or else
					a_pathname.item (i) /= directory_separator
				loop
					i := i - 1
				end
				nb := i
				from
				until
					i < 1 or else
					a_pathname.item (i) = directory_separator
				loop
					i := i - 1
				end
				if i < 1 and nb = a_pathname.count then
					Result := a_pathname
				else
					Result := a_pathname.substring (i + 1, nb)
				end
			end
		end

	dirname (a_pathname: STRING): STRING is
			-- Pathname containing only the leading directory components so
			-- that 'pathname (dirname (a_pathname), basename (a_pathname))'
			-- is equivalent to `a_pathname'; Return `relative_current_directory'
			-- when there is no leading directory components in `a_pathname';
			-- Return a root directory when `a_pathname' is a root directory
			-- (`a_pathname' should follow the Windows pathname convention.
			-- The result also follows this pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		local
			i: INTEGER
		do
				-- TODO: Try to re-implement this routine with a forward traversal to
				-- have better performances when `a_pathname' is a UC_STRING. (ericb)
			if is_root_directory (a_pathname) then
				Result := a_pathname
			else
				from
					i := a_pathname.count
				until
					i < 1 or else
					a_pathname.item (i) /= directory_separator
				loop
					i := i - 1
				end
				from
				until
					i < 1 or else
					a_pathname.item (i) = directory_separator
				loop
					i := i - 1
				end
				if i < 1 then
					Result := relative_current_directory
				else
					from
					until
						i < 1 or else
						a_pathname.item (i) /= directory_separator
					loop
						i := i - 1
					end
					if i < 1 then
						Result := root_directory
					else
						if a_pathname.item (i) = ':' and then i < a_pathname.count then
								-- We have something like that: "C:\foobar", so
								-- the result is "C:\" and not just "C:".
							Result := a_pathname.substring (1, i + 1)
						else
							Result := a_pathname.substring (1, i)
						end
					end
				end
			end
		end

	pathname (a_dirname, a_pathname: STRING): STRING is
			-- Pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the Windows pathname
			-- convention. The result also follows this pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			nb: INTEGER
		do
			Result := STRING_.cloned_string (a_dirname)
			if a_pathname.count > 0 then
				nb := Result.count
				if nb > 0 and then Result.item (nb) /= directory_separator then
					Result.append_character (directory_separator)
				end
				Result := STRING_.appended_string (Result, a_pathname)
			end
		end

	nested_pathname (a_dirname: STRING; a_pathnames: ARRAY [STRING]): STRING is
			-- Pathname made up of relative pathnames
			-- `a_pathnames' in directory `a_dirname'
			-- (`a_dirname' and `a_pathnames' should follow the Windows pathname
			-- convention. The result also follows this pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb, k: INTEGER
			a_pathname: STRING
		do
			Result := STRING_.cloned_string (a_dirname)
			i := a_pathnames.lower
			nb := a_pathnames.upper
			from until i > nb loop
				a_pathname := a_pathnames.item (i)
				if a_pathname.count > 0 then
					k := Result.count
					if k > 0 and then Result.item (k) /= directory_separator then
						Result.append_character (directory_separator)
					end
					Result := STRING_.appended_string (Result, a_pathname)
				end
				i := i + 1
			end
		end

	relative_current_directory: STRING is "."
			-- Relative pathname of current directory
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)

	relative_parent_directory: STRING is ".."
			-- Relative pathname of current parent directory
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)

	root_directory: STRING is
			-- Pathname of current root directory;
			-- Does not include current drive (please
			-- use `absolute_root_directory' otherwise)
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		once
			Result := "\"
		end

	absolute_pathname (a_pathname: STRING): STRING is
			-- Absolute pathname of `a_pathname'
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		do
			if is_absolute_pathname (a_pathname) then
				Result := a_pathname
			elseif is_relative_pathname (a_pathname) then
				Result := pathname (cwd, a_pathname)
			else
				Result := STRING_.concat (current_drive, a_pathname)
			end
		end

	absolute_parent_directory (a_pathname: STRING): STRING is
			-- Absolute pathname of parent directory of `a_pathname';
			-- Return `absolute_root_directory' if `a_pathname'
			-- is a root directory (i.e. has no parent)
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			an_absolute_pathname: STRING
			a_basename: STRING
			stop: BOOLEAN
		do
			from
				an_absolute_pathname := absolute_pathname (a_pathname)
			until
				stop
			loop
				a_basename := basename (an_absolute_pathname)
				if STRING_.same_string (a_basename, relative_current_directory) then
					an_absolute_pathname := dirname (an_absolute_pathname)
				elseif STRING_.same_string (a_basename, relative_parent_directory) then
					an_absolute_pathname := absolute_parent_directory (dirname (an_absolute_pathname))
				else
					stop := True
				end
			end
			an_absolute_pathname := dirname (an_absolute_pathname)
			if is_root_directory (an_absolute_pathname) then
				Result := absolute_root_directory
			else
				Result := an_absolute_pathname
			end
		end

	absolute_root_directory: STRING is
			-- Absolute pathname of current root directory;
			-- Includes current drive letter
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		do
			Result := STRING_.concat (current_drive, root_directory)
		end

	string_to_pathname (a_pathname: STRING): KL_PATHNAME is
			-- Convert string to pathname
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			j, k: INTEGER
			str: STRING
			has_hostname: BOOLEAN
			has_drive: BOOLEAN
		do
			create Result.make
			Result.set_relative (True)
			nb := a_pathname.count
			if
				nb > 2 and then
				(a_pathname.item (1) = directory_separator and
				a_pathname.item (2) = directory_separator)
			then
				has_hostname := True
				Result.set_relative (False)
				i := 3
			elseif
				nb > 0 and then
				a_pathname.item (1) = directory_separator
			then
				Result.set_relative (False)
				i := 2
			else
				has_drive := True
				i := 1
			end
			from until i > nb loop
				from
				until
					i > nb or else
					a_pathname.item (i) /= directory_separator
				loop
					i := i + 1
				end
				if i <= nb then
					j := i
					from
					until
						i > nb or else
						a_pathname.item (i) = directory_separator
					loop
						i := i + 1
					end
					k := i - 1
					str := a_pathname.substring (j, k)
					if STRING_.same_string (str, relative_current_directory) then
						Result.append_current
					elseif STRING_.same_string (str, relative_parent_directory) then
						Result.append_parent
					elseif has_hostname then
						Result.set_hostname (str)
					elseif has_drive then
						check str_not_empty: str.count > 0 end
						if str.item (str.count) = ':' then
							Result.set_drive (str)
							Result.set_relative (False)
						else
							Result.append_name (str)
						end
					else
						Result.append_name (str)
					end
					has_hostname := False
					has_drive := False
				end
			end
		end

	pathname_to_string (a_pathname: KI_PATHNAME): STRING is
			-- Convert pathname to string
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			a_drive: STRING
			a_hostname: STRING
		do
			create Result.make (50)
			a_drive := a_pathname.drive
			if a_drive /= Void then
				Result := STRING_.appended_string (Result, a_drive)
				Result.append_character (directory_separator)
			else
				a_hostname := a_pathname.hostname
				if a_hostname /= Void then
					Result.append_character (directory_separator)
					Result.append_character (directory_separator)
					Result := STRING_.appended_string (Result, a_hostname)
					Result.append_character (directory_separator)
				elseif not a_pathname.is_relative then
					Result := STRING_.appended_string (Result, root_directory)
				end
			end
			nb:= a_pathname.count
			from i := 1 until i >= nb loop
				if a_pathname.is_current (i) then
					Result := STRING_.appended_string (Result, relative_current_directory)
				elseif a_pathname.is_parent (i) then
					Result := STRING_.appended_string (Result, relative_parent_directory)
				else
					Result := STRING_.appended_string (Result, a_pathname.item (i))
				end
				Result.append_character (directory_separator)
				i := i + 1
			end
			if i = nb then
				if a_pathname.is_current (i) then
					Result := STRING_.appended_string (Result, relative_current_directory)
				elseif a_pathname.is_parent (i) then
					Result := STRING_.appended_string (Result, relative_parent_directory)
				else
					Result := STRING_.appended_string (Result, a_pathname.item (i))
				end
			end
		end

	has_extension (a_filename, an_extension: STRING): BOOLEAN is
			-- Is `an_extension' a file extension of `a_filename'?
			-- (`a_filename' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			nb, nb2: INTEGER
		do
			nb := an_extension.count
			if nb = 0 then
				Result := True
			else
				nb2 := a_filename.count
				if nb2 >= nb then
					Result := STRING_.same_string (a_filename.substring (nb2 - nb + 1, nb2), an_extension)
				end
			end
		end

	extension (a_filename: STRING): STRING is
			-- File extension of `a_filename' (include the leading '.')
			-- (`a_filename' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i: INTEGER
			c: CHARACTER
			found, stop: BOOLEAN
		do
				-- TODO: Try to re-implement this routine with a forward traversal to
				-- have better performances when `a_filename' is a UC_STRING. (ericb)
			from
				i := a_filename.count
			until
				found or stop
			loop
				c := a_filename.item (i)
				if c = '.' then
					found := True
				elseif c = directory_separator then
					stop := True
				else
					i := i - 1
				end
			end
			if found then
				Result := a_filename.substring (i, a_filename.count)
			else
				Result := ""
			end
		end

	exe_extension: STRING is ".exe"
			-- Executable file extension ('.exe' under Windows)

	directory_separator: CHARACTER is '\'
			-- Directory separator

	current_drive: STRING is
			-- Current drive (include the ':' but not the '\')
		require
			is_current_file_system: is_current_file_system
		local
			a_dirname: STRING
			i, nb: INTEGER
		do
			a_dirname := cwd
			nb := a_dirname.count
			from
				i := 1
			until
				i > nb or else
				a_dirname.item (i) = directory_separator
			loop
				i := i + 1
			end
			if i > 1 and i <= nb then
				Result := a_dirname.substring (1, i - 1)
			else
				Result := ""
			end
		ensure
			current_drive_not_void: Result /= Void
		end

end
