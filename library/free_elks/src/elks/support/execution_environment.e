note
	description: "The objects available from the environment at time of execution"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-07 23:36:00 +0100 (Mon, 07 Jan 2013) $"
	revision: "$Revision: 692 $"


class EXECUTION_ENVIRONMENT

inherit
	NATIVE_STRING_HANDLER

feature -- Access

	arguments: ARGUMENTS_32
			-- Arguments that were used to start current execution.
		once
			create Result
		end

	command_line: ARGUMENTS
			-- Command line that was used to start current execution
		obsolete
			"Use `arguments' instead for handling Unicode command lines."
		once
			create Result
		end

	current_working_path: PATH
			-- Directory of current execution.
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		do
			l_count := 50
			create l_managed.make (l_count)
			l_nbytes := eif_dir_current (l_managed.item, l_count)
			if l_nbytes = -1 then
					-- The underlying OS could not retrieve the current working directory. Most likely
					-- a case where it has been deleted under our feet. We simply return that the current
					-- directory is `.' the symbol for the current working directory.
				create Result.make_from_string (".")
			else
				if l_nbytes > l_count then
						-- We need more space.
					l_count := l_nbytes
					l_managed.resize (l_count)
					l_nbytes := eif_dir_current (l_managed.item, l_count)
				end
				if l_nbytes > 0 and l_nbytes <= l_count then
					create Result.make_from_pointer (l_managed.item)
				else
						-- Something went wrong.
					create Result.make_from_string (".")
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	current_working_directory: STRING
			-- Directory of current execution.
			-- Execution of this query on concurrent threads will result in
			-- an unspecified behavior.
		obsolete
			"Use `current_working_path' instead to support Unicode path."
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		do
			l_count := 50
			create l_managed.make (l_count)
			l_nbytes := eif_dir_current (l_managed.item, l_count)
			if l_nbytes = -1 then
					-- The underlying OS could not retrieve the current working directory. Most likely
					-- a case where it has been deleted under our feet. We simply return that the current
					-- directory is `.' the symbol for the current working directory.
				Result := "."
			else
				if l_nbytes > l_count then
						-- We need more space.
					l_count := l_nbytes
					l_managed.resize (l_count)
					l_nbytes := eif_dir_current (l_managed.item, l_count)
				end
				if l_nbytes > 0 and l_nbytes <= l_count then
					Result := file_info.pointer_to_file_name_8 (l_managed.item)
				else
						-- Something went wrong.
					Result := "."
					check False end
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	default_shell: STRING_32
			-- Default shell
		once
			if attached item ("SHELL") as l_shell then
				Result := l_shell
			else
				create Result.make_empty
			end
		end

	get (s: STRING): detachable STRING
			-- Value of `s' if it is an environment variable and has been set;
			-- void otherwise.
		obsolete
			"Use `item' instead to retrieve Unicode environment variables."
		require
			s_exists: s /= Void
			not_has_null_character: not s.has ('%U')
		do
			if attached item (s) as l_val then
					-- If the environment variable contains non-ASCII characters they
					-- will be missing.
				Result := l_val.as_string_8
			end
		end

	item (s: READABLE_STRING_GENERAL): detachable STRING_32
			-- Value of `s' if it is an environment variable and has been set;
			-- void otherwise.
		require
			s_exists: s /= Void
			not_has_null_character: not s.has ('%U')
		local
			l_key, l_value: NATIVE_STRING
			c_string: POINTER
		do
			create l_key.make (s)
			c_string := eif_getenv (l_key.item)
			if not c_string.is_default_pointer then
				create l_value.make_from_pointer (c_string)
				Result := l_value.string
			end
		end

	home_directory_path: detachable PATH
			-- Directory name corresponding to the home directory.
		require
			home_directory_supported: Operating_environment.home_directory_supported
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		once
			l_count := 50
			create l_managed.make (l_count)
			l_nbytes := eif_home_directory_name_ptr (l_managed.item, l_count)
			if l_nbytes > l_count then
				l_count := l_nbytes
				l_managed.resize (l_count)
				l_nbytes := eif_home_directory_name_ptr (l_managed.item, l_count)
			end
			if l_nbytes > 0 and l_nbytes <= l_count then
				create Result.make_from_pointer (l_managed.item)
			end
		end

	user_directory_path: detachable PATH
			-- Directory name corresponding to the user directory
			-- On Windows: C:\Users\manus\Documents
			-- On Unix & Mac: $HOME
			-- Otherwise Void
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		once
			l_count := 50
			create l_managed.make (50)
			l_nbytes := eif_user_directory_name_ptr (l_managed.item, l_count)
			if l_nbytes > l_count then
				l_count := l_nbytes
				l_managed.resize (l_count)
				l_nbytes := eif_user_directory_name_ptr (l_managed.item, l_count)
			end
			if l_nbytes > 0 and l_nbytes <= l_count then
				create Result.make_from_pointer (l_managed.item)
			end
			if Result /= Void and then not Result.is_empty then
					-- Nothing to do here, we take what we got from the OS.
			elseif
				operating_environment.home_directory_supported and then
				attached home_directory_path as l_home
			then
					-- We use $HOME.
				Result := l_home
			else
					-- No possibility of a user directory, we let the caller handle that.
				Result := Void
			end
		end

	home_directory_name: detachable STRING
			-- Directory name corresponding to the home directory.
		obsolete
			"Use `home_directory_path' instead to support Unicode path."
		require
			home_directory_supported: Operating_environment.home_directory_supported
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		once
			l_count := 50
			create l_managed.make (l_count)
			l_nbytes := eif_home_directory_name_ptr (l_managed.item, l_count)
			if l_nbytes > l_count then
				l_count := l_nbytes
				l_managed.resize (l_count)
				l_nbytes := eif_home_directory_name_ptr (l_managed.item, l_count)
			end
			if l_nbytes > 0 and l_nbytes <= l_count then
				Result := file_info.pointer_to_file_name_8 (l_managed.item)
			end
		end

	user_directory_name: detachable STRING
			-- Directory name corresponding to the user directory
			-- On Windows: C:\Users\manus\Documents
			-- On Unix & Mac: $HOME
			-- Otherwise Void
		obsolete
			"Use `user_directory_path' instead to support Unicode paths."
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		once
			l_count := 50
			create l_managed.make (50)
			l_nbytes := eif_user_directory_name_ptr (l_managed.item, l_count)
			if l_nbytes > l_count then
				l_count := l_nbytes
				l_managed.resize (l_count)
				l_nbytes := eif_user_directory_name_ptr (l_managed.item, l_count)
			end
			if l_nbytes > 0 and l_nbytes <= l_count then
				Result := file_info.pointer_to_file_name_8 (l_managed.item)
			end
			if Result /= Void and then not Result.is_empty then
					-- Nothing to do here, we take what we got from the OS.
			elseif
				operating_environment.home_directory_supported and then
				attached home_directory_name as l_home
			then
					-- We use $HOME.
				Result := l_home
			else
					-- No possibility of a user directory, we let the caller handle that.
				Result := Void
			end
		end

	root_directory_name: STRING
			-- Directory name corresponding to the root directory.
		require
			root_directory_supported: Operating_environment.root_directory_supported
		once
			if {PLATFORM}.is_windows then
				Result := "\"
			elseif {PLATFORM}.is_vms then
				Result := "[000000]"
			else
				Result := "/"
			end
		ensure
			result_not_void: Result /= Void
		end

	starting_environment_variables: HASH_TABLE [STRING_8, STRING_8]
			-- Table of environment variables when current process starts,
			-- indexed by variable name
		obsolete
			"Use starting_environment which support unicode. [dec/2012]"
		local
			l_ptr: POINTER
			i: INTEGER
			ns: NATIVE_STRING
		do
			create Result.make (40)
			from
				i := 0
				l_ptr := i_th_environ (i)
				create ns.make_empty (0)
			until
				l_ptr.is_default_pointer
			loop
				ns.set_shared_from_pointer (l_ptr)
				if attached separated_variables (ns.string) as l_curr_var then
					Result.force (l_curr_var.value.as_string_8, l_curr_var.key.as_string_8)
				end
				i := i + 1
				l_ptr := i_th_environ (i)
			end
		ensure
			result_attached: Result /= Void
		end

	starting_environment: HASH_TABLE [STRING_32, STRING_32]
			-- Table of environment variables when current process starts,
			-- indexed by variable name
		local
			l_ptr: POINTER
			i: INTEGER
			ns: NATIVE_STRING
		do
			create Result.make (40)
			from
				i := 0
				l_ptr := i_th_environ (i)
				create ns.make_empty (0)
			until
				l_ptr.is_default_pointer
			loop
				ns.set_shared_from_pointer (l_ptr)
				if attached separated_variables (ns.string) as l_curr_var then
					Result.force (l_curr_var.value, l_curr_var.key)
				end
				i := i + 1
				l_ptr := i_th_environ (i)
			end
		ensure
			result_attached: Result /= Void
		end

feature -- Status

	return_code: INTEGER
			-- Status code set by last call to `system' or `put'

feature -- Status setting

	change_working_directory (path: READABLE_STRING_GENERAL)
			-- Set the current directory to `path'
		obsolete
			"Use `change_working_path' instead to support Unicode path."
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := file_info.file_name_to_pointer (path, Void)
			return_code := eif_chdir (l_ptr.item)
		end

	change_working_path (path: PATH)
			-- Set the current directory to `path'
		local
			l_ptr: MANAGED_POINTER
		do
			l_ptr := path.to_pointer
			return_code := eif_chdir (l_ptr.item)
		end

	put (value, key: READABLE_STRING_GENERAL)
			-- Set the environment variable `key' to `value' treating both
			-- `value' and `key' as Unicode characters.
		require
			key_exists: key /= Void
			key_meaningful: not key.is_empty
			not_key_has_null_character: not key.has ('%U')
			value_exists: value /= Void
			not_value_has_null_character: not value.has ('%U')
		local
			l_env: STRING_32
			l_c_env: NATIVE_STRING
		do
			create l_env.make (value.count + key.count + 1)
			l_env.append_string_general (key)
			l_env.append_character ('=')
			l_env.append_string_general (value)
			create l_c_env.make (l_env)
			environ.force (l_c_env, create {IMMUTABLE_STRING_32}.make_from_string_general (key))
			return_code := eif_putenv (l_c_env.item)
		ensure
			variable_set: return_code = 0 implies
				((value.is_empty and then item (key) = Void) or else
				not value.is_empty and then attached item (key) as k and then k.same_string_general (value))
		end

	system (s: READABLE_STRING_GENERAL)
			-- Pass to the operating system a request to execute `s' interpreted as a Unicode string.
			-- If `s' is empty, use the default shell as command.
		require
			s_exists: s /= Void
		local
			l_cstr: NATIVE_STRING
		do
			if s.is_empty then
				create l_cstr.make (default_shell)
			else
				create l_cstr.make (s)
			end
			return_code := system_call (l_cstr.item)
		end

	launch (s: READABLE_STRING_GENERAL)
			-- Pass to the operating system an asynchronous request to
			-- execute `s' interpreted as a Unicode string.
			-- If `s' is empty, use the default shell as command.
		require
			s_not_void: s /= Void
		local
			l_cstr: NATIVE_STRING
		do
			if s.is_empty then
				create l_cstr.make (default_shell)
			else
				create l_cstr.make (s)
			end
			asynchronous_system_call (l_cstr.item)
		end

	sleep (nanoseconds: INTEGER_64)
			-- Suspend thread execution for interval specified in
			-- `nanoseconds' (1 nanosecond = 10^(-9) second).
		require
			non_negative_nanoseconds: nanoseconds >= 0
		do
			eif_sleep (nanoseconds)
		end

feature {NONE} -- Implementation

	environ: HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32]
			-- Environment variable memory set by current execution,
			-- indexed by environment variable name. Needed otherwise
			-- we would corrupt memory after freeing memory used by
			-- NATIVE_STRING instance since not referenced anywhere else.
		once
			create Result.make (10)
		end

	i_th_environ (i: INTEGER): POINTER
			-- Environment variable at `i'-th position of `eif_environ'.
		require
			i_valid: i >=0
		external
			"C inline use <string.h>"
		alias
			"[
				if (eif_environ) {
					#ifdef EIF_WINDOWS
						EIF_NATIVE_CHAR *vars = (EIF_NATIVE_CHAR *) eif_environ;
						int cnt = 0;
						for (; *vars; vars++) {
						   if ($i==cnt) return vars;
						   while (*vars) { vars++; }
						   cnt++;
						}
						return NULL;
					#else
						return ((EIF_NATIVE_CHAR **)eif_environ)[$i];
					#endif
				} else {
					return NULL;
				}
			]"
		end

	separated_variables (a_var: STRING_32): detachable TUPLE [value: STRING_32; key: STRING_32]
			-- Given an environment variable `a_var' in form of "key=value",
			-- return separated key and value.
			-- Return Void if `a_var' is in incorrect format.
		require
			a_var_attached: a_var /= Void
		local
			i, j: INTEGER
			done: BOOLEAN
		do
			j := a_var.count
			from
				i := 1
			until
				i > j or done
			loop
				if a_var.item (i) = '=' then
					done := True
				else
					i := i + 1
				end
			end
			if i > 1 and then i < j then
				Result := [a_var.substring (i + 1, j), a_var.substring (1, i - 1)]
			end
		end

	file_info: FILE_INFO
			-- Platform specific helper of filenames.
		obsolete
			"Remove when all obsolete routines using it will be removed."
		once
			create Result.make
		end

feature {NONE} -- External

	eif_dir_current (a_ptr: POINTER; a_count: INTEGER): INTEGER
			-- Store platform specific path of current working directory in `a_ptr' with `a_count' bytes. If
			-- there is a need for more bytes than `a_count', or if `a_ptr' is the default_pointer, nothing is done with `a_ptr'.
			-- We always return the number of bytes required including the null-terminating character, or -1 on error.
		external
			"C signature (EIF_FILENAME, EIF_INTEGER): EIF_INTEGER use %"eif_dir.h%""
		end

	eif_getenv (s: POINTER): POINTER
			-- Value of environment variable `s'
		external
			"C inline use <stdlib.h>"
		alias
			"[
			#ifdef EIF_WINDOWS
				return _wgetenv ((EIF_NATIVE_CHAR *) $s);
			#else
				return getenv ((EIF_NATIVE_CHAR *) $s);
			#endif
			]"
		end

	eif_putenv (v: POINTER): INTEGER
			-- Set `v' in environment.
		external
			"C inline use <stdlib.h>"
		alias
			"[
			#ifdef EIF_WINDOWS
				return _wputenv ((EIF_NATIVE_CHAR *) $v);
			#else
				return putenv ((EIF_NATIVE_CHAR *) $v);
			#endif
			]"
		end

	eif_chdir (path: POINTER): INTEGER
			-- Set the current directory to `path'
		external
			"C signature (EIF_FILENAME): EIF_INTEGER use %"eif_dir.h%""
		end

	system_call (s: POINTER): INTEGER
			-- Pass to the operating system a request to execute `s'.
		external
			"C blocking use %"eif_misc.h%""
		alias
			"eif_system"
		end

	asynchronous_system_call (s: POINTER)
			-- Pass to the operating system an asynchronous request to execute `s'.
		external
			"C blocking use %"eif_misc.h%""
		alias
			"eif_system_asynchronous"
		end

	eif_home_directory_name_ptr (a_ptr: POINTER; a_count: INTEGER): INTEGER
			-- Stored directory name corresponding to the home directory in `a_ptr' with `a_count' bytes. If
			-- there is a need for more bytes than `a_count', or if `a_ptr' is the default_pointer, nothing is done with `a_ptr'.
			-- We always return the number of bytes required including the null-terminating character.
		external
			"C signature (EIF_FILENAME, EIF_INTEGER): EIF_INTEGER use %"eif_path_name.h%""
		end

	eif_user_directory_name_ptr (a_buffer: POINTER; a_count: INTEGER): INTEGER
			-- Directory name corresponding to the user directory that will be stored in buffer `a_buffer'
			-- of size `a_count' bytes. Returns the number of bytes necessary in `a_buffer' to get the full copy.
		external
			"C signature (EIF_FILENAME, EIF_INTEGER): EIF_INTEGER use %"eif_path_name.h%""
		end

	eif_sleep (nanoseconds: INTEGER_64)
			-- Suspend thread execution for interval specified in
			-- `nanoseconds' (1 nanosecond = 10^(-9) second).
		require
			non_negative_nanoseconds: nanoseconds >= 0
		external
			"C blocking use %"eif_misc.h%""
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
