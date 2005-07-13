indexing

	description:

		"Eiffel dynamic FUNCTION types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_FUNCTION_TYPE

inherit

	ET_DYNAMIC_ROUTINE_TYPE
		rename
			make as make_type
		redefine
			new_dynamic_feature
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class; an_open_operand_type_sets: like open_operand_type_sets; a_result_type_set: like result_type_set) is
			-- Create a new FUNCTION type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
			an_open_operand_type_sets_not_void: an_open_operand_type_sets /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		do
			make_type (a_type, a_class)
			open_operand_type_sets := an_open_operand_type_sets
			result_type_set := a_result_type_set
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
			open_operand_type_sets_set: open_operand_type_sets = an_open_operand_type_sets
			result_type_set_set: result_type_set = a_result_type_set
		end

feature -- Access

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type set of result

feature {NONE} -- Implementation

	new_dynamic_feature (a_feature: ET_FEATURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time feature associated with `a_feature';
			-- Create a new object at each call.
		local
			l_name: ET_FEATURE_NAME
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			Result := precursor (a_feature, a_system)
			l_name := a_feature.name
			if l_name.same_feature_name (tokens.call_feature_name) then
				Result.set_builtin_code (tokens.builtin_routine_call)
				a_system.dynamic_type_set_builder.build_agent_call (Current, Result)
			elseif l_name.same_feature_name (tokens.item_feature_name) then
				Result.set_builtin_code (tokens.builtin_function_item)
				a_system.dynamic_type_set_builder.build_agent_call (Current, Result)
				l_result_type_set := Result.result_type_set
				if l_result_type_set /= Void and then l_result_type_set.static_type = result_type_set.static_type then
					Result.set_result_type_set (result_type_set)
				end
			elseif l_name.same_feature_name (tokens.last_result_feature_name) then
				l_result_type_set := Result.result_type_set
				if l_result_type_set /= Void and then l_result_type_set.static_type = result_type_set.static_type then
					Result.set_result_type_set (result_type_set)
				end
			end
		end

invariant

	is_function: result_type_set /= Void

end
