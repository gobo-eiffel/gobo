note

	description:

		"Eiffel dynamic SPECIAL types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SPECIAL_TYPE

inherit

	ET_DYNAMIC_TYPE
		rename
			make as make_type
		redefine
			is_special, has_nested_reference_attributes,
			new_dynamic_query, new_dynamic_procedure
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

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

	has_nested_reference_attributes: BOOLEAN
			-- Does current type contain attributes whose types are declared of reference type,
			-- or recursively does it contain expanded attributes whose type contains attributes
			-- of reference type?
		do
			if has_reference_attributes then
				Result := True
			else
					-- Look at the attributes of the types of expanded items.
					--
					-- We should not have cyclic recursive enclosed expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				if item_type_set.static_type.has_nested_reference_attributes then
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

feature {NONE} -- Implementation

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
			-- Run-time query associated with `a_query';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			Result := precursor (a_query, a_system)
			l_name := a_query.name
			if l_name.same_feature_name (tokens.item_feature_name) then
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
			l_name: ET_FEATURE_NAME
			l_procedure_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
		do
			Result := precursor (a_procedure, a_system)
			l_name := a_procedure.name
			if l_name.same_feature_name (tokens.put_feature_name) or l_name.same_feature_name (tokens.extend_feature_name) then
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
