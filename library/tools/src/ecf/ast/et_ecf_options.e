note

	description:

		"ECF options"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_OPTIONS

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create new ECF options.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			create primary_options.make_map (15)
			primary_options.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			primary_options.set_hash_function (l_hash_function)
			create primary_debugs.make_map (50)
			primary_debugs.set_key_equality_tester (case_insensitive_string_equality_tester)
			primary_debugs.set_hash_function (l_hash_function)
			create primary_assertions.make_map (10)
			primary_assertions.set_key_equality_tester (case_insensitive_string_equality_tester)
			primary_assertions.set_hash_function (l_hash_function)
			create primary_warnings.make_map (15)
			primary_warnings.set_key_equality_tester (case_insensitive_string_equality_tester)
			primary_warnings.set_hash_function (l_hash_function)
		end

feature -- Access

	value (a_name: STRING): detachable STRING
			-- Value of option `a_name';
			-- Void if option is not defined in `primary_options' nor in `secondary_options'
		do
			primary_options.search (a_name)
			if primary_options.found then
				Result := primary_options.found_item
			elseif attached secondary_options as l_secondary_options then
				Result := l_secondary_options.value (a_name)
			end
		end

	debug_value (a_name: STRING): detachable STRING
			-- Value of debug `a_name';
			-- Void if option is not defined in `primary_debugs' nor in `secondary_options'
		do
			primary_debugs.search (a_name)
			if primary_debugs.found then
				Result := primary_debugs.found_item
			elseif attached secondary_options as l_secondary_options then
				Result := l_secondary_options.debug_value (a_name)
			end
		end

	assertion_value (a_name: STRING): detachable STRING
			-- Value of assertion `a_name';
			-- Void if option is not defined in `primary_assertions' nor in `secondary_options'
		do
			primary_assertions.search (a_name)
			if primary_assertions.found then
				Result := primary_assertions.found_item
			elseif attached secondary_options as l_secondary_options then
				Result := l_secondary_options.assertion_value (a_name)
			end
		end

	warning_value (a_name: STRING): detachable STRING
			-- Value of warning `a_name';
			-- Void if option is not defined in `primary_warnings' nor in `secondary_options'
		do
			primary_warnings.search (a_name)
			if primary_warnings.found then
				Result := primary_warnings.found_item
			elseif attached secondary_options as l_secondary_options then
				Result := l_secondary_options.warning_value (a_name)
			end
		end

	primary_value (a_name: STRING): detachable STRING
			-- Value of option `a_name';
			-- Void if option is not defined in `primary_options'
		require
			a_name_not_void: a_name /= Void
		do
			primary_options.search (a_name)
			if primary_options.found then
				Result := primary_options.found_item
			end
		end

	primary_debug_value (a_name: STRING): detachable STRING
			-- Value of debug `a_name';
			-- Void if option is not defined in `primary_debugs'
		require
			a_name_not_void: a_name /= Void
		do
			primary_debugs.search (a_name)
			if primary_debugs.found then
				Result := primary_debugs.found_item
			end
		end

	primary_assertion_value (a_name: STRING): detachable STRING
			-- Value of assertion `a_name';
			-- Void if option is not defined in `primary_assertions'
		require
			a_name_not_void: a_name /= Void
		do
			primary_assertions.search (a_name)
			if primary_assertions.found then
				Result := primary_assertions.found_item
			end
		end

	primary_warning_value (a_name: STRING): detachable STRING
			-- Value of warning `a_name';
			-- Void if option is not defined in `primary_warnings'
		require
			a_name_not_void: a_name /= Void
		do
			primary_warnings.search (a_name)
			if primary_warnings.found then
				Result := primary_warnings.found_item
			end
		end

	primary_options: DS_HASH_TABLE [STRING, STRING]
			-- Options explicitly defined in the target or group

	primary_debugs: DS_HASH_TABLE [STRING, STRING]
			-- Debugs explicitly defined in the target or group

	primary_assertions: DS_HASH_TABLE [STRING, STRING]
			-- Assertions explicitly defined in the target or group

	primary_warnings: DS_HASH_TABLE [STRING, STRING]
			-- Warnings explicitly defined in the target or group

	secondary_options: detachable ET_ECF_OPTIONS
			-- Options to be taken into account when not
			-- explicitly defined in `primary_options'

	description: detachable STRING
			-- Description

feature -- Setting

	set_primary_value (a_name, a_value: STRING)
			-- Set option `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_options.force_last (a_value, a_name)
		ensure
			primary_value_set: primary_value (a_name) = a_value
		end

	set_primary_debug_value (a_name, a_value: STRING)
			-- Set debug `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_debugs.force_last (a_value, a_name)
		ensure
			primary_debug_value_set: primary_debug_value (a_name) = a_value
		end

	set_primary_assertion_value (a_name, a_value: STRING)
			-- Set assertion `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_assertions.force_last (a_value, a_name)
		ensure
			primary_assertion_value_set: primary_assertion_value (a_name) = a_value
		end

	set_primary_warning_value (a_name, a_value: STRING)
			-- Set warning `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_warnings.force_last (a_value, a_name)
		ensure
			primary_warning_value_set: primary_warning_value (a_name) = a_value
		end

	set_secondary_options (a_options: like secondary_options)
			-- Set `secondary_options' to `a_options'.
		require
--			no_cycle: `a_options', or recursively its secondary options, does not already have `Current' as secondary options
		do
			secondary_options := a_options
		ensure
			secondary_options_set: secondary_options = a_options
		end

	set_description (a_description: like description)
			-- Set `description' to `a_description'.
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

invariant

	primary_options_not_void: primary_options /= Void
	no_void_primary_option: not primary_options.has_void
	no_void_primary_value: not primary_options.has_void_item
	primary_debugs_not_void: primary_debugs /= Void
	no_void_primary_debug_name: not primary_debugs.has_void
	no_void_primary_debug_value: not primary_debugs.has_void_item
	primary_assertions_not_void: primary_assertions /= Void
	no_void_primary_assertion_name: not primary_assertions.has_void
	no_void_primary_assertion_value: not primary_assertions.has_void_item
	primary_warnings_not_void: primary_warnings /= Void
	no_void_primary_warning_name: not primary_warnings.has_void
	no_void_primary_warning_value: not primary_warnings.has_void_item
--	no_cycle: `secondary_options', or recursively its secondary options, does not already have `Current' as secondary options

end
