note

	description:

		"Shared standard files"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

class KL_SHARED_STANDARD_FILES

feature -- Access

	std: KL_STANDARD_FILES
			-- Standard files
		once
			create Result
		ensure
			instance_free: class
			std_not_void: Result /= Void
		end

end
