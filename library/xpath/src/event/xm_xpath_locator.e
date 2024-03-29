﻿note

	description:

		"Objects that provide location information to XM_XPATH_RECEIVERs"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_LOCATOR

inherit

	ANY

feature -- Access

	system_id: STRING
			-- Current SYSTEM ID;
			-- STRING interpretation of `base_uri' when available.
		deferred
		ensure
			system_id_not_void: Result /= Void
		end

	line_number: INTEGER
			-- Approximate line number of current event, or 0 if unknown
		deferred
		ensure
			positive_result: Result >= 0
		end

end
