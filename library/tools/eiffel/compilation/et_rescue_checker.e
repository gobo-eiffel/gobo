indexing

	description:

		"Eiffel Rescue clause validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_RESCUE_CHECKER

inherit

	ET_INSTRUCTION_CHECKER
		redefine
			check_precursor_instruction_validity,
			check_retry_instruction_validity
		end

creation

	make

feature {NONE} -- Instruction validity

	check_precursor_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		local
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
		do
				-- The Precursor instruction does not appear in a Routine_body.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			a_feature_impl := current_feature.implementation_feature
			if current_class = a_class_impl then
				error_handler.report_vdpr1a_error (current_class, an_instruction)
			elseif not a_feature_impl.has_implementation_error then
					-- Internal error: the VDPR-1 error should have been
					-- reported in the implementation feature.
				error_handler.report_giadj_error
			end
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		do
			-- Retry instructions valid in Rescue clauses.
		end

end
