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
			has_nested_reference_attributes,
			has_nested_reference_fields,
			has_nested_custom_standard_copy_routine,
			has_nested_custom_standard_is_equal_routine,
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

	has_nested_reference_attributes: BOOLEAN
			-- Does current type contain reference attributes or recursively does it contain
			-- expanded attributes whose type contains reference attributes?
		do
			if has_reference_attributes then
				Result := True
			else
					-- Look for reference attributes in the types of expanded attributes, if any.
					--
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				if item_type_set.static_type.primary_type.has_nested_reference_attributes then
						-- Note that for expanded types, there is no type other
						-- than itself that conforms to it.
					Result := True
				end
				has_reference_attributes := False
			end
		end

	has_nested_reference_fields: BOOLEAN
			-- Does current type contain reference fields, or recursively does it have
			-- expanded attributes whose types contain reference fields?
		do
			if has_reference_fields then
				Result := True
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
				if item_type_set.static_type.primary_type.has_nested_reference_fields then
						-- Note that for expanded types, there is no type other
						-- than itself that conforms to it.
					Result := True
				end
				has_reference_attributes := False
			end
		end

	has_nested_custom_standard_copy_routine: BOOLEAN
			-- Does current type contains fields, or recursively does it have
			-- expanded attributes which contain fields, which require special
			-- treatment in the implementation of routine 'standard_copy'?
		do
			Result := precursor or has_item_nested_custom_standard_copy_routine
		end

	has_item_nested_custom_standard_copy_routine: BOOLEAN
			-- Does current type contains items, or recursively do they have
			-- expanded attributes which contain fields, which require
			-- special treatment in the implementation of routine 'standard_copy'?
		local
			l_item_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			l_item_type := item_type_set.static_type.primary_type
			if l_item_type.is_expanded then
				if l_item_type.has_redefined_copy_routine then
					Result := True
				elseif l_item_type = Current then
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we have this
					-- test to break that cycle.
				elseif l_item_type.has_nested_custom_standard_copy_routine then
					Result := True
				end
			elseif item_type_set.has_expanded then
					-- Reference attribute which may be attached to an object with copy semantics.
				Result := True
			end
		end

	has_nested_custom_standard_is_equal_routine: BOOLEAN
			-- Does current type contains fields, or recursively does it have
			-- expanded attributes which contain fields, which require special
			-- treatment in the implementation of routine 'standard_is_equal'?
		do
			Result := precursor or has_item_nested_custom_standard_is_equal_routine
		end

	has_item_nested_custom_standard_is_equal_routine: BOOLEAN
			-- Does current type contains items, or recursively do they have
			-- expanded attributes which contain fields, which require special
			-- treatment in the implementation of routine 'standard_is_equal'?
		local
			l_item_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			l_item_type := item_type_set.static_type.primary_type
			if l_item_type.is_expanded then
				if l_item_type.has_redefined_is_equal_routine then
					Result := True
				elseif l_item_type = Current then
					-- We should not have cyclic recursive expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we have this
					-- test to break that cycle.
				elseif l_item_type.has_nested_custom_standard_is_equal_routine then
					Result := True
				end
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
