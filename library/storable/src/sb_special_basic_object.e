note

	description:

		"Special objects of objects of basic types read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_SPECIAL_BASIC_OBJECT

inherit

	SB_SPECIAL_OBJECT
		redefine
			is_special_basic
		end

feature -- Access

	item_type (a_schema: SB_SCHEMA): SB_TYPE
			-- Type of items in `a_schema'
		require
			a_schema_not_void: a_schema /= Void
		deferred
		ensure
			item_type_not_void: Result /= Void
		end

feature -- Status report

	is_special_basic: BOOLEAN = True
			-- Is current object a SPECIAL object of objects of basic types?

feature -- Output

	item_out (i: INTEGER): STRING
			-- Textual representation of item at index `i'
		require
			valid_index: valid_index (i)
		deferred
		ensure
			item_out_not_void: Result /= Void
		end

end
