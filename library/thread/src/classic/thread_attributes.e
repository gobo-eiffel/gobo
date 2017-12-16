note
	description: "Class defining thread attributes."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	THREAD_ATTRIBUTES

inherit
	ANY

	MEMORY_STRUCTURE
		rename
			make as mem_make
		export
			{NONE} all
			{THREAD} item
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Set default values to the thread attributes.
		do
			mem_make
			set_priority (default_priority)
		ensure
			priority_set: priority = default_priority
			stack_size_set: stack_size = 0
		end

feature -- Attribute change

	set_priority (prio: like priority)
			-- Set thread priority to `prio'.
		require
			valid_priority:	(prio >= min_priority) and (prio <= max_priority)
		do
			c_set_priority (item, prio)
		ensure
			priority_set: priority = prio
		end

	set_stack_size (s: like stack_size)
			-- Set `stack_size' to `s'.
		do
			c_set_stack_size (item, stack_size)
		ensure
			stack_size_set: stack_size = s
		end

feature -- Access

	priority: INTEGER
			-- Current thread priority
		do
			Result := c_priority (item)
		end

	stack_size: NATURAL_64
			-- Size of the call stack reserved for launching the thread. If `0' the default size for
			-- the current platform.
		do
			Result := c_stack_size (item)
		end

	default_priority: INTEGER
			-- Get default thread priority for the current architecture.
		external
			"C use %"eif_threads.h%""
		alias
			"eif_thr_default_priority"
		end

	min_priority: INTEGER
			-- Get minimum thread priority for the current architecture.
		external
			"C use %"eif_threads.h%""
		alias
			"eif_thr_min_priority"
		end

	max_priority: INTEGER
			-- Get maximum thread priority for the current architecture.
		external
			"C use %"eif_threads.h%""
		alias
			"eif_thr_max_priority"
		end

feature {NONE} -- Implementation

	c_set_priority (p: POINTER; v: like priority)
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
			#ifdef EIF_THREADS
				((EIF_THR_ATTR_TYPE *) $p)->priority = $v;
			#endif
			]"
		end

	c_set_stack_size (p: POINTER; v: like stack_size)
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
			#ifdef EIF_THREADS
				((EIF_THR_ATTR_TYPE *) $p)->stack_size = $v;
			#endif
			]"
		end

	c_priority (p: POINTER): like priority
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
			#ifdef EIF_THREADS
				return (EIF_INTEGER) (((EIF_THR_ATTR_TYPE *) $p)->priority);
			#else
				return 0L;
			#endif
			]"
		end

	c_stack_size (p: POINTER): like stack_size
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
			#ifdef EIF_THREADS
				return ((EIF_THR_ATTR_TYPE *) $p)->stack_size;
			#else
				return 0L;
			#endif
			]"
		end

	structure_size: INTEGER
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
			#ifdef EIF_THREADS
				return sizeof(EIF_THR_ATTR_TYPE);
			#else
				return 1L;
			#endif
			]"

		end

feature -- Obsolete: Not applicable

	set_policy (policy: INTEGER)
			-- Set scheduling policy to `policy'.  Possible values are:
			-- default_policy, other, fifo and round_robin.
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		require
			valid_policy: (policy >= default_policy) and (policy <= round_robin)
		do
		end

	set_detached (bool: BOOLEAN)
			-- Set the detached state of the thread attribute to `bool'. If
			-- `bool' is True (default), the thread will be created detached
			-- on the C level. You can always `join' a thread, even if it was
			-- created detached. This only affects the C join().
		obsolete
			"Removed because now threads are always started detached. [2017-05-31]"
		do
		end

	scheduling_policy: INTEGER
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		do
		end

	detached: BOOLEAN
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		do
		end

	default_policy: INTEGER
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		do
			Result := 0
		end

	other: INTEGER
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		do
			Result := 1
		end

	fifo: INTEGER
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		do
			Result := 2
		end

	round_robin: INTEGER
		obsolete
			"Removed because calls where not portable. [2017-05-31]"
		do
			Result := 3
		end

invariant
	priority_bounded: min_priority <= priority and priority <= max_priority

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
