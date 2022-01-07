note

	description: "Dynamic type sets of the operands of object equality expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_OBJECT_EQUALITY_TYPES

inherit

	ET_DYNAMIC_EQUALITY_TYPES
		redefine
			add_common_types_to_list
		end

create

	make

feature -- Basic operations

	add_common_types_to_list (a_common_object_equality_types, a_common_reference_equality_types: ET_DYNAMIC_PRIMARY_TYPE_LIST)
			-- Add to `a_common_object_equality_types' and `a_common_reference_equality_types'
			-- the types which are both in `left' and `right' and which require either
			-- object equality or reference equality.
		do
			left.add_common_types_to_list (right, a_common_object_equality_types)
		end

end
