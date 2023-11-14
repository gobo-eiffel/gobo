note
	description: "[
		File utilities, for retrieving files and folders and formatting paths.
	]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2020-04-04 18:39:52 +0000 (Sat, 04 Apr 2020) $"
	revision: "$Revision: 104028 $"

expanded class
	FILE_UTILITIES

feature -- Query

	frozen compact_path (a_path: READABLE_STRING_32): detachable STRING_32
			-- Compacts a file path, removing . and ..
			--
			-- `a_path': A path to compact.
			-- `Result': The compacted path or Void if the path could not be compacted.
		require
			a_path_attached: a_path /= Void
			not_a_path_is_empty: not a_path.is_empty
		local
			l_sep: CHARACTER_32
			l_parts: LIST [READABLE_STRING_32]
			l_part: READABLE_STRING_32
			l_error: BOOLEAN
		do
			l_sep := operating_environment.directory_separator

				-- Separate path
			l_parts := a_path.split (l_sep)
			from l_parts.start until l_parts.after or l_error loop
				l_part := l_parts.item
				if l_part.same_string_general (".") then
						-- Current directory, simple remove
					l_parts.remove
				elseif l_part.same_string_general ("..") then
						-- Remove parent
					l_parts.remove
					if not l_parts.is_empty then
						l_parts.back
						if not l_parts.before and not l_parts.item.is_empty then
							l_parts.remove
						else
							l_error := True
						end
					end
				else
					l_parts.forth
				end
			end

			if not l_error then
					-- Rebuild the path
				create Result.make (a_path.count)
				from l_parts.start until l_parts.after loop
					Result.append (l_parts.item)
					if not l_parts.islast then
						Result.append_character (l_sep)
					end
					l_parts.forth
				end
			end
		end

	ends_with (a_folder: PATH; a_end_with: READABLE_STRING_GENERAL a_levels: INTEGER_32): ARRAYED_LIST [PATH]
			-- Scans a folder for matching files.
			--
			-- `a_folder': Folder location to scan.
			-- `a_levels': Number of levels to recursively scan. 0 to scan the specified folder only, -1 to scan all folders.
			-- `a_end_with': A string results end with, ignoring cases.
		require
			a_folder_exists: directory_path_exists (a_folder)
			a_levels_is_valid: a_levels >= -1
		do
			Result := internal_files_end_with (a_folder, a_end_with, a_levels, True)
		end

feature {NONE} -- Query

	frozen internal_files_end_with (a_folder: PATH; a_end_with: READABLE_STRING_GENERAL; a_levels: INTEGER_32; a_recursive: BOOLEAN): ARRAYED_LIST [PATH]
			-- Scans a folder for matching files.
			--
			-- `a_folder': Folder location to scan.
			-- `a_levels': Number of levels to recursively scan. 0 to scan the specified folder only, -1 to scan all folders.
			-- `a_end_with': A string results end with, ignoring cases
		require
			a_folder_exists: directory_path_exists (a_folder)
			a_levels_is_valid: a_levels >= -1
		local
			l_dn: PATH
			l_dir: detachable DIRECTORY
			l_retried: BOOLEAN
			l_path: PATH
			f: RAW_FILE
			d: DIRECTORY
		do
			if not l_retried then
				if a_recursive then
					l_dn := a_folder.absolute_path
				else
					l_dn := a_folder
				end

				create l_dir.make_with_path (l_dn)
				if l_dir.exists and then l_dir.is_readable then
					l_dir.open_read
					from
						create Result.make (l_dir.count)
						l_dir.readentry
					until
						not attached l_dir.last_entry_32 as e
					loop
						l_path := l_dn.extended (e)
						create f.make_with_path (l_path)
						if f.exists and then f.is_readable and then f.is_plain and then e.as_lower.ends_with_general (a_end_with.as_lower) then
							Result.extend (l_path)
						else
							if
								(e.count = 1 and then e [1] = '.') or else
								(e.count = 2 and then e [1] = '.' and then e [2] = '.')
							then
									-- This is a reference to the current or to the parent directory.
							elseif a_levels > 0 or else a_levels = -1 then
									-- Check recursiverly  if `a_levels' asks for recursion.
								create d.make_with_path (l_path)
								if d.exists and then d.is_readable then
									Result.append (internal_files_end_with (l_path, a_end_with, (a_levels - 1).max (-1), False))
								end
							end
						end
						l_dir.readentry
					end
					l_dir.close
				else
					create Result.make (0)
				end
			elseif l_dir /= Void and then not l_dir.is_closed then
				l_dir.close
				create Result.make (0)
			else
				create Result.make (0)
			end
		rescue
			l_retried := True
			retry
		end

feature -- File name operations

	make_directory_name_in (name: READABLE_STRING_GENERAL; location: READABLE_STRING_GENERAL): READABLE_STRING_GENERAL
			-- A directory name for directory `name' in directory `location'.
		do
			Result := make_file_name_in (name, location)
		end

	make_file_name_in (name: READABLE_STRING_GENERAL; location: READABLE_STRING_GENERAL): READABLE_STRING_GENERAL
			-- A file name for file `name' in directory `location'.
		do
			Result := (create {PATH}.make_from_string (location)).extended (name).name
		end

feature -- Directory operations

 	directory_path_exists (p: PATH): BOOLEAN
			-- Does directory of path `p' exist?
		do
			Result := not p.is_empty and then (create {DIRECTORY}.make_with_path (p)).exists
		end

	directory_exists (n: READABLE_STRING_GENERAL): BOOLEAN
			-- Does directory of name `n' exist?
		do
			Result := not n.is_empty and then (create {DIRECTORY}.make (n)).exists
		end

	file_names (n: READABLE_STRING_32): detachable ARRAYED_LIST [STRING_32]
			-- List of file names in directory with name `n'.
			-- Or void if directory is not readable (does not exist, cannot be accessed, etc.).
		local
			d: detachable DIRECTORY
			is_retried: BOOLEAN
			f: RAW_FILE
		do
			if not is_retried then
				create d.make (n)
				if d.exists and then d.is_readable then
					d.open_read
					from
						create Result.make (0)
						d.readentry
					until
						not attached d.last_entry_32 as e
					loop
						create f.make_with_path ((create {PATH}.make_from_string (n)).extended (e))
						if f.exists and then f.is_readable and then f.is_plain then
							Result.extend (e)
						end
						d.readentry
					end
					d.close
				end
			elseif attached d and then not d.is_closed then
				d.close
			end
		rescue
			is_retried := True
			retry
		end

	directory_names (n: READABLE_STRING_32): detachable ARRAYED_LIST [STRING_32]
			-- List of directory names (excluding current and parent directory) in directory with name `n'.
			-- Or void if directory is not readable (does not exist, cannot be accessed, etc.).
		local
			d: detachable DIRECTORY
			is_retried: BOOLEAN
			f: DIRECTORY
		do
			if not is_retried then
				create d.make (n)
				if d.exists and then d.is_readable then
					d.open_read
					from
						create Result.make (0)
						d.readentry
					until
						not attached d.last_entry_32 as e
					loop
						if
							(e.count = 1 and then e [1] = '.') or else
							(e.count = 2 and then e [1] = '.' and then e [2] = '.')
						then
								-- This is a reference to the current or to the parent directory.
						else
							create f.make_with_path ((create {PATH}.make_from_string (n)).extended (e))
							if f.exists and then f.is_readable then
								Result.extend (e)
							end
						end
						d.readentry
					end
					d.close
				end
			elseif attached d and then not d.is_closed then
				d.close
			end
		rescue
			is_retried := True
			retry
		end

	create_directory_path (a_path: PATH)
			-- Creates a directory and any parent directories if they do not exist.
			--
			-- `a_path': The path to create.
		require
			a_path_attached: a_path /= Void
			not_a_path_is_empty: not a_path.is_empty
		local
			is_retried: BOOLEAN
			d: DIRECTORY
		do
			if not is_retried then
				create d.make_with_path (a_path)
				if not d.exists then
					d.recursive_create_dir
				end
			end
		ensure
			class
		rescue
			is_retried := True
			retry
		end

	create_directory (a_path: READABLE_STRING_GENERAL)
			-- Creates a directory and any parent directories if they do not exist.
			--
			-- `a_path': The directory to create.
		require
			a_path_attached: a_path /= Void
			not_a_path_is_empty: not a_path.is_empty
		local
			is_retried: BOOLEAN
			d: DIRECTORY
		do
			if not is_retried then
				create d.make (a_path)
				if not d.exists then
					d.recursive_create_dir
				end
			end
		ensure
			class
		rescue
			is_retried := True
			retry
		end

feature -- File operations

	copy_file (old_name, new_name: READABLE_STRING_GENERAL)
			-- Copy file named `old_name' to `new_name'.
		local
			f: detachable RAW_FILE
			t: detachable RAW_FILE
			is_rescued: BOOLEAN
		do
			if is_rescued then
				if attached f and then f.is_open_read then
					f.close
				end
				if attached t and then t.is_open_write then
					t.close
				end
			else
				create f.make_with_name (old_name)
				f.open_read
				create t.make_with_name (new_name)
				t.open_write
				f.copy_to (t)
				f.close
				t.close
			end
		rescue
			if not is_rescued then
				is_rescued := True
				retry
			end
		end

	copy_file_path (old_path, new_path: PATH)
			-- Copy file named `old_path' to `new_path'.
		local
			f: detachable RAW_FILE
			t: detachable RAW_FILE
			is_rescued: BOOLEAN
		do
			if is_rescued then
				if attached f and then f.is_open_read then
					f.close
				end
				if attached t and then t.is_open_write then
					t.close
				end
			else
				create f.make_with_path (old_path)
				f.open_read
				create t.make_with_path (new_path)
				t.open_write
				f.copy_to (t)
				f.close
				t.close
			end
		rescue
			if not is_rescued then
				is_rescued := True
				retry
			end
		end

	rename_file (old_name, new_name: READABLE_STRING_GENERAL)
			-- Rename file named `old_name' to `new_name'.
		do
			(create {RAW_FILE}.make_with_name (old_name)).rename_file (new_name)
		end

	rename_file_path (old_path, new_path: PATH)
			-- Rename file named `old_path' to `new_path'.
		do
			(create {RAW_FILE}.make_with_path (old_path)).rename_path (new_path)
		end

	file_exists (n: READABLE_STRING_GENERAL): BOOLEAN
			-- Does file of name `n' exist?
		local
			f: RAW_FILE
			is_retried: BOOLEAN
		do
			if not n.is_empty and then not is_retried then
				create f.make_with_name (n)
				Result := f.exists and then f.is_plain
			end
		rescue
			is_retried := True
			retry
		end

	file_path_exists (p: PATH): BOOLEAN
			-- Does file of path `p' exist?
		local
			f: RAW_FILE
			is_retried: BOOLEAN
		do
			if not p.is_empty and then not is_retried then
				create f.make_with_path (p)
				Result := f.exists and then f.is_plain
			end
		rescue
			is_retried := True
			retry
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	licensing_options: "http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
