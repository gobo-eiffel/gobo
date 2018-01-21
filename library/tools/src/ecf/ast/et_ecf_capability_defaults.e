note

	description:

		"ECF capability default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CAPABILITY_DEFAULTS

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
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
			default_capabilities_not_void: Result /= Void
		end

	default_capabilities_1_16_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.16.0 and above
		once
			create Result.make
			set_default_capabilities_1_16_0 (Result)
		ensure
			default_capabilities_1_16_0_not_void: Result /= Void
		end
		
	default_capabilities_1_13_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.13.0 and above
		once
			create Result.make
			set_default_capabilities_1_13_0 (Result)
		ensure
			default_capabilities_1_13_0_not_void: Result /= Void
		end
		
	default_capabilities_1_11_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.11.0 and above
		once
			create Result.make
			set_default_capabilities_1_11_0 (Result)
		ensure
			default_capabilities_1_11_0_not_void: Result /= Void
		end
		
	default_capabilities_1_0_0: ET_ECF_CAPABILITIES
			-- Default capability values for ECF 1.0.0 and above
		once
			create Result.make
			set_default_capabilities_1_0_0 (Result)
		ensure
			default_capabilities_1_0_0_not_void: Result /= Void
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
		end

	set_default_capabilities_1_16_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.16.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_latest (a_capabilities)
		end

	set_default_capabilities_1_13_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.13.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_1_16_0 (a_capabilities)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
		end
		
	set_default_capabilities_1_11_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.11.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_1_13_0 (a_capabilities)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value)
		end

	set_default_capabilities_1_0_0 (a_capabilities: ET_ECF_CAPABILITIES)
			-- Set in `a_capabilities' the default values for ECF 1.0.0 and above.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			set_default_capabilities_1_11_0 (a_capabilities)
			a_capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, {ET_ECF_CAPABILITY_NAMES}.none_capability_value)
		end
		
end
