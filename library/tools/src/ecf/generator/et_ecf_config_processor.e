note

	description:

		"ECF config processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ECF_CONFIG_PROCESSOR

feature -- Processing

	process_redirection_config (a_config: ET_ECF_REDIRECTION_CONFIG)
			-- Process `a_config'.
		require
			a_config_not_void: a_config /= Void
		deferred
		end

	process_system_config (a_config: ET_ECF_SYSTEM_CONFIG)
			-- Process `a_config'.
		require
			a_config_not_void: a_config /= Void
		deferred
		end

end
