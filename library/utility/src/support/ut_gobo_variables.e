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
		do
			if not attached gobo_value as l_gobo or else l_gobo.is_empty then
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
		do
			if not attached boehm_gc_value as l_boehm_gc_value or else l_boehm_gc_value.is_empty then
				l_pathname := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "backend", "c", "boehm_gc">>)
				l_pathname := Execution_environment.interpreted_string (l_pathname)
				l_filename := file_system.nested_pathname (l_pathname, <<"include", "gc.h">>)
				if file_system.file_exists (l_filename) then
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
