note

	description:

		"ECF configurations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_CONFIG

feature -- Access

	filename: STRING
			-- ECF filename

	uuid: detachable STRING
			-- UUID;
			-- May be Void when the ECF file described a system

	ecf_namespace: detachable STRING
			-- ECF namespace
			--
			-- May be void if not explicitly specified in ECF file

	ecf_version: detachable UT_VERSION
			-- ECF version
			--
			-- May be void if the ECF namespace has not been explicitly specified
			-- in the ECF file or if it was not recognized

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Universe of current system config.
			-- It might be different from the current system config itself when
			-- using parent targets with an 'extension_location' attribute.

feature -- Setting

	set_uuid (a_uuid: like uuid)
			-- Set `uuid' to `a_uuid'.
		do
			uuid := a_uuid
		ensure
			uuid_set: uuid = a_uuid
		end

	set_ecf_namespace (a_namespace: like ecf_namespace)
			-- Set `ecf_namespace' to `a_namespace'.
		do
			ecf_namespace := a_namespace
		ensure
			ecf_namespace_set: ecf_namespace = a_namespace
		end

	set_ecf_version (a_version: like ecf_version)
			-- Set `ecf_version' to `a_version'.
		do
			ecf_version := a_version
		ensure
			ecf_version_set: ecf_version = a_version
		end

feature -- Processing

	process (a_processor: ET_ECF_CONFIG_PROCESSOR)
			-- Process current config.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

invariant

	filename_not_void: filename /= Void
	universe_not_void: universe /= Void

end
