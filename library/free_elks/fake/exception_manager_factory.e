indexing
	description: "[
		Exception manager factory.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	EXCEPTION_MANAGER_FACTORY

feature -- Access

	exception_manager: EXCEPTION_MANAGER is
			-- Exception manager
		once
			create Result
		ensure
			exception_manager_not_void: Result /= Void
		end

end
