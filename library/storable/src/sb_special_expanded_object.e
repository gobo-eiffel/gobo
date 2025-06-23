note

	description:

		"Special objects of user-defined expanded objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SPECIAL_EXPANDED_OBJECT

inherit

	SB_COMPOSITE_SPECIAL_OBJECT
		redefine
			is_special_expanded,
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_flags: like flags; an_address: like address; a_count: like count)
			-- Create a new empty special object of expanded.
		do
			precursor (a_type, a_flags, an_address, a_count)
			subobject_type := a_type
		end

feature -- Access

	subobject_type: SB_TYPE
			-- Type of subobjects

	subobject_flags: NATURAL_32
			-- Flags (unit32) of subobjects

feature -- Setting

	set_subobject_flags (a_flags: NATURAL_32)
			-- Set `subject_flags' to `a_flags'.
		do
			subobject_flags := a_flags
		ensure
			subobject_flags_set: subobject_flags = a_flags
		end

	set_subobject_type (a_type: like subobject_type)
			-- Set `subject_type' to `a_type'.
		do
			subobject_type := a_type
		ensure
			subobject_type_set: subobject_type = a_type
		end

feature -- Status report

	is_special_expanded: BOOLEAN = True
			-- Is current object a SPECIAL object of user-defined expanded objects?

invariant

	subobject_type_not_void: subobject_type /= Void

end
