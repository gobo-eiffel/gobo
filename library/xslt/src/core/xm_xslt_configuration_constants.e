note

	description:

		"Configuration constants"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_CONFIGURATION_CONSTANTS

feature -- Access

	Recover_silently: INTEGER = 1
	Recover_with_warnings: INTEGER = 2
	Do_not_recover: INTEGER = 3
			-- Recovery policies

	Run_to_completion: INTEGER = 0
	Stop_after_principal_source: INTEGER = -1
	Stop_after_compilation: INTEGER = -2
			-- Execution phases

end

