note

	description:

		"Environment variables defined and used in Gobo's tools."

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class UT_GOBO_VARIABLES

inherit

	ANY

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature -- Access

	gobo_variable: STRING = "GOBO"
			-- Name of environment variable "$GOBO"

	gobo_value: detachable STRING
			-- Value of environment variable "$GOBO"
		do
			Result := Execution_environment.variable_value (gobo_variable)
		ensure
			instance_free: class
		end

	gobo_library_variable: STRING = "GOBO_LIBRARY"
			-- Name of environment variable "$GOBO_LIBRARY"

	gobo_library_value: detachable STRING
			-- Value of environment variable "$GOBO_LIBRARY"
		do
			Result := Execution_environment.variable_value (gobo_library_variable)
		ensure
			instance_free: class
		end

	boehm_gc_variable: STRING = "BOEHM_GC"
			-- Name of environment variable "$BOEHM_GC"

	boehm_gc_value: detachable STRING
			-- Value of environment variable "$BOEHM_GC"
		do
			Result := Execution_environment.variable_value (boehm_gc_variable)
		ensure
			instance_free: class
		end

	zig_variable: STRING = "ZIG"
			-- Name of environment variable "$ZIG"

	zig_value: detachable STRING
			-- Value of environment variable "$ZIG"
		do
			Result := Execution_environment.variable_value (zig_variable)
		ensure
			instance_free: class
		end

	executable_pathname (a_executable_name: STRING): STRING
			-- Executable pathname of `a_executable_name'.
			-- `a_executable_name' can be `gec`, `geant`, etc.
			-- Use the same file extension as the current executable.
			-- If the executable exists in the same folder as the current executable, then use this one.
			-- Otherwise if it exists in "$GOBO/bin" then use this one.
			-- Otherwise return `a_executable_name' and rely on the PATH of the underlying operating system to find it.
		require
			a_executable_name_not_void: a_executable_name /= Void
		local
			l_executable_with_extension: STRING
			l_current_executable_pathname: STRING
			l_executable_pathname: STRING
		do
			l_current_executable_pathname := {KL_EXECUTION_ENVIRONMENT}.current_executable_pathname
			if not file_system.extension (a_executable_name).is_empty then
				l_executable_with_extension := a_executable_name
			elseif not l_current_executable_pathname.is_empty then
				l_executable_with_extension := a_executable_name + file_system.extension (l_current_executable_pathname)
			else
				l_executable_with_extension := a_executable_name + file_system.exe_extension
			end
			if not l_current_executable_pathname.is_empty then
				l_executable_pathname := file_system.pathname (file_system.dirname (l_current_executable_pathname), l_executable_with_extension)
				if file_system.file_exists (l_executable_pathname) then
					Result := l_executable_pathname
				end
			end
			if Result = Void and attached gobo_value as l_gobo_value and then not l_gobo_value.is_empty then
				l_executable_pathname := file_system.nested_pathname (l_gobo_value, <<"bin", l_executable_with_extension>>)
				if file_system.file_exists (l_executable_pathname) then
					Result := l_executable_pathname
				end
			end
			if Result = Void then
				Result := a_executable_name
			end
		ensure
			executable_pathname_not_void: Result /= Void
			instance_free: class
		end

feature -- Setting

	set_gobo_variables
			-- Set environment variables "$GOBO", "$GOBO_LIBRARY",
			-- "$BOEHM_GC" and "$ZIG" if not set yet.
		do
			set_gobo_variable
			set_gobo_library_variable
			set_boehm_gc_variable
			set_zig_variable
		ensure
			instance_free: class
		end

	set_gobo_variable
			-- Set environment variable "$GOBO" if not set yet.
		local
			l_executable_pathname: STRING
			l_dirname: STRING
			l_done: BOOLEAN
		do
			if not attached gobo_value as l_gobo or else l_gobo.is_empty then
				from
					l_executable_pathname := {KL_EXECUTION_ENVIRONMENT}.current_executable_pathname
					l_dirname := file_system.dirname (l_executable_pathname)
				until
					l_done
				loop
					if file_system.is_root_directory (l_dirname) then
						l_done := True
					elseif l_dirname.same_string (file_system.relative_current_directory) then
						l_done := True
					elseif
						file_system.directory_exists (file_system.nested_pathname (l_dirname, <<"tool", "gec">>)) and
						file_system.directory_exists (file_system.nested_pathname (l_dirname, <<"library", "tools", "src", "eiffel">>)) and
						file_system.directory_exists (file_system.pathname (l_dirname, "bin"))
					then
						Execution_environment.set_variable_value (gobo_variable, l_dirname)
						l_done := True
					else
						l_dirname := file_system.dirname (l_dirname)
					end
				end
			end
		ensure
			instance_free: class
		end

	set_gobo_library_variable
			-- Set environment variable "$GOBO_LIBRARY" to "$GOBO" if not set yet.
		do
			if not attached gobo_library_value as l_gobo_library or else l_gobo_library.is_empty then
				if attached gobo_value as l_gobo and then not l_gobo.is_empty then
					Execution_environment.set_variable_value (gobo_library_variable, l_gobo)
				end
			end
		ensure
			instance_free: class
		end

	set_boehm_gc_variable
			-- Set environment variable "$BOEHM_GC" if not set yet.
		local
			l_pathname: STRING
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
		do
			if not attached boehm_gc_value as l_boehm_gc_value or else l_boehm_gc_value.is_empty then
				l_pathname := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "backend", "c", "boehm_gc">>)
				l_pathname := Execution_environment.interpreted_string (l_pathname)
				l_filename := file_system.nested_pathname (l_pathname, <<"include", "gc.h">>)
				create l_file.make (l_filename)
				if l_file.exists then
					Execution_environment.set_variable_value (boehm_gc_variable, l_pathname)
				end
			end
		ensure
			instance_free: class
		end

	set_zig_variable
			-- Set environment variable "$ZIG" if not set yet.
		local
			l_pathname: STRING
			l_filename: STRING
		do
			if not attached zig_value as l_zig_value or else l_zig_value.is_empty then
				l_pathname := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "backend", "c", "zig">>)
				l_pathname := Execution_environment.interpreted_string (l_pathname)
				if file_system.directory_exists (l_pathname) then
					l_filename := file_system.pathname (l_pathname, "zig")
					Execution_environment.set_variable_value (zig_variable, l_filename)
				else
					Execution_environment.set_variable_value (zig_variable, "zig")
				end
			end
		ensure
			instance_free: class
		end

end
