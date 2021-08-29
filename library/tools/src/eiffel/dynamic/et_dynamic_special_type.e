note

	description:

		"Eiffel dynamic SPECIAL types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SPECIAL_TYPE

inherit

	ET_DYNAMIC_PRIMARY_TYPE
		rename
			make as make_type
		redefine
			is_special,
			has_nested_non_embedded_attributes,
			has_nested_reference_fields,
			has_nested_custom_standard_copy_routine,
			new_dynamic_query,
			new_dynamic_procedure
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class; an_item_type_set: like item_type_set)
			-- Create a new type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
			an_item_type_set_not_void: an_item_type_set /= Void
		local
			l_item_type: ET_DYNAMIC_TYPE
		do
			item_type_set := an_item_type_set
			make_type (a_type, a_class)
			l_item_type := an_item_type_set.static_type
			if not l_item_type.is_expanded then
				has_reference_attributes := True
			elseif l_item_type.is_generic then
				has_generic_expanded_attributes := True
			end
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
			item_type_set_set: item_type_set = an_item_type_set
		end

feature -- Access

	item_type_set: ET_DYNAMIC_TYPE_SET
			-- Type set of items

feature -- Status report

	is_special: BOOLEAN = True
			-- Is current type a SPECIAL type?

feature -- Features

	has_nested_non_embedded_attributes: BOOLEAN
			-- Does current type contain non-embedded attributes or recursively does it contain
			-- embedded expanded attributes whose type contains non-embedded attributes?
		do
			if has_non_embedded_attributes then
				Result := True
			else
					-- Look for non-embedded attributes in the types of embedded
					-- expanded attributes, if any.
					--
					-- We should not have cyclic recursive embedded expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				if item_type_set.static_type.primary_type.has_nested_non_embedded_attributes then
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
				end
				has_reference_attributes := False
			end
		end

	has_nested_reference_fields: BOOLEAN
			-- Does current type contain references, or recursively does it have
			-- embedded expanded attributes whose types contain references?
		do
			if has_reference_fields then
				Result := True
			else
					-- Look for references in the types of embedded
					-- expanded attributes, if any.
					--
					-- We should not have cyclic recursive embedded expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				if item_type_set.static_type.primary_type.has_nested_reference_fields then
						-- Note that for non-generic expanded types, there is no type other
						-- than itself that conforms to it. For generic expanded types, we
						-- should either disallow conformance of other generic derivations of
						-- the same generic class, or have the corresponding attribute
						-- non-embedded in the enclosing object (while preserving the copy
						-- semantics).
					Result := True
				end
				has_reference_attributes := False
			end
		end

	has_nested_custom_standard_copy_routine: BOOLEAN
			-- Does current type contains fields, or recursively does it have
			-- embedded expanded attributes which contain fields, which require
			-- special treatment in the implementation of routine 'standard_copy'?
		do
			Result := precursor or has_item_nested_custom_standard_copy_routine
		end

	has_item_nested_custom_standard_copy_routine: BOOLEAN
			-- Does current type contains items, or recursively do they have
			-- embedded expanded attributes which contain fields, which require
			-- special treatment in the implementation of routine 'standard_copy'?
		local
			l_item_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			l_item_type := item_type_set.static_type.primary_type
			if l_item_type.is_embedded then
				if l_item_type.has_redefined_copy_routine then
					Result := True
				elseif l_item_type = Current then
					-- We should not have cyclic recursive embedded expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we have this
					-- test to break that cycle.
				elseif l_item_type.has_nested_custom_standard_copy_routine then
					Result := True
				end
			elseif l_item_type.is_expanded then
					-- Non-embedded expanded attribute (e.g. attribute with generic expanded type
					-- which can be polyphormic with 'EXP [INTEGER]' conforming to 'EXP [ANY]').
				Result := True
			elseif item_type_set.has_expanded then
					-- Reference attribute which may be attached to an object with copy semantics.
				Result := True
			end
		end

feature {NONE} -- Implementation

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
			-- Run-time query associated with `a_query';
			-- Create a new object at each call.
		local
			l_result_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			Result := precursor (a_query, a_system)
			if Result.is_builtin_special_item then
				l_result_type_set := Result.result_type_set
				if l_result_type_set /= Void and then l_result_type_set.static_type = item_type_set.static_type then
					Result.set_result_type_set (item_type_set)
				end
			end
		end

	new_dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
			-- Run-time procedure associated with `a_procedure';
			-- Create a new object at each call.
		local
			l_procedure_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
		do
			Result := precursor (a_procedure, a_system)
			if Result.is_builtin_special_put or Result.is_builtin_special_extend then
				l_procedure_type_sets := Result.dynamic_type_sets
				nb := l_procedure_type_sets.count
				create l_dynamic_type_sets.make_with_capacity (nb)
				l_dynamic_type_sets.put_last (item_type_set)
				from i := 2 until i > nb loop
					l_dynamic_type_sets.put_last (l_procedure_type_sets.item (i))
					i := i + 1
				end
				Result.set_dynamic_type_sets (l_dynamic_type_sets)
			end
		end

invariant

	item_type_set_not_void: item_type_set /= Void

end
