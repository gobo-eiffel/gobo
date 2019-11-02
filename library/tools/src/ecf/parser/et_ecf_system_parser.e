note

	description:

		"ECF Eiffel system parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SYSTEM_PARSER

inherit

	ET_ECF_PARSER

create

	make, make_standard, make_with_factory

feature -- Access

	last_system: detachable ET_ECF_SYSTEM
			-- Eiffel system being parsed
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.

	override_settings: detachable ET_ECF_SETTINGS
			-- Settings overriding those specified for the selected target

	override_capabilities: detachable ET_ECF_CAPABILITIES
			-- Capabilities overriding those specified for the selected target

	override_variables: detachable ET_ECF_VARIABLES
			-- Variables overriding those specified for the selected target

feature -- Setting

	set_override_settings (a_settings: like override_settings)
			-- Set `override_settings' to `a_settings'.
		do
			override_settings := a_settings
		ensure
			override_settings_set: override_settings = a_settings
		end

	set_override_capabilities (a_capabilities: like override_capabilities)
			-- Set `override_capabilities' to `a_capabilities'.
		do
			override_capabilities := a_capabilities
		ensure
			override_capabilities_set: override_capabilities = a_capabilities
		end

	set_override_variables (a_variables: like override_variables)
			-- Set `override_variables' to `a_variables'.
		do
			override_variables := a_variables
		ensure
			override_variables_set: override_variables = a_variables
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_target_name: detachable STRING)
			-- Parse ECF file `a_file'.
			-- Select `a_target_name' if specified, the last target parsed otherwise.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_result: DS_CELL [detachable ET_ECF_SYSTEM]
		do
			last_system := Void
			create l_result.make (Void)
			parse_file_with_action (a_file, True, agent build_system (?, ?, ?, a_target_name, agent override_target, l_result))
			last_system := l_result.item
		end

feature {NONE} -- Element change

	override_target (a_target: ET_ECF_TARGET)
			-- Override some settings/capabilities/variables in `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			if attached override_settings as l_override_settings then
				a_target.override_settings (l_override_settings)
			end
			if attached override_capabilities as l_override_capabilities then
				a_target.override_capabilities (l_override_capabilities)
			end
			if attached override_variables as l_override_variables then
				a_target.override_variables (l_override_variables)
			end
		end

end
