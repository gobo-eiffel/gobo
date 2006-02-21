indexing

	description:
		"The objects available from the environment at time of execution"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class EXECUTION_ENVIRONMENT

feature -- Access

	command_line: ARGUMENTS is
			-- Command line that was used to start current execution
		once
			create Result
		end

	current_working_directory: STRING is
			-- Directory of current execution
		external
			"C use %"eif_dir.h%""
		alias
			"dir_current"
		ensure
			result_not_void: Result /= Void
		end

	default_shell: STRING is
			-- Default shell
		once
			Result := get ("SHELL")
			if Result = Void then
				Result := ""
			end
		end

	get (s: STRING): STRING is
			-- Value of `s' if it is an environment variable and has been set;
			-- void otherwise.
		require
			s_exists: s /= Void
			not_has_null_character: not s.has ('%U')
		local
			ext: ANY
			c_string: POINTER
			void_pointer: POINTER
		do
			ext := s.to_c
			c_string := eif_getenv ($ext)
			if c_string /= void_pointer then
				create Result.make_from_c (c_string)
			end
		end

	home_directory_name: STRING is
			-- Directory name corresponding to the home directory.
		require
			home_directory_supported: Operating_environment.home_directory_supported
		do
			Result := eif_home_directory_name
		end

	root_directory_name: STRING is
			-- Directory name corresponding to the root directory.
		require
			root_directory_supported: Operating_environment.root_directory_supported
		do
			Result := eif_root_directory_name
		ensure
			result_not_void: Result /= Void
		end

feature -- Status

	return_code: INTEGER
			-- Status code set by last call to `system' or `put'

feature -- Status setting

	change_working_directory (path: STRING) is
			-- Set the current directory to `path'
		local
			ext: ANY
		do
			ext := path.to_c
			return_code := eif_chdir ($ext)
		end

	put (value, key: STRING) is
			-- Set the environment variable `key' to `value'.
		require
			key_exists: key /= Void
			key_meaningful: not key.is_empty
			not_key_has_null_character: not key.has ('%U')
			value_exists: value /= Void
			not_value_has_null_character: not value.has ('%U')
		local
			l_env: STRING
			l_c_env: C_STRING
		do
			create l_env.make (value.count + key.count + 1)
			l_env.append (key)
			l_env.append_character ('=')
			l_env.append (value)
			create l_c_env.make (l_env)
			
			environ.force (l_c_env, key)
			return_code := eif_putenv (l_c_env.item)
		ensure
			variable_set: (return_code = 0) implies (value.is_equal (get (key)))
		end

	system (s: STRING) is
			-- Pass to the operating system a request to execute `s'.
			-- If `s' is empty, use the default shell as command.
		require
			s_exists: s /= Void
		local
			ext: ANY
		do
			if s.is_empty then
				ext := default_shell.to_c
			else
				ext := s.to_c
			end
			return_code := system_call ($ext)
		end

	launch (s: STRING) is
			-- Pass to the operating system an asynchronous request to
			-- execute `s'.
			-- If `s' is empty, use the default shell as command.
		require
			s_not_void: s /= Void
		local
			ext: ANY
		do
			if s.is_empty then
				ext := default_shell.to_c
			else
				ext := s.to_c
			end
			asynchronous_system_call ($ext)
		end

feature {NONE} -- Implementation

	environ: HASH_TABLE [C_STRING, STRING] is
			-- Environment variable memory set by current execution,
			-- indexed by environment variable name. Needed otherwise
			-- we would corrupt memory after freeing memory used by
			-- C_STRING instance since not referenced anywhere else.
		once
			create Result.make (10)
		end

feature {NONE} -- External

	eif_getenv (s: POINTER): POINTER is
			-- Value of environment variable `s'
		external
			"C use %"eif_misc.h%""
		end

	eif_putenv (v: POINTER): INTEGER is
			-- Set `v' in environment.
		external
			"C use <stdlib.h>"
		alias
			"putenv"
		end

	eif_chdir (path: POINTER): INTEGER is
			-- Set the current directory to `path'
		external
			"C use %"eif_dir.h%""
		end

	system_call (s: POINTER): INTEGER is
			-- Pass to the operating system a request to execute `s'.
		external
			"C blocking use %"eif_misc.h%""
		alias
			"eif_system"
		end

	asynchronous_system_call (s: POINTER) is
			-- Pass to the operating system an asynchronous request to execute `s'.
		external
			"C blocking use %"eif_misc.h%""
		alias
			"eif_system_asynchronous"
		end

	eif_home_directory_name: STRING is
			-- Directory name corresponding to the home directory
		external
			"C use %"eif_path_name.h%""
		end

	eif_root_directory_name: STRING is
			-- Directory name corresponding to the root directory
		external
			"C use %"eif_path_name.h%""
		end

end
