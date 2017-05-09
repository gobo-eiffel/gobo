note

	description:

		"Test semantics of exception in once routines"

	remark: "[
		ECMA 367-2, section 8.23.22 p.124: "Semantics: Once Routine Execution Semantics",
		says that if first execution of a once routine triggered an exception, and 
		subsequent executions should trigger again an identical exception.
	]"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TH_TEST_ONCE_EXCEPTION

inherit

	TS_TEST_CASE

	EXCEPTION_MANAGER_FACTORY
		export {NONE} all end

create

	make_default

feature -- Test

	test_once_per_process_exception_1
			-- Test once-per-process function with exception,
			-- triggered on the main thread.
		local
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_first_exception := f1_exception (1)
			l_second_exception := f1_exception (2)
			assert_true ("has_exception", l_first_exception /= Void)
			assert_same ("same_exception", l_first_exception, l_second_exception)
		end

	test_once_per_process_exception_2
			-- Test once-per-process function with exception,
			-- triggered on the same thread.
		local
			l_pair: DS_PAIR [detachable EXCEPTION, detachable EXCEPTION]
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_pair := run_functions_in_thread (agent f2_exception (1), agent f2_exception (2))
			l_first_exception := l_pair.first
			l_second_exception := l_pair.second
			assert_true ("has_exception", l_first_exception /= Void)
			assert_same ("same_exception", l_first_exception, l_second_exception)
		end

	test_once_per_process_exception_3
			-- Test once-per-process function with exception,
			-- triggered on the different threads.
		local
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_first_exception := run_function_in_thread (agent f3_exception (1))
			l_second_exception := run_function_in_thread (agent f3_exception (2))
			assert_true ("has_exception", l_first_exception /= Void)
			assert_same ("same_exception", l_first_exception, l_second_exception)
		end
		
	test_once_per_thread_exception_1
			-- Test once-per-thread function with exception,
			-- triggered on the main thread.
		local
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_first_exception := g1_exception (1)
			l_second_exception := g1_exception (2)
			assert_true ("has_exception", l_first_exception /= Void)
			assert_same ("same_exception", l_first_exception, l_second_exception)
		end

	test_once_per_thread_exception_2
			-- Test once-per-thread function with exception,
			-- triggered on the same thread.
		local
			l_pair: DS_PAIR [detachable EXCEPTION, detachable EXCEPTION]
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_pair := run_functions_in_thread (agent g2_exception (1), agent g2_exception (2))
			l_first_exception := l_pair.first
			l_second_exception := l_pair.second
			assert_true ("has_exception", l_first_exception /= Void)
			assert_same ("same_exception", l_first_exception, l_second_exception)
		end		

	test_once_per_thread_exception_3
			-- Test once-per-thread function with exception,
			-- triggered on the different threads.
		local
			l_first_exception: detachable EXCEPTION
			l_second_exception: detachable EXCEPTION
		do
			l_first_exception := run_function_in_thread (agent g3_exception (1))
			l_second_exception := run_function_in_thread (agent g3_exception (2))
			assert_true ("first_with_exception", l_first_exception /= Void)
			assert_true ("second_without_exception", l_second_exception = Void)
		end

feature -- Once routines

	f1 (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once ("PROCESS")
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception in f1")
				l_exception.raise
			end
		end

	f1_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `f1', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := f1 (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

	f2 (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once ("PROCESS")
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception in f2")
				l_exception.raise
			end
		end

	f2_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `f2', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := f2 (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

	f3 (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once ("PROCESS")
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception in f3")
				l_exception.raise
			end
		end

	f3_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `f3', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := f3 (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

	g1 (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once ("THREAD")
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception in g1")
				l_exception.raise
			end
		end

	g1_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `g1', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := g1 (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

	g2 (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once ("THREAD")
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception in g2")
				l_exception.raise
			end
		end

	g2_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `g2', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := g2 (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

	g3 (i: INTEGER): INTEGER
			-- Once function raising an exception when `i' is 1
		local
			l_exception: DEVELOPER_EXCEPTION
		once ("THREAD")
			Result := i
			if i = 1 then
				create l_exception
				l_exception.set_description ("My Gobo exception in g3")
				l_exception.raise
			end
		end

	g3_exception (i: INTEGER): detachable EXCEPTION
			-- Exception raised when calling `g3', if any
		local
			l_retried: BOOLEAN
			j: INTEGER
		do
			if not l_retried then
				j := g3 (i)
			else
				Result := exception_manager.last_exception
			end
		rescue
			if not l_retried then
				l_retried := True
				retry
			end
		end

	run_function_in_thread (a_agent: FUNCTION [detachable EXCEPTION]): detachable EXCEPTION
			-- Execute `a_agent' in a thread and return the result
		require
			a_agent_not_void: a_agent /= Void
		local
			l_thread: MY_THREAD
			l_cell: DS_CELL [detachable EXCEPTION]
		do
			create l_cell.make (Void)
			create l_thread.make_with_agent (agent put_result_in_cell (a_agent, l_cell))
			l_thread.launch
			l_thread.join
			Result := l_cell.item
		end

	run_functions_in_thread (a_agent1, a_agent2: FUNCTION [detachable EXCEPTION]): DS_PAIR [detachable EXCEPTION, detachable EXCEPTION]
			-- Execute `a_agent' in a thread and return the result
		require
			a_agent1_not_void: a_agent1 /= Void
			a_agent2_not_void: a_agent2 /= Void
		local
			l_thread: MY_THREAD
			l_pair: DS_PAIR [detachable EXCEPTION, detachable EXCEPTION]
		do
			create l_pair.make (Void, Void)
			create l_thread.make_with_agent (agent put_results_in_pair (a_agent1, a_agent2, l_pair))
			l_thread.launch
			l_thread.join
			Result := l_pair
		ensure
			result_not_void: Result /= Void
		end			
		
	put_result_in_cell (a_agent: FUNCTION [detachable EXCEPTION]; a_cell: DS_CELL [detachable EXCEPTION])
			-- Execute `a_agent' and put the result in `a_cell'.
		require
			a_agent_not_void: a_agent /= Void
			a_cell_not_void: a_cell /= Void
		do
			a_cell.put (a_agent.item ([]))
		end

	put_results_in_pair (a_agent1, a_agent2: FUNCTION [detachable EXCEPTION]; a_pair: DS_PAIR [detachable EXCEPTION, detachable EXCEPTION])
			-- Execute `a_agent1' and `a_agent2' and put their results in `a_pair'.
		require
			a_agent1_not_void: a_agent1 /= Void
			a_agent2_not_void: a_agent2 /= Void
			a_pair_not_void: a_pair /= Void
		do
			a_pair.put_first (a_agent1.item ([]))
			a_pair.put_second (a_agent2.item ([]))
		end
		
end
