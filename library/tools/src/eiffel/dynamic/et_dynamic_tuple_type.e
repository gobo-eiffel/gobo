note

	description:

		"Eiffel dynamic TUPLE types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TUPLE_TYPE

inherit

	ET_DYNAMIC_TYPE
		rename
			make as make_type
		redefine
			is_tuple,
			has_nested_reference_attributes,
			new_dynamic_query, new_dynamic_procedure
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class; an_item_type_sets: like item_type_sets)
			-- Create a new TUPLE type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
			an_item_type_sets_not_void: an_item_type_sets /= Void
		local
			i, nb: INTEGER
			l_item_type: ET_DYNAMIC_TYPE
		do
			item_type_sets := an_item_type_sets
			make_type (a_type, a_class)
			nb := an_item_type_sets.count
			from i := 1 until i > nb loop
				l_item_type := item_type_sets.item (i).static_type
				if not l_item_type.is_expanded then
					has_reference_attributes := True
					if has_generic_expanded_attributes then
							-- Jump out of the loop.
						i := nb + 1
					end
				elseif l_item_type.is_generic then
					has_generic_expanded_attributes := True
					if has_reference_attributes then
							-- Jump out of the loop.
						i := nb + 1
					end
				end
				i := i + 1
			end
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
			item_type_sets_set: item_type_sets = an_item_type_sets
		end

feature -- Access

	item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Type sets of items

feature -- Status report

	is_tuple: BOOLEAN = True
			-- Is current type a TUPLE type?

feature -- Features

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
					-- Look at the attributes of the types of expanded items.
					--
					-- We should not have cyclic recursive enclosed expanded objects.
					-- This is either rejected by Eiffel validity rule (see VLEC in ETL2),
					-- or by another proper handling if ECMA relaxed this rule
					-- (through the introduction of attached types). But in case
					-- such a cyclic recursion has slipped through, we temporarily
					-- set `has_reference_attributes' to True to break that cycle.
				has_reference_attributes := True
				nb := item_type_sets.count
				from i := 1 until i > nb loop
					l_type := item_type_sets.item (i).static_type
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

feature {NONE} -- Implementation

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
			-- Run-time query associated with `a_query';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
		do
			Result := precursor (a_query, a_system)
			l_name := a_query.name
			if not Result.is_builtin and then (l_name.same_feature_name (tokens.item_feature_name) or l_name.same_feature_name (tokens.infix_at_feature_name) or l_name.same_feature_name (tokens.reference_item_feature_name)) then
				a_system.dynamic_type_set_builder.build_tuple_item (Current, Result)
			end
		end

	new_dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
			-- Run-time procedure associated with `a_procedure';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
		do
			Result := precursor (a_procedure, a_system)
			l_name := a_procedure.name
			if not Result.is_builtin and then (l_name.same_feature_name (tokens.put_feature_name) or l_name.same_feature_name (tokens.put_reference_feature_name)) then
				a_system.dynamic_type_set_builder.build_tuple_put (Current, Result)
			end
		end

invariant

	item_type_sets_not_void: item_type_sets /= Void

end
