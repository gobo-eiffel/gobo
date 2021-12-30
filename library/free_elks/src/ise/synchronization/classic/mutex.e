note
	description:
		"Mutex synchronization object, allows threads to access global %
		%data through critical sections. Mutexes are recursive."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MUTEX

inherit
	DISPOSABLE

inherit {NONE}

	THREAD_ENVIRONMENT
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Create mutex.
		do
			mutex_pointer := eif_thr_mutex_create
		ensure
			is_set: is_set
		end

feature {NONE} -- Access

	owner_thread_id: like current_thread_id
			-- Debugging facility to know the THREAD owning Current.
			-- The field might be invalid when Current is used with a condition variable.

feature -- Status report

	is_set: BOOLEAN
			-- Is mutex initialized?
		do
			Result := mutex_pointer /= default_pointer or else not {PLATFORM}.is_thread_capable
		end

feature -- Status setting

	lock
			-- Lock mutex, waiting if necessary until that becomes possible.
		require
			is_set: is_set
		do
			eif_thr_mutex_lock (mutex_pointer)
			owner_thread_id := current_thread_id
		end

	try_lock: BOOLEAN
			-- Has client been successful in locking mutex without waiting?
		require
			is_set: is_set
		do
			Result := eif_thr_mutex_trylock (mutex_pointer)
			if Result then
				owner_thread_id := current_thread_id
			end
		end

	unlock
			-- Unlock mutex.
		require
			is_set: is_set
		do
			owner_thread_id := default_pointer
			eif_thr_mutex_unlock (mutex_pointer)
		end

	destroy
			-- Destroy mutex.
		require
			is_set: is_set
		do
			eif_thr_mutex_destroy (mutex_pointer)
			mutex_pointer := default_pointer
		ensure
			not_set: not is_set
		end

feature -- Obsolete

	trylock, has_locked: BOOLEAN
			-- Has client been successful in locking mutex without waiting?
		obsolete
			"Use try_lock instead. [2017-05-31]"
		require
			is_set: is_set
		do
			Result := try_lock
		end

feature {NONE} -- Removal

	dispose
			-- Called by the garbage collector when the mutex is
			-- collected.
		do
				-- We can only destroy a mutex that was not locked
				-- yet, or if locked that we own the lock.
			if
				is_set and then
				(owner_thread_id = default_pointer or else owner_thread_id = current_thread_id)
			then
				destroy
			end
		end

feature {CONDITION_VARIABLE} -- Implementation

	mutex_pointer: POINTER
			-- C reference to the mutex.

feature {NONE} -- Externals

	eif_thr_mutex_create: POINTER
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_mutex_lock (a_mutex_pointer: POINTER)
		external
			"C blocking use %"eif_threads.h%""
		end

	eif_thr_mutex_unlock (a_mutex_pointer: POINTER)
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_mutex_trylock (a_mutex_pointer: POINTER): BOOLEAN
		external
			"C blocking use %"eif_threads.h%""
		end

	eif_thr_mutex_destroy (a_mutex_pointer: POINTER)
		external
			"C use %"eif_threads.h%""
		end

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
