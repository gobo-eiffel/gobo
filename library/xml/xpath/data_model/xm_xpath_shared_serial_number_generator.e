note

	description:

		"Objects that provide access to a shared unique serial number generator"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_SERIAL_NUMBER_GENERATOR

feature -- Access

	shared_serial_number_generator: XM_XPATH_SERIAL_NUMBER_GENERATOR is
			-- Shared serial number generator
		once
			create Result.make
		end
	
end
	
