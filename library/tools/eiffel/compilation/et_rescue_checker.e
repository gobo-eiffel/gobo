indexing

	description:

		"Eiffel Rescue clause validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
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
		do
				-- The Precursor instruction does not appear in a Routine_body.
			set_fatal_error
			error_handler.report_vdpr1a_error (current_feature.implementation_class, an_instruction)
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		do
			-- Retry instructions valid in Rescue clauses.
		end

end
