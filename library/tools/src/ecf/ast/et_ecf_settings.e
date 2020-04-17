note

	description:

		"ECF settings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SETTINGS

inherit

	KL_STRING_VALUES

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create new ECF settings.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			create primary_settings.make_map (50)
			primary_settings.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			primary_settings.set_hash_function (l_hash_function)
		end

feature -- Access

	value (a_name: STRING): detachable STRING
			-- Value of setting `a_name';
			-- Void if setting is not defined in `primary_settings' nor in `secondary_settings'
		do
			primary_settings.search (a_name)
			if primary_settings.found then
				Result := primary_settings.found_item
			elseif attached secondary_settings as l_secondary_settings then
				Result := l_secondary_settings.value (a_name)
			end
		end

	primary_value (a_name: STRING): detachable STRING
			-- Value of setting `a_name';
			-- Void if setting is not defined in `primary_settings'
		require
			a_name_not_void: a_name /= Void
		do
			primary_settings.search (a_name)
			if primary_settings.found then
				Result := primary_settings.found_item
			end
		end

	primary_settings: DS_HASH_TABLE [STRING, STRING]
			-- Settings explicitly defined in the target

	secondary_settings: detachable KL_STRING_VALUES
			-- Settings to be taken into account when not
			-- explicitly defined in `primary_settings'

feature -- Setting

	set_primary_value (a_name, a_value: STRING)
			-- Set setting `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_settings.force_last (a_value, a_name)
		ensure
			primary_value_set: primary_value (a_name) = a_value
		end

	set_secondary_settings (a_settings: like secondary_settings)
			-- Set `secondary_settings' to `a_settings'.
		require
--			no_cycle: `a_settings', or recursively its secondary settings, does not already have `Current' as secondary settings
		do
			secondary_settings := a_settings
		ensure
			secondary_settings_set: secondary_settings = a_settings
		end

invariant

	primary_settings_not_void: primary_settings /= Void
	no_void_primary_setting: not primary_settings.has_void
	no_void_primary_value: not primary_settings.has_void_item
--	no_cycle: `secondary_settings', or recursively its secondary settings, does not already have `Current' as secondary settings

end
