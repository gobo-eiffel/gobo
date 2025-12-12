note

	description:

		"Command-line interface (CLI) helper routines for Gobo Eiffel tools"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_GOBO_CLI

inherit

	UT_GOBO_CLI

feature -- Access

	settings_from_cli_value (a_cli_value: DS_LIST [detachable STRING]; a_cli_finalize: BOOLEAN): detachable ET_ECF_SETTINGS
			-- Settings overriding those specified in the ECF file, if any.
			-- `a_cli_finalize' indicates that the --finalize setting has
			-- also been specified.
		local
			l_override_settings: detachable ET_ECF_SETTINGS
			l_gobo_cli_setting_variable_value: detachable STRING
			l_gobo_default_setting_variable_value: detachable STRING
			l_splitter: ST_SPLITTER
		do
			if attached Execution_environment.variable_value (gobo_default_setting_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_default_setting_variable_value := l_variable_value
			end
			if attached Execution_environment.variable_value (gobo_cli_setting_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_cli_setting_variable_value := l_variable_value
			end
			if not a_cli_value.is_empty or a_cli_finalize or l_gobo_default_setting_variable_value /= Void or l_gobo_cli_setting_variable_value /= Void then
				create l_override_settings.make
				if l_gobo_default_setting_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_settings.set_primary_values_from_definitions (l_splitter.split (l_gobo_default_setting_variable_value))
				end
				l_override_settings.set_primary_values_from_definitions (a_cli_value)
				if a_cli_finalize then
					l_override_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.finalize_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
				end
				if l_gobo_cli_setting_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_settings.set_primary_values_from_definitions (l_splitter.split (l_gobo_cli_setting_variable_value))
				end
			end
			Result := l_override_settings
		end

	capabilities_from_cli_value (a_cli_value: DS_LIST [detachable STRING]): detachable ET_ECF_CAPABILITIES
			-- Capabilities overriding those specified in the ECF file, if any
		local
			l_override_capabilities: detachable ET_ECF_CAPABILITIES
			l_gobo_cli_capability_variable_value: detachable STRING
			l_gobo_default_capability_variable_value: detachable STRING
			l_splitter: ST_SPLITTER
		do
			if attached Execution_environment.variable_value (gobo_default_capability_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_default_capability_variable_value := l_variable_value
			end
			if attached Execution_environment.variable_value (gobo_cli_capability_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_cli_capability_variable_value := l_variable_value
			end
			if not a_cli_value.is_empty or l_gobo_default_capability_variable_value /= Void or l_gobo_cli_capability_variable_value /= Void then
				create l_override_capabilities.make
				if l_gobo_default_capability_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_capabilities.set_primary_use_values_from_definitions (l_splitter.split (l_gobo_default_capability_variable_value))
				end
				l_override_capabilities.set_primary_use_values_from_definitions (a_cli_value)
				if l_gobo_cli_capability_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_capabilities.set_primary_use_values_from_definitions (l_splitter.split (l_gobo_cli_capability_variable_value))
				end
			end
			Result := l_override_capabilities
		end

	variables_from_cli_value (a_cli_value: DS_LIST [detachable STRING]; a_is_ge, a_is_ise: BOOLEAN): detachable ET_ECF_VARIABLES
			-- Variables overriding those specified in the ECF file, if any.
			-- `a_is_ge' indicates that "$GOBO_EIFFEL" should be set to "ge".
			-- `a_is_ise' indicates that "$GOBO_EIFFEL" should be set to "ise" if not already set.
		require
			not_both_ge_and_ise: not (a_is_ge and a_is_ise)
		local
			l_override_variables: ET_ECF_VARIABLES
			l_definition: STRING
			l_index: INTEGER
		do
			create l_override_variables.make
			if a_is_ge then
				l_override_variables.set_primary_value ("GOBO_EIFFEL", "ge")
				Execution_environment.set_variable_value ("GOBO_EIFFEL", "ge")
			elseif attached Execution_environment.variable_value ("GOBO_EIFFEL") as l_gobo_eiffel and then not l_gobo_eiffel.is_empty then
				l_override_variables.set_primary_value ("GOBO_EIFFEL", l_gobo_eiffel)
			elseif a_is_ise then
				l_override_variables.set_primary_value ("GOBO_EIFFEL", "ise")
				Execution_environment.set_variable_value ("GOBO_EIFFEL", "ise")
			else
				l_override_variables.set_primary_value ("GOBO_EIFFEL", "ge")
				Execution_environment.set_variable_value ("GOBO_EIFFEL", "ge")
			end
			if not a_cli_value.is_empty then
				across a_cli_value as i_variable loop
					if attached i_variable as l_variable then
						l_definition := l_variable
						if l_definition.count > 0 then
							l_index := l_definition.index_of ('=', 1)
							if l_index = 0 then
								l_override_variables.set_primary_value (l_definition, "")
							elseif l_index = l_definition.count then
								l_override_variables.set_primary_value (l_definition.substring (1, l_index - 1), "")
							elseif l_index /= 1 then
								l_override_variables.set_primary_value (l_definition.substring (1, l_index - 1), l_definition.substring (l_index + 1, l_definition.count))
							end
						end
					end
				end
				if attached l_override_variables.primary_value ("GOBO_EIFFEL") as l_gobo_eiffel and then not l_gobo_eiffel.is_empty then
					Execution_environment.set_variable_value ("GOBO_EIFFEL", l_gobo_eiffel)
				end
			end
			Result := l_override_variables
		end

feature {NONE} -- Environment variables

	gobo_cli_setting_variable_name: STRING = "GOBO_CLI_SETTING"
			-- Environment variable name to specify settings
			-- as if they were specified with the command-line
			-- argument '--setting'.

	gobo_default_setting_variable_name: STRING = "GOBO_DEFAULT_SETTING"
			-- Environment variable name to specify settings
			-- which are not overridden with the command-line
			-- argument '--setting'.

	gobo_cli_capability_variable_name: STRING = "GOBO_CLI_CAPABILITY"
			-- Environment variable name to specify capabilities
			-- as if they were specified with the command-line
			-- argument '--capability'.

	gobo_default_capability_variable_name: STRING = "GOBO_DEFAULT_CAPABILITY"
			-- Environment variable name to specify capabilities
			-- which are not overridden with the command-line
			-- argument '--capability'.

end
