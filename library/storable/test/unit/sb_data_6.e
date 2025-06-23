note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

expanded class SB_DATA_6 [G]

feature -- Access

	attr: detachable G

feature -- Setting

	set_attr (a: like attr)
		do
			attr := a
		end

end
