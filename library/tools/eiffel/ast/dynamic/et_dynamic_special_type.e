indexing

	description:

		"Eiffel dynamic SPECIAL types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SPECIAL_TYPE

inherit

	ET_DYNAMIC_TYPE
		rename
			make as make_type
		redefine
			is_special,
			new_dynamic_feature
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class; an_item_type: ET_DYNAMIC_TYPE) is
			-- Create a new type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
			an_item_type_not_void: an_item_type /= Void
		do
			make_type (a_type, a_class)
			create item_type.make (an_item_type)
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
		end

feature -- Status report

	is_special: BOOLEAN is True
			-- Is current type a SPECIAL type?

feature -- Access

	item_type: ET_NESTED_DYNAMIC_TYPE_SET
			-- Type of items

feature {NONE} -- Implementation

	new_dynamic_feature (a_feature: ET_FEATURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time feature associated with `a_feature';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_result_type: ET_DYNAMIC_TYPE_SET
		do
			create Result.make (a_feature, Current, a_system)
			l_name := a_feature.name
			if l_name.same_feature_name (tokens.put_feature_name) then
				l_dynamic_type_sets := Result.dynamic_type_sets
				if l_dynamic_type_sets.count > 1 and then l_dynamic_type_sets.item (1).static_type = item_type.static_type then
					l_dynamic_type_sets.put (item_type, 1)
				end
			elseif l_name.same_feature_name (tokens.item_feature_name) or l_name.same_feature_name (tokens.infix_at_feature_name) then
				l_result_type := Result.result_type
				if l_result_type /= Void and then l_result_type.static_type = item_type.static_type then
					Result.set_result_type (item_type)
				end
			end
		end

invariant

	item_type_not_void: item_type /= Void

end
