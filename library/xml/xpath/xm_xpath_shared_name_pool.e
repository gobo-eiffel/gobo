indexing

	description:

		"Singleton XM_XPATH_NAME_POOL"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_NAME_POOL

creation

	make
	
feature -- Initialization

	make is
			-- Establish invariant
		once
			create default_pool.make
		end
	
feature -- Access

	default_pool: XM_XPATH_NAME_POOL

feature -- Element change

	set_default_pool (new_pool: XM_XPATH_NAME_POOL) is -- used when loading a compiled stylesheet
			-- Set the globally-shared default pool to `new_pool'
		require
			new_pool_not_void: new_pool /= Void
		do
			default_pool := new_pool
		ensure
			default_pool_set: default_pool = new_pool
		end

invariant

	default_pool_not_void: default_pool /= Void
	
end
	
