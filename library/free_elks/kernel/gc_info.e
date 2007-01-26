indexing

	description: "[
			Garbage collector statistics.
			This class may be used as ancestor by classes needing its facilities.
			Time accounting is relevant only if `enable_time_accounting' 
			(from MEMORY) has been called.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GC_INFO

inherit
	MEMORY_STRUCTURE
		rename
			make as structure_make
		export
			{NONE} make_by_pointer, structure_make, item, shared
		end

	MEM_CONST

create
	make

feature -- Initialization

	make (memory: INTEGER) is
			-- Fill in statistics for `memory' type
		require
			memory_valid: memory = Incremental_collector or memory = Full_collector
		do
			structure_make
			update (memory)
		ensure
			type_set: type = memory
		end

	update (memory: INTEGER) is
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

	cycle_count: INTEGER is
			-- Number of collection cycles for `type'
			-- before last call to `update'
		do
			Result := c_count (item)
		end

	memory_used: INTEGER is
			-- Total number of bytes used (counting overhead)
			-- after last cycle for `type' before last
			-- call to `update'
		do
			Result := c_mem_used (item)
		end

	collected: INTEGER is
			-- Number of bytes collected by the last cycle,
			-- for `type' before last call to `update'
		do
			Result := c_mem_collect (item)
		end

	collected_average: INTEGER is
			-- Average number of bytes collected by a cycle,
			-- for `type' before last call to `update'
		do
			Result := c_mem_avg (item)
		end

	real_time: INTEGER is
			-- Real time in centi-seconds used by last cycle
			-- for `type', before last call to `update';
			-- this may not be accurate on systems which do not
			-- provide a sub-second accuracy clock (typically
			-- provided on BSD).
		do
			Result := c_real_time (item)
		end

	real_time_average: INTEGER is
			-- Average amount of real time, in centi-seconds,
			-- spent in collection cycle,
			-- for `type' before last call to `update'
		do
			Result := c_real_avg (item)
		end

	real_interval_time: INTEGER is
			-- Real interval time (as opposed to CPU time) between
			-- two automatically raised cycles, in centi-seconds,
			-- for `type' before last call to `update'
		do
			Result := c_real_itime (item)
		end

	real_interval_time_average: INTEGER is
			-- Average real interval time between two automatic
			-- cycles, in centi-seconds,
			-- for `type' before last call to `update'
		do
			Result := c_real_iavg (item)
		end

	cpu_time: DOUBLE is
			-- Amount of CPU time, in seconds, spent in cycle,
			-- for `type' before last call to `update'
		do
			Result := c_cpu_time (item)
		end

	cpu_time_average: DOUBLE is
			-- Average amount of CPU time spent in cycle,
			-- in seconds, for `type' before last call to `update'
		do
			Result := c_cpu_avg (item)
		end

	cpu_interval_time: DOUBLE is
			-- Amount of CPU time elapsed since between last
			-- and penultimate cycles for `type' before
			-- last call to `update'
		do
			Result := c_cpu_itime (item)
		end

	cpu_interval_time_average: DOUBLE is
			-- Average amount of CPU time between two cycles,
			-- for `type' before last call to `update'
		do
			Result := c_cpu_iavg (item)
		end

	sys_time: DOUBLE is
			-- Amount of kernel time, in seconds, spent in cycle,
			-- for `type' before last call to `update'
		do
			Result := c_sys_time (item)
		end

	sys_time_average: DOUBLE is
			-- Average amount of kernel time spent in cycle,
			-- for `type' before last call to `update'
		do
			Result := c_sys_avg (item)
		end

	sys_interval_time: DOUBLE is
			-- Amount of kernel time elapsed since between
			-- the last and the penultimate cycle,
			-- for `type' before last call to `update'
		do
			Result := c_sys_itime (item)
		end

	sys_interval_time_average: DOUBLE is
			-- Average amount of kernel time between two cycles,
			-- for `type' before last call to `update'
		do
			Result := c_sys_iavg (item)
		end

feature {NONE} -- Implementation

	gc_stat (a_ptr: POINTER; mem: INTEGER) is
			-- Initialize `a_ptr used by GC_INFO to retrieve the
			-- statistics frozen at the time of this call.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_stat"
		end

	structure_size: INTEGER is
			-- Size of underlying C structure.
		do
			Result := c_sizeof_gacstat
		end

feature {NONE} -- C externals

	c_sizeof_gacstat: INTEGER is
			-- Size of struct `gacstat'.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return sizeof(struct gacstat);"
		end

	c_count (a_ptr: POINTER): INTEGER is
			-- Access `count' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->count;"
		end

	c_mem_used (a_ptr: POINTER): INTEGER is
			-- Access `mem_used' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->mem_used;"
		end

	c_mem_collect (a_ptr: POINTER): INTEGER is
			-- Access `mem_collect' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->mem_collect;"
		end

	c_mem_avg (a_ptr: POINTER): INTEGER is
			-- Access `mem_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->mem_avg;"
		end

	c_real_time (a_ptr: POINTER): INTEGER is
			-- Access `real_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->real_time;"
		end

	c_real_avg (a_ptr: POINTER): INTEGER is
			-- Access `real_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->real_avg;"
		end

	c_real_itime (a_ptr: POINTER): INTEGER is
			-- Access `real_itime' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->real_itime;"
		end

	c_real_iavg (a_ptr: POINTER): INTEGER is
			-- Access `real_iavg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->real_iavg;"
		end

	c_cpu_time (a_ptr: POINTER): DOUBLE is
			-- Access `cpu_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_time;"
		end

	c_cpu_avg (a_ptr: POINTER): DOUBLE is
			-- Access `cpu_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_avg;"
		end

	c_cpu_itime (a_ptr: POINTER): DOUBLE is
			-- Access `cpu_itime' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_itime;"
		end

	c_cpu_iavg (a_ptr: POINTER): DOUBLE is
			-- Access `cpu_iavg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->cpu_iavg;"
		end

	c_sys_time (a_ptr: POINTER): DOUBLE is
			-- Access `sys_time' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_time;"
		end

	c_sys_avg (a_ptr: POINTER): DOUBLE is
			-- Access `sys_avg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_avg;"
		end

	c_sys_itime (a_ptr: POINTER): DOUBLE is
			-- Access `sys_itime' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_itime;"
		end

	c_sys_iavg (a_ptr: POINTER): DOUBLE is
			-- Access `sys_iavg' data member of `a_ptr' struct.
		external
			"C inline use %"eif_memory.h%""
		alias
			"return ((struct gacstat *) $a_ptr)->sys_iavg;"
		end

end
