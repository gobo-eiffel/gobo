class FF

inherit

	ANY
		redefine
			copy,
			is_equal
		end

feature

	foo: INTEGER

	set_foo (i: INTEGER)
		do
			foo := i
		end

	bar: INTEGER

	set_bar (i: INTEGER)
		do
			bar := i
		end

	copy_count: INTEGER

	set_copy_count (i: INTEGER)
		do
			copy_count := i
		end

	copy (other: like Current)
		do
			foo := other.foo
			copy_count := copy_count + 1
		end

	is_equal (other: like Current): BOOLEAN
		do
			Result := foo = other.foo
		end

end
