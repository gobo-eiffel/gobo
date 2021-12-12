note

	description:

		"Environment variables defined and used in ISE's tools."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ISE_VARIABLES

inherit

	ANY

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	ise_eiffel_variable: STRING = "ISE_EIFFEL"
			-- Name of environment variable "$ISE_EIFFEL"

	ise_eiffel_value: detachable STRING
			-- Value of environment variable "$ISE_EIFFEL"
		do
			Result := Execution_environment.variable_value (ise_eiffel_variable)
		ensure
			instance_free: class
		end

	ise_library_variable: STRING = "ISE_LIBRARY"
			-- Name of environment variable "$ISE_LIBRARY"

	ise_library_value: detachable STRING
			-- Value of environment variable "$ISE_LIBRARY"
		do
			Result := Execution_environment.variable_value (ise_library_variable)
		ensure
			instance_free: class
		end

	eiffel_library_variable: STRING = "EIFFEL_LIBRARY"
			-- Name of environment variable "$EIFFEL_LIBRARY"

	eiffel_library_value: detachable STRING
			-- Value of environment variable "$EIFFEL_LIBRARY"
		do
			Result := Execution_environment.variable_value (eiffel_library_variable)
		ensure
			instance_free: class
		end

	ise_platform_variable: STRING = "ISE_PLATFORM"
			-- Name of environment variable "$ISE_PLATFORM"

	ise_platform_value: detachable STRING
			-- Value of environment variable "$ISE_PLATFORM"
		do
			Result := Execution_environment.variable_value (ise_platform_variable)
		ensure
			instance_free: class
		end

	ise_c_compiler_variable: STRING = "ISE_C_COMPILER"
			-- Name of environment variable "$ISE_C_COMPILER"

	ise_c_compiler_value: detachable STRING
			-- Value of environment variable "$ISE_C_COMPILER"
		do
			Result := Execution_environment.variable_value (ise_c_compiler_variable)
		ensure
			instance_free: class
		end

feature -- Setting

	set_ise_variables
			-- Set environment variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY",
			-- "$ISE_PLATFORM" and "$ISE_C_COMPILER" if not set yet.
		do
			set_ise_library_variable
			set_eiffel_library_variable
			set_ise_platform_variable
			set_ise_c_compiler_variable
		end

	set_ise_library_variable
			-- Set environment variable "$ISE_LIBRARY" to "$ISE_EIFFEL" if not set yet.
		local
			l_ise_eiffel: detachable STRING
			l_ise_library: detachable STRING
		do
			l_ise_library := ise_library_value
			if l_ise_library = Void or else l_ise_library.is_empty then
				l_ise_eiffel := ise_eiffel_value
				if l_ise_eiffel /= Void and then not l_ise_eiffel.is_empty then
					Execution_environment.set_variable_value (ise_library_variable, l_ise_eiffel)
				end
			end
		ensure
			instance_free: class
		end

	set_eiffel_library_variable
			-- Set environment variable "$EIFFEL_LIBRARY" to "$ISE_EIFFEL" if not set yet.
		local
			l_ise_eiffel: detachable STRING
			l_eiffel_library: detachable STRING
		do
			l_eiffel_library := eiffel_library_value
			if l_eiffel_library = Void or else l_eiffel_library.is_empty then
				l_ise_eiffel := ise_eiffel_value
				if l_ise_eiffel /= Void and then not l_ise_eiffel.is_empty then
					Execution_environment.set_variable_value (eiffel_library_variable, l_ise_eiffel)
				end
			end
		ensure
			instance_free: class
		end

	set_ise_platform_variable
			-- Set environment variable "$ISE_PLATFORM" if not set yet.
		local
			l_value: STRING
		do
			if not attached ise_platform_value as l_ise_platform_value or else l_ise_platform_value.is_empty then
				if {PLATFORM}.is_windows and {PLATFORM}.is_64_bits then
					l_value := "win64"
				elseif {PLATFORM}.is_windows then
					l_value := "windows"
				elseif {PLATFORM}.is_mac and {PLATFORM}.is_64_bits then
					l_value := "macosx-x86-64"
				elseif {PLATFORM}.is_mac then
					l_value := "macosx-x86"
				elseif {PLATFORM}.is_64_bits then
					l_value := "linux-x86-64"
				else
					l_value := "linux-x86"
				end
				Execution_environment.set_variable_value (ise_platform_variable, l_value)
			end
		ensure
			instance_free: class
		end

	set_ise_c_compiler_variable
			-- Set environment variable "$ISE_C_COMPILER" if not set yet.
		local
			l_value: detachable STRING
			l_file: KL_TEXT_INPUT_FILE
			l_filename: STRING
		do
			if not attached ise_c_compiler_value as l_ise_c_compiler_value or else l_ise_c_compiler_value.is_empty then
				l_filename := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "config", "c", "default.cfg">>)
				l_filename := Execution_environment.interpreted_string (l_filename)
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					l_file.read_line
					if not l_file.end_of_file then
						l_value := STRING_.cloned_string (l_file.last_string)
						STRING_.left_adjust (l_value)
						STRING_.right_adjust (l_value)
					end
					l_file.close
				end
				if l_value /= Void then
					Execution_environment.set_variable_value (ise_c_compiler_variable, l_value)
				end
			end
		end

end
