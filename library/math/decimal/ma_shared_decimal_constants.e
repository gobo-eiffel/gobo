indexing

	description:

		"Shared decimal math constants"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2005, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class MA_SHARED_DECIMAL_CONSTANTS

feature -- Access

	decimal: MA_DECIMAL_CONSTANTS is
			-- Decimal constants
		once
			create Result
		ensure
			decimal_not_void: Result /= Void
		end

end
