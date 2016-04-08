note

	description:

		"Eiffel sublists of actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_PARAMETER_SUBLIST

inherit

	ET_ACTUAL_PARAMETERS

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_actual_parameters: ET_ACTUAL_PARAMETERS; a_lower, a_upper: INTEGER)
			-- Create sublist of `a_actual_parameters' from `a_lower' to `a_upper'.
		require
			a_actual_parameters_not_void: a_actual_parameters /= Void
			valid_lower: a_lower >= 1
			valid_upper: a_upper <= a_actual_parameters.count
			valid_bounds: a_lower <= a_upper + 1
		do
			actual_parameters := a_actual_parameters
			lower := a_lower
			upper := a_upper
		ensure
			actual_parameters_set: actual_parameters = a_actual_parameters
			lower_set: lower = a_lower
			upper_set: upper = a_upper
		end

feature -- Measurement

	count: INTEGER
			-- Number of actual parameters
		do
			Result := upper - lower + 1
		ensure then
			definition: Result = (upper - lower + 1)
		end

feature -- Access

	actual_parameters: ET_ACTUAL_PARAMETERS
			-- Actual parameters from which a sublist is used

	lower: INTEGER
			-- Lower bound in `actual_parameters'

	upper: INTEGER
			-- Upper bound in `actual_parameters'

	actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- Actual parameter of `i'-th item in list
		do
			Result := actual_parameters.actual_parameter (lower + i - 1)
		end

	type (i: INTEGER): ET_TYPE
			-- Type of `i'-th item in list
		do
			Result := actual_parameters.type (lower + i - 1)
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not is_empty then
				Result := actual_parameter (1).position
			else
				Result := tokens.null_position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if not is_empty then
				Result := actual_parameter (1).first_leaf
			else
				Result := tokens.null_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := actual_parameter (count).last_leaf
			else
				Result := tokens.null_leaf
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_actual_parameter_sublist (Current)
		end

invariant

	actual_parameters_not_void: actual_parameters /= Void
	valid_lower: lower >= 1
	valid_upper: upper <= actual_parameters.count
	valid_bounds: lower <= upper + 1
end
