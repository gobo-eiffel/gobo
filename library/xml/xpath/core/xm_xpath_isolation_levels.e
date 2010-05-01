note

	description:

		"Constants defining isolation levels"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XPATH_ISOLATION_LEVELS

feature -- Access

	Read_uncommitted: INTEGER is 1
			-- As SQL 92 READ UNCOMMITTED

	Read_committed: INTEGER is 2
			-- As SQL 92 READ COMMITTED

	Repeatable_read: INTEGER is 3
			-- As SQL 92 REPEATABLE READ

	Serializable: INTEGER is 4
			-- as SQL 92 SERIALIZABLE

end
	
