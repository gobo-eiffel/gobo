note

	description:

		"Shared Eiffel Storable file readers"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SHARED_READERS

feature -- Access

	independent_store_6_6_reader: SB_INDEPENDENT_STORE_6_6_READER
			-- Eiffel Storable file reader using independent store format 6.6
		once
			create Result.make
		ensure
			reader_not_void: Result /= Void
		end

end
