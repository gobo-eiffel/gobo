indexing

	description:

		"Eiffel dynamic types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE

inherit

	ET_DYNAMIC_TYPE_SET
		redefine
			is_expanded
		end

	HASHABLE

	DEBUG_OUTPUT

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class) is
			-- Create a new type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
		do
			base_type := a_type
			base_class := a_class
			queries := empty_features
			procedures := empty_features
			if is_expanded then
				set_alive
			end
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
			expanded_type_alive: is_expanded implies is_alive
		end

feature -- Status report

	is_alive: BOOLEAN
			-- Is current type considered alive?
			-- (e.g. instances of this type may be created)

	was_alive: BOOLEAN
			-- Was current type considered alive during the last iteration?
			-- (e.g. instances of this type may be created)

	is_expanded: BOOLEAN is
			-- Is current type expanded?
		do
			Result := base_type.is_expanded
		ensure then
			definition: Result = base_type.is_expanded
		end

	is_generic: BOOLEAN is
			-- Is current type generic?
		do
			Result := base_class.is_generic
		ensure
			definition: Result = base_class.is_generic
		end

	is_agent_type: BOOLEAN is
			-- Is current type an agent type?
		do
			-- Result := False
		end

	is_special: BOOLEAN is
			-- Is current type a SPECIAL type?
		do
			-- Result := False
		end

	has_static: BOOLEAN
			-- Does current type contain features that are used as static features?

	is_used: BOOLEAN is
			-- Should current type used in the system?
		do
			Result := is_alive or has_static or (meta_type /= Void and then meta_type.is_used)
		ensure
			is_alive: is_alive implies Result
			has_static: has_static implies Result
			has_meta_type: (meta_type /= Void and then meta_type.is_used) implies Result
		end

feature -- Conformance

	conforms_to_type (other: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM): BOOLEAN is
			-- Does current type conform to `other' type?
			-- (Note: 'a_system.universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			other_not_void: other /= Void
			a_system_not_void: a_system /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_universe: ET_UNIVERSE
			l_any: ET_CLASS_TYPE
		do
			l_universe := a_system.universe
			l_any := l_universe.any_class
			Result := base_type.conforms_to_type (other.base_type, l_any, l_any, l_universe)
		end

feature -- Status setting

	set_alive is
			-- Set `is_alive' to True.
		do
			is_alive := True
			if first_type = Void then
				first_type := Current
			elseif first_type = Current then
				-- Do nothing.
			elseif other_types = Void then
				create other_types.make_with_capacity (15)
				other_types.put_last (Current)
			elseif other_types.has (Current) then
				-- Do nothing.
			else
				other_types.force_last (Current)
			end
		ensure
			alive_set: is_alive
		end

	set_was_alive is
			-- Set `was_alive' to True.
		do
			was_alive := True
		ensure
			was_alive_set: was_alive
		end

	set_static (b: BOOLEAN) is
			-- Set `has_static' to `b'.
		do
			has_static := b
		ensure
			static_set: has_static = b
		end

feature -- Access

	base_type: ET_BASE_TYPE
			-- Base type

	base_class: ET_CLASS
			-- Base class

	queries: ET_DYNAMIC_FEATURE_LIST
			-- Queries executed at run-time, if any

	procedures: ET_DYNAMIC_FEATURE_LIST
			-- Procedures executed at run-time, if any

	meta_type: ET_DYNAMIC_TYPE
			-- Type representing current type, if any.
			-- If current type is of the form 'T', then
			-- the meta type will be 'TYPE [T]'.

	static_type: ET_DYNAMIC_TYPE is
			-- Type at compilation time
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	first_type: ET_DYNAMIC_TYPE
			-- First type in current set;
			-- Void if no type in the set

	other_types: ET_DYNAMIC_TYPE_LIST
			-- Other types in current set;
			-- Void if zero or one type in the set

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Sub-sets of current type set
		do
		ensure then
			no_source: Result = Void
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := base_class.hash_code
		end

	id: INTEGER
			-- ID

feature -- Setting

	set_meta_type (a_type: like meta_type) is
			-- Set `meta_type' to `a_type'.
		do
			meta_type := a_type
		ensure
			meta_type_set: meta_type = a_type
		end

	set_id (i: INTEGER) is
			-- Set `id' to `i'.
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Features

	dynamic_query (a_query: ET_QUERY; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time query associated with `a_query'
		require
			a_query_not_void: a_query /= Void
			valid_query: base_class.queries.has (a_query)
			a_system_not_void: a_system /= Void
		local
			i, nb: INTEGER
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if queries = empty_features then
				create queries.make_with_capacity (base_class.queries.count)
				Result := new_dynamic_query (a_query, a_system)
				queries.put_last (Result)
			else
				nb := queries.count
				from i := 1 until i > nb loop
					l_dynamic_feature := queries.item (i)
					if l_dynamic_feature.static_feature = a_query then
						Result := l_dynamic_feature
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result = Void then
					Result := new_dynamic_query (a_query, a_system)
					queries.force_last (Result)
				end
			end
		ensure
			dynamic_query_not_void: Result /= Void
		end

	dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time procedure associated with `a_procedure'
		require
			a_feature_not_void: a_procedure /= Void
			valid_procedure: base_class.procedures.has (a_procedure)
			a_system_not_void: a_system /= Void
		local
			i, nb: INTEGER
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if procedures = empty_features then
				create procedures.make_with_capacity (base_class.procedures.count)
				Result := new_dynamic_procedure (a_procedure, a_system)
				procedures.put_last (Result)
			else
				nb := procedures.count
				from i := 1 until i > nb loop
					l_dynamic_feature := procedures.item (i)
					if l_dynamic_feature.static_feature = a_procedure then
						Result := l_dynamic_feature
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result = Void then
					Result := new_dynamic_procedure (a_procedure, a_system)
					procedures.force_last (Result)
				end
			end
		ensure
			dynamic_procedure_not_void: Result /= Void
		end

	seeded_dynamic_query (a_seed: INTEGER; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time query with seed `a_seed';
			-- Void if no such query
		require
			a_system_not_void: a_system /= Void
		local
			i, nb: INTEGER
			l_query: ET_QUERY
			l_dynamic_query: ET_DYNAMIC_FEATURE
		do
			if queries = empty_features then
				l_query := base_class.seeded_query (a_seed)
				if l_query /= Void then
					create queries.make_with_capacity (base_class.queries.count)
					Result := new_dynamic_query (l_query, a_system)
					queries.put_last (Result)
				end
			else
				nb := queries.count
				from i := 1 until i > nb loop
					l_dynamic_query := queries.item (i)
					if l_dynamic_query.static_feature.has_seed (a_seed) then
						Result := l_dynamic_query
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result = Void then
					l_query := base_class.seeded_query (a_seed)
					if l_query /= Void then
						Result := new_dynamic_query (l_query, a_system)
						queries.force_last (Result)
					end
				end
			end
		end

	seeded_dynamic_procedure (a_seed: INTEGER; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time procedure with seed `a_seed';
			-- Void if no such procedure
		require
			a_system_not_void: a_system /= Void
		local
			i, nb: INTEGER
			l_procedure: ET_PROCEDURE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			if procedures = empty_features then
				l_procedure := base_class.seeded_procedure (a_seed)
				if l_procedure /= Void then
					create procedures.make_with_capacity (base_class.procedures.count)
					Result := new_dynamic_procedure (l_procedure, a_system)
					procedures.put_last (Result)
				end
			else
				nb := procedures.count
				from i := 1 until i > nb loop
					l_dynamic_procedure := procedures.item (i)
					if l_dynamic_procedure.static_feature.has_seed (a_seed) then
						Result := l_dynamic_procedure
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result = Void then
					l_procedure := base_class.seeded_procedure (a_seed)
					if l_procedure /= Void then
						Result := new_dynamic_procedure (l_procedure, a_system)
						procedures.force_last (Result)
					end
				end
			end
		end

feature -- Calls

	query_calls: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			-- First qualified query call with current type as target static type
			-- (Other calls are accessed with 'query_calls.next'.)

	procedure_calls: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			-- First qualified procedure call with current type as target static type
			-- (Other calls are accessed with 'procedure_calls.next'.)

feature -- Element change

	put_query_call (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL) is
			-- Add `a_call' to the list of qualified query calls.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.set_next (query_calls)
			query_calls := a_call
		end

	put_procedure_call (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL) is
			-- Add `a_call' to the list of qualified procedure calls.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.set_next (procedure_calls)
			procedure_calls := a_call
		end

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		do
			if a_type.conforms_to_type (static_type, a_system) then
				if first_type = Void then
					first_type := a_type
				elseif a_type = first_type then
					-- Do nothing.
				elseif other_types = Void then
					create other_types.make_with_capacity (15)
					other_types.put_last (a_type)
				elseif other_types.has (a_type) then
					-- Do nothing.
				else
					other_types.force_last (a_type)
				end
			end
		end

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		do
			if is_alive then
				a_target.put_type (Current, a_system)
			end
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		do
			-- Do nothing: the current kind of type set is not pulling
			-- types from sources.
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := base_type.debug_output
		end

feature -- Link

	next_type: ET_DYNAMIC_TYPE
			-- Next dynamic type with the same base class in the surrounding system

	set_next_type (a_type: like next_type) is
			-- Set `next_type' to `a_type'.
		do
			next_type := a_type
		ensure
			next_type_set: next_type = a_type
		end

feature {NONE} -- Implementation

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time query associated with `a_query';
			-- Create a new object at each call.
		require
			a_query_not_void: a_query /= Void
			valid_query: base_class.queries.has (a_query)
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_query, Current, a_system)
		ensure
			new_dynamic_query_not_void: Result /= Void
		end

	new_dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time procedure associated with `a_procedure';
			-- Create a new object at each call.
		require
			a_procedure_not_void: a_procedure /= Void
			valid_procedure: base_class.procedures.has (a_procedure)
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_procedure, Current, a_system)
		ensure
			new_dynamic_procedure_not_void: Result /= Void
		end

	empty_features: ET_DYNAMIC_FEATURE_LIST is
			-- Empty feature list
		once
			create Result.make
		ensure
			features_not_void: Result /= Void
			features_empty: Result.is_empty
		end

invariant

	base_type_not_void: base_type /= Void
	base_type_base_type: base_type.is_base_type
	base_class_not_void: base_class /= Void
	queries_not_void: queries /= Void
	procedures_not_void: procedures /= Void

end
