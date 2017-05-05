note

	description:

		"Test features of class THREAD"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TH_TEST_THREAD

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_join_1
			-- Test feature of `join'.
		local
			l_thread: MY_THREAD1
		do
			create l_thread.make
			l_thread.launch
			l_thread.join
			assert_integers_equal ("thread_done", 10_000, l_thread.attr)
		end

	test_join_2
			-- Test feature of `join'.
			-- Test that the Eiffel runtime is not confused by the
			-- fact that the attribute 'terminated' has been renamed.
		local
			l_thread: MY_THREAD2
		do
			create l_thread.make
			l_thread.launch
			l_thread.join
			assert_integers_equal ("thread_done", 10_000, l_thread.attr)
		end

	test_join_3
			-- Test feature of `join'.
			-- Test that the Eiffel runtime will use the version of
			-- 'terminated' inherited from class THREAD and not the
			-- new attribute introduced in class MY_THREAD3.
		local
			l_thread: MY_THREAD3
		do
			create l_thread.make
			l_thread.launch
			l_thread.join
			assert_integers_equal ("thread_done", 10_000, l_thread.attr)
		end

	test_join_4
			-- Test feature of `join'.
			-- Test that the renamed attribute 'terminated' is not
			-- overwritten on thread exit from the Eiffel runtime.
		local
			l_thread: MY_THREAD4
		do
			create l_thread.make
			l_thread.launch
			l_thread.join
			assert_integers_equal ("thread_done", 0, l_thread.terminated)
		end

end
