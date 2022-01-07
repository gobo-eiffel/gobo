note

	description: "Dynamic type sets of the operands of equality expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_EQUALITY_TYPES

create

	make

feature {NONE} -- Initialization

	make (a_left: like left; a_right: like right)
			-- Create a new equality types.
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			left := a_left
			right := a_right
		ensure
			left_set: left = a_left
			right_set: right = a_right
		end

feature -- Access

	left: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of the left operand of the equality expression

	right: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of the right operand of the equality expression

feature -- Setting

	set_left (a_left: like left)
			-- Set `left' to `a_left'.
		require
			a_left_not_void: a_left /= Void
		do
			left := a_left
		ensure
			left_set: left = a_left
		end

	set_right (a_right: like right)
			-- Set `right' to `a_right'.
		require
			a_right_not_void: a_right /= Void
		do
			right := a_right
		ensure
			right_set: right = a_right
		end

feature -- Basic operations

	add_common_types_to_list (a_common_object_equality_types, a_common_reference_equality_types: ET_DYNAMIC_PRIMARY_TYPE_LIST)
			-- Add to `a_common_object_equality_types' and `a_common_reference_equality_types'
			-- the types which are both in `left' and `right' and which require either
			-- object equality or reference equality.
		require
			a_common_object_equality_types_not_void: a_common_object_equality_types /= Void
			a_common_reference_equality_types_not_void: a_common_reference_equality_types /= Void
		do
			left.add_common_expanded_and_reference_types_to_lists (right, a_common_object_equality_types, a_common_reference_equality_types)
		end

invariant

	left_not_void: left /= Void
	right_not_void: right /= Void

end
