note

	description:

	"[
		Eiffel actual generic parameters of a Tuple-type-unfolded form of a type,
		of the form:
		    PROCEDURE -> PROCEDURE [TUPLE]
		where the original class type had no actual generic parameters.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2017, Eric Bezault and others"
	license: "MIT License"

class ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS

inherit

	ET_ACTUAL_PARAMETERS
		redefine
			folded_actual_parameters
		end

create

	make

feature {NONE} -- Initialization

	make (a_tuple_type: ET_TUPLE_TYPE)
			-- Create an unfolded empty tuple actual generic parameters.
		require
			a_tuple_type_not_void: a_tuple_type /= Void
		do
			tuple_type := a_tuple_type
		ensure
			tuple_type_set: tuple_type = a_tuple_type
		end

feature -- Measurement

	count: INTEGER = 1
			-- Number of actual parameters

feature -- Access

	tuple_type: ET_TUPLE_TYPE
			-- Tuple type which has been unfolded

	actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- Actual parameter of `i'-th item in list
		do
			Result := tuple_type
		end

	type (i: INTEGER): ET_TYPE
			-- Type of `i'-th item in list
		do
			Result := tuple_type
		end

	folded_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			-- Actual parameters as they were when last parsed
		do
			Result := Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := tuple_type.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := tuple_type.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := tuple_type.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_unfolded_empty_tuple_actual_parameters (Current)
		end

invariant

	tuple_tye_not_void: tuple_type /= Void

end
