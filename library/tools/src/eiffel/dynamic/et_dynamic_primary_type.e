note

	description:
	"[
		Eiffel dynamic types at run-time corresponding to types of objects.
		For backward compatibility between non-void-safe and void-safe modes
		in the FreeELKS classes, they represent the detachable non-separate
		version of the type when not expanded, or the expanded type itself
		when expanded.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PRIMARY_TYPE

inherit

	ET_DYNAMIC_TYPE

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
			create conforming_ancestors.make (a_class.conforming_ancestors.count)
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
		end

feature -- Status report

	is_alive: BOOLEAN
			-- Is current type considered alive?
			-- (e.g. instances of this type may be created)


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

	is_tuple: BOOLEAN
			-- Is current type a TUPLE type?
		do
			-- Result := False
		end

	is_boolean: BOOLEAN
			-- Is current type the "BOOLEAN" type in its universe?
		do
			Result := base_class.universe.boolean_type.same_named_type (base_type, base_type, base_type)
		end

	is_self_initializing: BOOLEAN = True
			-- Is current type self-initializing?
			--
			-- It is currently limited to detachable types and expanded types
			-- in order to match ISE's implementation (as of ISE 20.03.10.3992).
			-- The ECMA standard says that attached type with 'default_create'
			-- as creation procedure are also self-initializing (see DEST,
			-- section 8.19.13, page 106 of ECMA-367 3-36).

	is_attached: BOOLEAN
			-- Is current type attached?
		do
			Result := is_expanded
		end

	has_static: BOOLEAN
			-- Does current type contain features that are used as static features?

	is_used: BOOLEAN
			-- Should current type used in the system?
		do
			Result := is_alive or has_static or (attached meta_type as l_meta_type and then l_meta_type.is_used)
		ensure
			is_alive: is_alive implies Result
			has_static: has_static implies Result
			has_meta_type: (attached meta_type as l_meta_type and then l_meta_type.is_used) implies Result
		end

feature -- Status setting

	set_alive
			-- Set `is_alive' to True.
			-- (Note that in order to make sure that the 'dispose' feature, if it exists, is
			-- compiled into the system, the feature ET_DYNAMIC_TYPE_SET_BUILDER.mark_type_alive
			-- needs to be called. Likewise to compute ET_DYNAMIC_TYPE_SET_BUILDER.alive_conforming_descendants.)
		do
			if not is_alive then
				is_alive := True
			end
		ensure
			alive_set: is_alive
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

	type_mark: detachable ET_TYPE_MARK
			-- Type mark (e.g. 'attached') to override `base_type'
		do
			if not is_expanded then
				Result := tokens.implicit_detachable_type_mark
			end
		end

	primary_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Primary version of current type
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	attached_type: detachable ET_DYNAMIC_SECONDARY_TYPE
			-- Attached version of current type, if already available

	hash_code: INTEGER
			-- Hash code

	id: INTEGER
			-- ID

	type_id: INTEGER
			-- Type id
		do
			Result := id
		end

feature -- Setting

	set_attached_type (a_type: like attached_type)
			-- Set `attached_type' to `a_type'.
		do
			attached_type := a_type
		ensure
			attached_type_set: attached_type = a_type
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

feature -- Conformance

	conforms_to_primary_type (other: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Does current type conform to `other' type?
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif base_class.is_none then
				Result := not other.is_expanded
			else
				Result := conforming_ancestors.has (other)
			end
		end

	conforming_ancestors: DS_HASH_SET [ET_DYNAMIC_PRIMARY_TYPE]
			-- All types (both alive and dead) to which the current type conforms

feature -- Features

	attribute_count: INTEGER
			-- Number of attributes

	has_reference_attributes: BOOLEAN
			-- Does current type contain attributes whose types are declared of reference type?

	has_nested_reference_attributes: BOOLEAN
			-- Does current type contain reference attributes or recursively does it contain
			-- expanded attributes whose type contains reference attributes?
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if has_reference_attributes then
				Result := True
			elseif is_basic then
				Result := False
			else
					-- Look for reference attributes in the types of
					-- expanded attributes, if any.
					--
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				nb := attribute_count
				from i := 1 until i > nb loop
					if attached queries.item (i).result_type_set as l_result_type_set then
						l_type := l_result_type_set.static_type.primary_type
						if l_type.is_expanded and then l_type.has_nested_reference_attributes then
								-- Note that for expanded types, there is no type other
								-- than itself that conforms to it.
							Result := True
							i := nb + 1
						else
							i := i + 1
						end
					else
							-- Should never happen: queries have a result type set.
						i := i + 1
					end
				end
				has_reference_attributes := False
			end
		end

	has_once_per_object_routines: BOOLEAN
			-- Does current type contain once-per-object routines?

	has_reference_fields: BOOLEAN
			-- Does current type contain reference attributes or once-per-object routines?
			-- Note that there is a reference field (like a pseudo attribute) to store once-per-object data.
		do
			Result := has_reference_attributes or has_once_per_object_routines
		end

	has_nested_reference_fields: BOOLEAN
			-- Does current type contain reference fields, or recursively does it have
			-- expanded attributes whose types contain reference fields?
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if has_reference_fields then
				Result := True
			elseif is_basic then
				Result := False
			else
					-- Look for reference fields in the types of expanded attributes, if any.
					--
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				nb := attribute_count
				from i := 1 until i > nb loop
					if attached queries.item (i).result_type_set as l_result_type_set then
						l_type := l_result_type_set.static_type.primary_type
						if l_type.is_expanded and then l_type.has_nested_reference_fields then
								-- Note that for expanded types, there is no type other
								-- than itself that conforms to it.
							Result := True
							i := nb + 1
						else
							i := i + 1
						end
					else
							-- Should never happen: queries have a result type set.
						i := i + 1
					end
				end
				has_reference_attributes := False
			end
		end

	has_redefined_copy_routine: BOOLEAN
			-- Is the version of routine 'copy' in current type different
			-- from the one in class 'ANY'?

	has_nested_custom_standard_copy_routine: BOOLEAN
			-- Does current type contains fields, or recursively does it have
			-- expanded attributes which contain fields, which require special
			-- treatment in the implementation of routine 'standard_copy'?
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if has_once_per_object_routines then
				Result := True
			elseif is_basic then
				Result := False
			else
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_once_per_object_routines' to True to break that cycle.
				has_once_per_object_routines := True
				nb := attribute_count
				from i := 1 until i > nb loop
					if attached queries.item (i).result_type_set as l_result_type_set then
						l_type := l_result_type_set.static_type.primary_type
						if l_type.is_expanded then
							if l_type.has_redefined_copy_routine then
								Result := True
								i := nb + 1
							elseif l_type.has_nested_custom_standard_copy_routine then
								Result := True
								i := nb + 1
							else
								i := i + 1
							end
						elseif l_result_type_set.has_expanded then
								-- Reference attribute which may be attached to an object with copy semantics.
							Result := True
							i := nb + 1
						else
							i := i + 1
						end
					else
							-- Should never happen: queries have a result type set.
						i := i + 1
					end
				end
				has_once_per_object_routines := False
			end
		end

	has_redefined_is_equal_routine: BOOLEAN
			-- Is the version of routine 'is_equal' in current type different
			-- from the one in class 'ANY'?

	has_nested_custom_standard_is_equal_routine: BOOLEAN
			-- Does current type contains fields, or recursively does it have
			-- expanded attributes which contain fields, which require special
			-- treatment in the implementation of routine 'standard_is_equal'?
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if has_once_per_object_routines then
				Result := True
			elseif is_basic then
				Result := False
			else
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_once_per_object_routines' to True to break that cycle.
				has_once_per_object_routines := True
				nb := attribute_count
				from i := 1 until i > nb loop
					if attached queries.item (i).result_type_set as l_result_type_set then
						l_type := l_result_type_set.static_type.primary_type
						if l_type.is_expanded then
							if l_type.has_redefined_is_equal_routine then
								Result := True
								i := nb + 1
							elseif l_type.has_nested_custom_standard_is_equal_routine then
								Result := True
								i := nb + 1
							else
								i := i + 1
							end
						elseif l_result_type_set.has_expanded then
								-- Reference attribute which may be attached to an object with copy semantics.
							Result := True
							i := nb + 1
						else
							i := i + 1
						end
					else
							-- Should never happen: queries have a result type set.
						i := i + 1
					end
				end
				has_once_per_object_routines := False
			end
		end

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
			nb: INTEGER
			l_result: detachable ET_DYNAMIC_FEATURE
			l_queries_by_seed: like queries_by_seed
		do
			l_queries_by_seed := queries_by_seed
			if l_queries_by_seed = Void then
				nb := base_class.queries.count
				create queries.make_with_capacity (nb)
				create l_queries_by_seed.make_map (nb)
				queries_by_seed := l_queries_by_seed
			else
				l_result := l_queries_by_seed.value (a_query.first_seed)
			end
			if l_result /= Void then
				Result := l_result
			else
				Result := new_dynamic_query (a_query, a_system)
				register_feature_seeds (Result, l_queries_by_seed)
				if Result.is_attribute then
					put_attribute (Result, a_system)
				else
					put_function (Result)
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
			nb: INTEGER
			l_result: detachable ET_DYNAMIC_FEATURE
			l_procedures_by_seed: like procedures_by_seed
		do
			l_procedures_by_seed := procedures_by_seed
			if l_procedures_by_seed = Void then
				nb := base_class.procedures.count
				create procedures.make_with_capacity (nb)
				create l_procedures_by_seed.make_map (nb)
				procedures_by_seed := l_procedures_by_seed
			else
				l_result := l_procedures_by_seed.value (a_procedure.first_seed)
			end
			if l_result /= Void then
				Result := l_result
			else
				Result := new_dynamic_procedure (a_procedure, a_system)
				register_feature_seeds (Result, l_procedures_by_seed)
				put_procedure (Result)
			end
		ensure
			dynamic_procedure_not_void: Result /= Void
			is_procedure: Result.is_procedure
		end

	seeded_dynamic_query (a_seed: INTEGER; a_system: ET_DYNAMIC_SYSTEM): detachable ET_DYNAMIC_FEATURE
			-- Run-time query with seed `a_seed';
			-- Void if no such query
		require
			a_system_not_void: a_system /= Void
		local
			nb: INTEGER
			l_result: detachable ET_DYNAMIC_FEATURE
			l_queries_by_seed: like queries_by_seed
		do
			l_queries_by_seed := queries_by_seed
			if l_queries_by_seed = Void then
				nb := base_class.queries.count
				create queries.make_with_capacity (nb)
				create l_queries_by_seed.make_map (nb)
				queries_by_seed := l_queries_by_seed
			else
				l_result := l_queries_by_seed.value (a_seed)
			end
			if l_result /= Void then
				Result := l_result
			elseif attached base_class.seeded_query (a_seed) as l_query then
				Result := new_dynamic_query (l_query, a_system)
				register_feature_seeds (Result, l_queries_by_seed)
				if Result.is_attribute then
					put_attribute (Result, a_system)
				else
					put_function (Result)
				end
			end
		ensure
			is_query: Result /= Void implies Result.is_query
		end

	seeded_dynamic_procedure (a_seed: INTEGER; a_system: ET_DYNAMIC_SYSTEM): detachable ET_DYNAMIC_FEATURE
			-- Run-time procedure with seed `a_seed';
			-- Void if no such procedure
		require
			a_system_not_void: a_system /= Void
		local
			nb: INTEGER
			l_result: detachable ET_DYNAMIC_FEATURE
			l_procedures_by_seed: like procedures_by_seed
		do
			l_procedures_by_seed := procedures_by_seed
			if l_procedures_by_seed = Void then
				nb := base_class.procedures.count
				create procedures.make_with_capacity (nb)
				create l_procedures_by_seed.make_map (nb)
				procedures_by_seed := l_procedures_by_seed
			else
				l_result := l_procedures_by_seed.value (a_seed)
			end
			if l_result /= Void then
				Result := l_result
			elseif attached base_class.seeded_procedure (a_seed) as l_procedure then
				Result := new_dynamic_procedure (l_procedure, a_system)
				register_feature_seeds (Result, l_procedures_by_seed)
				put_procedure (Result)
			end
		ensure
			is_procedure: Result /= Void implies Result.is_procedure
		end

	set_attribute_position (an_attribute: ET_DYNAMIC_FEATURE; a_position: INTEGER)
			-- Make sure that `an_attribute' is at position `i' if
			-- this is already a known attribute in current type.
			-- Do nothing otherwise.
		require
			an_attribute_not_void: an_attribute /= Void
			a_position_large_enough: a_position >= 1
			a_position_small_enough: a_position <= attribute_count
		local
			i: INTEGER
		do
			i := queries.index_of (an_attribute)
			if i >= 1 and i <= attribute_count then
				if a_position /= i then
					queries.put (queries.item (a_position), i)
					queries.put (an_attribute, a_position)
				end
			end
		ensure
			position_set: (old queries.index_of (an_attribute) >= 1 and old queries.index_of (an_attribute) <= attribute_count) implies queries.item (a_position) = an_attribute
			same_attribute_count: attribute_count = old attribute_count
		end

	use_all_attributes (a_system: ET_DYNAMIC_SYSTEM)
			-- Make sure that all attributes of current type are marked as
			-- used and hence included in the generated run-time instances.
		require
			a_system_not_void: a_system /= Void
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
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
					if attached {ET_EXTERNAL_FUNCTION} l_query as l_external_function and then l_external_function.is_builtin and then is_builtin_attribute (l_external_function, l_external_function.builtin_class_code, l_external_function.builtin_feature_code) then
						l_dynamic_feature := dynamic_query (l_external_function, a_system)
					end
				end
				i := i + 1
			end
		end

	is_builtin_attribute (a_feature: ET_FEATURE; a_builtin_class_code, a_builtin_feature_code: NATURAL_8): BOOLEAN
			-- Is built-in feature `a_feature' with code `a_built_class_code'
			-- and `a_builtin_feature_code' considered as an attribute or not
			-- in the current type?
		require
			a_feature_not_void: a_feature /= Void
		do
			inspect a_builtin_class_code
			when {ET_TOKEN_CODES}.builtin_boolean_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_boolean_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_character_8_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_character_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_character_32_ref_class then
				 if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_character_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_integer_8_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_integer_16_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_integer_32_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_integer_64_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_natural_8_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_natural_16_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_natural_32_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_natural_64_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_integer_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_pointer_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_pointer_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_real_32_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_real_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_real_64_ref_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_real_n_ref_item then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_special_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_count then
					Result := True
				elseif a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_capacity then
					Result := True
				end
			when {ET_TOKEN_CODES}.builtin_tuple_class then
				if a_builtin_feature_code = {ET_TOKEN_CODES}.builtin_tuple_object_comparison then
					Result := True
				end
			else
				Result := False
			end
		ensure
			is_query: Result implies a_feature.is_query
		end

feature {NONE} -- Features

	put_attribute (an_attribute: ET_DYNAMIC_FEATURE; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `an_attribute' to `queries'.
		require
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
			is_query: an_attribute.is_query
			a_system_not_void: a_system /= Void
		local
			l_type: ET_DYNAMIC_PRIMARY_TYPE
			l_dynamic_type_set_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
			attribute_count := attribute_count + 1
			if queries.count < attribute_count then
				queries.force_last (an_attribute)
			else
				queries.force_last (queries.item (attribute_count))
				queries.put (an_attribute, attribute_count)
			end
			if has_reference_attributes then
				-- Already set.
			elseif not attached an_attribute.result_type_set as l_result_type_set then
					-- Should never happen. The precondition says that `an_attribute'
					-- is a query, an therefore has a result type set.
				check is_query: False end
			else
				l_type := l_result_type_set.static_type.primary_type
				if not l_type.is_expanded then
					has_reference_attributes := True
				end
			end
			l_dynamic_type_set_builder := a_system.dynamic_type_set_builder
			l_dynamic_type_set_builder.propagate_reference_field_dynamic_types (an_attribute)
			l_dynamic_type_set_builder.propagate_set_reference_field_dynamic_types (an_attribute)
		ensure
			one_more: attribute_count = old attribute_count + 1
			reference_attribute: (attached an_attribute.result_type_set as l_result_type_set and then not l_result_type_set.is_expanded) implies has_reference_attributes
		end

	put_function (a_function: ET_DYNAMIC_FEATURE)
			-- Add `a_function' to `queries'.
		require
			a_function_not_void: a_function /= Void
			is_function: not a_function.is_attribute
			is_query: a_function.is_query
		do
			queries.force_last (a_function)
			if not has_once_per_object_routines then
				has_once_per_object_routines := a_function.is_once_per_object
			end
			if a_function.is_is_equal_routine then
				-- Note: As of EiffelBase 20.11.10.5048, 'is_equal' in classes such as "INTEGER_32"
				-- is redefined as 'Result := other.item = item' instead of using the built-in version
				-- from "ANY". This introduces an infinite recursive call. Hence the test for 'is_basic'
				-- below.
-- TODO: check that the version of 'is_equal' redefined in basic types is equalivalent to the
-- built-in one from "ANY.is_equal".
				has_redefined_is_equal_routine := not a_function.is_builtin_any_is_equal and then not is_basic
			end
		end

	put_procedure (a_procedure: ET_DYNAMIC_FEATURE)
			-- Add `a_procedure' to `procedures'.
		require
			a_procedure_not_void: a_procedure /= Void
			is_procedure: a_procedure.is_procedure
		do
			procedures.force_last (a_procedure)
			if not has_once_per_object_routines then
				has_once_per_object_routines := a_procedure.is_once_per_object
			end
			if a_procedure.is_copy_routine then
				has_redefined_copy_routine := not a_procedure.is_builtin_any_copy
			end
		end

	queries_by_seed: detachable DS_HASH_TABLE [ET_DYNAMIC_FEATURE, INTEGER]
			-- Cache for `seeded_dynamic_query' and `dynamic_query'

	procedures_by_seed: detachable DS_HASH_TABLE [ET_DYNAMIC_FEATURE, INTEGER]
			-- Cache for `seeded_dynamic_procedure' and `dynamic_procedure'

	register_feature_seeds (a_feature: ET_DYNAMIC_FEATURE; a_features_by_seed: DS_HASH_TABLE [ET_DYNAMIC_FEATURE, INTEGER])
			-- Add `a_feature' to `a_features_by_seed' for each of its seeds.
		require
			a_feature_not_void: a_feature /= Void
			a_features_by_seed_not_void: a_features_by_seed /= Void
		local
			i, nb: INTEGER
		do
			a_features_by_seed.force_last (a_feature, a_feature.static_feature.first_seed)
			if attached a_feature.static_feature.other_seeds as l_other_seeds then
				nb := l_other_seeds.count
				from i := 1 until i > nb loop
					a_features_by_seed.force_last (a_feature, l_other_seeds.item (i))
					i := i + 1
				end
			end
		end

feature -- Calls

	query_calls: detachable ET_DYNAMIC_QUALIFIED_QUERY_CALL
			-- First qualified query call with current type as target static type
			-- (Other calls are accessed with 'query_calls.next'.)

	procedure_calls: detachable ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			-- First qualified procedure call with current type as target static type
			-- (Other calls are accessed with 'procedure_calls.next'.)

	put_query_call (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL)
			-- Add `a_call' to the list of qualified query calls.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.set_next (query_calls)
			query_calls := a_call
			a_call.current_feature.put_query_call (a_call)
		end

	put_procedure_call (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL)
			-- Add `a_call' to the list of qualified procedure calls.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.set_next (procedure_calls)
			procedure_calls := a_call
			a_call.current_feature.put_procedure_call (a_call)
		end

feature -- Equality expressions

	equality_expressions: detachable ET_DYNAMIC_EQUALITY_EXPRESSION
			-- First equality expression with current type as static type of the left operand;
			-- Needed to build the dynamic type sets of feature 'is_equal' which is internally
			-- called when the operands involved in the equality expression are of expanded types.
			-- (Other equality expressions are accessed with `equality_expressions.next'.)

	object_equality_expressions: detachable ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION
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

feature -- Link

	next_type: detachable ET_DYNAMIC_PRIMARY_TYPE
			-- Next dynamic primary type with the same base class in the surrounding system

	set_next_type (a_type: like next_type)
			-- Set `next_type' to `a_type'.
		do
			next_type := a_type
		ensure
			next_type_set: next_type = a_type
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

	conforming_ancestors_not_void: conforming_ancestors /= Void
	queries_not_void: queries /= Void
	procedures_not_void: procedures /= Void
	attribute_count_not_negative: attribute_count >= 0
	attribute_count_constraint: attribute_count <= queries.count

end
