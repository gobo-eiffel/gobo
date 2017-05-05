note
	description: "Read/Write synchronization object, allows multiple reader threads to have %
		%access to a resource, and only one writer thread."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	READ_WRITE_LOCK

inherit
	DISPOSABLE

create
	make

feature {NONE} -- Initialization

	make
			-- Create read/write lock.
		do
			item := eif_thr_rwl_create
		ensure
			item_set: is_set
		end

feature -- Access

	is_set: BOOLEAN
			-- Is read/write lock initialized?
		do
			Result := item /= default_pointer
		end

feature -- Status setting

	acquire_read_lock
			-- Lock current on a read.
		require
			is_set: is_set
		do
			eif_thr_rwl_rdlock (item)
		end

	acquire_write_lock
			-- Lock current on a write.
		require
			is_set: is_set
		do
			eif_thr_rwl_wrlock (item)
		end

	release_read_lock
			-- Unlock Reader lock.
		require
			is_set: is_set
		do
			eif_thr_rwl_unlock (item)
		end

	release_write_lock
			-- Unlock Writer lock.
		require
			is_set: is_set
		do
			eif_thr_rwl_unlock (item)
		end

	destroy
			-- Destroy read/write lock.
		require
			is_set: is_set
		do
			eif_thr_rwl_destroy (item)
			item := default_pointer
		ensure
			not_set: not is_set
		end

feature -- Obsolete

	release_reader_lock, release_writer_lock
			-- Unlock Reader or Writer lock.
		obsolete
			"Use `release_read_lock' or `release_write_lock'. [2017-05-31]"
		require
			is_set: is_set
		do
			eif_thr_rwl_unlock (item)
		end

feature {NONE} -- Implementation

	item: POINTER
			-- C reference to the read/write lock.

feature {NONE} -- Removal

	dispose
			-- Called by the garbage collector when the read/write lock is
			-- collected.
		do
			if is_set then
				destroy
			end
		end

feature {NONE} -- Externals

	eif_thr_rwl_create: POINTER
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_rwl_rdlock (an_item: POINTER)
		external
			"C blocking use %"eif_threads.h%""
		end

	eif_thr_rwl_unlock (an_item: POINTER)
		external
			"C use %"eif_threads.h%""
		end

	eif_thr_rwl_wrlock (an_item: POINTER)
		external
			"C blocking use %"eif_threads.h%""
		end

	eif_thr_rwl_destroy (an_item: POINTER)
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
