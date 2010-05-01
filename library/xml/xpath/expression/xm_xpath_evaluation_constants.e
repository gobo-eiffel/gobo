note

	description:

		"Constants for determining XPath evaluation method"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EVALUATION_CONSTANTS

feature -- Access

	Evaluation_method_undecided: INTEGER is 0
			-- Evaluation method not yet determined

	No_evaluation_needed: INTEGER is 1
			-- Expression is already a value

	Call_evaluate_variable: INTEGER is 2
			-- Call `evaluate_variable'

	Call_evaluate_item: INTEGER is 3
			-- Call `evaluate_item'

	Evaluate_and_materialize_variable: INTEGER is 4
			-- Evaluate variable then materialize it

	Iterate_and_materialize: INTEGER is 5
			-- Call `create_iterator' then materialize sequence

	Create_empty_sequence: INTEGER is 6
			-- Evaluate as ()
	
	Call_generate_events: INTEGER is 7
			-- Call `generate_events' to write to current receiver

			-- The following are only returned for lazy evaluation:
	
	Evaluate_as_lazy_tail_expression: INTEGER is 8
			-- Evaluate a lzay tail expression

	Create_closure: INTEGER is 9
			-- Create an XM_XPATH_CLOSURE

	Create_memo_closure: INTEGER is 10
			-- Create an XM_XPATH_MEMO_CLOSURE

end
