indexing

	description:

		"Project variables for GEANT"

	library: "Gobo Eiffel Ant"
	copyright:"Copyright (c) 2001-2004, Sven Ehrke and others"
	license:"MIT License"
	date: "$Date$"
	revision:"$Revision$"


class GEANT_PROJECT_VARIABLES

inherit

	GEANT_VARIABLES
		redefine
			make
		end

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		undefine
			is_equal, copy
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new variables object.
		local
			a_name: STRING
			a_value: STRING
		do
			precursor
				-- Create built-in variables $GOBO_OS, $is_windows/$is_unix, $exe
			Project_variables_resolver.set_variables (Current)
			a_name := gobo_os_name
			if not Project_variables_resolver.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
			a_name := is_windows_name
			if not Project_variables_resolver.has (a_name) then
				a_value := Default_builtin_variables.value (a_name)
				if a_value /= Void then
					set_variable_value (a_name, a_value)
				end
			end
			a_name := is_unix_name
			if not Project_variables_resolver.has (a_name) then
				a_value := Default_builtin_variables.value (a_name)
				if a_value /= Void then
					set_variable_value (a_name, a_value)
				end
			end
			a_name := path_separator_name
			if not Project_variables_resolver.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
			a_name := exe_name
			if not Project_variables_resolver.has (exe_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
			a_name := verbose_name
			if not Project_variables_resolver.has (a_name) and
				Default_builtin_variables.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
		end

feature -- Status report

	is_builtin_variable_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' the name of a built-in variable?
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			Result := STRING_.same_string (gobo_os_name, a_name)
			Result := Result or else STRING_.same_string (is_windows_name, a_name)
			Result := Result or else STRING_.same_string (is_unix_name, a_name)
			Result := Result or else STRING_.same_string (path_separator_name, a_name)
			Result := Result or else STRING_.same_string (exe_name, a_name)
			Result := Result or else STRING_.same_string (verbose_name, a_name)
		end

feature {NONE} -- Constants

	gobo_os_name: STRING is
			-- Name of variable 'GOBO_OS'
		once
			Result := "GOBO_OS"
		ensure
			gobo_os_name_not_void: Result /= Void
			gobo_os_name_not_empty: Result.count > 0
		end

	is_windows_name: STRING is
			-- Name of variable 'is_windows'
		once
			Result := "is_windows"
		ensure
			is_windows_name_not_void: Result /= Void
			is_windows_name_not_empty: Result.count > 0
		end

	is_unix_name: STRING is
			-- Name of variable 'is_unix'
		once
			Result := "is_unix"
		ensure
			is_unix_name_not_void: Result /= Void
			is_unix_name_not_empty: Result.count > 0
		end

	path_separator_name: STRING is
			-- Name of variable 'path_separator'
		once
			Result := "path_separator"
		ensure
			path_separator_name_not_void: Result /= Void
			path_separator_name_not_empty: Result.count > 0
		end

	exe_name: STRING is
			-- Name of variable 'exe'
		once
			Result := "exe"
		ensure
			exe_name_not_void: Result /= Void
			exe_name_not_empty: Result.count > 0
		end

	verbose_name: STRING is
			-- Name of variable 'verbose'
		once
			Result := "verbose"
		ensure
			verbose_name_not_void: Result /= Void
			verbose_name_not_empty: Result.count > 0
		end

end
