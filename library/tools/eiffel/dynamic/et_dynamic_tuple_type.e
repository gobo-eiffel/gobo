indexing

	description:

		"Eiffel dynamic TUPLE types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TUPLE_TYPE

inherit

	ET_DYNAMIC_TYPE
		rename
			make as make_type
		redefine
			new_dynamic_query, new_dynamic_procedure
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class; an_item_type_sets: like item_type_sets) is
			-- Create a new TUPLE type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
			an_item_type_sets_not_void: an_item_type_sets /= Void
		do
			item_type_sets := an_item_type_sets
			make_type (a_type, a_class)
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
			item_type_sets_set: item_type_sets = an_item_type_sets
		end

feature -- Access

	item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Type sets of items

feature {NONE} -- Implementation

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time query associated with `a_query';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
		do
			Result := precursor (a_query, a_system)
			l_name := a_query.name
			if l_name.same_feature_name (tokens.item_feature_name) or l_name.same_feature_name (tokens.infix_at_feature_name) or l_name.same_feature_name (tokens.reference_item_feature_name) then
				a_system.dynamic_type_set_builder.build_tuple_item (Current, Result)
			end
		end

	new_dynamic_procedure (a_procedure: ET_PROCEDURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time procedure associated with `a_procedure';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
		do
			Result := precursor (a_procedure, a_system)
			l_name := a_procedure.name
			if l_name.same_feature_name (tokens.put_feature_name) or l_name.same_feature_name (tokens.put_reference_feature_name) then
				a_system.dynamic_type_set_builder.build_tuple_put (Current, Result)
			end
		end

invariant

	item_type_sets_not_void: item_type_sets /= Void

end
