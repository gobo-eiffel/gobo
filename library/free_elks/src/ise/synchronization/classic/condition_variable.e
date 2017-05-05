note
	description: "[
		Condition variables allow threads to synchronize based on the content of a shared data, whereas
		mutexes only synchronize access to the data. In other words, a condition variable is a
		synchronization object that enables threads to wait until a particular condition occurs.
		
		When a thread executes a `wait' call on a condition variable, it must hold an associated `mutex'
		(used for checking that condition). Then, it is immediately suspended and put into the waiting
		queue. The thread is suspended and is waiting for the condition to occur.

		Eventually, when the condition has occurred, a thread will `signal' it. Two possible scenarios:
		- if there are threads waiting, then one of the waiting thread will resume its execution and
		  will get the `mutex' in a locked state.
		- if there are no threads waiting, nothing is done

		For the simple usage of a condition variable, it is very similar to using a semaphore.
		
		In addition you have `broadcast' that will resume all waiting threads at once, and
		`wait_with_timeout' that will wait only a certain amount of time before abandonning the wait.
		
		The `signal' and `broadcast' routines can be called by a thread whether or not it currently owns
		the mutex that threads calling `wait' or `wait_with_timeout' have associated with the condition
		variable during their waits. If, however, predictable scheduling behavior is required, then that
		mutex should be locked by the thread prior to calling `signal' or `broadcast'.
		
		Assuming `shared_data' an INTEGER initially set to zero, then a typical usage of condition variable
		to wait until `shared_data' becomes one, could be written as followed in thread A:
		
			mutex.lock
			from
			until
				shared_data = 1
			loop
				condition_variable.wait (mutex)
			end
			mutex.unlock
			
		and in thread B:
		
			mutex.lock
			shared_data := 1
			condition_variable.signal
			mutex.unlock
			
		Thread A will be blocked until thread B signal that now `shared_data' is 1.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CONDITION_VARIABLE

inherit
	DISPOSABLE

create
	make

feature {NONE} -- Initialization

	make
			-- Create and initialize condition variable.
		do
			cond_pointer := eif_thr_cond_create
		ensure
			is_set: is_set
		end

feature -- Access

	is_set: BOOLEAN
			-- Is condition variable initialized?
		do
			Result := cond_pointer /= default_pointer
		end

feature -- Status setting

	signal
			-- Unblock one thread blocked on the current condition variable.
		require
			is_set: is_set
		do
			eif_thr_cond_signal (cond_pointer)
		end

	broadcast
			-- Unblock all threads blocked on the current condition variable.
		require
			is_set: is_set
		do
			eif_thr_cond_broadcast (cond_pointer)
		end

	wait (a_mutex: MUTEX)
			-- Block calling thread on current condition variable.
		require
			is_set: is_set
			a_mutex_not_void: a_mutex /= Void
		do
			eif_thr_cond_wait (cond_pointer, a_mutex.mutex_pointer)
		end

	wait_with_timeout (a_mutex: MUTEX; a_timeout_ms: INTEGER): BOOLEAN
			-- Block calling thread on current condition variable for at most `a_timeout' milliseconds.
			-- Return `True' is we got the condition variable on time, otherwise return `False'
		require
			is_set: is_set
			a_mutex_not_void: a_mutex /= Void
			timeout_positive: a_timeout_ms >= 0
		do
			Result := eif_thr_cond_wait_with_timeout (cond_pointer, a_mutex.mutex_pointer, a_timeout_ms) = 1
		end

	destroy
			-- Destroy condition variable.
		require
			is_set: is_set
		do
			eif_thr_cond_destroy (cond_pointer)
			cond_pointer := default_pointer
		ensure
			not_set: not is_set
		end

feature {NONE} -- Implementation

	cond_pointer: POINTER
			-- C reference to the condition variable.

feature {NONE} -- Removal

	dispose
			-- Called by the garbage collector when the condition
			-- variable is collected.
		do
			if is_set then
				destroy
			end
		end

feature {NONE} -- Externals

	eif_thr_cond_create: POINTER
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_cond_broadcast (a_cond_ptr: POINTER)
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_cond_signal (a_cond_ptr: POINTER)
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_cond_wait (a_cond_ptr: POINTER; a_mutex_ptr: POINTER)
		external
			"C blocking  use %"eif_threads.h%""
		end

	eif_thr_cond_wait_with_timeout (a_cond_ptr: POINTER; a_mutex_ptr: POINTER; a_timeout: INTEGER): INTEGER
		external
			"[
				C blocking
				signature (EIF_POINTER, EIF_POINTER, EIF_INTEGER): EIF_INTEGER
				use "eif_threads.h"
			]"
		end

	eif_thr_cond_destroy (a_mutex_ptr: POINTER)
		external
			"C use %"eif_threads.h%""
		end

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end

