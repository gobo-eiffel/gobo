indexing
	description: "[
		Facilities for tuning up the garbage collection mechanism.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	MEMORY

inherit
	DISPOSABLE

	MEM_CONST
	
feature -- Measurement

	memory_statistics (memory_type: INTEGER): MEM_INFO is
			-- Memory usage information for `memory_type'
		require
			type_ok:
				memory_type = Total_memory or
				memory_type = Eiffel_memory or
				memory_type = C_memory
		do
			create Result.make (memory_type)
		end

	gc_statistics (collector_type: INTEGER): GC_INFO is
			-- Garbage collection information for `collector_type'.
		require
			type_ok:
				collector_type = Full_collector or
				collector_type = Incremental_collector
		do
			create Result.make (collector_type)
		end

feature -- Status report

	memory_threshold: INTEGER is
			-- Minimum amount of bytes to be allocated before
			-- starting an automatic garbage collection.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_tget"
		end

	collection_period: INTEGER is
			-- Period of full collection.
			-- If the environment variable EIF_FULL_COLLECTION_PERIOD   
			-- is defined, it is set to the closest reasonable 
			-- value from it.
			-- If null, no full collection is launched.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_pget"
		end

	coalesce_period: INTEGER is
			-- Period of full coalesce (in number of collections)
			-- If the environment variable EIF_FULL_COALESCE_PERIOD   
			-- is defined, it is set to the closest reasonable 
			-- value from it.
			-- If null, no full coalescing is launched.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_coalesce_period"
		end
			
	collecting: BOOLEAN is
			-- Is garbage collection enabled?
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_ison"
		end

	largest_coalesced_block: INTEGER is
			-- Size of largest coalesced block since last call to
			-- `largest_coalesced'; 0 if none.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_largest"
		end

	max_mem: INTEGER is
			-- Maximum amount of bytes the run-time can allocate.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_get_max_mem"
		end

	chunk_size: INTEGER is
			-- Minimal size of a memory chunk. The run-time always
			-- allocates a multiple of this size.
			-- If the environment variable EIF_MEMORY_CHUNK   
			-- is defined, it is set to the closest reasonable 
			-- value from it.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_get_chunk_size"
		end

	tenure: INTEGER is
			-- Maximum age of object before being considered
			-- as old (old objects are not scanned during 
			-- partial collection).
			-- If the environment variable EIF_TENURE_MAX   
			-- is defined, it is set to the closest reasonable 
			-- value from it.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_tenure"
		end
			
	generation_object_limit: INTEGER is
			-- Maximum size of object in generational scavenge zone.
			-- If the environment variable EIF_GS_LIMIT   
			-- is defined, it is set to the closest reasonable 
			-- value from it.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_generation_object_limit"
		end
	
	scavenge_zone_size: INTEGER is
			-- Size of generational scavenge zone.
			-- If the environment variable EIF_MEMORY_SCAVENGE   
			-- is defined, it is set to the closest reasonable 
			-- value from it.

		external
			"C use %"eif_memory.h%""
		alias
			"eif_scavenge_zone_size"
		end

feature -- Status report

	referers (an_object: ANY): SPECIAL [ANY] is
			-- Objects that refer to `an_object'.
		do
			Result := find_referers ($an_object, special_any_dynamic_type)
		end
		
	objects_instance_of (an_object: ANY): SPECIAL [ANY] is
			-- Objects that have same dynamic type as `an_object'.
		do
			Result := find_instance_of (internal_.dynamic_type (an_object),
				special_any_dynamic_type)
		end

	memory_map: HASH_TABLE [ARRAYED_LIST [ANY], INTEGER] is
			-- Retrieves all object in system as a table indexed by dynamic type
			-- where elements are all instances of a given data type.
		local
			i, nb, dtype: INTEGER
			l_spec: SPECIAL [ANY]
			l_item: ANY
			l_list: ARRAYED_LIST [ANY]
			l_memory_count_map: HASH_TABLE [INTEGER, INTEGER]
		do
				-- First get all object instances in runtime.
			l_spec := find_all_instances (special_any_dynamic_type)
			
				-- Now create a memory count map of all objects. There are two reasons
				-- why we do not simply query `memory_count_map':
				-- 1. This would cause two calls to `find_all_instances'.
				-- 2. The new objects created by the first call would be included in the
				-- second list so they would not match exactly.
				
				-- The reason why we prepass and create a memory count map is
				-- to enable us to create the arrayed lists in `Result' with
				-- the exact size required for their contents. Even though we now have to
				-- perform the prepass, `memory_map' is approx 15-20% faster as
				-- resizing the arrayed lists each time an item was addded is slow.
				
			create l_memory_count_map.make (100)
			from
				i := 0
				nb := l_spec.count
			until
				i >= nb
			loop
				l_item := l_spec.item (i)
				if l_item /= Void then
					dtype := internal_.dynamic_type (l_item)
					l_memory_count_map.force (l_memory_count_map.item (dtype) + 1, dtype)
				end
				i := i + 1
			end

				-- Now create table indexed by dynamic type. For a given
				-- dynamic type, we will have a list of all objects of
				-- this type.
			create Result.make (100)		
			from
				i := 0
				nb := l_spec.count
			until
				i >= nb
			loop
				l_item := l_spec.item (i)
				if l_item /= Void then
					dtype := internal_.dynamic_type (l_item)
					Result.search (dtype)
					if Result.found then
						l_list := Result.found_item
					else
						create l_list.make_filled (l_memory_count_map.item (dtype))
						l_list.start
						Result.put (l_list, dtype)
					end
					l_list.put_i_th (l_item, l_list.index)
					l_list.forth
				end
				i := i + 1
			end
		end

	memory_count_map: HASH_TABLE [INTEGER, INTEGER] is
			-- Number of instances per dynamic type present in system.
			-- Same as `memory_map' except that no references on the objects themselves
			-- is kept.
		local
			i, nb, dtype: INTEGER
			l_spec: SPECIAL [ANY]
			l_item: ANY
		do
				-- First get all object instances in runtime.
			l_spec := find_all_instances (special_any_dynamic_type)
			
				-- Now create table indexed by dynamic type. For a given
				-- dynamic type, we will count all objects of this type.
			create Result.make (100)
			from
				i := 0
				nb := l_spec.count
			until
				i >= nb
			loop
				l_item := l_spec.item (i)
				if l_item /= Void then
					dtype := internal_.dynamic_type (l_item)
					Result.search (dtype)
					if Result.found then
						Result.force (Result.found_item + 1, dtype)
					else
						Result.put (1, dtype)
					end
				end
				i := i + 1
			end
		end
	
feature -- Status setting

	collection_off is
			-- Disable garbage collection.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_stop"
		end

	collection_on is
			-- Enable garbage collection.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_run"
		end

	allocate_fast is
			-- Enter ``speed'' mode: will optimize speed of memory
			-- allocation rather than memory usage.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_speed"
		end

	allocate_compact is
			-- Enter ``memory'' mode: will try to compact memory
			-- before requesting more from the operating system.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_slow"
		end

	allocate_tiny is
			-- Enter ``tiny'' mode: will enter ``memory'' mode
			-- after having freed as much memory as possible.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_tiny"
		end

	enable_time_accounting is
			-- Enable GC time accouting, accessible in `gc_statistics'.
		do
			gc_monitoring (True)
		end

	disable_time_accounting is
			-- Disable GC time accounting (default).
		do
			gc_monitoring (False)
		end

	set_memory_threshold (value: INTEGER) is
			-- Set a new `memory_threshold' in bytes. Whenever the memory 
			-- allocated for Eiffel reaches this value, an automatic
			-- collection is performed.
		require
			positive_value: value > 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_tset"
		end

	set_collection_period (value: INTEGER) is
			-- Set `collection_period'. Every `value' collection,
			-- the Garbage collector will perform a collection
			-- on the whole memory (full collection), otherwise 
			-- a simple partial collection is done.
		require
			positive_value: value >= 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_pset"
		end

	set_coalesce_period (value: INTEGER) is
			-- Set `coalesce_period'. Every `value' collection,
			-- the Garbage Collector will coalesce
			-- the whole memory. 
		require
			positive_value: value >= 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_set_coalesce_period"
		end

	set_max_mem (value: INTEGER) is
			-- Set the maximum amount of memory the run-time can allocate.
		require
			positive_value: value > 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_set_max_mem"
		end

feature -- Removal

	dispose is
			-- Action to be executed just before garbage collection
			-- reclaims an object.
			-- Default version does nothing; redefine in descendants
			-- to perform specific dispose actions. Those actions
			-- should only take care of freeing external resources;
			-- they should not perform remote calls on other objects
			-- since these may also be dead and reclaimed.
		do
		end

	free (object: ANY) is
			-- Free `object', by-passing garbage collection.
			-- Erratic behavior will result if the object is still
			-- referenced.
		do
			mem_free ($object)
		end

	mem_free (addr: POINTER) is
			-- Free memory of object at `addr'.
			-- (Preferred interface is `free'.)
		external
			"C signature (EIF_REFERENCE) use %"eif_memory.h%""
		alias
			"eif_mem_free"
		end

	full_coalesce is
			-- Coalesce the whole memory: merge adjacent free
			-- blocks to reduce fragmentation. Useful, when
			-- a lot of memory is allocated with garbage collector off.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_coalesc"
		end

	collect is
			-- Force a partial collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		external
			"C use %"eif_memory.h%""
		end

	full_collect is
			-- Force a full collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		external
			"C use %"eif_memory.h%""
		alias
			"plsc"
		end

feature {NONE} -- Implementation

	gc_monitoring (flag: BOOLEAN) is
			-- Set up GC monitoring according to `flag'
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_mon"
		end
	
	find_referers (target: POINTER; result_type: INTEGER): SPECIAL [ANY] is
		external
			"C signature (EIF_REFERENCE, EIF_INTEGER): EIF_REFERENCE use %"eif_traverse.h%""
		end

	find_instance_of (dtype, result_type: INTEGER): SPECIAL [ANY] is
		external
			"C signature (EIF_INTEGER, EIF_INTEGER): EIF_REFERENCE use %"eif_traverse.h%""
		end

	find_all_instances (result_type: INTEGER): SPECIAL [ANY] is
		external
			"C signature (EIF_INTEGER): EIF_REFERENCE use %"eif_traverse.h%""
		end

	special_any_dynamic_type: INTEGER is
			-- Dynamic type ID of an instance of `SPECIAL [ANY]'
		local
			a: ARRAY [ANY]
			spec: SPECIAL [ANY]
		once
			create a.make (0, 0)
			spec := a.area
			Result := internal_.dynamic_type (spec)
		end

	internal_: INTERNAL is
			-- Internal features
		once
			create Result
		ensure
			internal_not_void: Result /= Void
		end

end
