note
	description: "[
			Objects representing a path, i.e. a way to identify a file or a directory for the
			current underlying platform. A path is made of two components:
			1 - an optional root which can either be:
				a - a drive letter followed by colon on Windows, i.e. "C:" or "C:\"
				b - "/" for UNIX root directory.
				c - "\" for Windows root directory.
				d - "\\server\share" or "\\server\share\" for Microsoft UNC path.
			2 - a sequence of zero or more names.
			
			A path is absolute if it has a root, and on windows if the root is a drive, then it should
			be followed by "\". Otherwise a path is relative.


			Validity
			========
			
			The current class will not check the validity of filenames. Check your file
			system for your operating system manual for the list of invalid characters.


			Windows consideration
			=====================
			
			When the root of a Windows path is a drive, be aware of the following behavior:
			1 - "C:filename.txt" refers to the file name "filename.txt" in the current directory 
			    on drive "C:".
			2 - "C:sub\filename.txt" refers to the file name "filename.txt" in a subdirectory "sub"
			    of the current directory on drive "C:".
			3 - "C:\sub\filename.txt" refers to the file name "filename.txt" in a subdirectory "sub"
			    located at the root of the drive "C:".
			
			Both forward and backslashes are accepted, but forward slashes are internally converted
			to backward slashes whenever they are used to construct a path.
			
			On Windows, there is a limit of 259 characters for a path. If you need to create a larger
			path, you can do so by using the following conventions which will let you have paths of
			about 32,767 characters:
			1 - Use \\?\ for non-UNC path and let the rest unchanged.
			2 - Use \\?\UNC\server\share for UNC path and let the rest unchanged.
			The above path cannot be used to specify a relative path.
			
			To know more about Windows paths, read the "Naming Files, Paths, and Namespaces"
			document located at:
			  http://msdn.microsoft.com/en-us/library/windows/desktop/aa365247(v=vs.85).aspx


			Unicode consideration
			=====================
			
			The PATH class treats strings as sequence of Unicode characters, i.e. an instance of 
			a READABLE_STRING_8 or descendant will be treated as if characters in the range
			128 .. 255 were Unicode code points.
			This contrasts to the FILE/DIRECTORY classes where to preserve backward compatibility, those
			characters are treated as is.
			
			
			Mixed-encoding consideration
			============================
			
			Most operating systems have conventions for paths that are incompatible with Unicode.
			On UNIX, in a sequence of names, each name is just a null-terminated byte sequence, it
			does not follow any specific encoding. Usually the locale setting enables you to see
			the filename the way you expect.
			On Windows, the sequence of names is made of null-terminated UTF-16 code unit sequence. Windows
			does not guarantee that the sequence is actually a valid UTF-16 sequence.
			
			In other words, when there is an invalid UTF-8 encoding on UNIX, or an invalid UTF-16 encoding
			on Windows, the filename is not directly representable as a Unicode string. To make it possible
			to create and store paths in a textually representable form, the query `name' will create
			an encoded representation that can be then later used in `make_from_string' to create a PATH
			equivalent to the original path. The encoding is described in UTF_CONVERTER's note clause
			and is a fourth variant of the recommended practice for replacement characters in Unicode
			(see http://www.unicode.org/review/pr-121.html).

						
			Immutability
			============
			
			Instances of the current class are immutable.
		]"

	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	PATH

inherit
	HASHABLE
		redefine
			out, is_equal, copy
		end

	COMPARABLE
		redefine
			out, is_equal, copy
		end

	NATIVE_STRING_HANDLER
		redefine
			out, is_equal, copy
		end

	DEBUG_OUTPUT
		redefine
			out, is_equal, copy
		end

create {NATIVE_STRING_HANDLER}
	make_from_pointer

create {PATH}
	make_from_storage,
	make_from_normalized_storage

create
	make_empty,
	make_current,
	make_from_string,
	make_from_separate

feature {NONE} -- Initialization

	make_empty
			-- Initialize current as an empty path.
		do
			create storage.make_empty
			is_normalized := True
			reset_internal_data
		ensure
			is_empty: is_empty
			is_normalized: is_normalized
		end

	make_current
			-- Initialize current as the symbolic representation of the current working directory
		do
			create storage.make (unit_size)
			storage.append_character ('.')
			if {PLATFORM}.is_windows then
				storage.append_character ('%U')
			end
			is_normalized := True
			reset_internal_data
		ensure
			not_empty: not is_empty
			is_normalized: is_normalized
			is_current: is_current_symbol
		end

	make_from_string (a_path: READABLE_STRING_GENERAL)
			-- Initialize current from `a_path' treated as a sequence of Unicode characters.
			-- If `a_path' is trying to represent a mixed-encoded path, then `a_path' should use
			-- the escaped representation as described in UTF_CONVERTER.
		require
			a_path_not_void: a_path /= Void
		do
			create storage.make (a_path.count * unit_size)
			if not a_path.is_empty then
					-- We start from nothing, so we do not add a directory separator regardless.
				internal_append_into (storage, a_path, '%U')
					-- Path was created from a non-normalized string, we need to normalize it.
				normalize
			else
				is_normalized := True
			end
			reset_internal_data
		ensure
			not_empty: not a_path.is_empty implies not is_empty
			is_normalized: is_normalized
			roundtrip: True -- name.same_string_general (a_path) with all duplicated separators removed except for the first two in UNC path.
			roundtrip_with_trailing: True -- name.same_string_general (a_path) with all trailing directory separators removed from `a_path' except if this is a root.
		end

	make_from_separate (a_path: separate PATH)
			-- Initialize from separate `a_path'.
		require
			a_path_not_void: a_path /= Void
		do
			create storage.make_from_separate (a_path.storage)
			is_normalized := True
			reset_internal_data
		ensure
			not_empty: not a_path.is_empty implies not is_empty
			is_normalized: is_normalized
		end

feature {NONE} -- Internal initialization

	make_from_storage (a_path: STRING_8)
			-- Initialize current from `a_path' and normalize `a_path' as it may be coming
			-- from a user provided string or from a C API.
		require
			a_path_not_void: a_path /= Void
		do
			storage := a_path
			normalize
			reset_internal_data
		ensure
			shared: storage = a_path
			is_normalized: is_normalized
		end

	make_from_normalized_storage (a_path: STRING_8)
			-- Initialize current from `a_path' which has already been normalized.
		require
			a_path_not_void: a_path /= Void
		do
			storage := a_path
			is_normalized := True
			reset_internal_data
		ensure
			shared: storage = a_path
			is_normalized: is_normalized
		end

	make_from_pointer (a_path_pointer: POINTER)
			-- Initialize current from `a_path_pointer', a platform system specific encoding of
			-- a path that is null-terminated.
		require
			a_path_pointer_not_null: a_path_pointer /= default_pointer
		local
			l_cstr: C_STRING
			nb: INTEGER
		do
				-- Let's be safe here, we take the min between the recorded size and the actual size.
			nb := pointer_length_in_bytes (a_path_pointer)
				-- Let's make sure that `nb' is a valid length, any value on Unix, but an even number on Windows
			nb := nb - nb \\ unit_size
			create l_cstr.make_shared_from_pointer_and_count (a_path_pointer, nb)
			storage := l_cstr.substring_8 (1, nb)
				-- Path was created from a non-normalized pointer, we need to normalize it.
			if not storage.is_empty then
				normalize
			end
			reset_internal_data
		end

feature -- Status report

	is_current_symbol: BOOLEAN
			-- Is Current a representation of "."?
		do
			if storage.count = unit_size then
				Result := is_character (storage, 1, '.')
			end
		end

	is_parent_symbol: BOOLEAN
			-- Is Current Representation of ".."?
		do
			if storage.count = 2 * unit_size then
				Result := is_character (storage, 1, '.')
				Result := is_character (storage, 1 + unit_size, '.')
			end
		end

	has_root: BOOLEAN
			-- Does current have a root?
		do
			Result := root_end_position /= 0
		ensure
			defintion: Result implies not is_empty
		end

	is_empty: BOOLEAN
			-- Is current empty, i.e. no root and no sequence of names?
		do
			Result := storage.is_empty
		end

	is_relative: BOOLEAN
			-- Is current path relative?
		do
			Result := not is_absolute
		end

	is_absolute: BOOLEAN
			-- Is current path absolute?
		local
			l_root_end_position: INTEGER
		do
			l_root_end_position := root_end_position
			if l_root_end_position > 0 then
				if {PLATFORM}.is_windows then
						-- A path is absolute if its root has a trailing directory separator.
					Result := is_character (storage, l_root_end_position - unit_size + 1, directory_separator)
				else
						-- Optimization for Unix where the only root you can have is "/".
					Result := True
				end
			end
		end

	is_simple: BOOLEAN
			-- Is current path made of only one name and no root?
			-- I.e. readme.txt, usr or the empty path.
		local
			l_root_pos: like root_end_position
		do
			if storage.is_empty then
				Result := True
			else
				l_root_pos := root_end_position
				if l_root_pos = 0 and not is_empty then
						-- There is no root, now check that there are no directory separator.
					Result := next_directory_separator (1) = 0
				end
			end
		end

	is_same_file_as (a_path: PATH): BOOLEAN
			-- Does `Current' and `a_path' points to the same file on disk? It is different from path equality
			-- as it will take into account symbolic links.
			-- If `Current' or/and `a_path' do not exists, it will yield false, otherwise it will compare
			-- the file at the file system level.
		require
			a_path_not_void: a_path /= Void
		local
			l_p1, l_p2: MANAGED_POINTER
		do
			l_p1 := to_pointer
			l_p2 := a_path.to_pointer
			Result := c_same_files (l_p1.item, l_p2.item)
		end

	has_extension (a_ext: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `Current' has an extension `a_ext' compared in a case insensitive manner?
		require
			a_ext_not_void: a_ext /= Void
			a_ext_not_empty: not a_ext.is_empty
			a_ext_has_no_dot: not a_ext.has ('.')
		do
			Result := attached extension as l_ext and then l_ext.is_case_insensitive_equal_general (a_ext)
		end

feature -- Access

	root: detachable PATH
			-- Root if any of current path.
		local
			l_pos: INTEGER
		do
			l_pos := root_end_position
			if l_pos /= 0 then
				if l_pos = storage.count then
					create Result.make_from_normalized_storage (storage)
				else
					create Result.make_from_normalized_storage (storage.substring (1, l_pos))
				end
			end
		ensure
			has_root_implies_not_void: has_root implies Result /= Void
		end

	parent: PATH
			-- Parent directory if any, otherwise current working path.
			-- The parent of a path consists of `root' if any, and of each
			-- simple names in the current sequence except for the last.
		local
			l_pos, l_root_end_pos: INTEGER
		do
			l_pos := end_position_of_last_directory_separator
				-- Only create
			if l_pos = 0 then
				if attached root as l_root then
						-- Case of a path like "C:abc.txt", the parent is "C:"
					check is_windows: {PLATFORM}.is_windows end
					Result := l_root
				else
						-- Path has no root, thus the parent directory is simply
						-- the current working directory ".".
					create Result.make_current
				end
			elseif l_pos = unit_size then
					-- Case where we have "/usr" or "\Windows", the parent is just the root "/" or "\"
				create Result.make_from_normalized_storage (storage.substring (1, unit_size))
			else
				l_root_end_pos := root_end_position
				if l_pos <= l_root_end_pos then
						-- Case where we have "\\server\share", we cannot cut this path into just "\\server".
					if l_root_end_pos = storage.count then
							-- Optimization, do not duplicate `storage'.
						Result := Current
					else
						create Result.make_from_normalized_storage (storage.substring (1, l_root_end_pos))
					end
				else
						-- Normal case.
					create Result.make_from_normalized_storage (storage.substring (1, l_pos - unit_size))
				end
			end
		end

	entry: detachable PATH
			-- Name of file or directory denoted by Current if any.
			-- This is the last name in the current sequence.
		local
			l_pos: INTEGER
			l_end_root: INTEGER
		do
			l_pos := end_position_of_last_directory_separator
			if l_pos = 0 then
				l_end_root := root_end_position
				if l_end_root > 0 then
						-- We have a root, case of "C:abc" on Windows or "/" on UNIX.
						-- On Windows, we return just "abc" and no entry on UNIX.
					if l_end_root < storage.count then
						create Result.make_from_normalized_storage (storage.substring (l_end_root + 1, storage.count))
					end
				else
						-- There is no directory separator, or just a trailing one, so current is a simple path
					Result := Current
				end
			else
					-- We go after the directory separator
				l_end_root := root_end_position
				if l_pos <= l_end_root then
						-- We clearly have "\\server\share" for Windows or "/xxx" for Unix. Thus there is
						-- only an entry on UNIX if there is something after the / (i.e. "xxx" in the case of "/xxx").
					if l_end_root < storage.count then
						create Result.make_from_normalized_storage (storage.substring (l_end_root + 1, storage.count))
					end
				else
					create Result.make_from_normalized_storage (storage.substring (l_pos + 1, storage.count))
				end
			end
				-- An entry has to be some valid name, not just "." or ".." or an empty path
			if Result /= Void and then (Result.is_empty or Result.is_current_symbol or Result.is_parent_symbol) then
				Result := Void
			end
		ensure
			not_empty: Result /= Void implies not Result.is_empty
		end

	extension: detachable IMMUTABLE_STRING_32
			-- Extension if any of current entry.
		local
			l_name: like name
			l_pos, nb: INTEGER
		do
			if attached entry as l_entry then
				l_name := l_entry.name
				nb := l_name.count
				l_pos := l_name.last_index_of ('.', nb)
				if l_pos /= 0 and l_pos /= nb then
						-- Only create the extension if it is not empty.
					Result := l_name.shared_substring (l_pos + 1, nb)
				end
			end
		ensure
			not_empty: attached Result implies not Result.is_empty
			no_dot: attached Result implies not Result.has ('.')
		end

	components: ARRAYED_LIST [PATH]
			-- Sequence of simple paths making up Current, including `root' if any.
		local
			l_storage: STRING_8
			l_previous_pos, l_pos: INTEGER
		do
			create Result.make (10)
				-- First insert `root' if any.
			l_pos := root_end_position
			if l_pos > 0 then
				create l_storage.make (l_pos)
				l_storage.append_substring (storage, 1, l_pos)
				Result.extend (create {PATH}.make_from_normalized_storage (l_storage))
				l_pos := l_pos + 1
			else
				l_pos := 1
			end
			if l_pos <= storage.count then
				from
					l_previous_pos := l_pos
					l_pos := next_directory_separator (l_previous_pos)
				until
					l_pos = 0
				loop
					create l_storage.make (l_pos - l_previous_pos)
					l_storage.append_substring (storage, l_previous_pos, l_pos - 1)
					Result.extend (create {PATH}.make_from_normalized_storage (l_storage))
						-- We skip the directory separator
					l_previous_pos := l_pos + unit_size
					l_pos := next_directory_separator (l_previous_pos)
				end
				if l_previous_pos <= storage.count then
						-- If we have some characters left then this is our last component.
					create l_storage.make (storage.count - l_previous_pos)
					l_storage.append_substring (storage, l_previous_pos, storage.count )
					Result.extend (create {PATH}.make_from_normalized_storage (l_storage))
				end
			end
		end

	absolute_path: PATH
			-- Absolute path of Current.
			-- If Current is already absolute, then return Current.
			-- If Current is empty, then return the current working directory.
			-- Otherwise resolve the path in a platform specific way:
			-- * On UNIX, resolve against the current working directory
			-- * On Windows:
			--    a) if current has a drive letter which is not followed by "\"
			--       resolve against the current working directory for that drive letter,
			--       otherwise resolve against the current working directory.
			--    b) if current path starts with "\", not a double "\\", then resolve
			--       against the root of the current working directory (i.e. a drive
			--       letter "C:\" or a UNC path "\\server\share\".)
		do
			Result := absolute_path_in (env.current_working_path)
		end

	absolute_path_in (a_current_directory: PATH): PATH
			-- Absolute path of Current in the context of `a_current_directory'.
			-- If Current is already absolute, then return Current.
			-- If Current is empty, then return `a_current_directory'.
			-- Otherwise resolve the path in a platform specific way:
			-- * On UNIX, resolve against `a_current_directory'
			-- * On Windows:
			--    a) if current has a drive letter which is not followed by "\"
			--       resolve against `a_current_directory' for that drive letter,
			--       otherwise resolve against `a_current_directory'.
			--    b) if current path starts with "\", not a double "\\", then resolve
			--       against the root of `a_current_directory; (i.e. a drive
			--       letter "C:\" or a UNC path "\\server\share\".)
		require
			a_current_directory_not_void: a_current_directory /= Void
			a_current_directory_absolute: a_current_directory.is_absolute
		do
			if storage.is_empty then
				Result := a_current_directory
			else
				if is_absolute then
					Result := Current
				else
					if {PLATFORM}.is_windows then
						if attached root as l_root then
								-- Path is not absolute but has a root, it can only be a drive letter.
								-- Now we have to resolve "c:something\file.txt" using the current working
								-- directory of the "c:" drive. If `l_root' and `a_current_directory' do
								-- not points to the same drive, we assume that "c:" means "c:\" as we do
								-- not know what is the current drive's current working directory.
							if
								(l_root.storage.count = 4 and a_current_directory.storage.count >= 4) and then
								(l_root.storage.item (1) = a_current_directory.storage.item (1) and
								l_root.storage.item (3) = a_current_directory.storage.item (3))
							then
									-- Same root so we simply append.
								Result := a_current_directory.twin
							else
									-- There is no way we can figure this out, so we simply append to the current root.
								Result := l_root
							end
							internal_path_append_substring_into (Result.storage, storage, l_root.storage.count + 1, storage.count, directory_separator)
						else
								-- Case of either "abc\dev" or "\abc\def"	
							if is_character (storage, 1, windows_separator) then
								Result := a_current_directory.twin
								if attached Result.root as l_root then
									Result := l_root
								else
										-- The current working path has no root? It is hard to believe.
								end
							else
								Result := a_current_directory.twin
							end
								-- Now that we have built a valid path, we just append the relative one.
							internal_path_append_into (Result.storage, storage, directory_separator)
						end
					else
						Result := a_current_directory.twin
							-- Now that we have built a valid path, we just append the relative one.
						internal_path_append_into (Result.storage, storage, directory_separator)
					end
					Result.reset_internal_data
				end
			end
		ensure
			has_root: Result.has_root
		end

	canonical_path: PATH
			-- Canonical path of Current.
			-- Similar to `absolute_path' except that sequences containing "." or ".." are
			-- resolved.
		local
			l_components: like components
			l_absolute_path: like absolute_path
			l_storage: like storage
		do
			l_absolute_path := absolute_path
			if attached l_absolute_path.root as l_root then
				create l_storage.make (l_absolute_path.storage.count)
					-- Extract all components of the path, and if we encounter ".", we simply remove it,
					-- if we encounter "..", we remove the previous element and the current element.
				l_components := l_absolute_path.components
				check
					l_components_has_root: l_components.count >= 1
					l_components_first_is_root: l_components.first.same_as (l_root)
				end
				from
					l_components.start
						-- Record `root' and move to the next item in the list
					internal_path_append_into (l_storage, l_components.item.storage, directory_separator)
					l_components.remove
				until
					l_components.after
				loop
					if l_components.item.is_current_symbol then
							-- Our simple name is just ".", we skip it.
						l_components.remove
					elseif l_components.item.is_parent_symbol then
							-- If our simple name is "..", we skip it and remove the previous
							-- elements as well. If there is no previous element, then there is
							-- not much we can do so we ignore it.
						if not l_components.isfirst then
							l_components.back
							l_components.remove
						end
						l_components.remove
					else
						l_components.forth
					end
				end
				across l_components as l_component loop
					internal_path_append_into (l_storage, l_component.item.storage, directory_separator)
				end
					-- Everything was built from normalized strings.
				create Result.make_from_normalized_storage (l_storage)
			else
				check False end
				Result := l_absolute_path
			end
		end

	hash_code: INTEGER
			-- Hash code value
		do
			if {OPERATING_ENVIRONMENT}.case_sensitive_path_names then
				Result := storage.hash_code
			else
				Result := name.case_insensitive_hash_code
			end
		end

	native_string: NATIVE_STRING
			-- Convert current into an instance of NATIVE_STRING
		do
			create Result.make_from_raw_string (storage)
		ensure
			set: Result.raw_string.same_string (storage)
		end

	unix_separator: CHARACTER_8 = '/'
	windows_separator: CHARACTER_8 = '\'
			-- Platform specific directory separator.

	directory_separator: CHARACTER_8
			-- Default directory separator for the current platform.
		do
			if {PLATFORM}.is_windows then
				Result := windows_separator
			else
				Result := unix_separator
			end
		end

feature -- Status setting

	extended (a_name: READABLE_STRING_GENERAL): PATH
			-- New path instance of current extended with path `a_name'.
			-- If current is not empty, then `a_name' cannot have a root.
			-- A directory separator is added between two entries except
			-- 1 - `a_name' starts with a directory separator (i.e. it has a root)
			-- 2 - if current is empty or is just a root.
			-- Note that `a_name' can be an encoding of a mixed-encoding simple name and it will
			-- be decoded accordingly (see note clause for the class for more details.)
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_name_has_no_root: not is_empty implies not (create {PATH}.make_from_string (a_name)).has_root
		local
			l_storage: like storage
		do
				-- Pre-allocate all the bytes necessary to store the combination of `Current'
				-- and `a_extra'.
			create l_storage.make (storage.count + a_name.count * unit_size + unit_size)
				-- Get a copy of `storage' from Current'
			l_storage.append (storage)
				-- Append `a_name' with the directory separator only if Current not just
				-- a root.
			if l_storage.count > 0 and root_end_position = l_storage.count then
					-- If a path is just made of a root, do no add a directory separator.
				internal_append_into (l_storage, a_name, '%U')
			else
				internal_append_into (l_storage, a_name, directory_separator)
			end
				-- Create a new PATH instance and normalize it since it was created
				-- from a non-normalized string.
			create Result.make_from_storage (l_storage)
		ensure
			associated_path_of_name: attached (create {PATH}.make_from_string (a_name)) as l_path
			not_empty: not Result.is_empty
			extended_with_only_empty_or_root:
				(same_as (root) or is_empty) implies Result.name.same_string (name + l_path.name)
			extended_with_more_than_root_or_not_empty:
				(not same_as (root) and not is_empty) implies Result.name.same_string (name + directory_separator_string + l_path.name)
		end

	extended_path alias "+" (a_path: PATH): PATH
			-- New path instance of current extended with path `a_path'.
			-- If current is not empty, then `a_path' cannot have a root.
			-- A directory separator is added between two entries except
			-- 1 - `a_path' starts with a directory separator (i.e. it has a root)
			-- 2 - if current is empty or is just a root.
		require
			a_path_not_void: a_path /= Void
			a_path_not_empty: not a_path.is_empty
			a_path_has_no_root: not is_empty implies not a_path.has_root
		local
			l_storage: like storage
		do
				-- Pre-allocate all the bytes necessary to store the combination of `Current', `a_path' and
				-- the directory separator.
			create l_storage.make (storage.count + a_path.storage.count + unit_size)
				-- Get a copy of `storage' from Current'
			l_storage.append (storage)
				-- Append `a_path.storage' to `l_storage'.
			if l_storage.count > 0 and root_end_position = l_storage.count then
					-- If a path is just made of a root, do no add a directory separator.				
				internal_path_append_into (l_storage, a_path.storage, '%U')
			else
				internal_path_append_into (l_storage, a_path.storage, directory_separator)
			end
				-- Create a new PATH instance.
			create Result.make_from_normalized_storage (l_storage)
		ensure
			not_empty: not Result.is_empty
			extended_with_only_empty_or_root:
				(same_as (root) or is_empty) implies Result.name.same_string (name + a_path.name)
			extended_with_more_than_root_or_not_empty:
				(not same_as (root) and not is_empty) implies Result.name.same_string (name + directory_separator_string + a_path.name)
		end

	appended (a_extra: READABLE_STRING_GENERAL): PATH
			-- New path instance of current where `entry' is appended with `a_extra' without
			-- adding a directory separator.
			-- For example if Current path is "C:" and `a_path' is "path\file.txt", it will yield
			-- "C:path\file.txt".
			-- Note that `a_extra' can be an encoding of a mixed-encoding simple name and it will
			-- be decoded accordingly (see note clause for the class for more details.)
		require
			a_extra_not_void: a_extra /= Void
			a_extra_not_empty: not a_extra.is_empty
		local
			l_storage: like storage
		do
				-- Pre-allocate all the bytes necessary to store the combination of `Current'
				-- and `a_extra'.
			create l_storage.make (storage.count + a_extra.count * unit_size)
				-- Get a copy of `storage' from Current'
			l_storage.append (storage)
				-- Append `a_extra'.
			internal_append_into (l_storage, a_extra, '%U')
				-- Create a new PATH instance and normalize it since it was created
				-- from a non-normalized string.
			create Result.make_from_storage (l_storage)
		ensure
			not_empty: not Result.is_empty
			appended: Result.name.same_string (name + (create {PATH}.make_from_string (a_extra)).name)
		end

	appended_with_extension (a_ext: READABLE_STRING_GENERAL): PATH
			-- New path instance of current where `entry' is extended with a dot followed by `a_ext'.
			-- If Current already has a dot, no dot is added.
			-- Note that `a_ext' can be an encoding of a mixed-encoding simple name and it will
			-- be decoded accordingly (see note clause for the class for more details.)
		require
			a_ext_not_void: a_ext /= Void
			a_ext_not_empty: not a_ext.is_empty
			a_ext_has_no_dot: not a_ext.has ('.')
			a_ext_has_no_directory_separator: not a_ext.has (windows_separator) and not a_ext.has (unix_separator)
			has_entry: entry /= Void
		local
			l_storage: like storage
		do
				-- Pre-allocate all the bytes necessary to store the combination of `Current'
				-- and `a_extra'.
			create l_storage.make (storage.count + a_ext.count * unit_size + unit_size)
				-- Get a copy of `storage' from Current'
			l_storage.append (storage)
				-- Append a dot if not already present and then `a_extra'.
			internal_append_into (l_storage, a_ext, '.')
				-- Create a new PATH instance. We can assume it is normalized
				-- because we require no directory separator.
			create Result.make_from_normalized_storage (l_storage)
		ensure
			not_empty: not Result.is_empty
			extension_set: attached Result.extension as l_ext and then l_ext.same_string_general (a_ext)
			components_stable: Result.components.count = components.count
		end

feature -- Comparison

	same_as (other: detachable PATH): BOOLEAN
			-- Is Current the same path as `other'?
			-- Note that no canonicalization is being performed to compare paths,
			-- paths are compared using the OS-specific convention for letter case.
		do
			if other = Void then
					-- False by definition.
			elseif other = Current then
				Result := True
			else
					-- Depending on the OS specific setting.
				if {OPERATING_ENVIRONMENT}.case_sensitive_path_names then
					Result := is_case_sensitive_equal (other)
				else
					Result := is_case_insensitive_equal (other)
				end
			end
		end

	is_less alias "<" (other: like Current): BOOLEAN
			-- <Precursor>
		do
			if {OPERATING_ENVIRONMENT}.case_sensitive_path_names then
				Result := storage < other.storage
			else
					-- FIXME: the implementation of `is_less' is suboptimal since
					-- it creates 4 new, potentially big, objects
				Result := name.as_lower < other.name.as_lower
			end
		end

	is_equal (other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := same_as (other)
		end

	is_case_sensitive_equal (other: PATH): BOOLEAN
			-- Compare path and paying attention to case.
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			else
				Result := storage.is_equal (other.storage)
			end
		end

	is_case_insensitive_equal (other: PATH): BOOLEAN
			-- Compare path without paying attention to case. If the path is containing some mixed-encoding
			-- we might ignore many characters when doing the case comparison.
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			else
				Result := name.is_case_insensitive_equal (other.name)
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- <Precursor>
		do
			if other /= Current then
					-- Duplicate storage
				standard_copy (other)
				storage := other.storage.twin
			end
		end

feature -- Output

	out: STRING
			-- Unicode representation of the underlying filename if representable,
			-- otherwise a UTF-8 encoded version.
			-- Use `utf_8_name' to have a printable representation whose format is not going
			-- to be changed in the future.
		do
			if attached {READABLE_STRING} name as n then
				create Result.make_from_string (n)
			else
				Result := utf_8_name
			end
		end

	utf_8_name: STRING_8
			-- UTF-8 representation of the underlying filename.
		local
			u: UTF_CONVERTER
		do
			Result := u.escaped_utf_32_string_to_utf_8_string_8 (name)
		end

	name: IMMUTABLE_STRING_32
			-- If current is representable in Unicode, the Unicode representation.
			-- Otherwise all non-valid sequences for the current platform in the path are escaped
			-- as mentioned in the note clause of the class.
			-- To ensure roundtrip, you cannot use `name' directly to create a `FILE', you have to
			-- create a `PATH' instance using `make_from_string' before passing it to the creation
			-- procedure of `FILE' taking an instance of `PATH'.
		local
			u: UTF_CONVERTER
		do
				-- We can safely buffer `internal_name' since Current is immutable.
			if attached internal_name as l_name then
				Result := l_name
			else
				if {PLATFORM}.is_windows then
					create Result.make_from_string (u.utf_16le_string_8_to_escaped_string_32 (storage))
				else
					create Result.make_from_string (u.utf_8_string_8_to_escaped_string_32 (storage))
				end
				internal_name := Result
			end
		ensure
			roundtrip: same_as (create {PATH}.make_from_string (Result))
		end

feature {NONE} -- Output

	debug_output: READABLE_STRING_32
			-- String that should be displayed in debugger to represent `Current'.
		do
			Result := name
		end

feature {NATIVE_STRING_HANDLER} -- Access

	to_pointer: MANAGED_POINTER
			-- Platform specific representation of Current.
		local
			l_cstr: C_STRING
		do
				-- A `C_STRING' instance is zeroed out and a single null byte character is added.
				-- On Windows we need 2 null characters, thus the `+ unit_size - 1' addition
				-- to the length of the storage.
			create l_cstr.make_empty (storage.count + unit_size - 1)
			l_cstr.set_string (storage)
			Result := l_cstr.managed_data
		end

feature {PATH} -- Implementation

	is_normalized: BOOLEAN
			-- Has current string be normalized?

	storage: STRING_8
			-- Internal storage for Current.
			-- On UNIX, it is a binary sequence encoded in UTF-8 by default.
			-- On Windows, it is a binary sequence encoded in UTF-16LE by default.

	unit_size: INTEGER
			-- Size in bytes of a unit for `storage'.
		do
			if {PLATFORM}.is_windows then
				Result := 2
			else
				Result := 1
			end
		end

	reset_internal_data
			-- Reset the private cache data.
		do
			internal_name := Void
		end

	normalize
			-- Normalize current with respect to directory separators:
			-- 1 - On Windows, replace all `/' by `\'.
			-- 2 - Remove trailing directory separator unless this is a root for which
			--     we will keep just one. This is the case of:
			--      * C:\
			--      * \\server\share\
			--      * \\?\C:\
			--      * /
			--     where removing the trailing directory separator would transform
			--     current path from being absolute to be relative.
			-- 3 - Remove redundant directory separator in a path except on Windows for
			--     the starting \\ in a UNC path. (i.e. /foo////bar -> /foo/bar, and
			--     \\server\share\\\\foo\\\bar -> \\server\share\foo\bar.
			-- 4 - If a path is just made of directory separator, it become that directory separator.
		require
			not_normalized: not is_normalized
			storage_not_empty: storage.count >= unit_size
		local
			l_storage: like storage
			i, j, nb: INTEGER
			l_root_pos: INTEGER
			l_in_separator, l_copy_character, l_has_unc: BOOLEAN
		do
			l_storage := storage
			nb := l_storage.count
				-- Remove all redundant directory separator.
			if {PLATFORM}.is_windows then
					-- But on Windows keep the first two '\\' and replace all `/' into `\'
				i := 1
				if nb >= min_unc_path_count then
						-- Handle the special case for starting `\\' which can either be `//', `/\', '\\' or '\/'.
					if
						(is_character (l_storage, 1, unix_separator) and (is_character (l_storage, 3, unix_separator) or is_character (l_storage, 3, windows_separator))) or
						(is_character (l_storage, 1, windows_separator) and (is_character (l_storage, 3, windows_separator) or is_character (l_storage, 3, unix_separator)))
					then
						if not is_character (l_storage, 5, unix_separator) and not is_character (l_storage, 5, windows_separator) then
								-- Simply "\\a", so we keep the leading redundant directory separator.
							i := 5
							l_has_unc := True
						end
					end
				end

					-- Start from position `i' previously computed in case we need to skip
					-- the starting "\\".
				from
					j := i
					l_copy_character := True
				until
					i > nb
				loop
					if l_in_separator then
							-- We skip copying the separator as long as we encounter directory separator.
						l_copy_character := not is_character (l_storage, i, windows_separator) and not is_character (l_storage, i, unix_separator)
						l_in_separator := not l_copy_character
					else
						if is_character (l_storage, i, unix_separator) then
							l_storage.put (windows_separator, i)
							l_in_separator := True
						else
							l_in_separator := is_character (l_storage, i, windows_separator)
						end
					end
					if l_copy_character then
						if i /= j then
							l_storage.put (l_storage.item (i), j)
							l_storage.put (l_storage.item (i + 1), j + 1)
						end
						j := j + 2
					end
					i := i + 2
				end
			else
					-- Start from position `i' previously computed in case we need to skip
					-- the starting "\\".
				from
					i := 1
					j := i
					l_copy_character := True
				until
					i > nb
				loop
					if l_in_separator then
							-- We skip copying the separator as long as we encounter directory separator.
						l_copy_character := not is_character (l_storage, i, unix_separator)
						l_in_separator := not l_copy_character
					else
						l_in_separator := is_character (l_storage, i, unix_separator)
					end
					if l_copy_character then
						if i /= j then
							l_storage.put (l_storage.item (i), j)
						end
						j := j + 1
					end
					i := i + 1
				end
			end
			if i /= j then
					-- Remove all the characters we do not need because we got rid
					-- of duplicated separator.
				l_storage.keep_head (j - 1)
			end

			is_normalized := True

			if l_has_unc then
				l_root_pos := root_end_position
				if l_root_pos = 0 then
						-- Even if it was starting with "\\a" we could not find a root,
						-- we remove the redundant leading directory separator.
					l_storage.remove_head (unit_size)
				end
			end
				-- Remove the trailing directory separators when the path is
				-- not just made of the root.
			if
				is_character (l_storage, l_storage.count - unit_size + 1, directory_separator) and then
				root_end_position < l_storage.count
			then
					-- We have a path of the form `root/X/' so we can safely remove the trailing directory separator
				l_storage.remove_tail (unit_size)
			end
		ensure
			is_normalized: is_normalized
		end

feature {NONE} -- Implementation

	internal_name: detachable IMMUTABLE_STRING_32
			-- Cache for `name'.

	platform: PLATFORM
			-- Access underlying platform info, used to satisfy invariant below.
		once
			create Result
		end

	env: EXECUTION_ENVIRONMENT
			-- Access to underlying execution environment.
		once
			create Result
		end

	root_end_position: INTEGER
			-- Position of the last character of `root' as a full unit if any, 0 otherwise.
		require
			is_normalized: is_normalized
		local
			l_drive_letter: CHARACTER
			l_pos: INTEGER
		do
			if not storage.is_empty then
				if {PLATFORM}.is_windows then
						-- On Windows it has a root if it starts with "X:" or "\\server\share".
					if storage.count = unit_size and then is_character (storage, 1, windows_separator) then
							-- Case of just "\"
						Result := unit_size
					elseif storage.count >= 4 and then (storage.item (2) = '%U' and storage.item (4) = '%U') then
						l_drive_letter := storage.item (1).as_lower
						if l_drive_letter >= 'a' and l_drive_letter <= 'z' and storage.item (3) = ':' then
								-- We found a drive letter.
							if storage.count >= 3 * unit_size and then is_character (storage, 5, windows_separator) then
									-- Case of "C:\", the "\" is actually part of the root.
								Result := 6
							else
								Result := 4
							end
						elseif l_drive_letter = windows_separator and storage.item (3) /= windows_separator then
								-- Case of "\abc", the root is just "\".
							Result := unit_size
						elseif
							storage.count >= min_unc_path_count and
							l_drive_letter = windows_separator and storage.item (3) = windows_separator and
							storage.item (5) /= windows_separator
						then
								-- We found a path that is of the form "\\X" where X is not "\".
								-- Let's find the next directory separator to build the server name of the UNC path.
							l_pos := next_directory_separator (7)
							if l_pos > 0 and l_pos + unit_size <= storage.count then
									-- We found a path of the form "\\X\....", where .... could be anything.
									-- Search for the next directory separator to build the share name of the UNC path.
								l_pos := next_directory_separator (l_pos + unit_size)
								if l_pos > 0 then
										-- Case of at least "\\X\S\"
									Result := l_pos + 1
								else
										-- Case of just "\\X\S"
									Result := storage.count
								end
							end
						end
					else
							-- Case of non-ASCII characters, clearly not a root.
					end
				else
					if storage.item (1) = unix_separator then
						Result := 1
					end
				end
			end
		ensure
			non_negative: Result >= 0
			not_too_big: Result <= storage.count
			valid_for_windows: {PLATFORM}.is_windows implies Result \\ unit_size = 0
		end

	end_position_of_last_directory_separator: INTEGER
			-- Position of the last directory separator in Current, not including the trailing ones if any, 0 if none.
		require
			is_normalized: is_normalized
		do
			if not storage.is_empty then
					-- First ignore the trailing directory separator.
				Result := storage.count - unit_size + 1
				if Result >= 1 then
						-- Search for the directory separator now.
					from
					until
						Result < 1 or is_character (storage, Result, directory_separator)
					loop
						Result := Result - unit_size
					end
				end
					-- Uniformize invalid result to 0.
				if Result < 0 then
					Result := 0
				else
					Result := Result + unit_size - 1
				end
			end
		ensure
			non_negative: Result >= 0
			not_too_big: Result <= storage.count
			valid_for_windows: {PLATFORM}.is_windows implies Result \\ unit_size = 0
		end

	next_directory_separator (a_starting_pos: INTEGER): INTEGER
			-- Starting at a position `a_starting_pos' find the position in `storage' of the
			-- next directory separator, or 0 otherwise.
		require
			a_starting_pos_valid: a_starting_pos >= 1 and a_starting_pos <= storage.count
			a_starting_pos_is_well_positionned: {PLATFORM}.is_windows implies a_starting_pos \\ unit_size = 1
		local
			nb: INTEGER
			l_step: like unit_size
			l_sep: like directory_separator
			l_storage: like storage
		do
			from
				l_step := unit_size
				l_sep := directory_separator
				Result := a_starting_pos
				l_storage := storage
				nb := l_storage.count
			until
				Result < 1 or Result > nb or is_character (l_storage, Result, l_sep)
			loop
				Result := Result + l_step
			end
			if Result > nb then
				Result := 0
			end
		ensure
			valid_position: Result >= 0 and Result <= storage.count
			well_positionned: {PLATFORM}.is_windows implies ((Result = 0) or (Result \\ unit_size = 1))
			has_separator: Result > 0 implies is_character (storage, Result, directory_separator)
		end

	internal_append_into (a_storage: STRING_8; other: READABLE_STRING_GENERAL; a_separator: CHARACTER_8)
			-- Append `a_separator' if different from '%U' and not already present as last character
			-- in `a_storage', and then `other' to Current.
		require
			other_not_void: other /= Void
			other_not_empty: not other.is_empty
		local
			u: UTF_CONVERTER
		do
			if not other.is_empty then
					-- Add a separator if needed.
				if
					a_separator /= '%U' and
					not a_storage.is_empty and then
						-- Only add a terminator if `a_storage' does not already have one at the end, or if `other' does not already
						-- have one at the beginning.
					not is_character (a_storage, a_storage.count - unit_size + 1, a_separator) and
					other.item (1) /= unix_separator
				then
					if {PLATFORM}.is_windows then
						if other.item (1) /= windows_separator then
							a_storage.append_character (a_separator)
							a_storage.append_character ('%U')
						end
					else
						a_storage.append_character (a_separator)
					end
				end
					-- Take `other' and add it to `a_storage'.
				if {PLATFORM}.is_windows then
					u.escaped_utf_32_string_into_utf_16le_string_8 (other, a_storage)
				else
					u.escaped_utf_32_string_into_utf_8_string_8 (other, a_storage)
				end
			end
		end

	internal_path_append_into (a_storage, other: STRING_8; a_separator: CHARACTER_8)
			-- Append `a_separator' if other than '%U' and not already present as last character
			-- of `a_storage', and then `other' to `a_storage'.
		require
			other_not_void: other /= Void
			other_not_empty: not other.is_empty
		do
			if
				a_separator /= '%U' and
				not a_storage.is_empty and then
				not is_character (a_storage, a_storage.count - unit_size + 1, a_separator) and
				not is_character (other, 1, a_separator)
			then
					-- Only add a terminator if `a_storage' does not already have one at the end, or if `other' does not already
					-- have one at the beginning.
				a_storage.append_character (a_separator)
				if {PLATFORM}.is_windows then
					a_storage.append_character ('%U')
				end
			end
			a_storage.append (other)
		end

	internal_path_append_substring_into (a_storage, other: STRING_8; other_start_index, other_end_index: INTEGER; a_separator: CHARACTER_8)
			-- Append `a_separator' if other than '%U' and not already present as last character
			-- of `a_storage.substring (other_start_index, other_end_index)', and then `other' to `a_storage'.
		require
			other_not_void: other /= Void
			other_not_empty: not other.is_empty
			other_has_not_trailing_directory_separator: not is_character (other, other.count - unit_size + 1, directory_separator)
		do
			if
				a_separator /= '%U' and
				not a_storage.is_empty and then
				not is_character (a_storage, a_storage.count - unit_size + 1, a_separator) and
				not is_character (other, other_start_index, a_separator)
			then
					-- Only add a terminator if `a_storage' does not already have one at the end, or if `other' doest not already
					-- have one at the beginning.
				a_storage.append_character (a_separator)
				if {PLATFORM}.is_windows then
					a_storage.append_character ('%U')
				end
			end
			a_storage.append_substring (other, other_start_index, other_end_index)
		end

	is_character (a_storage: like storage; a_pos: INTEGER; a_char: CHARACTER_8): BOOLEAN
			-- Is `a_char' appearing at position `a_pos' (in bytes) in `a_storage'.
		require
			a_pos_valid: a_storage.valid_index (a_pos)
			a_pos_valid_for_windows: {PLATFORM}.is_windows implies a_storage.valid_index (a_pos + 1)
			a_pos_odd_for_windows: {PLATFORM}.is_windows implies (a_pos \\ unit_size) = 1
			a_storage_count_valid_for_windows: {PLATFORM}.is_windows implies (a_storage.count \\ unit_size) = 0
		do
			if {PLATFORM}.is_windows then
				Result := a_storage.item (a_pos) = a_char and then a_storage.item (a_pos + 1) = '%U'
			else
				Result := a_storage.item (a_pos) = a_char
			end
		ensure
			definition: Result = ((a_storage.item (a_pos) = a_char) and then ({PLATFORM}.is_windows implies a_storage.item (a_pos + 1) = '%U'))
		end

	directory_separator_string: STRING_32
			-- Default directory separator for the current platform.
		once
			if {PLATFORM}.is_windows then
				Result := {STRING_32} "\"
			else
				Result := {STRING_32} "/"
			end
		end

	min_unc_path_count: INTEGER = 10
			-- Number of characters in `storage' to make up a valid UNC path: \\a\c whic is 5 Unicode characters, thus 10 bytes.

feature {NONE} -- Externals

	c_same_files (a_path1, a_path2: POINTER): BOOLEAN
			-- Do C paths `a_path1' and `a_path2' represent the same file?
		require
			a_path1_not_null: a_path1 /= default_pointer
			a_path2_not_null: a_path2 /= default_pointer
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
			EIF_BOOLEAN Result = EIF_FALSE;
			#ifdef EIF_WINDOWS
					/* To check this, we use `CreateFileW' to open both file, and then using the information
					 * returned by `GetFileInformationByHandle' we can check whether or not they are indeed
					 * the same.
					 * Note: it is important to use the W version of CreateFileW because arguments
					 * are Unicode, not ASCII. */
				BY_HANDLE_FILE_INFORMATION l_path1_info, l_path2_info;
				HANDLE l_path2_file = CreateFileW ((LPCWSTR) $a_path2, GENERIC_READ, FILE_SHARE_READ, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
				HANDLE l_path1_file = CreateFileW ((LPCWSTR) $a_path1, GENERIC_READ, FILE_SHARE_READ, NULL,
						OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			
				if ((l_path2_file == INVALID_HANDLE_VALUE) || (l_path1_file == INVALID_HANDLE_VALUE)) {
						/* We do not need the handles anymore, simply close them. Since Microsoft
						 * API accepts INVALID_HANDLE_VALUE we don't check the validity of arguments. */
					CloseHandle(l_path2_file);
					CloseHandle(l_path1_file);
				} else {
					BOOL success = GetFileInformationByHandle (l_path2_file, &l_path2_info);
					success = success && GetFileInformationByHandle (l_path1_file, &l_path1_info);
						/* We do not need the handles anymore, simply close them. */
					CloseHandle(l_path2_file);
					CloseHandle(l_path1_file);
					if (success) {
							/* Check that `path2' and `path1' do not represent the same file. */
						if
							((l_path2_info.dwVolumeSerialNumber == l_path1_info.dwVolumeSerialNumber) &&
							(l_path2_info.nFileIndexLow == l_path1_info.nFileIndexLow) &&
							(l_path2_info.nFileIndexHigh == l_path1_info.nFileIndexHigh))
						{
							Result = EIF_TRUE;
						}
					}
				}
			#else
				struct stat buf1, buf2;
				int status;
				#ifdef HAS_LSTAT
					status = lstat($a_path1, &buf1);
					if (status == 0) {
							/* We found a file, now let's check if it is not a symbolic link. If it is, we use `stat'
						 	 * to ensure the validity of the link. */
						if ((buf1.st_mode & S_IFLNK) == S_IFLNK) {
							status = stat ($a_path1, &buf1);
						}
					}
					
					if (status == 0) {
						status = lstat($a_path2, &buf2);
						if (status == 0) {
								/* We found a file, now let's check if it is not a symbolic link. If it is, we use `stat'
							 	 * to ensure the validity of the link. */
							if ((buf2.st_mode & S_IFLNK) == S_IFLNK) {
								status = stat ($a_path2, &buf2);
							}
						}
					}
				#else
					status = stat ($a_path1, &buf1);
					if (status == 0) {
						status = stat ($a_path2, &buf2);
					}
				#endif
				if (status == 0) {
						/* Both files are present, check they represent the same one. */
					if ((buf1.st_dev == buf2.st_dev) && (buf1.st_ino == buf2.st_ino)) {
						Result = EIF_TRUE;
					}
				}
			#endif
			return Result;
			]"
		end

invariant
	little_endian_windows: {PLATFORM}.is_windows implies platform.is_little_endian
	even_count_on_windows: {PLATFORM}.is_windows implies storage.count \\ unit_size = 0
	no_forward_slash_on_windows: {PLATFORM}.is_windows implies not storage.has_substring ("/%U")

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
