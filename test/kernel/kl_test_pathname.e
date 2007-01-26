indexing

	description:

		"Test features of class KL_PATHNAME"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_TEST_PATHNAME

inherit

	KL_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert ("a_pathname_not_void", a_pathname /= Void)
			assert ("not_relative", not a_pathname.is_relative)
		end

	test_set_relative is
			-- Test feature `set_relative'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert ("not_relative1", not a_pathname.is_relative)
			a_pathname.set_relative (True)
			assert ("relative", a_pathname.is_relative)
			a_pathname.set_relative (False)
			assert ("not_relative2", not a_pathname.is_relative)
		end

	test_set_drive is
			-- Test feature `set_drive'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert ("no_drive", a_pathname.drive = Void)
			a_pathname.set_drive ("c:")
			assert_equal ("drive", "c:", a_pathname.drive)
		end

	test_set_hostname is
			-- Test feature `set_hostname'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert ("no_hostname", a_pathname.hostname = Void)
			a_pathname.set_hostname ("gobo")
			assert_equal ("hostname", "gobo", a_pathname.hostname)
		end

	test_append_name is
			-- Test feature `append_name'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert_integers_equal ("empty", 0, a_pathname.count)
			a_pathname.append_name ("foo")
				-- "/foo"
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert_equal ("foo1", "foo",  a_pathname.item (1))
			a_pathname.append_name ("bar")
				-- "/foo/bar"
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert_equal ("foo2", "foo", a_pathname.item (1))
			assert_equal ("bar2", "bar", a_pathname.item (2))
		end

	test_append_names is
			-- Test feature `append_names'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert_integers_equal ("empty", 0, a_pathname.count)
			a_pathname.append_name ("gobo")
				-- "/gobo"
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert_equal ("gobo1", "gobo",  a_pathname.item (1))
			a_pathname.append_names (<<"foo", "bar">>)
				-- "/gobo/foo/bar"
			assert_integers_equal ("count2", 3, a_pathname.count)
			assert_equal ("gobo2", "gobo", a_pathname.item (1))
			assert_equal ("foo2", "foo", a_pathname.item (2))
			assert_equal ("bar2", "bar", a_pathname.item (3))
		end

	test_append_current is
			-- Test feature `append_current'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert_integers_equal ("empty1", 0, a_pathname.count)
			a_pathname.append_name ("foo")
				-- "/foo"
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert_equal ("foo1", "foo", a_pathname.item (1))
			a_pathname.append_current
				-- "/foo/."
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert_equal ("foo2", "foo",  a_pathname.item (1))
			assert ("current2", a_pathname.is_current (2))
			a_pathname.append_name ("bar")
				-- "/foo/./bar"
			assert_integers_equal ("count3", 3, a_pathname.count)
			assert_equal ("foo3", "foo", a_pathname.item (1))
			assert ("current3", a_pathname.is_current (2))
			assert_equal ("bar3", "bar", a_pathname.item (3))
			create a_pathname.make
			assert_integers_equal ("empty2", 0, a_pathname.count)
			a_pathname.set_relative (True)
			a_pathname.append_current
				-- "."
			assert_integers_equal ("count4", 1, a_pathname.count)
			assert ("current4", a_pathname.is_current (1))
		end

	test_append_parent is
			-- Test feature `append_parent'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert_integers_equal ("empty1", 0, a_pathname.count)
			a_pathname.append_name ("foo")
				-- "/foo"
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert_equal ("foo1", "foo", a_pathname.item (1))
			a_pathname.append_parent
				-- "/foo/.."
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert_equal ("foo2", "foo", a_pathname.item (1))
			assert ("parent2", a_pathname.is_parent (2))
			a_pathname.append_name ("bar")
				-- "/foo/../bar"
			assert_integers_equal ("count3", 3, a_pathname.count)
			assert_equal ("foo3", "foo", a_pathname.item (1))
			assert ("parent3", a_pathname.is_parent (2))
			assert_equal ("bar3", "bar", a_pathname.item (3))
			create a_pathname.make
			assert_integers_equal ("empty2", 0, a_pathname.count)
			a_pathname.set_relative (True)
			a_pathname.append_parent
				-- ".."
			assert_integers_equal ("count4", 1, a_pathname.count)
			assert ("parent4", a_pathname.is_parent (1))
		end

	test_set_canonical1 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			assert_integers_equal ("empty1", 0, a_pathname.count)
			a_pathname.append_name ("foo")
				-- "/foo"
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert_equal ("foo1", "foo", a_pathname.item (1))
			a_pathname.append_parent
				-- "/foo/.."
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert_equal ("foo2", "foo", a_pathname.item (1))
			assert ("parent2", a_pathname.is_parent (2))
			a_pathname.append_name ("bar")
				-- "/foo/../bar"
			assert_integers_equal ("count3", 3, a_pathname.count)
			assert_equal ("foo3", "foo", a_pathname.item (1))
			assert ("parent3", a_pathname.is_parent (2))
			assert_equal ("bar3", "bar", a_pathname.item (3))
			assert ("not_canonical1", not a_pathname.is_canonical)
			a_pathname.set_canonical
				-- "/bar"
			assert ("canonical1", a_pathname.is_canonical)
			assert_integers_equal ("count4", 1, a_pathname.count)
			assert_equal ("bar4", "bar", a_pathname.item (1))
			a_pathname.append_current
				-- "/bar/."
			assert_integers_equal ("count5", 2, a_pathname.count)
			assert_equal ("bar5", "bar", a_pathname.item (1))
			assert ("current5", a_pathname.is_current (2))
			a_pathname.append_name ("gobo")
				-- "/bar/./gobo"
			assert_integers_equal ("count6", 3, a_pathname.count)
			assert_equal ("bar6", "bar", a_pathname.item (1))
			assert ("current6", a_pathname.is_current (2))
			assert_equal ("gobo6", "gobo", a_pathname.item (3))
			assert ("not_canonical2", not a_pathname.is_canonical)
			a_pathname.set_canonical
				-- "/bar/gobo"
			assert ("canonical2", a_pathname.is_canonical)
			assert_integers_equal ("count7", 2, a_pathname.count)
			assert_equal ("bar7", "bar", a_pathname.item (1))
			assert_equal ("gobo7", "gobo", a_pathname.item (2))
		end

	test_set_canonical2 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "/foo/gobo/../../bar"
			create a_pathname.make
			a_pathname.append_name ("foo")
			a_pathname.append_name ("gobo")
			a_pathname.append_parent
			a_pathname.append_parent
			a_pathname.append_name ("bar")
			assert_integers_equal ("count1", 5, a_pathname.count)
			a_pathname.set_canonical
				-- "/bar"
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert_equal ("bar", "bar", a_pathname.item (1))
		end

	test_set_canonical3 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "../../bar"
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_parent
			a_pathname.append_parent
			a_pathname.append_name ("bar")
			assert_integers_equal ("count1", 3, a_pathname.count)
			a_pathname.set_canonical
				-- "../../bar"
			assert_integers_equal ("count2", 3, a_pathname.count)
			assert ("parent1", a_pathname.is_parent (1))
			assert ("parent2", a_pathname.is_parent (2))
			assert_equal ("bar", "bar", a_pathname.item (3))
		end

	test_set_canonical4 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "./../bar"
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_current
			a_pathname.append_parent
			a_pathname.append_name ("bar")
			assert_integers_equal ("count1", 3, a_pathname.count)
			a_pathname.set_canonical
				-- "../bar"
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert ("parent", a_pathname.is_parent (1))
			assert_equal ("bar", "bar", a_pathname.item (2))
		end

	test_set_canonical5 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "foo/../../bar"
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_parent
			a_pathname.append_parent
			a_pathname.append_name ("bar")
			assert_integers_equal ("count1", 4, a_pathname.count)
			a_pathname.set_canonical
				-- "../bar"
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert ("parent", a_pathname.is_parent (1))
			assert_equal ("bar", "bar", a_pathname.item (2))
		end

	test_set_canonical6 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "../foo/../bar"
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_parent
			a_pathname.append_name ("foo")
			a_pathname.append_parent
			a_pathname.append_name ("bar")
			assert_integers_equal ("count1", 4, a_pathname.count)
			a_pathname.set_canonical
				-- "../bar"
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert ("parent", a_pathname.is_parent (1))
			assert_equal ("bar", "bar", a_pathname.item (2))
		end

	test_set_canonical7 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "."
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_current
			assert_integers_equal ("count1", 1, a_pathname.count)
			a_pathname.set_canonical
				-- "."
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert ("current", a_pathname.is_current (1))
		end

	test_set_canonical8 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "/."
			create a_pathname.make
			a_pathname.append_current
			assert_integers_equal ("count1", 1, a_pathname.count)
			a_pathname.set_canonical
				-- "/"
			assert_integers_equal ("count2", 0, a_pathname.count)
		end

	test_set_canonical9 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- ".."
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_parent
			assert_integers_equal ("count1", 1, a_pathname.count)
			a_pathname.set_canonical
				-- ".."
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert ("parent", a_pathname.is_parent (1))
		end

	test_set_canonical10 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "foo/.."
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_parent
			assert_integers_equal ("count1", 2, a_pathname.count)
			a_pathname.set_canonical
				-- "."
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert ("current", a_pathname.is_current (1))
		end

	test_set_canonical11 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "/foo/.."
			create a_pathname.make
			a_pathname.append_name ("foo")
			a_pathname.append_parent
			assert_integers_equal ("count1", 2, a_pathname.count)
			a_pathname.set_canonical
				-- "/"
			assert_integers_equal ("count2", 0, a_pathname.count)
		end

	test_set_canonical12 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "foo/./.."
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_current
			a_pathname.append_parent
			assert_integers_equal ("count1", 3, a_pathname.count)
			a_pathname.set_canonical
				-- "."
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert ("current", a_pathname.is_current (1))
		end

	test_set_canonical13 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "foo/../."
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_parent
			a_pathname.append_current
			assert_integers_equal ("count1", 3, a_pathname.count)
			a_pathname.set_canonical
				-- "."
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert ("current", a_pathname.is_current (1))
		end

	test_set_canonical14 is
			-- Test feature `set_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
				-- "foo/."
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_current
			assert_integers_equal ("count1", 2, a_pathname.count)
			a_pathname.set_canonical
				-- "foo"
			assert_integers_equal ("count2", 1, a_pathname.count)
			assert_equal ("foo", "foo", a_pathname.item (1))
		end

	test_same_pathname is
			-- Test feature `same_pathname'.
		local
			a_pathname1, a_pathname2: KL_PATHNAME
		do
			create a_pathname1.make
			a_pathname1.set_relative (True)
			a_pathname1.append_parent
			a_pathname1.append_name ("foo")
			a_pathname1.append_current
			a_pathname1.append_name ("bar")
			assert ("relative1", a_pathname1.is_relative)
			assert ("drive1", a_pathname1.drive = Void)
			assert ("hostname1", a_pathname1.hostname = Void)
			assert_integers_equal ("count1", 4, a_pathname1.count)
			assert ("parent1", a_pathname1.is_parent (1))
			assert_equal ("foo1", "foo", a_pathname1.item (2))
			assert ("current1", a_pathname1.is_current (3))
			assert_equal ("bar1", "bar", a_pathname1.item (4))
			assert ("same_pathname1", a_pathname1.same_pathname (a_pathname1))
			create a_pathname2.make
			a_pathname2.set_relative (True)
			a_pathname2.append_parent
			a_pathname2.append_name ("foo")
			a_pathname2.append_current
			a_pathname2.append_name ("bar")
			assert ("relative2", a_pathname2.is_relative)
			assert ("drive2", a_pathname2.drive = Void)
			assert ("hostname2", a_pathname2.hostname = Void)
			assert_integers_equal ("count2", 4, a_pathname2.count)
			assert ("parent2", a_pathname2.is_parent (1))
			assert_equal ("foo2", "foo", a_pathname2.item (2))
			assert ("current2", a_pathname2.is_current (3))
			assert_equal ("bar2", "bar", a_pathname2.item (4))
			assert ("same_pathname2", a_pathname1.same_pathname (a_pathname2))
			a_pathname2.append_name ("gobo")
			assert ("not_same_pathname1", not a_pathname1.same_pathname (a_pathname2))
			a_pathname2 := a_pathname1.cloned_object
			assert ("same_pathname3", a_pathname1.same_pathname (a_pathname2))
			a_pathname2.set_drive ("c:")
			assert ("not_same_pathname2", not a_pathname1.same_pathname (a_pathname2))
		end

	test_is_parent is
			-- Test feature `is_parent'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			a_pathname.append_parent
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert ("parent1", a_pathname.is_parent (1))
			a_pathname.append_current
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert ("not_parent1", not a_pathname.is_parent (2))
			a_pathname.append_name ("foo")
			assert_integers_equal ("count3", 3, a_pathname.count)
			assert ("not_parent2", not a_pathname.is_parent (3))
				-- ".." is not considered as the parent component.
				-- One should use `append_parent' instead.
			a_pathname.append_name ("..")
			assert_integers_equal ("count4", 4, a_pathname.count)
			assert ("not_parent3", not a_pathname.is_parent (4))
		end

	test_is_current is
			-- Test feature `is_current'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			a_pathname.append_current
			assert_integers_equal ("count1", 1, a_pathname.count)
			assert ("current1", a_pathname.is_current (1))
			a_pathname.append_parent
			assert_integers_equal ("count2", 2, a_pathname.count)
			assert ("not_current1", not a_pathname.is_current (2))
			a_pathname.append_name ("foo")
			assert_integers_equal ("count3", 3, a_pathname.count)
			assert ("not_current2", not a_pathname.is_current (3))
				-- "." is not considered as the current component.
				-- One should use `append_current' instead.
			a_pathname.append_name (".")
			assert_integers_equal ("count4", 4, a_pathname.count)
			assert ("not_current3", not a_pathname.is_current (4))
		end

	test_is_canonical is
			-- Test feature `is_canonical'.
		local
			a_pathname: KL_PATHNAME
		do
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_names (<<"foo", "bar">>)
				-- "foo/bar"
			assert ("canonical1", a_pathname.is_canonical)
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_current
				-- "."
			assert ("canonical2", a_pathname.is_canonical)
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_parent
			a_pathname.append_name ("foo")
				-- "../foo"
			assert ("canonical3", a_pathname.is_canonical)
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_parent
				-- "foo/.."
			assert ("not_canonical1", not a_pathname.is_canonical)
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_name ("foo")
			a_pathname.append_current
				-- "foo/."
			assert ("not_canonical2", not a_pathname.is_canonical)
		end

end
