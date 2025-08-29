note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_22

feature -- Access

	f: ANY
		do
			create {SB_DATA_21} Result.make
		ensure
			instance_free: class
		end

end
