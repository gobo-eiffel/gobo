indexing

	description:

		"Objects that provide location information to XM_XPATH_RECEIVERs"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_LOCATOR

feature -- Access

	system_id: STRING is
			-- Current SYSTEM ID;
			-- If this is a URL, then it must be fully resolved
		deferred
		ensure
			system_id_not_void: Result /= Void
		end

	line_number: INTEGER is
			-- Approximate line number of current event, or -1 if unknown
		deferred
		ensure
			nearly_positive_result: Result >= -1
		end

invariant

	system_id_not_void: system_id /= Void

end
