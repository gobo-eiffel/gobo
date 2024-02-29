note

	description:

		"Test features of class THREAD"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class TH_TEST_THREAD

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test
                
	test_join_1
			-- Test feature of 'join'.
		local
			l_thread: WORKER_THREAD
			l_cell: DS_CELL [INTEGER]
			l_mutex: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_cell.make (1_000_000)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, l_mutex))
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_true ("terminated", l_thread.terminated)
			assert_integers_equal ("thread_done", 0, l_cell.item)
		end

	test_join_2
			-- Test feature of 'join'.
			-- Test that the Eiffel runtime is not confused by the
			-- fact that the attribute 'terminated' has been renamed.
		local
			l_thread: MY_WORKER_THREAD1
			l_cell: DS_CELL [INTEGER]
			l_mutex: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_cell.make (1_000_000)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, l_mutex))
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_true ("terminated", l_thread.thread_terminated)
			assert_integers_equal ("thread_done", 0, l_cell.item)
		end
		
	test_join_3
			-- Test feature of 'join'.
			-- Test that the Eiffel runtime will use the version of
			-- 'terminated' inherited from class THREAD and not the
			-- new attribute introduced in class MY_WORKER_THREAD2.
		local
			l_thread: MY_WORKER_THREAD2
			l_cell: DS_CELL [INTEGER]
			l_mutex: MUTEX
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_cell.make (1_000_000)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, l_mutex))
			l_thread.set_terminated (True)
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_true ("terminated", l_thread.thread_terminated)
			assert_integers_equal ("thread_done", 0, l_cell.item)
		end

	test_join_4
			-- Test feature of 'join'.
			-- Test that the renamed attribute 'terminated' is not
			-- overwritten on thread exit from the Eiffel runtime.
		local
			l_thread: MY_WORKER_THREAD3
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			create l_thread.make (agent do_nothing)
			l_thread.launch
			l_thread.join
			assert_true ("terminated", l_thread.thread_terminated)
			assert_integers_equal ("thread_done", 0, l_thread.terminated)
		end

	test_join_with_timeout_1
			-- Test feature of 'join_with_timeout'.
			-- Test when the thread terminates before the timeout.
		local
			l_thread: WORKER_THREAD
			l_10_seconds: NATURAL_64
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			l_10_seconds := 10_000
			create l_thread.make (agent do_nothing)
			l_thread.launch
			assert_true ("before_timeout", l_thread.join_with_timeout (l_10_seconds))
			assert_true ("terminated", l_thread.terminated)
		end

	test_join_with_timeout_2
			-- Test feature of 'join_with_timeout'.
			-- Test when the thread does not terminate before the timeout.
		local
			l_thread: WORKER_THREAD
			l_1_millisecond: NATURAL_64
			l_10_seconds: NATURAL_64
			l_mutex: MUTEX
			l_cell: DS_CELL [INTEGER]
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			l_1_millisecond := 1
			l_10_seconds := 10_000
			create l_cell.make (0)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_cell, l_mutex))
			l_thread.launch
			assert_false ("after_timeout", l_thread.join_with_timeout (l_1_millisecond))
			assert_false ("not_terminated", l_thread.terminated)
			l_mutex.unlock
			assert_true ("before_timeout", l_thread.join_with_timeout (l_10_seconds))
			assert_true ("terminated", l_thread.terminated)
		end

	test_exit
			-- Test feature of 'exit'.
		local
			l_thread: WORKER_THREAD
			l_2_seconds: NATURAL_64
			l_mutex: MUTEX
			l_cell: DS_CELL [detachable THREAD]
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			l_2_seconds := 2_000
			create l_cell.make (Void)
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action3 (l_cell, l_mutex))
			l_thread.launch
			l_mutex.unlock
			assert_true ("not_running", l_thread.join_with_timeout (l_2_seconds))
			assert_true ("terminated", l_thread.terminated)
		end

	test_thread_id
			-- Test feature of 'thread_id'.
		local
			l_thread: WORKER_THREAD
			l_mutex: MUTEX
			l_thread_info: TUPLE [thread: detachable THREAD; thread_id, current_thread_id: POINTER]
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			l_thread_info := [l_thread, default_pointer, default_pointer]
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action2 (l_thread_info, l_mutex))
			l_thread_info.thread := l_thread
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_not_same ("thread_id_not_null", default_pointer, l_thread_info.thread_id)
			assert_same ("current_thread_id", l_thread_info.current_thread_id, l_thread_info.thread_id)
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

	action2 (a_thread_info: TUPLE [thread: detachable THREAD; thread_id, current_thread_id: POINTER]; a_mutex: MUTEX)
			-- If `a_thread_info' contains a thread object, then
			-- put its thread id and current thread id in it.
			-- Execute when `a_mutex' is available.
		require
			a_thread_info_not_void: a_thread_info /= Void
			a_mutex_not_void: a_mutex /= Void
		do
			a_mutex.lock
			if attached a_thread_info.thread as l_thread then
				a_thread_info.thread_id := l_thread.thread_id
				a_thread_info.current_thread_id := l_thread.current_thread_id
			end
			a_mutex.unlock
		end
		
	action3 (a_thread: DS_CELL [detachable THREAD]; a_mutex: MUTEX)
			-- If `a_thread' contains a thread object, then
			-- call `exit' on it.
			-- Execute when `a_mutex' is available.
		require
			a_thread_not_void: a_thread /= Void
			a_mutex_not_void: a_mutex /= Void
		local
			l_10_seconds: INTEGER_64
		do
			a_mutex.lock
			if attached a_thread.item as l_thread then
				l_thread.exit
				l_10_seconds := 10_000_000_000
				(create {EXECUTION_ENVIRONMENT}).sleep (l_10_seconds)
			end
			a_mutex.unlock
		end
		
end
