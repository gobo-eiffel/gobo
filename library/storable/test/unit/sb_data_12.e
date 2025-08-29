note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_12

feature -- Access

	stopped: BOOLEAN

feature -- Setting

	set_stopped (b: BOOLEAN)
		do
			stopped := b
		end

end
