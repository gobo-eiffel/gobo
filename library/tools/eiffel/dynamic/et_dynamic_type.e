note

	description:

		"Eiffel dynamic types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE

inherit

	ET_DYNAMIC_TYPE_SET
		redefine
			dynamic_type,
			index_of,
			is_expanded,
			put_target,
			has_type
		end

	HASHABLE

	DEBUG_OUTPUT

	ET_TOKEN_CODES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class)
			-- Create a new type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
		do
			base_type := a_type
			base_class := a_class
			hash_code := a_class.hash_code
			queries := empty_features
			procedures := empty_features
			create conforming_dynamic_types.make_empty (Current)
			create all_conforming_dynamic_types.make_empty (Current)
			all_conforming_dynamic_types.put_type (Current)
			if is_expanded then
				set_alive
				conforming_dynamic_types.set_never_void
				all_conforming_dynamic_types.set_never_void
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

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			Result := base_type.is_expanded
		ensure then
			definition: Result = base_type.is_expanded
		end

	is_never_void: BOOLEAN
			-- Can the expression of current dynamic type set never be void?
			-- (Note that in order to be truly true, the current dynamic type
			-- set should also be non-empty. Therefore it is recommended to
			-- use 'not can_be_void'.)
		do
			Result := not base_class.is_none and is_alive
		end

	is_generic: BOOLEAN
			-- Is current type generic?
		do
			Result := base_class.is_generic
		ensure
			definition: Result = base_class.is_generic
		end

	is_agent_type: BOOLEAN
			-- Is current type an agent type?
		do
			-- Result := False
		end

	is_special: BOOLEAN
			-- Is current type a SPECIAL type?
		do
			-- Result := False
		end

	is_basic: BOOLEAN
			-- Is current type one of "BOOLEAN", "CHARACTER_8", "CHARACTER_32",
			-- "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64",
			-- "NATURAL_8", "NATURAL_16", "NATURAL_32", "NATURAL_64",
			-- "POINTER", "REAL_32", "REAL_64"?
		do
			Result := base_class.is_basic
		ensure
			definition: Result = base_class.is_basic
		end

	has_static: BOOLEAN
			-- Does current type contain features that are used as static features?

	is_used: BOOLEAN
			-- Should current type used in the system?
		do
			Result := is_alive or has_static or (meta_type /= Void and then meta_type.is_used)
		ensure
			is_alive: is_alive implies Result
			has_static: has_static implies Result
			has_meta_type: (meta_type /= Void and then meta_type.is_used) implies Result
		end

	has_type (a_type: ET_DYNAMIC_TYPE): BOOLEAN
			-- Do current dynamic types contain `a_type'?
		do
			if count = 1 then
				Result := a_type = Current
			end
		ensure then
			definition: Result = (a_type = Current)
		end

feature -- Status setting

	set_never_void
			-- Set `is_never_void' to True.
		do
			-- `is_never_void' is already True unless current type is NONE or is not alive.
		end

feature -- Conformance

	conforms_to_type (other: ET_DYNAMIC_TYPE): BOOLEAN
			-- Does current type conform to `other' type?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			other_not_void: other /= Void
		local
			l_other_base_type: ET_BASE_TYPE
		do
			l_other_base_type := other.base_type
			Result := base_type.conforms_to_type (l_other_base_type, l_other_base_type, base_type)
		end

feature -- Status setting

	set_alive
			-- Set `is_alive' to True.
			-- (Note that in order to make sure that the 'dispose' feature, if it exists, is
			-- compiled into the system, the feature ET_DYNAMIC_TYPE_SET_BUILDER.mark_type_alive
			-- needs to be called.)
		do
			if not is_alive then
				is_alive := True
				conforming_dynamic_types.put_type (Current)
			end
		ensure
			alive_set: is_alive
		end

	set_was_alive
			-- Set `was_alive' to True.
		do
			was_alive := True
		ensure
			was_alive_set: was_alive
		end

	set_static (b: BOOLEAN)
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

	meta_type: ET_DYNAMIC_TYPE
			-- Type representing current type, if any.
			-- If current type is of the form 'T', then
			-- the meta type will be 'TYPE [T]'.

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	dynamic_type (i: INTEGER): ET_DYNAMIC_TYPE
			-- Dynamic type at index `i'
		do
			Result := Current
		end

	index_of (a_type: ET_DYNAMIC_TYPE): INTEGER
			-- Index of first occurrence of `a_type'?
		do
			if has_type (a_type) then
				Result := 1
			end
		end

	conforming_dynamic_types: ET_DYNAMIC_STANDALONE_TYPE_SET
			-- Types that conform to current type and that are considered alive
			-- (e.g. instances of this type may be created)

	all_conforming_dynamic_types: ET_DYNAMIC_STANDALONE_TYPE_SET
			-- All types (both alive and dead) that conform to current type
			-- (Might be useful when retrieving Storable files or getting from
			-- an external routine any other objects created outside of Eiffel.)

	hash_code: INTEGER
			-- Hash code

	id: INTEGER
			-- ID

feature -- Measurement

	count: INTEGER
			-- Number of types in current type set
		do
			if not base_class.is_none and is_alive then
				Result := 1
			end
		end

feature -- Setting

	set_meta_type (a_type: like meta_type)
			-- Set `meta_type' to `a_type'.
		do
			meta_type := a_type
		ensure
			meta_type_set: meta_type = a_type
		end

	set_id (i: INTEGER)
			-- Set `id' to `i'.
		do
			id := i
		ensure
			id_set: id = i
		end

	set_hash_code (a_code: INTEGER)
			-- Set `hash_code' to `a_code'.
		require
			a_code_not_negative: a_code >= 0
		do
			hash_code := a_code
		ensure
			hash_code_set: hash_code = a_code
		end

feature -- Features

	attribute_count: INTEGER
			-- Number of attributes

	has_reference_attributes: BOOLEAN
			-- Does current type contain attributes whose types are declared of reference type?

	has_nested_reference_attributes: BOOLEAN
			-- Does current type contain attributes whose types are declared of reference type,
			-- or recursively does it contain expanded attributes whose type contains attributes
			-- of reference type?
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
		do
			if has_reference_attributes then
				Result := True
			else
					-- Look at the attributes of the types of expanded attributes, if any.
					--
					-- We should not have cyclic recursive enclosed expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				nb := attribute_count
				from i := 1 until i > nb loop
					l_type := queries.item (i).result_type_set.static_type
					if l_type.is_expanded and then l_type.has_nested_reference_attributes then
							-- Note that for non-generic expanded types, there is no type other
							-- than itself that conforms to it. However for generic expanded types,
							-- other generic derivations of the same generic class may conform to
							-- it. But it is OK to take only the static type of the expanded attribute
							-- into account even in that case, and we won't miss any sub-attribute
							-- of reference types in conforming expanded generic derivations.
							-- Indeed, if that static type has expanded attributes, then conforming
							-- generic derivations cannot have these attributes of reference
							-- type (because no reference type conforms to an expanded type).
						Result := True
						i := nb + 1
					else
						i := i + 1
					end
				end
				has_reference_attributes := False
			end
		end

	has_generic_expanded_attributes: BOOLEAN
			-- Does current type contain attributes whose types are declared of generic expanded type?
			-- Note that for non-generic expanded types, there is no type other than itself
			-- that conforms to it. Therefore we don't need to keep the type-id in its instances.
			-- However for generic expanded types, other generic derivations of the same generic
			-- class may conform to it. So as for reference types, we need to keep the type-id
			-- in its instances. That's why we need to know whether the current type has such
			-- kind of attributes.

	queries: ET_DYNAMIC_FEATURE_LIST
			-- Queries executed at run-time, if any
			-- (Note that attributes are stored first, from 1 to `attribute_count'.)

	procedures: ET_DYNAMIC_FEATURE_LIST
			-- Procedures executed at run-time, if any

	dynamic_query (a_query: ET_QUERY; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
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
				if Result.is_attribute then
					put_attribute (Result)
				else
					queries.put_last (Result)
				end
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
					if Result.is_attribute then
						put_attribute (Result)
					else
						queries.force_last (Result)
					end
				end
			end
		ensure
			dynamic_query_not_void: Result /= Void
			is_query: Result.is_query
		end

	dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
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
			is_procedure: Result.is_procedure
		end

	seeded_dynamic_query (a_seed: INTEGER; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
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
					if Result.is_attribute then
						put_attribute (Result)
					else
						queries.put_last (Result)
					end
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
						if Result.is_attribute then
							put_attribute (Result)
						else
							queries.force_last (Result)
						end
					end
				end
			end
		ensure
			is_query: Result /= Void implies Result.is_query
		end

	seeded_dynamic_procedure (a_seed: INTEGER; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
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
		ensure
			is_procedure: Result /= Void implies Result.is_procedure
		end

	use_all_attributes (a_system: ET_DYNAMIC_SYSTEM)
			-- Make sure that all attributes of current type are marked as
			-- used and hence included in the generated run-time instances.
		require
			a_system_not_void: a_system /= Void
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_external_function: ET_EXTERNAL_FUNCTION
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
		do
			l_queries := base_class.queries
			nb := l_queries.count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				if l_query.is_attribute then
					l_dynamic_feature := dynamic_query (l_query, a_system)
				else
						-- Check if we have built-in attributes.
					l_external_function ?= l_query
					if l_external_function /= Void and then l_external_function.is_builtin and then is_builtin_attribute (l_external_function, l_external_function.builtin_code) then
						l_dynamic_feature := dynamic_query (l_external_function, a_system)
					end
				end
				i := i + 1
			end
		end

	is_builtin_attribute (a_feature: ET_FEATURE; a_builtin_code: INTEGER): BOOLEAN
			-- Is built-in feature `a_feature' with code `a_built_code'
			-- considered as an attribute or not in the current type?
		require
			a_feature_not_void: a_feature /= Void
		do
			inspect a_builtin_code // builtin_capacity
			when builtin_boolean_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_boolean_item then
					Result := not is_basic
				end
			when builtin_character_8_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_character_item then
					Result := not is_basic
				end
			when builtin_character_32_class then
				 if (a_builtin_code \\ builtin_capacity) = builtin_character_item then
					Result := not is_basic
				end
			when builtin_pointer_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_pointer_item then
					Result := not is_basic
				end
			when builtin_integer_8_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_integer_16_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_integer_32_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_integer_64_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_natural_8_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_natural_16_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_natural_32_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_natural_64_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_integer_item then
					Result := not is_basic
				end
			when builtin_real_32_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_real_item then
					Result := not is_basic
				end
			when builtin_real_64_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_real_item then
					Result := not is_basic
				end
			when builtin_tuple_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_tuple_object_comparison then
					Result := True
				end
			when builtin_special_class then
				if (a_builtin_code \\ builtin_capacity) = builtin_special_count then
					Result := True
				elseif (a_builtin_code \\ builtin_capacity) = builtin_special_capacity then
					Result := True
				end
			else
				Result := False
			end
		ensure
			is_query: Result implies a_feature.is_query
		end

feature {NONE} -- Fetaures

	put_attribute (an_attribute: ET_DYNAMIC_FEATURE)
			-- Add `an_attribute' to `queries'.
		require
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
			is_query: an_attribute.is_query
		local
			l_type: ET_DYNAMIC_TYPE
		do
			attribute_count := attribute_count + 1
			if queries.count < attribute_count then
				queries.force_last (an_attribute)
			else
				queries.force_last (queries.item (attribute_count))
				queries.put (an_attribute, attribute_count)
			end
			l_type := an_attribute.result_type_set.static_type
			if not l_type.is_expanded then
				has_reference_attributes := True
			elseif l_type.is_generic then
				has_generic_expanded_attributes := True
			end
		ensure
			one_more: attribute_count = old attribute_count + 1
			reference_attribute: not an_attribute.result_type_set.is_expanded implies has_reference_attributes
			generic_expanded_attribute: (an_attribute.result_type_set.is_expanded and then an_attribute.result_type_set.static_type.is_generic) implies has_generic_expanded_attributes
		end

feature -- Calls

	query_calls: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			-- First qualified query call with current type as target static type
			-- (Other calls are accessed with 'query_calls.next'.)

	procedure_calls: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			-- First qualified procedure call with current type as target static type
			-- (Other calls are accessed with 'procedure_calls.next'.)

	put_query_call (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL)
			-- Add `a_call' to the list of qualified query calls.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.set_next (query_calls)
			query_calls := a_call
		end

	put_procedure_call (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL)
			-- Add `a_call' to the list of qualified procedure calls.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.set_next (procedure_calls)
			procedure_calls := a_call
		end

feature -- Equality expressions

	equality_expressions: ET_DYNAMIC_EQUALITY_EXPRESSION
			-- First equality expression with current type as static type of the left operand;
			-- Needed to build the dynamic type sets of feature 'is_equal' which is internally
			-- called when the operands involved in the equality expression are of expanded types.
			-- (Other equality expressions are accessed with `equality_expressions.next'.)

	object_equality_expressions: ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION
			-- First object-equality expression with current type as static type of the left operand;
			-- Needed to build the dynamic type sets of feature 'is_equal' which is internally called.
			-- (Other object-equality expressions are accessed with `equality_expressions.next'.)

	put_equality_expression (a_equality: ET_DYNAMIC_EQUALITY_EXPRESSION)
			-- Add `a_equality' to the list of equality expressions.
		require
			a_equality_not_void: a_equality /= Void
		do
			a_equality.set_next (equality_expressions)
			equality_expressions := a_equality
		end

	put_object_equality_expression (a_equality: ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION)
			-- Add `a_equality' to the list of object-equality expressions.
		require
			a_equality_not_void: a_equality /= Void
		do
			a_equality.set_next (object_equality_expressions)
			object_equality_expressions := a_equality
		end

feature -- Element change

	put_type_from_type_set (a_type: ET_DYNAMIC_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' coming from `a_type_set' to current target.
		do
		end

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		do
			if is_alive then
				a_target.put_type_from_type_set (Current, Current, a_system)
			end
			if not is_never_void then
				a_target.propagate_can_be_void (Current)
			end
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := base_type.debug_output
		end

feature -- Link

	next_type: ET_DYNAMIC_TYPE
			-- Next dynamic type with the same base class in the surrounding system

	set_next_type (a_type: like next_type)
			-- Set `next_type' to `a_type'.
		do
			next_type := a_type
		ensure
			next_type_set: next_type = a_type
		end

feature {ET_DYNAMIC_TYPE_SET} -- Implementation

	dynamic_types: ET_DYNAMIC_TYPES
			-- Dynamic types in current set;
			-- Void if no type in the set
		do
			Result := Current
		end

feature {NONE} -- Implementation

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
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
			is_query: Result.is_query
		end

	new_dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
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
			is_procedure: Result.is_procedure
		end

	empty_features: ET_DYNAMIC_FEATURE_LIST
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
	conforming_dynamic_types_not_void: conforming_dynamic_types /= Void
	all_conforming_dynamic_types_not_void: all_conforming_dynamic_types /= Void
	queries_not_void: queries /= Void
	procedures_not_void: procedures /= Void
	attribute_count_not_negative: attribute_count >= 0
	attribute_count_constraint: attribute_count <= queries.count

end
