indexing

	description:

		"Project variables for GEANT"

	library: "Gobo Eiffel Ant"
	copyright:"Sven Ehrke and others"
	license:"Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision:"$Revision$"


class GEANT_PROJECT_VARIABLES

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new variables object.
		local
			a_tester: UC_STRING_EQUALITY_TESTER
		do
			create variables.make_map (10)
			create a_tester
			variables.set_equality_tester (a_tester)
			variables.set_key_equality_tester (a_tester)

				-- Create built-in variables $GOBO_OS, $is_windows/$is_unix, $exe
			if operating_system.is_windows then
				if not has_variable ("GOBO_OS") then
					set_variable_value ("GOBO_OS", "windows")
				end
				if not has_variable ("is_windows") then
					set_variable_value ("is_windows", "true")
				end
				if not has_variable ("path_separator") then
					set_variable_value ("path_separator", "\")
				end
			elseif operating_system.is_unix then
				if not has_variable ("GOBO_OS") then
					set_variable_value ("GOBO_OS", "unix")
				end
				if not has_variable ("is_unix") then
					set_variable_value ("is_unix", "true")
				end
				if not has_variable ("path_separator") then
					set_variable_value ("path_separator", "/")
				end
			end
			if not has_variable ("exe") then
				set_variable_value ("exe", file_system.exe_extension)
			end
		end

feature -- Access

	variables : DS_HASH_TABLE [STRING, STRING]
			-- Defined variables

	has_variable (a_name: STRING): BOOLEAN is
			-- Is there a variable named `a_name' in `variables'?
			-- Search order: commandline variables, project variables, environment variables.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			value: STRING
		do
				-- Search commandline variables:
			Commandline_variables.search (a_name)
			Result := Commandline_variables.found

			if not Result then
					-- Search project variables:
				variables.search (a_name)
				Result := variables.found
			end

			if not Result then
					-- Search environment variables:
				value := Execution_environment.variable_value (a_name)
				Result := value /= Void
			end
		end

	variable_value (a_name: STRING): STRING is
			-- Value of variable `a_name';
			-- `${a_name}' if `a_name' has not been set.
			-- Search order: commandline variables, project variables, environment variables.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
				-- Check non overrridable variables:
			if STRING_.same_string (a_name, "cwd") then
				Result := file_system.cwd
			end

			if Result = Void then
					-- Search commandline variables:
				Commandline_variables.search (a_name)
				if Commandline_variables.found then
					Result := Commandline_variables.found_item
				end
			end

			if Result = Void then
					-- Search project variables:
				variables.search (a_name)
				if variables.found then
					Result := expanded_variable_value (variables.found_item)
				end
			end

			if Result = Void then
					-- Search environment variables:
				if Execution_environment.variable_value (a_name) /= Void then
					Result := Execution_environment.variable_value (a_name)
				end
			end

			if Result = Void then
				Result := STRING_.new_empty_string (a_name, a_name.count + 3)
				Result.append_string ("${")
				Result.append_string (a_name)
				Result.append_string ("}")
			end
		ensure
			variable_value_not_void: Result /= Void
		end

	environment_variable_value (a_name: STRING): STRING is
			-- Value of environment variable `a_name';
			-- `${a_name}' if `a_name' environment variable does not exist
		require
			a_name_not_void: a_name /= Void
		do
			Result := Execution_environment.variable_value (Result)
			if Result = Void then
				Result := STRING_.new_empty_string (a_name, a_name.count + 3)
				Result.append_string ("${")
				Result.append_string (a_name)
				Result.append_string ("}")
			end
		end

	expanded_variable_value (a_value : STRING) : STRING is
			-- Expanded variable value of `a_value'
		require
			a_value_not_void: a_value /= Void
		local
			source: STRING
		do
			from
				source := a_value
				Result := interpreted_string (source)
			until
				STRING_.same_string (Result, source)
			loop
				source := Result
				Result := interpreted_string (source)
			end
		ensure
			expanded_variable_value_not_void : Result /= Void
		end

	remove_variable (a_name: STRING) is
			-- Remove variable `a_name' from `variables'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			variables.remove (a_name)
		ensure
			variable_removed: not variables.has (a_name)
		end

	interpreted_string (a_string: STRING): STRING is
			-- String where the environment variables have been
			-- replaced by their values. The environment variables
			-- are considered to be either ${[^}]*} or $[a-zA-Z0-9_]+
			-- and the dollar sign is escaped using $$. Non defined
			-- environment variables are replaced by empty strings.
			-- The result is not defined when `a_string' does not
			-- conform to the conventions above.
			-- Return a new string each time.
			-- Borrowed from GOBO's KL_EXECUTION_ENVIRONMENT
		require
			a_string_not_void: a_string /= Void
		local
			str: STRING
			i, nb: INTEGER
			c: CHARACTER
			stop: BOOLEAN
		do
			from
				i := 1
				nb := a_string.count
				Result := STRING_.new_empty_string (a_string, nb)
			until
				i > nb
			loop
				c := a_string.item (i)
				i := i + 1
				if c /= '$' then
					if c /= '%U' then
						Result.append_character (c)
					else
						Result := STRING_.appended_substring (Result, a_string, i - 1, i - 1)
					end
				elseif i > nb then
						-- Dollar at the end of `a_string'.
						-- Leave it as it is.
					Result.append_character ('$')
				else
					c := a_string.item (i)
					if c = '$' then
							-- Escaped dollar character.
						Result.append_character ('$')
						i := i + 1
					else
							-- Found beginning of a environment variable
							-- It is either ${VAR} or $VAR.
						str := STRING_.new_empty_string (a_string, 5)
						if c = '{' then
								-- Looking for a right brace.
							from
								i := i + 1
								stop := False
							until
								i > nb or stop
							loop
								c := a_string.item (i)
								if c = '}' then
									stop := True
								elseif c /= '%U' then
									str.append_character (c)
								else
									check same_type: str.same_type (a_string) end
									STRING_.append_substring_to_string (str, a_string, i, i)
								end
								i := i + 1
							end
						else
								-- Looking for a non-alphanumeric character
								-- (i.e. [^a-zA-Z0-9_]).
							from
								stop := False
							until
								i > nb or stop
							loop
								c := a_string.item (i)
								inspect c
								when 'a'..'z', 'A'..'Z', '0'..'9', '_' then
									str.append_character (c)
									i := i + 1
								else
									stop := True
								end
							end
						end
						str := variable_value (str)
						if str /= Void then
							Result := STRING_.appended_string (Result, str)
						end
					end
				end
			end
		ensure
			interpreted_string_not_void: Result /= Void
		end

	boolean_condition_value (a_condition: STRING): BOOLEAN is
			-- Is `a_condition' True?;
			-- used for "if" and "unless" attributes;
			-- possible forms:
			-- "$foo": True if variable `foo' is defined
			-- "${foo}": True if variable `foo' is defined
			-- "$foo=bar" | "${foo}=bar" | "bar=$foo" | "bar=${foo}":
			--       True if variable `foo' is defined and its value is "bar"
			-- if `a_condition' is not in either form Result is `False'
		require
			condition_not_void: a_condition /= Void
		local
			a_tokens: DS_ARRAYED_LIST [STRING]
			s: STRING
			s2: STRING
		do
			a_tokens := string_tokens (a_condition, '=')
			if a_tokens.count = 1 then
					-- `a_condition' should be in form "$foo";
					-- Check if $foo is defined.
				s := a_tokens.item (1)
				if s.count > 3 and then (s.item (1) = '$' and s.item (2) = '{' and s.item (s.count) = '}') then
						-- Handle "${bar}" form:
					s := s.substring (3, s.count - 1)
					Result := has_variable (s)
				elseif s.count > 1 and then (s.item (1) = '$' and s.item (2) /= '{') then
						-- Handle "$bar" form:
					s := s.substring (2, s.count)
					Result := has_variable (s)
				else
					exit_application (1, <<"geant: incorrect conditional: '", a_condition, "%'">>)
				end
			elseif a_tokens.count = 2 then
					-- `a_condition' should be in form "$foo=bar";
					-- Check if $foo equals "bar".
				s := a_tokens.item (1)
				s := interpreted_string (s)
				s2 := a_tokens.item (2)
				s2 := interpreted_string (s2)
				Result := s.is_equal (s2)
			else
				exit_application (1, <<"geant: incorrect conditional: '", a_condition, "%'">>)
			end
		end

feature -- Setting

	set_variable_value (a_name, a_value : STRING) is
			-- Set value of variable `a_name' to `a_value'.
			-- Ignored when `a_name' is already defined.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		do
			variables.force (a_value, a_name)
		end

end
