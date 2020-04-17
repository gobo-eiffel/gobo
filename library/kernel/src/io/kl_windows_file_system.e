note

	description:

		"Windows-like file systems"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_WINDOWS_FILE_SYSTEM

inherit

	KL_FILE_SYSTEM
		redefine
			make,
			same_canonical_pathnames,
			is_canonical_subpathname
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new windows file system object.
			-- Accept both \ and / directory separators
			-- as input, and use \ as output.
		do
		end

feature -- File handling

	new_input_file (a_name: STRING): KL_WINDOWS_INPUT_FILE
			-- New input text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create Result.make (a_name)
		end

	new_output_file (a_name: STRING): KL_WINDOWS_OUTPUT_FILE
			-- New output text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create Result.make (a_name)
		end

	eol: STRING = "%R%N"
			-- Line separator in current file system

feature -- Pathname handling

	is_absolute_pathname (a_pathname: STRING): BOOLEAN
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
			if nb >= 4 and then is_directory_separator (a_pathname.item (1)) then
					-- Maybe of the form \\hostname\foobar
				if is_directory_separator (a_pathname.item (2)) and not is_directory_separator (a_pathname.item (3)) then
					from
						i := 4
					until
						i > nb or Result
					loop
						c := a_pathname.item (i)
						if is_directory_separator (c) then
							Result := True
						else
							i := i + 1
						end
					end
				end
			elseif nb >= 3 then
					-- Maybe of the form C:\foobar
				c := a_pathname.item (1)
				if not is_directory_separator (c) and c /= ':' then
					from
						i := 2
					until
						i > nb or stop or found
					loop
						c := a_pathname.item (i)
						if is_directory_separator (c) then
							stop := True
						elseif c = ':' then
							found := True
						else
							i := i + 1
						end
					end
					if found and i < nb then
						c := a_pathname.item (i + 1)
						Result := is_directory_separator (c)
					end
				end
			end
		end

	is_relative_pathname (a_pathname: STRING): BOOLEAN
			-- Is `a_pathname' a relative pathname (relative
			-- to the current working directory)?
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		do
			if not is_absolute_pathname (a_pathname) then
				Result := (a_pathname.count = 0 or else not is_directory_separator (a_pathname.item (1)))
			end
		end

	is_root_directory (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a root directory (i.e. it has no parent directory)?
			-- (`a_dirname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			stop, found: BOOLEAN
			c: CHARACTER
		do
			nb := a_dirname.count
			if nb >= 4 and then is_directory_separator (a_dirname.item (1)) then
					-- Maybe of the form \\hostname\rootdir
					-- Note that \\hostname and \\hostname\\rootdir are not
					-- valid Windows pathname, but \\hostname\rootdir\ and
					-- \\hostname\rootdir\\ are.
				if is_directory_separator (a_dirname.item (2)) and not is_directory_separator (a_dirname.item (3)) then
					from
						i := 4
					until
						i > nb or found
					loop
						c := a_dirname.item (i)
						if is_directory_separator (c) then
							found := True
						else
							i := i + 1
						end
					end
					if found then
						if i < nb and then not is_directory_separator (a_dirname.item (i + 1)) then
							from
								found := False
								i := i + 1
							until
								i > nb or found
							loop
								c := a_dirname.item (i)
								if is_directory_separator (c) then
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
									c := a_dirname.item (i)
									if not is_directory_separator (c) then
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
				if not is_directory_separator (c) and c /= ':' then
					from
						i := 2
					until
						i > nb or stop or found
					loop
						c := a_dirname.item (i)
						if is_directory_separator (c) then
							stop := True
						elseif c = ':' then
							found := True
						else
							i := i + 1
						end
					end
					if found and (i + 1 = nb) then
						c := a_dirname.item (nb)
						Result := is_directory_separator (c)
					end
				end
			elseif nb = 1 then
					-- Note that \\ is not a valid Windows pathname.
				c := a_dirname.item (1)
				Result := is_directory_separator (c)
			end
		end

	same_pathnames (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Are `a_pathname1' and `a_pathname2' considered equal when
			-- viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		local
			p1, p2: KI_PATHNAME
		do
			p1 := string_to_pathname (a_pathname1)
			p2 := string_to_pathname (a_pathname2)
			Result := p1.same_case_insensitive (p2)
		end

	same_canonical_pathnames (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Are the canonical versions of `a_pathname1' and `a_pathname2'
			-- considered equal when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		local
			p1, p2: KI_PATHNAME
		do
			p1 := string_to_pathname (a_pathname1)
			p2 := string_to_pathname (a_pathname2)
			p1.set_canonical
			p2.set_canonical
			Result := p1.same_case_insensitive (p2)
		end

	is_subpathname (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Is `a_pathname1' considered as a subpathname of `a_pathname2'
			-- when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		local
			p1, p2: KI_PATHNAME
		do
			p1 := string_to_pathname (a_pathname1)
			p2 := string_to_pathname (a_pathname2)
			Result := p1.is_case_insensitive_subpathname (p2)
		end

	is_canonical_subpathname (a_pathname1, a_pathname2: STRING): BOOLEAN
			-- Is the canonical version of `a_pathname1' considered as
			-- a subpathname of the canonical version of `a_pathname2'
			-- when viewed from the current file system?
			-- (`a_pathname1' and `a_pathname2' should follow
			-- the pathname convention of the underlying
			-- platform. For pathname conversion use
			-- KI_FILE_SYSTEM.pathname_from_file_system.)
			--
			-- Note that pathnames may be considered equal when viewed
			-- from one file system but not from another. For example
			-- Windows is case-insensitive, but Unix is case-sensitive.
		local
			p1, p2: KI_PATHNAME
		do
			p1 := string_to_pathname (a_pathname1)
			p2 := string_to_pathname (a_pathname2)
			p1.set_canonical
			p2.set_canonical
			Result := p1.is_case_insensitive_subpathname (p2)
		end

	basename (a_pathname: STRING): STRING
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
					i < 1 or else not is_directory_separator (a_pathname.item (i))
				loop
					i := i - 1
				end
				nb := i
				from
				until
					i < 1 or else is_directory_separator (a_pathname.item (i))
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

	dirname (a_pathname: STRING): STRING
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
					i < 1 or else not is_directory_separator (a_pathname.item (i))
				loop
					i := i - 1
				end
				from
				until
					i < 1 or else is_directory_separator (a_pathname.item (i))
				loop
					i := i - 1
				end
				if i < 1 then
					Result := relative_current_directory
				else
					from
					until
						i < 1 or else not is_directory_separator (a_pathname.item (i))
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

	pathname (a_dirname, a_pathname: STRING): STRING
			-- Pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the Windows pathname
			-- convention. The result also follows this pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			nb: INTEGER
		do
			Result := a_dirname.twin
			if a_pathname.count > 0 then
				nb := Result.count
				if nb > 0 and then not is_directory_separator (Result.item (nb)) then
					Result.append_character (directory_separator)
				end
				Result := STRING_.appended_string (Result, a_pathname)
			end
		end

	append_pathname_to_string (a_dirname, a_pathname, a_string: STRING)
			-- Append to `a_string' the pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the pathname convention
			-- of current file system: Unix convention in KL_UNIX_FILE_SYSTEM,
			-- Windows convention in KL_WINDOWS_FILE_SYSTEM, etc. The
			-- result also follows this pathname convention. For pathname
			-- conversion use `pathname_from_file_system'.)
		local
			nb: INTEGER
		do
			a_string.append_string (a_dirname)
			if a_pathname.count > 0 then
				nb := a_string.count
				if nb > 0 and then not is_directory_separator (a_string.item (nb)) then
					a_string.append_character (directory_separator)
				end
				a_string.append_string (a_pathname)
			end
		end

	nested_pathname (a_dirname: STRING; a_pathnames: ARRAY [STRING]): STRING
			-- Pathname made up of relative pathnames
			-- `a_pathnames' in directory `a_dirname'
			-- (`a_dirname' and `a_pathnames' should follow the Windows pathname
			-- convention. The result also follows this pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb, k: INTEGER
			a_pathname: STRING
		do
			Result := a_dirname.twin
			i := a_pathnames.lower
			nb := a_pathnames.upper
			from
			until
				i > nb
			loop
				a_pathname := a_pathnames.item (i)
				if a_pathname.count > 0 then
					k := Result.count
					if k > 0 and then not is_directory_separator (Result.item (k)) then
						Result.append_character (directory_separator)
					end
					Result := STRING_.appended_string (Result, a_pathname)
				end
				i := i + 1
			end
		end

	relative_current_directory: STRING = "."
			-- Relative pathname of current directory
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)

	relative_parent_directory: STRING = ".."
			-- Relative pathname of current parent directory
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)

	root_directory: STRING
			-- Pathname of current root directory;
			-- Does not include current drive (please
			-- use `absolute_root_directory' otherwise)
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		once
			Result := "\"
		end

	absolute_pathname (a_pathname: STRING): STRING
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

	absolute_parent_directory (a_pathname: STRING): STRING
			-- Absolute pathname of parent directory of `a_pathname';
			-- If `a_pathname' is a root directory (i.e. has no parent)
			-- then return `a_pathname' itself if it is an absolute pathname,
			-- or `absolute_root_directory' if it is a relative pathname
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			an_absolute_pathname: STRING
			a_basename: STRING
			stop: BOOLEAN
			l_absolute: BOOLEAN
		do
			from
				if is_absolute_pathname (a_pathname) then
					an_absolute_pathname := a_pathname
					l_absolute := True
				elseif is_relative_pathname (a_pathname) then
					an_absolute_pathname := pathname (cwd, a_pathname)
				else
					an_absolute_pathname := STRING_.concat (current_drive, a_pathname)
				end
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
			if is_root_directory (an_absolute_pathname) then
				if l_absolute then
					Result := a_pathname
				else
					Result := absolute_root_directory
				end
			else
				Result := dirname (an_absolute_pathname)
			end
		end

	absolute_root_directory: STRING
			-- Absolute pathname of current root directory;
			-- Includes current drive letter
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		do
			Result := STRING_.concat (current_drive, root_directory)
		end

	string_to_pathname (a_pathname: STRING): KL_PATHNAME
			-- Convert string to pathname
			-- (`a_pathname' should follow the Windows pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			j, k: INTEGER
			str: STRING
			has_hostname: BOOLEAN
			has_sharename: BOOLEAN
			has_drive: BOOLEAN
		do
			create Result.make
			Result.set_relative (True)
			nb := a_pathname.count
			if nb > 2 and then (is_directory_separator (a_pathname.item (1)) and is_directory_separator (a_pathname.item (2))) then
				has_hostname := True
				Result.set_relative (False)
				i := 3
			elseif nb > 0 and then is_directory_separator (a_pathname.item (1)) then
				Result.set_relative (False)
				i := 2
			else
				has_drive := True
				i := 1
			end
			from
			until
				i > nb
			loop
				from
				until
					i > nb or else not is_directory_separator (a_pathname.item (i))
				loop
					i := i + 1
				end
				if i <= nb then
					j := i
					from
					until
						i > nb or else is_directory_separator (a_pathname.item (i))
					loop
						i := i + 1
					end
					k := i - 1
					str := a_pathname.substring (j, k)
					if STRING_.same_string (str, relative_current_directory) then
						Result.append_current
						has_sharename := False
					elseif STRING_.same_string (str, relative_parent_directory) then
						Result.append_parent
						has_sharename := False
					elseif has_hostname then
						Result.set_hostname (str)
						has_sharename := True
					elseif has_sharename then
						Result.set_sharename (str)
						has_sharename := False
					elseif has_drive then
						check
							str_not_empty: str.count > 0
						end
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

	pathname_to_string (a_pathname: KI_PATHNAME): STRING
			-- Convert pathname to string
			-- (The result follows the Windows pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			a_drive: detachable STRING
			a_hostname: detachable STRING
			a_sharename: detachable STRING
		do
			create Result.make (50)
			nb := a_pathname.count
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
					a_sharename := a_pathname.sharename
					if a_sharename /= Void then
						Result := STRING_.appended_string (Result, a_sharename)
						if nb > 0 then
							Result.append_character (directory_separator)
						end
					end
				elseif not a_pathname.is_relative then
					Result := STRING_.appended_string (Result, root_directory)
				end
			end
			from
				i := 1
			until
				i >= nb
			loop
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

	has_extension (a_filename, an_extension: STRING): BOOLEAN
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

	extension (a_filename: STRING): STRING
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
				if i = 0 then
					stop := True
				end
			until
				found or stop
			loop
				c := a_filename.item (i)
				if c = '.' then
					found := True
				elseif is_directory_separator (c) then
					stop := True
				elseif i = 1 then
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

	exe_extension: STRING = ".exe"
			-- Executable file extension ('.exe' under Windows)

	is_directory_separator (c: CHARACTER): BOOLEAN
			-- Is `c' a directory separator?
		do
			Result := (c = directory_separator or c = secondary_directory_separator)
		ensure
			instance_free: class
			definition: Result = (c = directory_separator or c = secondary_directory_separator)
		end

	directory_separator: CHARACTER = '\'
			-- Primary directory separator

	secondary_directory_separator: CHARACTER
			-- Secondary directory separator
		once
			Result := '/'
		ensure
			instance_free: class
		end

	current_drive: STRING
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
				i > nb or else is_directory_separator (a_dirname.item (i))
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
