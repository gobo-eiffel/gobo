note

	description:

		"Shared decimal math constants"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2005-2018, Paul G. Crismer and others"
	license: "MIT License"

class MA_SHARED_DECIMAL_CONSTANTS

feature -- Access

	decimal: MA_DECIMAL_CONSTANTS
			-- Decimal constants
		once
			create Result
		ensure
			instance_free: class
			decimal_not_void: Result /= Void
		end

end
