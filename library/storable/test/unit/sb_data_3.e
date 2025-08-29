note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

expanded class SB_DATA_3 [expanded G]

inherit

	ANY
		redefine
			is_equal
		end

feature -- Access

	attr: G

feature -- Setting

	set_attr (a: like attr)
		do
			attr := a
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := True
		end

end
