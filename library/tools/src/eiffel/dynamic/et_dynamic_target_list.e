note

	description:

		"Lists Eiffel targets when propagating dynamic types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_TARGET_LIST

inherit

	ET_TAIL_LIST [ET_DYNAMIC_TARGET]

create

	make, make_with_capacity

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_DYNAMIC_TARGET]
			-- Fixed array routines
		once
			create Result
		end

end
