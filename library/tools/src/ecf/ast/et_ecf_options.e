note

	description:

		"ECF options"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_OPTIONS

inherit

	KL_STRING_VALUES

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
			create primary_options.make_map (50)
			primary_options.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code)
			primary_options.set_hash_function (l_hash_function)
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
			-- Options explicitly defined in the target

	secondary_options: detachable KL_STRING_VALUES
			-- Options to be taken into account when not
			-- explicitly defined in `primary_options'

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
			a_options_not_void: a_options /= Void
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
