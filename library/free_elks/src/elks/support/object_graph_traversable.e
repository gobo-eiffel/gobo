note
	description: "[
		Utility class to traverse object graphs starting at a root object.


		When traversing a graph the class distinguishes four different types of references:
		
			(1) Normal references
			(2) References with copy-semantics, which are usually seen when attaching 
				an expanded object to an ANY reference
			(3) User-defined expanded objects, embedded inside another object. 
				Semantically this is a special case of a copy-semantics reference.
			(4) Language-defined expanded objects (INTEGER, POINTER etc) embedded inside another object. 
				Semantically, this is a special case of a copy-semantics reference.
				
		This class will follow all reference types except (4). 
		
		During traversal the agent `on_processing_object_action' will be called for each object
		and the agent `on_processing_reference_action' for each reference, if present. This includes
		references to objects that have already been processed.
		
		The algorighm has two output values: `visited_objects' and `visited_types':
		Any standard object without copy-semantics (i.e. reference type (1)) will be stored
		by aliasing inside `visited_object'. For references of type (2) and (3) a copy will be stored.
		The `visited_types' hash table contains the dynamic type id of all types encountered during 
		traversal. The key and value in the hashtable are the same.
		
		Setting `is_skip_copy_semantics_reference' to true means that references of (2) and (3) will
		not be stored in `visited_types'. Note that this is the only effect of this setting - i.e.
		the traversal algorithm will still follow the references, the agents will be called, and the
		`visited_types' array will be extended anyway.

		NOTE:
		
		Due to a limitation in the reflection library, references of type (2) and (3) within TUPLE 
		and references of type (3) within SPECIAL cannot be handled without causing a copy. This is 
		problematic for agents, especially when they want to change the object. Therefore
		the algorithm will raise an exception when an agent is attached.
		In read-only situations it may be acceptable to use a copy of an object. Therefore to disable the
		exception behaviour you can set `is_exception_on_copy_suppressed' to True.
		
		NOTE:
		
		To maintain backwards compatibility the traversal algorithm will silently ignore any kind of 
		exception and just return normally, with `traversed_objects' set to whatever value it had before 
		invoking `traverse'. In order to get exceptions you need to set `is_exception_propagated' to True.
		]"

	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: "Stephanie Balzer"
	date: "$Date: 2015-12-17 05:34:17 -0800 (Thu, 17 Dec 2015) $"
	revision: "$Revision: 98279 $"

deferred class
	OBJECT_GRAPH_TRAVERSABLE

feature -- Access

	root_object: detachable ANY
			-- Starting point of graph traversing

	on_processing_object_action: detachable PROCEDURE [REFLECTED_OBJECT]
			-- Action called on every object in the object graph.
			-- Note: The argument is reused later for a different object. Do not alias it.

	on_processing_reference_action: detachable PROCEDURE [TUPLE [referer: REFLECTED_OBJECT; referee: REFLECTED_OBJECT]]
			-- Action called on every reference in the object graph.
			-- Note: The arguments are reused later for different objects. Do not alias them.

	object_action: detachable PROCEDURE [separate ANY]
			-- Action called on every object in object graph

	visited_objects: detachable ARRAYED_LIST [separate ANY]
			-- List referencing objects of object graph that have been visited in `traverse'.

	visited_types: detachable HASH_TABLE [INTEGER, INTEGER]
			-- List of all types encountered during traversal

feature -- Status report

	has_failed: BOOLEAN
			-- Was the last traversal successful?

	is_root_object_set: BOOLEAN
			-- Is starting point of graph traversing set?
		do
			Result := root_object /= Void
		end

	is_object_action_set: BOOLEAN
			-- Is procedure to call on every object set?
		do
			Result := object_action /= Void
		end

	has_reference_with_copy_semantics: BOOLEAN
			-- Does the traversed graph of objects contain reference with copy semantics?

	is_skip_transient: BOOLEAN
			-- Do we skip transient attribute during traversal?
			--| Default: False, i.e. transient attributes will be processed.

	is_skip_copy_semantics_reference: BOOLEAN
			-- Do we skip copy semantics reference from `visited_objects' during traversal?
			--| Default: False, i.e. copy semantics reference will be traversed and kept in `visited_objects'.

	is_exception_on_copy_suppressed: BOOLEAN
			-- Do we suppress an exception when `object_action' is called on a copied object?
			-- A copy happens when encountering tuples containing copy-semantics references
			-- or with SPECIAL[XX], where XX is a user-defined expanded type.

	is_exception_propagated: BOOLEAN
			-- Does the algorithm propagate any exceptions to the user?
			--| Default: False, i.e. exceptions will be silently ignored.

feature -- Element change

	set_root_object (an_object: like root_object)
			-- Set `root_object' with 'an_object'.
		require
			an_object_not_void: an_object /= Void
		do
			root_object := an_object
		ensure
			root_object_set: root_object = an_object and is_root_object_set
		end

	set_on_processing_object_action (an_action: like on_processing_object_action)
			-- Set `on_processing_object_action' with `an_action'
		require
			an_action_not_void: an_action /= Void
		do
			on_processing_object_action := an_action
		ensure
			on_processing_object_action_set: on_processing_object_action = an_action
		end

	set_on_processing_reference_action (an_action: like on_processing_reference_action)
			-- Set `on_processing_object_action' with `an_action'
		require
			an_action_not_void: an_action /= Void
		do
			on_processing_reference_action:= an_action
		ensure
			on_processing_reference_action_set: on_processing_reference_action = an_action
		end

	set_object_action (an_object_action: like object_action)
			-- Set `object_action' with `an_object_action'.
		obsolete
			"Use set_on_processing_object_action to read and manipulate objects via REFLECTED_OBJECT"
		require
			an_object_action_not_void: an_object_action /= Void
		do
			object_action := an_object_action
		ensure
			an_object_action_set: object_action = an_object_action and is_object_action_set
		end

	set_is_skip_transient (v: like is_skip_transient)
			-- Set `is_skip_transient' with `v'.
		do
			is_skip_transient := v
		ensure
			is_skip_transient_set: is_skip_transient = v
		end

	set_is_skip_copy_semantics_reference (v: like is_skip_copy_semantics_reference)
			-- Set `is_skip_copy_semantics_reference' with `v'.
		do
			is_skip_copy_semantics_reference := v
		ensure
			is_skip_copy_semantics_reference_set: is_skip_copy_semantics_reference = v
		end

	set_is_exception_on_copy_suppressed (v: like is_exception_on_copy_suppressed)
			-- Set `set_is_exception_on_copy_suppressed' with `v'.
		do
			is_exception_on_copy_suppressed := v
		ensure
			is_exception_on_copy_suppressed_set: is_exception_on_copy_suppressed = v
		end

	set_is_exception_propagated (v: like is_exception_propagated)
			-- Set `is_exception_propagated' with `v'.
		do
			is_exception_propagated := v
		ensure
			is_exception_propagated_set: is_exception_propagated = v
		end

feature -- Basic operations

	frozen traverse
			-- Traverse object structure starting at 'root_object' and call object_action
			-- on every object in the graph.
			--| Redefine `internal_traverse' if you need to change the implementation.
		require
			root_object_available: is_root_object_set
		local
			l_marker: detachable OBJECT_GRAPH_MARKER
			l_has_lock: BOOLEAN
			l_retried: BOOLEAN
		do
			if not l_retried and then attached root_object as l_root then
				create l_marker
				l_marker.lock_marking
				l_has_lock := True
				internal_traverse (l_root)
				l_marker.unlock_marking
				has_failed := False
			end
		rescue
			l_retried := True
			has_failed := True
			if l_has_lock and then l_marker /= Void then
				l_marker.unlock_marking
			end

			if not is_exception_propagated then
				retry
			end
		end

	wipe_out
			-- Clear current to default values
		do
			visited_objects := Void
			visited_types := Void
			object_action := Void
			root_object := Void
		ensure
			visited_objects_reset: visited_objects = Void
			object_action_not_set: not is_object_action_set
			root_object_not_set: not is_root_object_set
		end

feature {NONE} -- Implementation

	new_dispenser: DISPENSER [separate ANY]
			-- New dispenser to use for storing visited objects.
		deferred
		ensure
			new_dispenser_not_void: Result /= Void
		end

	default_size: INTEGER = 200
			-- Default size for containers used during object traversal

	internal_traverse (a_root_object: ANY)
			-- Traverse object structure starting at 'root_object' and call object_action
			-- on every object in the graph.
		local
			i, nb: INTEGER
			l_object: separate ANY
			l_field: like {TUPLE}.reference_item
			l_field_type: INTEGER
			l_marker: OBJECT_GRAPH_MARKER
			l_objects_to_visit: like new_dispenser
			l_visited: like visited_objects
			l_visited_types: like visited_types
			l_action: like object_action
			l_on_processing_object_action: like on_processing_object_action
			l_spec: like visited_objects.area
			l_reflected_reference_object: REFLECTED_REFERENCE_OBJECT
			l_reflected_object: REFLECTED_OBJECT
			l_has_reference_with_copy_semantics: BOOLEAN

			l_on_processing_reference_action: like on_processing_reference_action
			l_referee_object_cache: REFLECTED_REFERENCE_OBJECT
			l_referee_object: REFLECTED_OBJECT
		do
			from
				create l_marker
				create l_reflected_reference_object.make (a_root_object)
				l_reflected_object := l_reflected_reference_object
				l_marker.mark (a_root_object)
				create l_visited.make (default_size)
				create l_visited_types.make (default_size)
				l_objects_to_visit := new_dispenser
				l_objects_to_visit.put (a_root_object)
				l_action := object_action
				l_on_processing_object_action := on_processing_object_action
				l_on_processing_reference_action := on_processing_reference_action
				create l_referee_object_cache.make (a_root_object)
				l_referee_object := l_referee_object_cache
				l_referee_object := l_referee_object_cache
			until
				l_objects_to_visit.is_empty
			loop
				l_object := l_objects_to_visit.item
				l_objects_to_visit.remove

					-- Iterate through fields of `l_object'.
					-- There are three major types of object:
					-- 1 - Objects representing
					-- 2 - SPECIAL [ANY]
					-- 3 - TUPLE containing references
					-- 4 - Normal objects
				if attached {REFLECTED_OBJECT} l_object as l_copy_semantics_object then
						-- See the object really has copy semantics.
					check
						embedded_or_copy_semantics:
								-- The object is of expanded type, but referenced with copy semantics
							attached {REFLECTED_COPY_SEMANTICS_OBJECT} l_copy_semantics_object
								-- The object is expanded and embedded within an enclosing object
							or (attached {REFLECTED_REFERENCE_OBJECT} l_copy_semantics_object as l_ref_obj
							and then l_ref_obj.physical_offset /= 0)
					end

					l_has_reference_with_copy_semantics := True
					l_reflected_object := l_copy_semantics_object
						-- We usually add `l_object' (i.e. a reference with copy semantic)
						-- to processed object. However if `is_skip_copy_semantics_reference' is set,
						-- we won't add them to the list; it must mean that caller will traverse
						-- them later by going directly to the enclosing object that reference them
					if not is_skip_copy_semantics_reference then
						l_visited.extend (l_copy_semantics_object.object)
					end
				else
					l_reflected_reference_object.set_object (l_object)
					l_reflected_object := l_reflected_reference_object

						-- Due to some limitations we still might have (copies of) copy-semantics objects here.
					if l_reflected_reference_object.is_expanded then
						l_has_reference_with_copy_semantics := True
						if not is_skip_copy_semantics_reference then
							l_visited.extend (l_object)
						end
					else
						l_visited.extend (l_object)
					end
				end
				l_visited_types.put (l_reflected_object.dynamic_type, l_reflected_object.dynamic_type)

					-- Check if we are allowed to call the agents:
				if l_action /= Void or l_on_processing_object_action /= Void then
					if not is_exception_on_copy_suppressed and then l_reflected_object.is_expanded then
						raise_unwanted_copy_exception
					else
							-- Call `object_action'.
						if l_action /= Void then
							l_action.call ([l_object])
						end
							-- Call `on_processing_object_action'.
						if attached l_on_processing_object_action then
							l_on_processing_object_action.call ([l_reflected_object])
						end
					end
				end

				if l_reflected_object.is_special then
					if l_reflected_object.is_special_of_reference then
						if attached {SPECIAL [detachable ANY]} l_object as l_sp then
							from
								i := 0
								nb := l_sp.count
							until
								i = nb
							loop
								if l_reflected_object.is_special_copy_semantics_item (i) then
									l_referee_object := l_reflected_object.special_copy_semantics_item (i)
									l_field := l_referee_object
									l_objects_to_visit.put (l_field)
										-- There is no need for marking since, no one can have a reference
										-- to that object, so we are sure to never hit it again.
									if attached l_on_processing_reference_action then
										l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
									end
								else
									l_field := l_sp.item (i)
									if l_field /= Void and then not l_marker.is_marked (l_field) then
										l_marker.mark (l_field)
										l_objects_to_visit.put (l_field)
									end
									if attached l_on_processing_reference_action and attached l_field then
										l_referee_object_cache.set_object (l_field)
										l_referee_object := l_referee_object_cache
										l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
									end
								end
								i := i + 1
							end
						end
					elseif l_reflected_object.is_special_of_expanded then
						if attached {SPECIAL [ANY]} l_object as l_sp then
								-- The items have copy-semantics, but we currently lack the mechanisms
								-- to create a proper reflected object. Thus we will take a copy into account.
							from
								i := 0
								nb := l_sp.count
							until
								i = nb
							loop
								l_field := l_sp.item (i)
								l_objects_to_visit.put (l_field)
									-- There is no need for marking since, no one can have a reference
									-- to that object, so we are sure to never hit it again.
								if attached l_on_processing_reference_action then
									if is_exception_on_copy_suppressed  then
										l_referee_object_cache.set_object (l_field)
										l_referee_object := l_referee_object_cache
										l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
									else
										raise_unwanted_copy_exception
									end
								end
								i := i + 1
							end
						end
					end
				elseif l_reflected_object.is_tuple then
					if attached {TUPLE} l_object as l_tuple_obj then
						from
							i := 1
							nb := l_tuple_obj.count + 1
						until
							i = nb
						loop
							if l_tuple_obj.is_reference_item (i) then
								l_field := l_tuple_obj.reference_item (i)
								if l_field /= Void and then not l_marker.is_marked (l_field) then
									l_marker.mark (l_field)
									l_objects_to_visit.put (l_field)
								end
									-- Call the agent if exceptions are suppressed
								if attached l_on_processing_reference_action and attached l_field then
									if is_exception_on_copy_suppressed then
										l_referee_object_cache.set_object (l_field)
										l_referee_object := l_referee_object_cache
										l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
									else
										raise_unwanted_copy_exception
									end
								end
							end
							i := i + 1
						end
					end
				else
					from
						i := 1
						nb := l_reflected_object.field_count + 1
					until
						i = nb
					loop
						l_field_type := l_reflected_object.field_type (i)
						if
							l_field_type = {REFLECTOR_CONSTANTS}.reference_type
							or l_field_type = {REFLECTOR_CONSTANTS}.expanded_type
						then
							if not is_skip_transient or else not l_reflected_object.is_field_transient (i) then
								if l_field_type = {REFLECTOR_CONSTANTS}.expanded_type then
									l_referee_object := l_reflected_object.expanded_field (i)
									l_objects_to_visit.put (l_referee_object)
										-- There is no need for marking since, no one can have a reference
										-- to that object, so we are sure to never hit it again.

										-- Call the agent
									if attached l_on_processing_reference_action then
										l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
									end
								elseif l_reflected_object.is_copy_semantics_field (i) then
									l_referee_object := l_reflected_object.copy_semantics_field (i)
									l_objects_to_visit.put (l_referee_object)
										-- There is no need for marking since, no one can have a reference
										-- to that object, so we are sure to never hit it again.

										-- Call the agent
									if attached l_on_processing_reference_action then
										l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
									end
								else
									l_field := l_reflected_object.reference_field (i)
									if l_field /= Void then
										if not l_marker.is_marked (l_field) then
											l_marker.mark (l_field)
											l_objects_to_visit.put (l_field)
										end
											-- Call the agent
										if attached l_on_processing_reference_action then
											l_referee_object_cache.set_object (l_field)
											l_referee_object := l_referee_object_cache
											l_on_processing_reference_action.call ([l_reflected_object, l_referee_object])
										end
									end
								end
							end
						end
						i := i + 1
					variant
						nb - i
					end
				end
			end

				-- Unmark all objects.
			from
				i := 0
				nb := l_visited.count
				l_spec := l_visited.area
			until
				i = nb
			loop
				l_marker.unmark (l_spec.item (i))
				i := i + 1
			end

				-- Update queries of Current with last traversal.
			visited_objects := l_visited
			visited_types := l_visited_types
			has_reference_with_copy_semantics := l_has_reference_with_copy_semantics
		end

	raise_unwanted_copy_exception
		local
			l_exception: DEVELOPER_EXCEPTION
		do
			create l_exception
			l_exception.set_description (
				"An agent has been invoked on a copy of an object during object graph traversal.%N%
				%This happens in TUPLE containing objects with copy-semantics or in SPECIAL[XX],%N%
				%where XX is a user-defined expanded type.")
			l_exception.raise
		end

note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
