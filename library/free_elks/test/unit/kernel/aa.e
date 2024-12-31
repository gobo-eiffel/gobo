class AA

feature

	foo: INTEGER

	set_foo (a_foo: INTEGER)
		do
			foo := a_foo
		ensure
			foo_set: foo = a_foo
		end

	bar: INTEGER

end
