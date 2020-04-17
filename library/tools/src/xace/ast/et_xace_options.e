note

	description:

		"Xace option clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2020, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTIONS

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		rename
			string_equality_tester as xx_string_equality_tester
		export {NONE} all end

	ET_SHARED_XACE_OPTION_NAMES

	UC_SHARED_STRING_EQUALITY_TESTER

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new Xace option clause.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			create primary_options.make_map (50)
			primary_options.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			primary_options.set_hash_function (l_hash_function)
			create primary_multivalue_options.make_map (15)
			primary_multivalue_options.set_key_equality_tester (case_insensitive_string_equality_tester)
			primary_multivalue_options.set_hash_function (l_hash_function)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.assertion_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.c_compiler_options_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.dead_code_removal_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.debug_tag_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.exclude_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.header_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.include_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.inlining_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.link_option_name)
			primary_multivalue_options.force_last (Void, {ET_XACE_OPTION_NAMES}.override_cluster_option_name)
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

	multivalue (a_name: STRING): detachable DS_HASH_SET [STRING]
			-- Values of option `a_name';
			-- Void if option is not a multi-value option or is not defined in `primary_multivalue_options' nor in `secondary_options'
		do
			primary_multivalue_options.search (a_name)
			if primary_multivalue_options.found then
				Result := primary_multivalue_options.found_item
				if Result = Void and then attached secondary_options as l_secondary_options then
					Result := l_secondary_options.multivalue (a_name)
				end
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

	primary_multivalue (a_name: STRING): detachable DS_HASH_SET [STRING]
			-- Values of option `a_name';
			-- Void if option is not a multi-value option or is not defined in `primary_multivalue_options'
		require
			a_name_not_void: a_name /= Void
		do
			primary_multivalue_options.search (a_name)
			if primary_multivalue_options.found then
				Result := primary_multivalue_options.found_item
			end
		end

	primary_options: DS_HASH_TABLE [STRING, STRING]
			-- Options explicitly defined

	primary_multivalue_options: DS_HASH_TABLE [detachable DS_HASH_SET [STRING], STRING]
			-- Known multi-value options with their explicitly defined values

	secondary_options: detachable ET_XACE_OPTIONS
			-- Options to be taken into account when not
			-- explicitly defined in `primary_options'

feature -- Setting

	set_primary_value (a_name, a_value: STRING)
			-- Set option `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		local
			l_values: detachable DS_HASH_SET [STRING]
		do
			primary_multivalue_options.search (a_name)
			if primary_multivalue_options.found then
				l_values := primary_multivalue_options.found_item
				if l_values = Void then
					create l_values.make (5)
					l_values.set_equality_tester (string_equality_tester)
					primary_multivalue_options.replace_found_item (l_values)
				end
				l_values.force_last (a_value)
			else
				primary_options.force_last (a_value, a_name)
			end
		ensure
			primary_multivalue_set: old primary_multivalue_options.has (a_name) implies attached primary_multivalue (a_name) as l_multivalues and then l_multivalues.has (a_value)
			primary_value_set: not old primary_multivalue_options.has (a_name) implies primary_value (a_name) = a_value
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

invariant

	primary_options_not_void: primary_options /= Void
	no_void_primary_option: not primary_options.has_void
	no_void_primary_value: not primary_options.has_void_item
--	no_cycle: `secondary_options', or recursively its secondary options, does not already have `Current' as secondary options

end
