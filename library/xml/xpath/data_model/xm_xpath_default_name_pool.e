indexing

	description:

		"Default XM_XPATH_NAME_POOL"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DEFAULT_NAME_POOL

create {XM_XPATH_SHARED_NAME_POOL}

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create default_pool.make
		end

feature -- Access

	default_pool: XM_XPATH_NAME_POOL
			-- The default pool

feature -- Element change

	set_default_pool (a_new_pool: XM_XPATH_NAME_POOL) is -- used when loading a compiled stylesheet
			-- Set the globally-shared default pool to `a_new_pool'
		require
			new_pool_not_void: a_new_pool /= Void
		do
			default_pool := a_new_pool
		ensure
			default_pool_set: default_pool = a_new_pool
		end

invariant

	default_pool: default_pool /= Void

end
	
