indexing
	description: "References to objects containing a boolean value"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class BOOLEAN_REF inherit

	HASHABLE
		redefine
			is_hashable, out
		end

feature -- Access

	item: BOOLEAN is
			-- Boolean value
		external
			"built_in"
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := 1
		end

feature -- Status report

	is_hashable: BOOLEAN is
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := item
		end

feature {NONE} -- Initialization

	make_from_reference (v: BOOLEAN_REF) is
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: BOOLEAN_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	to_integer: INTEGER is
			-- 1 if `True'
			-- 0 if `False'
		do
			if item then
				Result := 1
			end
		ensure
			zero_or_one: Result = 0 or Result = 1
			item_implies_one: item implies Result = 1
		end

feature -- Element change

	set_item (b: BOOLEAN) is
			-- Make `b' the `item' value.
		external
			"built_in"
		end

feature -- Basic operations

	infix "and" (other: like Current): BOOLEAN is
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

	infix "and then" (other: like Current): BOOLEAN is
			-- Boolean semi-strict conjunction with `other'
		require
			other_exists: other /= Void
		do
			Result := item and then other.item
		ensure
			de_morgan: Result = not (not Current or else not other)
		end

	infix "implies" (other: like Current): BOOLEAN is
			-- Boolean implication of `other'
			-- (semi-strict)
		require
			other_exists: other /= Void
		do
			Result := item implies other.item
		ensure
			definition: Result = (not Current or else other)
		end

	prefix "not": like Current is
			-- Negation
		do
			create Result
			Result.set_item (not item)
		end

	infix "or" (other: like Current): BOOLEAN is
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

	infix "or else" (other: like Current): BOOLEAN is
			-- Boolean semi-strict disjunction with `other'
		require
			other_exists: other /= Void
		do
			Result := item or else other.item
		ensure
			de_morgan: Result = not (not Current and then not other)
		end

	infix "xor" (other: like Current): BOOLEAN is
			-- Boolean exclusive or with `other'
		require
			other_exists: other /= Void
		do
			Result := item xor other.item
		ensure
			definition: Result = ((Current or other) and not (Current and other))
		end

feature -- Output

	out: STRING is
			-- Printable representation of boolean
		do
			if item then
				Result := "True"
			else
				Result := "False"
			end
		end

invariant

	involutive_negation: is_equal (not (not Current))
	non_contradiction: not (Current and (not Current))
	completeness: Current or else (not Current)

end
