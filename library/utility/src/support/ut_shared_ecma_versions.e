﻿note

	description:

		"Shared ECMA Eiffel version numbers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2006-2018, Eric Bezault and others"
	license: "MIT License"

class UT_SHARED_ECMA_VERSIONS

inherit

	ANY -- Needed for SE.

feature -- Access

	ecma_367_1: UT_VERSION
			-- ECMA 367-1
		once
			create Result.make_major_minor (367, 1)
		ensure
			instance_free: class
			ecma_367_1_not_void: Result /= Void
		end

	ecma_367_2: UT_VERSION
			-- ECMA 367-2
		once
			create Result.make_major_minor (367, 2)
		ensure
			instance_free: class
			ecma_367_2_not_void: Result /= Void
		end

	ecma_367_latest: UT_VERSION
			-- After the last release ECMA 367
		once
			create Result.make_major (367)
		ensure
			instance_free: class
			ecma_367_latest_not_void: Result /= Void
		end

end
