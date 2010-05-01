note

	description:

		"Test singleton pattern"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DP_TEST_SINGLETON

inherit

	TS_TEST_CASE

	SHARED_SINGLETON1
	SHARED_SINGLETON2
	SHARED_SINGLETON3
	SHARED_SINGLETON4

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Tests

	test_single_singleton is
			-- Can we create a singleton?
		local
			s1: SINGLETON1
		do
			if not singleton1_created then
				create s1.make
				assert ("singleton1_created", singleton1_created)
				assert ("singleton1", s1 = singleton1)
			end
		end

	test_two_singletons_in_system is
			-- What if we have two singleton classes in our system?
		local
			s2: SINGLETON2
		do
			if not singleton2_created then
				create s2.make
				assert ("singleton2_created", singleton2_created)
				assert ("singleton2", s2 = singleton2)
			end
		end

	test_singleton_accessor is
			-- Does the accessor work?
		local
			first, second: SINGLETON3
		do
			first := singleton3
			assert ("singleton3_not_void", first /= Void)
			second := singleton3
			assert ("singleton3_pattern", first = second)
		end

	test_another_singleton_accessor is
			-- Do two singleton accessors work?
		local
			first, second: SINGLETON4
		do
			first := singleton4
			assert ("singleton4_not_void", first /= Void)
			second := singleton4
			assert ("singleton4_pattern", first = second)
			assert ("different_singletons", not ANY_.same_objects (first, singleton3))
		end

end
