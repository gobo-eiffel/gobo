note

	description:

		"ECF options"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_OPTIONS

inherit

	KL_STRING_VALUES

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make,
	make_default_1_16_0,
	make_default_1_15_0,
	make_default_1_14_0

feature {NONE} -- Initialization

	make
			-- Create new ECF options.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			create primary_options.make_map (50)
			primary_options.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code)
			primary_options.set_hash_function (l_hash_function)
		end

	make_default_1_16_0
			-- Create a new ECF options already filled in with the default values of ECF 1.16.0.
		do
			make
			set_primary_value ({ET_ECF_OPTION_NAMES}.debug_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.msil_application_optimize_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.optimize_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.profile_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.standard_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.trace_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			set_primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
		end

	make_default_1_15_0
			-- Create a new ECF options already filled in with the default values of ECF 1.15.0.
		do
			make_default_1_16_0
		end

	make_default_1_14_0
			-- Create a new ECF options already filled in with the default values of ECF 1.14.0.
		do
			make_default_1_15_0
			set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
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

	primary_options: DS_HASH_TABLE [STRING, STRING]
			-- Options explicitly defined in the target or group

	secondary_options: detachable KL_STRING_VALUES
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
--	no_cycle: `secondary_options', or recursively its secondary options, does not already have `Current' as secondary options

end
