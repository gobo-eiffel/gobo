expanded class ZZ

inherit

	ANY
		redefine
			copy,
			is_equal
		end

feature

	attr: INTEGER

	set_attr (i: INTEGER)
		do
			attr := i
			copy_count := 0
		end

	copy_count: INTEGER

	set_copy_count (i: INTEGER)
		do
			copy_count := i
		end

	copy (other: like Current)
		do
			attr := other.attr
			copy_count := copy_count + 1
		end

	is_equal (other: like Current): BOOLEAN
		do
			Result := attr = other.attr
		end

end
