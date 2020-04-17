note

	description:

		"ECF void-safety conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_VOID_SAFETY_CONDITION

inherit

	ET_ECF_CONDITION_ITEM
		redefine
			is_capability_aware,
			is_capability_supported
		end

	ET_ECF_CAPABILITY_DEFAULTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_excluded

feature {NONE} -- Initialization

	make (a_value: STRING)
			-- Create a new condition where the void-safety mode should be equal to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			value := a_value
			is_excluded := False
		ensure
			value_set: value = a_value
			not_excluded: not is_excluded
		end

	make_excluded (a_value: STRING)
			-- Create a new condition where the void-safety mode should not be equal to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		do
			value := a_value
			is_excluded := True
		ensure
			value_set: value = a_value
			excluded: is_excluded
		end

feature -- Access

	value: STRING
			-- Void-safety mode value

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		local
			l_state_value: detachable STRING
			l_ecf_version: detachable UT_VERSION
			l_splitter: ST_SPLITTER
			l_default_capabilities: like default_capabilities
		do
			l_state_value := a_state.target.capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
			if l_state_value = Void then
				l_state_value := a_state.target.capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
			end
			if l_state_value = Void then
				l_ecf_version := a_state.target.system_config.ecf_version
				if l_ecf_version = Void then
					l_ecf_version := {UT_SHARED_ECF_VERSIONS}.ecf_last_known
				end
				l_default_capabilities := default_capabilities (l_ecf_version)
				l_state_value := l_default_capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
				if l_state_value = Void then
					l_state_value := l_default_capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
				end
			end
			if l_state_value /= Void then
				if value.has ({ET_ECF_CAPABILITY_NAMES}.value_separator) then
					create l_splitter.make_with_separators ({ET_ECF_CAPABILITY_NAMES}.value_separators)
					Result := l_splitter.split (value).there_exists (agent STRING_.same_case_insensitive ({STRING_8} ?, l_state_value))
				else
					Result := STRING_.same_case_insensitive (value, l_state_value)
				end
			end
			Result := (is_excluded /= Result)
		end

	is_excluded: BOOLEAN
			-- Should the void-safety mode not be equal to `value'?

	is_capability_aware (a_capability_name: STRING): BOOLEAN
			-- Can this individual condition have an influence on capability `a_capability_name'?
		do
			Result := STRING_.same_case_insensitive (a_capability_name, {ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
		end

	is_capability_supported (a_capability_name: STRING; a_target_capabilities, a_other_capabilities: ET_ECF_CAPABILITIES): BOOLEAN
			-- Is capability `a_capability_name' of the enclosing target with
			-- capabilities `a_target_capabilities', possibly restricted by the
			-- current condition, supported by the capabilities `a_other_capabilities'?
		local
			l_splitter: ST_SPLITTER
			l_values: DS_HASH_SET [STRING]
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
			l_value: STRING
		do
			create l_values.make (3)
			l_values.set_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			l_values.set_hash_function (l_hash_function)
			if value.has ({ET_ECF_CAPABILITY_NAMES}.value_separator) then
				create l_splitter.make_with_separators ({ET_ECF_CAPABILITY_NAMES}.value_separators)
				if is_excluded then
					l_values.append_last (supported_void_safety_capability_values)
					l_splitter.split (value).do_all (agent l_values.remove)
				else
					l_values.append_last (l_splitter.split (value))
				end
			else
				if is_excluded then
					l_values.append_last (supported_void_safety_capability_values)
					l_values.remove (value)
				else
					l_values.put_last (value)
				end
			end
			Result := True
			from l_values.start until l_values.after loop
				l_value := l_values.item_for_iteration
				if not a_target_capabilities.is_capability_supported (a_capability_name, l_value) then
					l_values.forth
				elseif a_other_capabilities.is_capability_supported (a_capability_name, l_value) then
					l_values.forth
				else
					Result := False
						-- Jump out of the loop.
					l_values.go_after
				end
			end
		end

invariant

	value_not_void: value /= Void
	value_not_empty: not value.is_empty

end
