indexing

	description: "Test singleton pattern"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


deferred class

	DP_TEST_SINGLETON


inherit

	TS_TEST_CASE

	SINGLETON3_ACCESSOR

	SINGLETON4_ACCESSOR

feature -- Tests

	test_single_singleton is
			-- Can we create a singleton?
		local
			singleton1: SINGLETON1
		do
			create singleton1
		end

	test_singleton_is_singleton is
			-- Is it not allowed to create a singleton twice?
		local
			retried: BOOLEAN
			singleton1: SINGLETON1
		do
			if not retried then
				create singleton1
				assert ("Creating two singletons isn't a problem.", False)
			else
				assert ("Singleton seems to be really a singleton.", True)
			end
		rescue
			retried := True
			retry
		end

	test_two_singletons_in_system is
			-- What if we have two singleton classes in our system?
		local
			singleton2: SINGLETON2
		do
			create singleton2
		end

	test_singleton_accessor is
			-- Does the accessor work?
		local
			first,
			second: SINGLETON3
		do
			first := the_singleton3
			assert ("Singleton is there.", first /= Void)
			second := the_singleton3
			assert ("Really returns same object.", first = second)
		end

	test_another_singleton_accessor is
			-- Do two singleton accessors work?
		local
			first,
			second: DP_SINGLETON
		do
			first := the_singleton4
			assert ("Singleton is there.", first /= Void)
			second := the_singleton4
			assert ("Really returns same object.", first = second)
			assert ("Two different accessors return different object.", first /= the_singleton3)
		end

end
