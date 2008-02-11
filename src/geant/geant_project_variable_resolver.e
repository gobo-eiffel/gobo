indexing

	description:

		"Variable resolvers"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2004, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PROJECT_VARIABLE_RESOLVER

inherit

	GEANT_VARIABLE_RESOLVER

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create new Project Variable resolver.
		do
		end

feature -- Access

	value (a_name: STRING): STRING is
			-- Value of variable `a_name' as a result of searching in
			-- current target's arguments, commandline variables, project variables, environment variables
			-- in this order; Void if not found
		do
				-- Check non overrridable variables:
			if STRING_.same_string (a_name, "cwd") then
				Result := file_system.cwd
			end

			if Result = Void then
					-- Search target arguments:
				if target_arguments_stack.count > 0 then
					target_arguments_stack.item.search (a_name)
					if target_arguments_stack.item.found then
						Result := target_arguments_stack.item.found_item
					end
				end
			end

			if Result = Void then
					-- Search commandline variables:
				Commandline_variables.search (a_name)
				if Commandline_variables.found then
					Result := Commandline_variables.found_item
				end
			end

			if Result = Void then
					-- Search target locals:
				if target_locals_stack.count > 0 then
					target_locals_stack.item.search (a_name)
					if target_locals_stack.item.found then
						Result := target_locals_stack.item.found_item
					end
				end
			end

			if Result = Void then
					-- Search project variables:
				variables.search (a_name)
				if variables.found then
					Result := variables.found_item
				end
			end

			if Result = Void then
					-- Search environment variables:
				if Execution_environment.variable_value (a_name) /= Void then
					Result := Execution_environment.variable_value (a_name)
				end
			end

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
			s: STRING
			s2: STRING
			a_string_interpreter: GEANT_STRING_INTERPRETER
			a_splitter: ST_SPLITTER
			a_tokens: DS_LIST [STRING]
		do
			create a_splitter.make_with_separators ("=")
			a_tokens := a_splitter.split_greedy (a_condition)
			if a_tokens.count = 1 then
					-- `a_condition' should be in form "$foo";
					-- Check if $foo is defined.
				s := a_tokens.item (1)
				if s.count > 3 and then (s.item (1) = '$' and s.item (2) = '{' and s.item (s.count) = '}') then
						-- Handle "${bar}" form:
					s := s.substring (3, s.count - 1)
					Result := has (s)
				elseif s.count > 1 and then (s.item (1) = '$' and s.item (2) /= '{') then
						-- Handle "$bar" form:
					s := s.substring (2, s.count)
					Result := has (s)
				else
					exit_application (1, <<"geant: incorrect conditional: '", a_condition, "%'">>)
				end
			elseif a_tokens.count = 2 then
					-- `a_condition' should be in form "$foo=bar";
					-- Check if $foo equals "bar".
					-- TODO: Do this more efficiently:
				create a_string_interpreter.make
				a_string_interpreter.set_variable_resolver (Current)

				s := a_tokens.item (1)
				s := a_string_interpreter.interpreted_string (s)
				s2 := a_tokens.item (2)
				s2 := a_string_interpreter.interpreted_string (s2)
				Result := STRING_.same_string (s, s2)
			else
				exit_application (1, <<"geant: incorrect conditional: '", a_condition, "%'">>)
			end
		end

	variables: GEANT_VARIABLES
			-- Variables used for resolving

feature -- Status report

	has (a_name: STRING): BOOLEAN is
			-- Is there a variable named `a_name' in
			-- current target's arguments, commandline variables, project variables, environment variables
			-- (searched in this order)?
		local
			a_value: STRING
		do
				-- Check non overrridable variables:
			Result := STRING_.same_string (a_name, "cwd")

			if not Result then
					-- Search target arguments:
				if target_arguments_stack.count > 0 then
					target_arguments_stack.item.search (a_name)
					Result := target_arguments_stack.item.found
				end
			end

			if not Result then
					-- Search commandline variables:
				Commandline_variables.search (a_name)
				Result := Commandline_variables.found
			end


			if not Result then
					-- Search local project variables:
				if target_locals_stack.count > 0 then
					target_locals_stack.item.search (a_name)
					Result := target_locals_stack.item.found
				end
			end

			if not Result then
					-- Search project variables:
				variables.search (a_name)
				Result := variables.found
			end

			if not Result then
					-- Search environment variables:
				a_value := Execution_environment.variable_value (a_name)
				Result := a_value /= Void
			end
		end

feature -- Setting

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

end
