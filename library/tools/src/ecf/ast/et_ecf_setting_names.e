note

	description:

		"ECF setting names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SETTING_NAMES

feature -- Access

	console_application_setting_name: STRING = "console_application"
			-- Name of setting "console_application"

	concurrency_setting_name: STRING = "concurrency"
			-- Name of setting "concurrency"

	exception_trace_setting_name: STRING = "exception_trace"
			-- Name of setting "exception_trace"

	metadata_cache_path_setting_name: STRING = "metadata_cache_path"
			-- Name of setting "metadata_cache_path"

	msil_clr_version_setting_name: STRING = "msil_clr_version"
			-- Name of setting "msil_clr_version"

	msil_generation_setting_name: STRING = "msil_generation"
			-- Name of setting "msil_generation"

	multithreaded_setting_name: STRING = "multithreaded"
			-- Name of setting "multithreaded"

end
