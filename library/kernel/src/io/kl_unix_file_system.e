note

	description:

		"Unix-like file systems"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_UNIX_FILE_SYSTEM

inherit

	KL_FILE_SYSTEM
		redefine
			same_canonical_pathnames,
			is_canonical_subpathname
		end

create

	make

feature -- File handling

	new_input_file (a_name: STRING): KL_UNIX_INPUT_FILE
			-- New input text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create Result.make (a_name)
		end

	new_output_file (a_name: STRING): KL_UNIX_OUTPUT_FILE
			-- New output text file in current file system
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create Result.make (a_name)
		end

	eol: STRING = "%N"
			-- Line separator in current file system

feature -- Pathname handling

	is_absolute_pathname (a_pathname: STRING): BOOLEAN
			-- Is `a_pathname' an absolute pathname?
			-- (`a_pathname' should follow the Unix pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		do
			Result := (a_pathname.count > 0 and then a_pathname.item (1) = directory_separator)
		end

	is_relative_pathname (a_pathname: STRING): BOOLEAN
			-- Is `a_pathname' a relative pathname (relative
			-- to the current working directory)?
			-- (`a_pathname' should follow the Unix pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		do
			Result := not is_absolute_pathname (a_pathname)
		ensure then
			definition: Result = not is_absolute_pathname (a_pathname)
		end

	is_root_directory (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a root directory (i.e. it has no parent directory)?
			-- (`a_dirname' should follow the Unix pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
		do
			nb := a_dirname.count
			if nb > 0 then
				Result := True
				from
					i := 1
				until
					i > nb
				loop
					if a_dirname.item (i) /= directory_separator then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
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
			Result := p1.same_pathname (p2)
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
			Result := p1.same_pathname (p2)
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
			Result := p1.is_subpathname (p2)
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
			Result := p1.is_subpathname (p2)
		end

	basename (a_pathname: STRING): STRING
			-- Pathname with any leading directory components removed
			-- (`a_pathname' should follow the Unix pathname convention.
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
					i < 1 or else a_pathname.item (i) /= directory_separator
				loop
					i := i - 1
				end
				nb := i
				from
				until
					i < 1 or else a_pathname.item (i) = directory_separator
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
			-- (`a_pathname' should follow the Unix pathname convention.
			-- The result also follows this pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		local
			i: INTEGER
		do
				-- TODO: Try to re-implement this routine with a forward traversal to
				-- have better performances when `a_pathname' is a UC_STRING. (ericb)
			if is_root_directory (a_pathname) then
				Result := root_directory
			else
				from
					i := a_pathname.count
				until
					i < 1 or else a_pathname.item (i) /= directory_separator
				loop
					i := i - 1
				end
				from
				until
					i < 1 or else a_pathname.item (i) = directory_separator
				loop
					i := i - 1
				end
				if i < 1 then
					Result := relative_current_directory
				else
					from
					until
						i < 1 or else a_pathname.item (i) /= directory_separator
					loop
						i := i - 1
					end
					if i < 1 then
						Result := root_directory
					else
						Result := a_pathname.substring (1, i)
					end
				end
			end
		end

	pathname (a_dirname, a_pathname: STRING): STRING
			-- Pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the Unix pathname
			-- convention. The result also follows this pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			nb: INTEGER
		do
			Result := a_dirname.twin
			if a_pathname.count > 0 then
				nb := Result.count
				if nb > 0 and then Result.item (nb) /= directory_separator then
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
				if nb > 0 and then a_string.item (nb) /= directory_separator then
					a_string.append_character (directory_separator)
				end
				a_string.append_string (a_pathname)
			end
		end

	nested_pathname (a_dirname: STRING; a_pathnames: ARRAY [STRING]): STRING
			-- Pathname made up of relative pathnames
			-- `a_pathnames' in directory `a_dirname'
			-- (`a_dirname' and `a_pathnames' should follow the Unix pathname
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
					if k > 0 and then Result.item (k) /= directory_separator then
						Result.append_character (directory_separator)
					end
					Result := STRING_.appended_string (Result, a_pathname)
				end
				i := i + 1
			end
		end

	relative_current_directory: STRING = "."
			-- Relative pathname of current directory
			-- (The result follows the Unix pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)

	relative_parent_directory: STRING = ".."
			-- Relative pathname of current parent directory
			-- (The result follows the Unix pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)

	root_directory: STRING
			-- Pathname of current root directory
			-- (The result follows the Unix pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		once
			Result := "/"
		end

	absolute_pathname (a_pathname: STRING): STRING
			-- Absolute pathname of `a_pathname'
			-- (`a_pathname' should follow the Unix pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		do
			if is_absolute_pathname (a_pathname) then
				Result := a_pathname
			else
				Result := pathname (cwd, a_pathname)
			end
		end

	absolute_parent_directory (a_pathname: STRING): STRING
			-- Absolute pathname of parent directory of `a_pathname';
			-- If `a_pathname' is a root directory (i.e. has no parent)
			-- then return `a_pathname' itself if it is an absolute pathname,
			-- or `absolute_root_directory' if it is a relative pathname
			-- (`a_pathname' should follow the Unix pathname convention.
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
				else
					an_absolute_pathname := pathname (cwd, a_pathname)
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
			-- Absolute pathname of current root directory
			-- (The result follows the Unix pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		once
			Result := "/"
		end

	string_to_pathname (a_pathname: STRING): KL_PATHNAME
			-- Convert string to pathname
			-- (`a_pathname' should follow the Unix pathname convention.
			-- For pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
			j, k: INTEGER
			str: STRING
		do
			create Result.make
			nb := a_pathname.count
			if nb > 0 then
				if a_pathname.item (1) /= directory_separator then
					Result.set_relative (True)
				end
			else
				Result.set_relative (True)
			end
			from
				i := 1
			until
				i > nb
			loop
				from
				until
					i > nb or else a_pathname.item (i) /= directory_separator
				loop
					i := i + 1
				end
				if i <= nb then
					j := i
					from
					until
						i > nb or else a_pathname.item (i) = directory_separator
					loop
						i := i + 1
					end
					k := i - 1
					str := a_pathname.substring (j, k)
					if STRING_.same_string (str, relative_current_directory) then
						Result.append_current
					elseif STRING_.same_string (str, relative_parent_directory) then
						Result.append_parent
					else
						Result.append_name (str)
					end
				end
			end
		end

	pathname_to_string (a_pathname: KI_PATHNAME): STRING
			-- Convert pathname to string
			-- (The result follows the Unix pathname convention. For
			-- pathname conversion use `pathname_from_file_system'.)
		local
			i, nb: INTEGER
		do
			create Result.make (50)
			if not a_pathname.is_relative then
				Result := STRING_.appended_string (Result, root_directory)
			end
			nb := a_pathname.count
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
			-- (`a_filename' should follow the Unix pathname convention.
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
			-- (`a_filename' should follow the Unix pathname convention.
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
				elseif c = directory_separator then
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

	exe_extension: STRING = ""
			-- Executable file extension (empty under Unix)

	directory_separator: CHARACTER = '/'
			-- Directory separator

end
