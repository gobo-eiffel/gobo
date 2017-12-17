note

	description:

		"ECF capabilities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CAPABILITIES

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make,
	make_default_1_16_0,
	make_default_1_15_0,
	make_default_1_14_0

feature {NONE} -- Initialization

	make
			-- Create new ECF capabilities.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			create primary_use_capabilities.make_map (10)
			primary_use_capabilities.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code)
			primary_use_capabilities.set_hash_function (l_hash_function)
			create primary_support_capabilities.make_map (10)
			primary_support_capabilities.set_key_equality_tester (case_insensitive_string_equality_tester)
			primary_support_capabilities.set_hash_function (l_hash_function)
		end

	make_default_1_16_0
			-- Create a new ECF capabilities already filled in with the default values of ECF 1.16.0.
		do
			make
			set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, {ET_ECF_CAPABILITY_NAMES}.scoop_capability_value)
			set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, {ET_ECF_CAPABILITY_NAMES}.all_capability_value)
		end

	make_default_1_15_0
			-- Create a new ECF capabilities already filled in with the default values of ECF 1.15.0.
		do
			make_default_1_16_0
		end

	make_default_1_14_0
			-- Create a new ECF capabilities already filled in with the default values of ECF 1.14.0.
		do
			make_default_1_15_0
		end

feature -- Status report

	is_capability_supported (a_capability_name, a_capability_value: STRING): BOOLEAN
			-- Is value `a_capability_value' for capability `a_capability_name' supported by current capabilities?
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
		local
			l_order: DS_HASH_TABLE [INTEGER, STRING]
			l_splitter: ST_SPLITTER
			l_rank: INTEGER
		do
			if not attached support_value (a_capability_name) as l_value then
				Result := False
			elseif STRING_.same_case_insensitive (l_value, a_capability_value) then
				Result := True
			else
				capability_order.search (a_capability_name)
				if capability_order.found then
					l_order := capability_order.found_item
					l_order.search (a_capability_value)
					if l_order.found then
						l_rank := l_order.found_item
						l_order.search (l_value)
						if l_order.found then
							Result := l_rank <= l_order.found_item
						end
					end
				else
						-- Not ordered.
					if l_value.has ({ET_ECF_CAPABILITY_NAMES}.value_separator) then
						create l_splitter.make_with_separators ({ET_ECF_CAPABILITY_NAMES}.value_separators)
						Result := l_splitter.split (l_value).there_exists (agent STRING_.same_case_insensitive (?, a_capability_value))
					end
				end
			end
		end

feature -- Access

	use_value (a_name: STRING): detachable STRING
			-- Value of capability use `a_name';
			-- Void if capability use is not defined in `primary_use_capabilities' nor in `secondary_capabilities'
		do
			primary_use_capabilities.search (a_name)
			if primary_use_capabilities.found then
				Result := primary_use_capabilities.found_item
			elseif attached secondary_capabilities as l_secondary_capabilities then
				Result := l_secondary_capabilities.use_value (a_name)
			end
		end

	support_value (a_name: STRING): detachable STRING
			-- Value of capability support `a_name';
			-- Void if capability support is not defined in `primary_support_capabilities' nor in `secondary_capabilities'
		do
			primary_support_capabilities.search (a_name)
			if primary_support_capabilities.found then
				Result := primary_support_capabilities.found_item
			elseif attached secondary_capabilities as l_secondary_capabilities then
				Result := l_secondary_capabilities.support_value (a_name)
			end
		end

	primary_use_value (a_name: STRING): detachable STRING
			-- Value of capability use `a_name';
			-- Void if capability use is not defined in `primary_use_capabilities'
		require
			a_name_not_void: a_name /= Void
		do
			primary_use_capabilities.search (a_name)
			if primary_use_capabilities.found then
				Result := primary_use_capabilities.found_item
			end
		end

	primary_support_value (a_name: STRING): detachable STRING
			-- Value of capability support `a_name';
			-- Void if capability support is not defined in `primary_support_capabilities'
		require
			a_name_not_void: a_name /= Void
		do
			primary_support_capabilities.search (a_name)
			if primary_support_capabilities.found then
				Result := primary_support_capabilities.found_item
			end
		end

	primary_use_capabilities: DS_HASH_TABLE [STRING, STRING]
			-- Capability uses explicitly defined in the target

	primary_support_capabilities: DS_HASH_TABLE [STRING, STRING]
			-- Capability supports explicitly defined in the target

	secondary_capabilities: detachable ET_ECF_CAPABILITIES
			-- Capabilities to be taken into account when not
			-- explicitly defined in `primary_use_capabilities'
			-- or `primary_support_capabilities'

	capability_names_1_16_0: DS_HASH_SET [STRING]
			-- Names of capabilities supported in ECF 1.16.0
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make (5)
			Result.set_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code)
			Result.set_hash_function (l_hash_function)
			Result.force_last ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name)
			Result.force_last ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
			Result.force_last ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
		ensure
			capability_names_not_void: Result /= Void
			no_void_capability_name: not Result.has_void
		end

feature -- Setting

	set_primary_use_value (a_name, a_value: STRING)
			-- Set capability use `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_use_capabilities.force_last (a_value, a_name)
		ensure
			primary_use_value_set: primary_use_value (a_name) = a_value
		end

	set_primary_support_value (a_name, a_value: STRING)
			-- Set capability support `a_name' to `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			primary_support_capabilities.force_last (a_value, a_name)
		ensure
			primary_support_value_set: primary_support_value (a_name) = a_value
		end

	set_secondary_capabilities (a_capabilities: like secondary_capabilities)
			-- Set `secondary_capabilities' to `a_capabilities'.
		require
--			no_cycle: `a_capabilities', or recursively its secondary capabilities, does not already have `Current' as secondary capabilities
		do
			secondary_capabilities := a_capabilities
		ensure
			secondary_capabilities_set: secondary_capabilities = a_capabilities
		end

feature {NONE} -- Implementation

	capability_order: DS_HASH_TABLE [DS_HASH_TABLE [INTEGER, STRING], STRING]
			-- Is capability order if any, indexed by capability names
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
			l_order: DS_HASH_TABLE [INTEGER, STRING]
		once
			create Result.make_map (5)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code)
			Result.set_hash_function (l_hash_function)
			create l_order.make_map (3)
			l_order.set_key_equality_tester (case_insensitive_string_equality_tester)
			l_order.set_hash_function (l_hash_function)
			l_order.put_last (1, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			l_order.put_last (2, {ET_ECF_CAPABILITY_NAMES}.conformance_capability_value)
			l_order.put_last (3, {ET_ECF_CAPABILITY_NAMES}.all_capability_value)
			Result.put_last (l_order, {ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name)
			create l_order.make_map (3)
			l_order.set_key_equality_tester (case_insensitive_string_equality_tester)
			l_order.set_hash_function (l_hash_function)
			l_order.put_last (1, {ET_ECF_CAPABILITY_NAMES}.thread_capability_value)
			l_order.put_last (2, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			l_order.put_last (3, {ET_ECF_CAPABILITY_NAMES}.scoop_capability_value)
			Result.put_last (l_order, {ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
			create l_order.make_map (5)
			l_order.set_key_equality_tester (case_insensitive_string_equality_tester)
			l_order.set_hash_function (l_hash_function)
			l_order.put_last (1, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			l_order.put_last (2, {ET_ECF_CAPABILITY_NAMES}.conformance_capability_value)
			l_order.put_last (3, {ET_ECF_CAPABILITY_NAMES}.initialization_capability_value)
			l_order.put_last (4, {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value)
			l_order.put_last (5, {ET_ECF_CAPABILITY_NAMES}.all_capability_value)
			Result.put_last (l_order, {ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
		ensure
			capability_order_not_void: Result /= Void
		end

invariant

	primary_use_capabilities_not_void: primary_use_capabilities /= Void
	no_void_primary_use_capability: not primary_use_capabilities.has_void
	no_void_primary_use_value: not primary_use_capabilities.has_void_item
	primary_support_capabilities_not_void: primary_support_capabilities /= Void
	no_void_primary_support_capability: not primary_support_capabilities.has_void
	no_void_primary_support_value: not primary_support_capabilities.has_void_item
--	no_cycle: `secondary_capabilities', or recursively its secondary capabilities, does not already have `Current' as secondary capabilities

end
