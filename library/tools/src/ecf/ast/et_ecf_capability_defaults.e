note

	description:

		"ECF capability default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CAPABILITY_DEFAULTS

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	default_capabilities (a_ecf_version: UT_VERSION): ET_ECF_CAPABILITIES
			-- Default capability values for ECF version `a_ecf_version'
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_16_0 then
				Result := default_capabilities_1_16_0
			elseif a_ecf_version >= ecf_1_13_0 then
				Result := default_capabilities_1_13_0
			elseif a_ecf_version >= ecf_1_11_0 then
				Result := default_capabilities_1_11_0
			else
				Result := default_capabilities_1_0_0
			end
		ensure
			instance_free: class
			default_capabilities_not_void: Result /= Void
		end

	default_capabilities_1_16_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.16.0 and above
		once
			create Result.make
			set_default_capabilities_1_16_0 (Result)
		ensure
			instance_free: class
			default_capabilities_1_16_0_not_void: Result /= Void
		end

	default_capabilities_1_13_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.13.0 and above
		once
			create Result.make
			set_default_capabilities_1_13_0 (Result)
		ensure
			instance_free: class
			default_capabilities_1_13_0_not_void: Result /= Void
		end

	default_capabilities_1_11_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.11.0 and above
		once
			create Result.make
			set_default_capabilities_1_11_0 (Result)
		ensure
			instance_free: class
			default_capabilities_1_11_0_not_void: Result /= Void
		end

	default_capabilities_1_0_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.0.0 and above
		once
			create Result.make
			set_default_capabilities_1_0_0 (Result)
		ensure
			instance_free: class
			default_capabilities_1_0_0_not_void: Result /= Void
		end

	valid_capabilities (a_ecf_version: UT_VERSION): DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid capability values for ECF version `a_ecf_version'
			--
			-- A void regexp means that there is no constraint on the capability value.
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_16_0 then
				Result := valid_capabilities_1_16_0
			else
				Result := valid_capabilities_1_0_0
			end
		ensure
			instance_free: class
			valid_capabilities_not_void: Result /= Void
			no_void_capability_name: not Result.has_void
		end

	valid_capabilities_latest: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid capability values for the latest version of ECF
			--
			-- A void regexp means that there is no constraint on the capability value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (5)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (catcall_detection_capability_value_regexp, {ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name)
			Result.force_last (concurrency_capability_value_regexp, {ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
			Result.force_last (void_safety_detection_capability_value_regexp, {ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
		ensure
			instance_free: class
			valid_capabilities_latest_not_void: Result /= Void
			no_void_capability_name: not Result.has_void
		end

	valid_capabilities_1_16_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid capability values for ECF 1.16.0 and above
			--
			-- A void regexp means that there is no constraint on the capability value.
		once
			Result := valid_capabilities_latest
		ensure
			instance_free: class
			valid_capabilities_1_16_0_not_void: Result /= Void
			no_void_capability_name: not Result.has_void
		end

	valid_capabilities_1_0_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid capability values for ECF 1.0.0 and above
			--
			-- A void regexp means that there is no constraint on the capability value.
		once
			Result := valid_capabilities_1_16_0.twin
			Result.remove ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name)
			Result.remove ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
			Result.remove ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
		ensure
			instance_free: class
			valid_capabilities_1_0_0_not_void: Result /= Void
			no_void_capability_name: not Result.has_void
		end

	supported_concurrency_capability_values: DS_HASH_SET [STRING]
			-- Supported values for capability "concurrency"
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make (3)
			Result.set_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.thread_capability_value)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.scoop_capability_value)
		ensure
			instance_free: class
			supported_concurrency_capability_values_not_void: Result /= Void
			no_void_supported_concurrency_capability_value: not Result.has_void
		end

	supported_void_safety_capability_values: DS_HASH_SET [STRING]
			-- Supported values for capability "void_safety"
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make (5)
			Result.set_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.conformance_capability_value)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.initialization_capability_value)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.transitional_capability_value)
			Result.put_last ({ET_ECF_CAPABILITY_NAMES}.all_capability_value)
		ensure
			instance_free: class
			supported_void_safety_capability_values_not_void: Result /= Void
			no_void_supported_void_safety_capability_value: not Result.has_void
		end

feature -- Setting

	set_default_capabilities_latest (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for the latest version of ECF.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, {ET_ECF_CAPABILITY_NAMES}.scoop_capability_value)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, {ET_ECF_CAPABILITY_NAMES}.all_capability_value)
		ensure
			instance_free: class
		end

	set_default_capabilities_1_16_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.16.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_latest (a_capabilities)
		ensure
			instance_free: class
		end

	set_default_capabilities_1_13_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.13.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_1_16_0 (a_capabilities)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
		ensure
			instance_free: class
		end

	set_default_capabilities_1_11_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.11.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_1_13_0 (a_capabilities)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value)
		ensure
			instance_free: class
		end

	set_default_capabilities_1_0_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.0.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_1_11_0 (a_capabilities)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	catcall_detection_capability_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "catcall_detection" capability values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_CAPABILITY_NAMES}.none_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.conformance_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.all_capability_value + ")")
		ensure
			instance_free: class
			catcall_detection_capability_value_regexp_not_void: Result /= Void
			catcall_detection_capability_value_regexp_compiled: Result.is_compiled
		end

	concurrency_capability_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "concurrency" capability values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_CAPABILITY_NAMES}.thread_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.none_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.scoop_capability_value + ")")
		ensure
			instance_free: class
			concurrency_capability_value_regexp_not_void: Result /= Void
			concurrency_capability_value_regexp_compiled: Result.is_compiled
		end

	void_safety_detection_capability_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "void_safety" capability values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_CAPABILITY_NAMES}.none_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.conformance_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.initialization_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value + "|" + {ET_ECF_CAPABILITY_NAMES}.all_capability_value + ")")
		ensure
			instance_free: class
			void_safety_capability_value_regexp_not_void: Result /= Void
			void_safety_capability_value_regexp_compiled: Result.is_compiled
		end

end
