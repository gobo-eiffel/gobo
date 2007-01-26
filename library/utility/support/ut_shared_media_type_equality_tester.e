indexing

	description:

		"Shared media type equality testers"

	library: "Gobo Eiffel utility Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_MEDIA_TYPE_EQUALITY_TESTER

feature -- Access

	media_type_tester: UT_MEDIA_TYPE_EQUALITY_TESTER is
			-- Media type equality tester
		once
			create Result
		ensure
			media_type_tester_not_void: Result /= Void
		end

end
