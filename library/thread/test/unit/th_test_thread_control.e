note

	description:

		"Test features of class THREAD_CONTROL"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TH_TEST_THREAD_CONTROL

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_join_all
			-- Test feature of 'join_all'.
		local
			l_thread_1: WORKER_THREAD
			l_thread_2: WORKER_THREAD
			l_cell_1: DS_CELL [INTEGER]
			l_cell_2: DS_CELL [INTEGER]
			l_mutex_1: MUTEX
			l_mutex_2: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
				-- Prepare thread 1.
			create l_cell_1.make (1_000_000)
			create l_mutex_1.make
			l_mutex_1.lock
			create l_thread_1.make (agent action1 (l_cell_1, l_mutex_1))
				-- Prepare thread 2.
			create l_cell_2.make (1_000_000)
			create l_mutex_2.make
			l_mutex_2.lock
			create l_thread_2.make (agent action1 (l_cell_2, l_mutex_2))
				-- Ready to let  the thread execute.
			l_thread_1.launch
			l_thread_2.launch
			l_mutex_1.unlock
			l_mutex_2.unlock
			{THREAD_CONTROL}.join_all
			assert_true ("thread_1_terminated", l_thread_1.terminated)
			assert_integers_equal ("thread_1_done", 0, l_cell_1.item)
			assert_true ("thread_2_terminated", l_thread_2.terminated)
			assert_integers_equal ("thread_2_done", 0, l_cell_2.item)
		end

feature {NONE} -- Implementation

	action1 (a_cell: DS_CELL [INTEGER]; a_mutex: MUTEX)
			-- Decrement counter in `a_cell' and stops at 0.
			-- Execute when `a_mutex' is available.
		require
			a_cell_not_void: a_cell /= Void
			a_mutex_not_void: a_mutex /= Void
		local
			i: INTEGER
		do
			a_mutex.lock
			from
				i := a_cell.item
			until
				i <= 0
			loop
				i := i - 1
				a_cell.put (i)
			end
			a_mutex.unlock
		end

end
