note

	description:

		"Eiffel dynamic ROUTINE types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_ROUTINE_TYPE

inherit

	ET_DYNAMIC_PRIMARY_TYPE
		redefine
			is_agent_type
		end

feature -- Status report

	is_agent_type: BOOLEAN = True
			-- Is current type an agent type?

feature -- Access

	open_operand_tuple_type_set: detachable ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of the tuple passed as argument of the built-in
			-- features 'PROCEDURE.call' or 'FUNCTION.item' if known

	open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Type sets of open operands

	result_type_set: detachable ET_DYNAMIC_TYPE_SET
			-- Type set of result, if any
		deferred
		end

	set_rout_disp_final_feature: detachable ET_DYNAMIC_FEATURE
			-- Expected procedure 'set_rout_disp_final' in class "ROUTINE"

feature -- Setting

	set_set_rout_disp_final_feature (a_feature: like set_rout_disp_final_feature)
			-- Set `set_rout_disp_final_feature' to `a_feature'
		do
			set_rout_disp_final_feature := a_feature
		ensure
			set_rout_disp_final_feature_set: set_rout_disp_final_feature = a_feature
		end

invariant

	open_operand_type_sets_not_void: open_operand_type_sets /= Void

end
