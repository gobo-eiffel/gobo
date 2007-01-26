indexing

	description:

		"Singleton object that represent any item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_ANY_TYPE

feature -- Access

	any_type: XM_XPATH_ANY_TYPE is
			-- Singleton
		once
			create Result.make
		end

end
	
