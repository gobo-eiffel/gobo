note
	description: "[
		Facilities for tuning up the garbage collection mechanism.
		This class may be used as ancestor by classes needing its facilities.
	]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MEMORY

inherit
	DISPOSABLE

	MEM_CONST

feature -- Measurement

	memory_statistics (memory_type: INTEGER): MEM_INFO
			-- Memory usage information for `memory_type'
		require
			type_ok:
				memory_type = Total_memory or
				memory_type = Eiffel_memory or
				memory_type = C_memory
		do
			create Result.make (memory_type)
		ensure
			instance_free: class
		end

	gc_statistics (collector_type: INTEGER): GC_INFO
			-- Garbage collection information for `collector_type'.
		require
			type_ok:
				collector_type = Full_collector or
				collector_type = Incremental_collector
		do
			create Result.make (collector_type)
		ensure
			instance_free: class
		end

feature -- Status report

	memory_threshold: INTEGER
			-- Minimum amount of bytes to be allocated before
			-- starting an automatic garbage collection.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_tget"
		ensure
			instance_free: class
		end

	collection_period: INTEGER
			-- Period of full collection.
			-- If the environment variable EIF_FULL_COLLECTION_PERIOD
			-- is defined, it is set to the closest reasonable
			-- value from it.
			-- If null, no full collection is launched.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_pget"
		ensure
			instance_free: class
		end

	coalesce_period: INTEGER
			-- Period of full coalesce (in number of collections)
			-- If the environment variable EIF_FULL_COALESCE_PERIOD
			-- is defined, it is set to the closest reasonable
			-- value from it.
			-- If null, no full coalescing is launched.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_coalesce_period"
		ensure
			instance_free: class
		end

	collecting: BOOLEAN
			-- Is garbage collection enabled?
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_ison"
		ensure
			instance_free: class
		end

	largest_coalesced_block: INTEGER
			-- Size of largest coalesced block since last call to
			-- `largest_coalesced'; 0 if none.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_largest"
		ensure
			instance_free: class
		end

	max_mem: INTEGER
			-- Maximum amount of bytes the run-time can allocate.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_get_max_mem"
		ensure
			instance_free: class
		end

	chunk_size: INTEGER
			-- Minimal size of a memory chunk. The run-time always
			-- allocates a multiple of this size.
			-- If the environment variable EIF_MEMORY_CHUNK
			-- is defined, it is set to the closest reasonable
			-- value from it.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_get_chunk_size"
		ensure
			instance_free: class
		end

	tenure: INTEGER
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
		ensure
			instance_free: class
		end

	generation_object_limit: INTEGER
			-- Maximum size of object in generational scavenge zone.
			-- If the environment variable EIF_GS_LIMIT
			-- is defined, it is set to the closest reasonable
			-- value from it.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_generation_object_limit"
		ensure
			instance_free: class
		end

	scavenge_zone_size: INTEGER
			-- Size of generational scavenge zone.
			-- If the environment variable EIF_MEMORY_SCAVENGE
			-- is defined, it is set to the closest reasonable
			-- value from it.

		external
			"C use %"eif_memory.h%""
		alias
			"eif_scavenge_zone_size"
		ensure
			instance_free: class
		end

	referers (an_object: ANY): SPECIAL [ANY]
			-- Objects that refer to `an_object'.
		do
			Result := find_referers (an_object, special_any_dynamic_type)
		ensure
			instance_free: class
		end

	objects_instance_of (an_object: ANY): SPECIAL [ANY]
			-- Objects that have same dynamic type as `an_object'.
		do
			Result := objects_instance_of_type (an_object.generating_type.type_id)
		ensure
			instance_free: class
		end

	objects_instance_of_type (a_type_id: INTEGER): SPECIAL [ANY]
			-- Objects that have same dynamic type as `an_object'.
		do
			Result := find_instance_of (a_type_id, special_any_dynamic_type)
		ensure
			instance_free: class
		end

	memory_map: HASH_TABLE [ARRAYED_LIST [ANY], INTEGER]
			-- Retrieves all object in system as a table indexed by dynamic type
			-- where elements are all instances of a given data type.
		local
			i, nb, dtype: INTEGER
			l_spec: SPECIAL [ANY]
			l_item: ANY
			l_list: detachable ARRAYED_LIST [ANY]
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
					dtype := l_item.generating_type.type_id
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
					dtype := l_item.generating_type.type_id
					Result.search (dtype)
					if Result.found and then attached Result.found_item as l_found_item then
						l_list := l_found_item
					else
						create l_list.make (l_memory_count_map.item (dtype))
						Result.put (l_list, dtype)
					end
					l_list.extend (l_item)
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	memory_count_map: HASH_TABLE [INTEGER, INTEGER]
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
					dtype := l_item.generating_type.type_id
					Result.search (dtype)
					if Result.found then
						Result.force (Result.found_item + 1, dtype)
					else
						Result.put (1, dtype)
					end
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

feature -- Status setting

	execute_without_collection (a_action: PROCEDURE)
			-- Execute `a_action' with the garbage collector disabled.
			-- If `a_action' modifies the status of `collecting', we restore
			-- it no matter what at the end.
		require
			a_action_not_void: a_action /= Void
		local
			l_is_collecting: like collecting
			retried: BOOLEAN
		do
			if not retried then
				l_is_collecting := collecting
				if l_is_collecting then
					collection_off
					a_action.call (Void)
					collection_on
				else
					a_action.call (Void)
					collection_off
				end
			else
				if l_is_collecting then
					collection_on
				else
					collection_off
				end
			end
		ensure
			instance_free: class
			collection_status_preserved: collecting = old collecting
		rescue
			retried := True
			retry
		end

	collection_off
			-- Disable garbage collection.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_stop"
		ensure
			instance_free: class
		end

	collection_on
			-- Enable garbage collection.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_run"
		ensure
			instance_free: class
		end

	allocate_fast
			-- Enter `speed' mode: will optimize speed of memory
			-- allocation rather than memory usage.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_speed"
		ensure
			instance_free: class
		end

	allocate_compact
			-- Enter `memory' mode: will try to compact memory
			-- before requesting more from the operating system.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_slow"
		ensure
			instance_free: class
		end

	allocate_tiny
			-- Enter `tiny' mode: will enter `memory' mode
			-- after having freed as much memory as possible.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_tiny"
		ensure
			instance_free: class
		end

	enable_time_accounting
			-- Enable GC time accouting, accessible in `gc_statistics'.
		do
			gc_monitoring (True)
		ensure
			instance_free: class
		end

	disable_time_accounting
			-- Disable GC time accounting (default).
		do
			gc_monitoring (False)
		ensure
			instance_free: class
		end

	set_memory_threshold (value: INTEGER)
			-- Set a new `memory_threshold' in bytes. Whenever the memory
			-- allocated for Eiffel reaches this value, an automatic
			-- collection is performed.
		require
			positive_value: value > 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_tset"
		ensure
			instance_free: class
		end

	set_collection_period (value: INTEGER)
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
		ensure
			instance_free: class
		end

	set_coalesce_period (value: INTEGER)
			-- Set `coalesce_period'. Every `value' collection,
			-- the Garbage Collector will coalesce
			-- the whole memory.
		require
			positive_value: value >= 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_set_coalesce_period"
		ensure
			instance_free: class
		end

	set_max_mem (value: INTEGER)
			-- Set the maximum amount of memory the run-time can allocate.
		require
			positive_value: value > 0
		external
			"C use %"eif_memory.h%""
		alias
			"eif_set_max_mem"
		ensure
			instance_free: class
		end

feature -- Removal

	dispose
			-- Action to be executed just before garbage collection
			-- reclaims an object.
			-- Default version does nothing; redefine in descendants
			-- to perform specific dispose actions. Those actions
			-- should only take care of freeing external resources;
			-- they should not perform remote calls on other objects
			-- since these may also be dead and reclaimed.
		do
		end

	free (object: ANY)
			-- Free `object', by-passing garbage collection.
			-- Erratic behavior will result if the object is still
			-- referenced.
		external
			"built_in static"
		ensure
			instance_free: class
		end

	full_coalesce
			-- Coalesce the whole memory: merge adjacent free
			-- blocks to reduce fragmentation. Useful, when
			-- a lot of memory is allocated with garbage collector off.
		external
			"C use %"eif_memory.h%""
		alias
			"eif_mem_coalesc"
		ensure
			instance_free: class
		end

	collect
			-- Force a partial collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		external
			"C use %"eif_memory.h%""
		ensure
			instance_free: class
		end

	full_collect
			-- Force a full collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		external
			"C use %"eif_memory.h%""
		alias
			"plsc"
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	gc_monitoring (flag: BOOLEAN)
			-- Set up GC monitoring according to `flag'
		external
			"C use %"eif_memory.h%""
		alias
			"eif_gc_mon"
		ensure
			instance_free: class
		end

	find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]
		external
			"built_in static"
		ensure
			instance_free: class
		end

	find_instance_of (dtype, result_type: INTEGER): SPECIAL [ANY]
		external
			"C signature (EIF_INTEGER, EIF_INTEGER): EIF_REFERENCE use %"eif_traverse.h%""
		ensure
			instance_free: class
		end

	find_all_instances (result_type: INTEGER): SPECIAL [ANY]
		external
			"C signature (EIF_INTEGER): EIF_REFERENCE use %"eif_traverse.h%""
		ensure
			instance_free: class
		end

	special_any_dynamic_type: INTEGER
			-- Dynamic type ID of an instance of `SPECIAL [ANY]'
		once
			Result := ({SPECIAL [ANY]}).type_id
		ensure
			instance_free: class
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
