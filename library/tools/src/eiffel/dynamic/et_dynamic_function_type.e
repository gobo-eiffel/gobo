note

	description:

		"Eiffel dynamic FUNCTION types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_FUNCTION_TYPE

inherit

	ET_DYNAMIC_ROUTINE_TYPE
		rename
			make as make_type
		redefine
			new_dynamic_query
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class; an_open_operand_type_sets: like open_operand_type_sets; a_result_type_set: like result_type_set)
			-- Create a new FUNCTION type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
			an_open_operand_type_sets_not_void: an_open_operand_type_sets /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
		do
			open_operand_type_sets := an_open_operand_type_sets
			result_type_set := a_result_type_set
			make_type (a_type, a_class)
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

	new_dynamic_query (a_query: ET_QUERY; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE
			-- Run-time query associated with `a_query';
			-- Create a new object at each call.
		local
			l_result_type_set: detachable ET_DYNAMIC_TYPE_SET
		do
			Result := precursor (a_query, a_system)
			if Result.builtin_class_code = tokens.builtin_function_class and then Result.builtin_feature_code = tokens.builtin_function_item then
				a_system.dynamic_type_set_builder.build_agent_call (Current, Result)
				l_result_type_set := Result.result_type_set
				if l_result_type_set /= Void and then l_result_type_set.static_type = result_type_set.static_type then
					Result.set_result_type_set (result_type_set)
				end
				open_operand_tuple_type_set := Result.argument_type_set (1)
			end
		end

invariant

	is_function: result_type_set /= Void

end
