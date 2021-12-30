note
	description: "[
			Garbage collector statistics.
			This class may be used as ancestor by classes needing its facilities.
			Time accounting is relevant only if `enable_time_accounting' 
			(from MEMORY) has been called.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class GC_INFO

inherit {NONE}

	MEMORY_STRUCTURE
		rename
			make as structure_make
		export
			{NONE} all
		end

	MEM_CONST

create
	make

feature -- Initialization

	make (memory: INTEGER)
			-- Fill in statistics for `memory' type
		require
			memory_valid: memory = Incremental_collector or memory = Full_collector
		do
			structure_make
			update (memory)
		ensure
			type_set: type = memory
		end

	update (memory: INTEGER)
			-- Fill in statistics for `memory' type
		require
			memory_valid: memory = Incremental_collector or memory = Full_collector
		do
			gc_stat (item, memory)
			type := memory
		ensure
			type_set: type = memory
		end

feature -- Access

	type: INTEGER
			-- Collector type (Full, Collect),
			-- for `type' before last call to `update'

	cycle_count: INTEGER
			-- Number of collection cycles for `type'
			-- before last call to `update'
		do
			Result := c_count (item)
		end

	memory_used: INTEGER
			-- Total number of bytes used (counting overhead)
			-- after last cycle for `type' before last
			-- call to `update'
		do
			Result := c_mem_used (item)
		end

	collected: INTEGER
			-- Number of bytes collected by the last cycle,
			-- for `type' before last call to `update'
		do
			Result := c_mem_collect (item)
		end

	collected_average: INTEGER
			-- Average number of bytes collected by a cycle,
			-- for `type' before last call to `update'
		do
			Result := c_mem_avg (item)
		end

	real_time: INTEGER
			-- Real time in centi-seconds used by last cycle
			-- for `type', before last call to `update';
			-- this may not be accurate on systems which do not
			-- provide a sub-second accuracy clock (typically
			-- provided on BSD).
		do
			Result := c_real_time (item)
		end

	real_time_average: INTEGER
			-- Average amount of real time, in centi-seconds,
			-- spent in collection cycle,
			-- for `type' before last call to `update'
		do
			Result := c_real_avg (item)
		end

	real_interval_time: INTEGER
			-- Real interval time (as opposed to CPU time) between
			-- two automatically raised cycles, in centi-seconds,
			-- for `type' before last call to `update'
		do
			Result := c_real_itime (item)
		end

	real_interval_time_average: INTEGER
			-- Average real interval time between two automatic
			-- cycles, in centi-seconds,
			-- for `type' before last call to `update'
		do
			Result := c_real_iavg (item)
		end

	cpu_total_time: REAL_64
			-- Amount of application CPU time, in seconds, for `type' before last call to `update'
		do
			Result := c_cpu_total_time (item)
		end

	cpu_time: REAL_64
			-- Amount of CPU time, in seconds, spent in cycle,
			-- for `type' before last call to `update'
		do
			Result := c_cpu_time (item)
		end

	cpu_time_average: REAL_64
			-- Average amount of CPU time spent in cycle,
			-- in seconds, for `type' before last call to `update'
		do
			Result := c_cpu_avg (item)
		end

	cpu_interval_time: REAL_64
			-- Amount of CPU time elapsed since between last
			-- and penultimate cycles for `type' before
			-- last call to `update'
		do
			Result := c_cpu_itime (item)
		end

	cpu_interval_time_average: REAL_64
			-- Average amount of CPU time between two cycles,
			-- for `type' before last call to `update'
		do
			Result := c_cpu_iavg (item)
		end

	sys_total_time: REAL_64
			-- Amount of application kernel time, in seconds, for `type' before last call to `update'
		do
			Result := c_sys_total_time (item)
		end

	sys_time: REAL_64
			-- Amount of kernel time, in seconds, spent in cycle,
			-- for `type' before last call to `update'
		do
			Result := c_sys_time (item)
		end

	sys_time_average: REAL_64
			-- Average amount of kernel time spent in cycle,
			-- for `type' before last call to `update'
		do
			Result := c_sys_avg (item)
		end

	sys_interval_time: REAL_64
			-- Amount of kernel time elapsed since between
			-- the last and the penultimate cycle,
			-- for `type' before last call to `update'
		do
			Result := c_sys_itime (item)
		end

	sys_interval_time_average: REAL_64
			-- Average amount of kernel time between two cycles,
			-- for `type' before last call to `update'
		do
			Result := c_sys_iavg (item)
		end

feature {NONE} -- Implementation

	gc_stat (a_ptr: POINTER; mem: INTEGER)
			-- Initialize `a_ptr used by GC_INFO to retrieve the
			-- statistics frozen at the time of this call.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_stat"
		end

	structure_size: INTEGER
			-- Size of underlying C structure.
		do
			Result := c_sizeof_gacstat
		end

feature {NONE} -- C externals

	c_sizeof_gacstat: INTEGER
			-- Size of struct `gacstat'.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return sizeof(struct gacstat);"
		ensure
			is_class: class
		end

	c_count (a_ptr: POINTER): INTEGER
			-- Access `count' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->count;"
		end

	c_mem_used (a_ptr: POINTER): INTEGER
			-- Access `mem_used' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->mem_used;"
		end

	c_mem_collect (a_ptr: POINTER): INTEGER
			-- Access `mem_collect' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->mem_collect;"
		end

	c_mem_avg (a_ptr: POINTER): INTEGER
			-- Access `mem_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->mem_avg;"
		end

	c_real_time (a_ptr: POINTER): INTEGER
			-- Access `real_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->real_time;"
		end

	c_real_avg (a_ptr: POINTER): INTEGER
			-- Access `real_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->real_avg;"
		end

	c_real_itime (a_ptr: POINTER): INTEGER
			-- Access `real_itime' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->real_itime;"
		end

	c_real_iavg (a_ptr: POINTER): INTEGER
			-- Access `real_iavg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return (EIF_INTEGER) ((struct gacstat *) $a_ptr)->real_iavg;"
		end

	c_cpu_total_time (a_ptr: POINTER): REAL_64
			-- Access `cpu_total_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_total_time;"
		end

	c_cpu_time (a_ptr: POINTER): REAL_64
			-- Access `cpu_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_time;"
		end

	c_cpu_avg (a_ptr: POINTER): REAL_64
			-- Access `cpu_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_avg;"
		end

	c_cpu_itime (a_ptr: POINTER): REAL_64
			-- Access `cpu_itime' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_itime;"
		end

	c_cpu_iavg (a_ptr: POINTER): REAL_64
			-- Access `cpu_iavg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_iavg;"
		end

	c_sys_total_time (a_ptr: POINTER): REAL_64
			-- Access `sys_total_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_total_time;"
		end

	c_sys_time (a_ptr: POINTER): REAL_64
			-- Access `sys_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_time;"
		end

	c_sys_avg (a_ptr: POINTER): REAL_64
			-- Access `sys_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_avg;"
		end

	c_sys_itime (a_ptr: POINTER): REAL_64
			-- Access `sys_itime' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_itime;"
		end

	c_sys_iavg (a_ptr: POINTER): REAL_64
			-- Access `sys_iavg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_iavg;"
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
