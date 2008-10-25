indexing
	description: "References to objects containing a boolean value"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class BOOLEAN_REF inherit

	HASHABLE
		redefine
			out
		end

feature -- Access

	item: BOOLEAN
			-- Boolean value
		external
			"built_in"
		end

	hash_code: INTEGER
			-- Hash code value
		do
			if item then
				Result := 1
			end
		end

feature {NONE} -- Initialization

	make_from_reference (v: BOOLEAN_REF)
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: BOOLEAN_REF
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
			same_item: Result.item = item
		end

	to_integer: INTEGER
			-- 1 if `True'
			-- 0 if `False'
		do
			if item then
				Result := 1
			end
		ensure
			not_item_implies_zero: not item implies Result = 0
			item_implies_one: item implies Result = 1
		end

feature -- Element change

	set_item (b: BOOLEAN)
			-- Make `b' the `item' value.
		external
			"built_in"
		end

feature -- Basic operations

	infix "and" (other: like Current): BOOLEAN
			-- Boolean conjunction with `other'
		require
			other_exists: other /= Void
		do
			Result := item and other.item
		ensure
			de_morgan: Result = not (not Current or not other)
			commutative: Result = (other and Current)
			consistent_with_semi_strict: Result implies (Current and then other)
		end

	infix "and then" (other: like Current): BOOLEAN
			-- Boolean semi-strict conjunction with `other'
		require
			other_exists: other /= Void
		do
			Result := item and then other.item
		ensure
			de_morgan: Result = not (not Current or else not other)
		end

	infix "implies" (other: like Current): BOOLEAN
			-- Boolean implication of `other'
			-- (semi-strict)
		require
			other_exists: other /= Void
		do
			Result := item implies other.item
		ensure
			definition: Result = (not Current or else other)
		end

	prefix "not": BOOLEAN
			-- Negation
		do
			Result := not item
		end

	infix "or" (other: like Current): BOOLEAN
			-- Boolean disjunction with `other'
		require
			other_exists: other /= Void
		do
			Result := item or other.item
		ensure
			de_morgan: Result = not (not Current and not other)
			commutative: Result = (other or Current)
			consistent_with_semi_strict: Result implies (Current or else other)
		end

	infix "or else" (other: like Current): BOOLEAN
			-- Boolean semi-strict disjunction with `other'
		require
			other_exists: other /= Void
		do
			Result := item or else other.item
		ensure
			de_morgan: Result = not (not Current and then not other)
		end

	infix "xor" (other: like Current): BOOLEAN
			-- Boolean exclusive or with `other'
		require
			other_exists: other /= Void
		do
			Result := item xor other.item
		ensure
			definition: Result = ((Current or other) and not (Current and other))
		end

feature -- Output

	out: STRING
			-- Printable representation of boolean
		do
			Result := "False"
			if item then
				Result := "True"
			end
		end

invariant
	involutive_negation: (not (not Current)).is_equal (Current)
	non_contradiction: not ((not Current) and Current)
	completeness: (not Current) or Current

end
