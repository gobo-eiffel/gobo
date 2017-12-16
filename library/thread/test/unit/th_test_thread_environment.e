note

	description:

		"Test features of class THREAD_ENVIRONMENT"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TH_TEST_THREAD_ENVIRONMENT

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_current_thread_id
			-- Test feature of 'current_thread_id'.
		local
			l_thread: WORKER_THREAD
			l_mutex: MUTEX
			l_thread_info: TUPLE [thread: detachable THREAD; thread_id, current_thread_id: POINTER]
			l_main_thread_id: POINTER
		do
			assert_true ("is_thread_capable", {PLATFORM}.is_thread_capable)
			l_main_thread_id := {THREAD_ENVIRONMENT}.current_thread_id
			assert_not_same ("main_thread_id_not_null", default_pointer, l_main_thread_id)
			l_thread_info := [l_thread, default_pointer, default_pointer]
			create l_mutex.make
			l_mutex.lock
			create l_thread.make (agent action1 (l_thread_info, l_mutex))
			l_thread_info.thread := l_thread
			l_thread.launch
			l_mutex.unlock
			l_thread.join
			assert_not_same ("thread_id_not_null", default_pointer, l_thread_info.current_thread_id)
			assert_same ("valid_thread_info", l_thread_info.current_thread_id, l_thread_info.thread_id)
			assert_not_same ("different_thread_id", l_main_thread_id, l_thread_info.current_thread_id)
			assert_same ("main_thread_id_not_changed", l_main_thread_id, {THREAD_ENVIRONMENT}.current_thread_id)
		end
		
feature {NONE} -- Implementation

	action1 (a_thread_info: TUPLE [thread: detachable THREAD; thread_id, current_thread_id: POINTER]; a_mutex: MUTEX)
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
				a_thread_info.current_thread_id := {THREAD_ENVIRONMENT}.current_thread_id
			end
			a_mutex.unlock
		end
		
end
