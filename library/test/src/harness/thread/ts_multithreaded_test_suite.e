note

	description:

		"Test suites implemented using multiple threads"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_MULTITHREADED_TEST_SUITE

inherit

	TS_TEST_SUITE
		redefine
			make,
			execute
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_variables: like variables)
			-- Create a new test suite named `a_name'.
		do
			thread_count := 1
			precursor (a_name, a_variables)
		ensure then
			thread_count_set: thread_count = 1
		end

feature -- Access

	thread_count: INTEGER
			-- Number of threads to be used

feature -- Setting

	set_thread_count (a_thread_count: INTEGER)
			-- Set `thread_count' to `a_thread_count'.
		require
			a_thread_count_not_negative: a_thread_count >= 1
			a_thread_count_constraint: a_thread_count > 1 implies {PLATFORM}.is_thread_capable
		do
			thread_count := a_thread_count
		ensure
			thread_count_set: thread_count = a_thread_count
		end

feature -- Execution

	execute (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		local
			l_tests: DS_LINKED_LIST [TS_TEST]
			l_mutex: MUTEX
			l_thread: WORKER_THREAD
			i, nb: INTEGER
		do
			l_tests := tests.twin
			create l_mutex.make
			nb := thread_count.min (l_tests.count) - 1
			if nb >= 1 then
				from
					i := 1
				until
					i > nb
				loop
					create l_thread.make (agent execute_tests (l_tests, a_summary, l_mutex))
					l_thread.launch
					i := i + 1
				end
				execute_tests (l_tests, a_summary, l_mutex)
				{THREAD_CONTROL}.join_all
			else
				execute_tests (l_tests, a_summary, l_mutex)
			end
		end

feature {NONE} -- Implementation

	execute_tests (a_tests: DS_LINKED_LIST [TS_TEST]; a_summary: TS_SUMMARY; a_mutex: MUTEX)
			-- Execute tests in `a_tests' (from start to end) until
			-- it contains no more test.
			-- Remove each test from the list before executing it.
			-- `a_mutex' is used to get exclusive access to `a_tests' in a multi-threaded environment.
		require
			a_tests_not_void: a_tests /= Void
			no_void_test: not a_tests.has_void
			a_summary_not_void: a_summary /= Void
			a_mutex_not_void: a_mutex /= Void
		local
			l_test: detachable TS_TEST
			l_done: BOOLEAN
		do
			from
			until
				l_done
			loop
				a_mutex.lock
				if a_tests.is_empty then
					l_done := True
					l_test := Void
				else
					l_test := a_tests.first
					a_tests.remove_first
				end
				a_mutex.unlock
				if l_test /= Void then
					l_test.execute (a_summary)
				end
			end
		end

invariant

	thread_count_not_negative: thread_count >= 1
	thread_count_constraint: thread_count > 1 implies {PLATFORM}.is_thread_capable

end
