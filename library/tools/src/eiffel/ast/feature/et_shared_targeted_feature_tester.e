note

	description:

		"Shared equality testers for Eiffel features with their target base type"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

class ET_SHARED_TARGETED_FEATURE_TESTER

feature -- Access

	targeted_feature_tester: ET_TARGETED_FEATURE_TESTER
			-- Targeted feature equality tester
		once
			create Result
		ensure
			instance_free: class
			targeted_feature_tester_not_void: Result /= Void
		end

end
