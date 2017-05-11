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
			l_thread: WORKER_THREAD
			l_cell: DS_CELL [INTEGER]
			l_mutex: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_cell.make (0)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, 1_000_000, l_mutex))
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_integers_equal ("thread_done", 1_000_000, l_cell.item)
		end

	test_join_2
			-- Test feature of `join'.
			-- Test that the Eiffel runtime is not confused by the
			-- fact that the attribute 'terminated' has been renamed.
		local
			l_thread: MY_WORKER_THREAD1
			l_cell: DS_CELL [INTEGER]
			l_mutex: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_cell.make (0)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, 1_000_000, l_mutex))
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_integers_equal ("thread_done", 1_000_000, l_cell.item)
		end
		
	test_join_3
			-- Test feature of `join'.
			-- Test that the Eiffel runtime will use the version of
			-- 'terminated' inherited from class THREAD and not the
			-- new attribute introduced in class MY_WORKER_THREAD2.
		local
			l_thread: MY_WORKER_THREAD2
			l_cell: DS_CELL [INTEGER]
			l_mutex: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_cell.make (0)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, 1_000_000, l_mutex))
			l_thread.set_terminated (True)
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_integers_equal ("thread_done", 1_000_000, l_cell.item)
		end

	test_join_4
			-- Test feature of `join'.
			-- Test that the renamed attribute 'terminated' is not
			-- overwritten on thread exit from the Eiffel runtime.
		local
			l_thread: MY_WORKER_THREAD3
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_thread.make (agent do_nothing)
			l_thread.launch
			l_thread.join
			assert_integers_equal ("thread_done", 0, l_thread.terminated)
		end

feature {NONE} -- Implementation

	action1 (a_cell: DS_CELL [INTEGER]; a_count: INTEGER; a_mutex: MUTEX)
			-- Increment in `a_cell' from 1 to `a_count'
			-- when `a_mutex' is available.
		require
			a_cell_not_void: a_cell /= Void
			a_mutex_not_void: a_mutex /= Void
		local
			i: INTEGER
		do
			a_mutex.lock
			from
				i := 1
			until
				i > a_count
			loop
				a_cell.put (i)
				i := i + 1
			end
			a_mutex.unlock
		end

end
