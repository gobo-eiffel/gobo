﻿note

	description:

		"Objects that provide access to a shared function library during stylesheet module compilation"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_SHARED_FUNCTION_LIBRARY

feature -- Access

	shared_function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Establish invariant
		local
			a_function_library: XM_XPATH_FUNCTION_LIBRARY
		once
			create Result.make
			create {XM_XSLT_SYSTEM_FUNCTION_LIBRARY} a_function_library.make
			Result.add_function_library (a_function_library)
			create {XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY} a_function_library.make
			Result.add_function_library (a_function_library)
		end
end

