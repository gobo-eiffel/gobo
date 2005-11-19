class INTEGER_REF

inherit

	COMPARABLE
		undefine
			is_equal
		redefine
			infix ">",
			infix ">=",
			infix "<="
		end

	HASHABLE

feature {NONE} -- Initialization

	make_from_reference (v: INTEGER_REF) is
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			item := v.item
		ensure
			item_set: item = v.item	
		end

feature -- Conversion

	to_reference: INTEGER_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

feature

	item: INTEGER
			-- Integer value

feature -- Element change

	set_item (i: INTEGER) is
			-- Make `i' the `item' value.
		do
			item := i
		ensure
			item_set: item = i
		end

	hash_code: INTEGER is
		do
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		external
			"built_in"
		end

	infix ">" (other: like Current): BOOLEAN is
		external
			"built_in"
		end

	infix "<=" (other: like Current): BOOLEAN is
		external
			"built_in"
		end

	infix ">=" (other: like Current): BOOLEAN is
		external
			"built_in"
		end

end
