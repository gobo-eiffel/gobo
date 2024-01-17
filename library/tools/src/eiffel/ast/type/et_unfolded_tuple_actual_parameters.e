note

	description:

	"[
		Eiffel actual generic parameters of a Tuple-type-unfolded form of a type.
		For example:
		   PROCEDURE [A] -> PROCEDURE [TUPLE [A]]
		   FUNCTION [A] -> FUNCTION [TUPLE, A]
		   FUNCTION [A, B, C] -> FUNCTION [TUPLE [A, B], C]
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2017, Eric Bezault and others"
	license: "MIT License"

class ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS

inherit

	ET_ACTUAL_PARAMETERS
		redefine
			folded_actual_parameters
		end

create

	make

feature {NONE} -- Initialization

	make (a_actual_parameters: ET_ACTUAL_PARAMETERS; a_tuple_type: ET_TUPLE_TYPE; a_tuple_position: INTEGER)
			-- Create an unfolded tuple version of `a_actual_parameters',
			-- with `a_tuple_type' at position `a_tuple_position' in the
			-- new list of actual parameters.
		require
			a_actual_parameters_not_void: a_actual_parameters /= Void
			a_tuple_type_not_void: a_tuple_type /= Void
			tuple_position_large_enough: a_tuple_position >= 1
			tuple_position_small_enough: a_tuple_position <= a_actual_parameters.count - a_tuple_type.actual_parameter_count + 1
		do
			actual_parameters := a_actual_parameters
			tuple_type := a_tuple_type
			tuple_position := a_tuple_position
			count := a_actual_parameters.count - a_tuple_type.actual_parameter_count + 1
		ensure
			actual_parameters_set: actual_parameters = a_actual_parameters
			tuple_type_set: tuple_type = a_tuple_type
			tuple_position_set: tuple_position = a_tuple_position
			count_set: count = a_actual_parameters.count - a_tuple_type.actual_parameter_count + 1
		end

feature -- Measurement

	count: INTEGER
			-- Number of actual parameters

feature -- Access

	actual_parameters: ET_ACTUAL_PARAMETERS
			-- Actual parameters from which the current parameters are unfolded

	folded_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			-- Actual parameters as they were when last parsed
		do
			Result := actual_parameters.folded_actual_parameters
		end

	tuple_position: INTEGER
			-- Position of the tuple type is the new list of actual parameters

	tuple_type: ET_TUPLE_TYPE
			-- Tuple type which has been unfolded out of `actual_parameters'

	actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- Actual parameter of `i'-th item in list
		do
			if i < tuple_position then
				Result := actual_parameters.actual_parameter (i)
			elseif i = tuple_position then
				Result := tuple_type
			else
				Result := actual_parameters.actual_parameter (i + actual_parameters.count - count)
			end
		end

	type (i: INTEGER): ET_TYPE
			-- Type of `i'-th item in list
		do
			if i < tuple_position then
				Result := actual_parameters.type (i)
			elseif i = tuple_position then
				Result := tuple_type
			else
				Result := actual_parameters.type (i + actual_parameters.count - count)
			end
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := actual_parameters.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := actual_parameters.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := actual_parameters.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_unfolded_tuple_actual_parameters (Current)
		end

invariant

	actual_parameters_not_void: actual_parameters /= Void
	tuple_tye_not_void: tuple_type /= Void
	count_definition: count = actual_parameters.count - tuple_type.actual_parameter_count + 1
	tuple_position_large_enough: tuple_position >= 1
	tuple_position_small_enough: tuple_position <= count
	at_least_one: count > 0

end
