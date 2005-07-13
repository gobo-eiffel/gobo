indexing

	description:

		"Eiffel actual generic parameters followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_PARAMETER_COMMA

inherit

	ET_ACTUAL_PARAMETER_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_parameter: like actual_parameter; a_comma: like comma) is
			-- Create a new actual_parameter-comma.
		require
			a_parameter_not_void: a_parameter /= Void
			a_comma_not_void: a_comma /= Void
		do
			actual_parameter := a_parameter
			comma := a_comma
		ensure
			actual_parameter_set: actual_parameter = a_parameter
			comma_set: comma = a_comma
		end

feature -- Access

	actual_parameter: ET_ACTUAL_PARAMETER
			-- Actual parameter in comma-separated list

	type: ET_TYPE is
			-- Type of `actual_parameter'
		do
			Result := actual_parameter.type
		end

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := actual_parameter.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := actual_parameter.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := comma
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER_COMMA is
			-- Version of current actual parameter where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		local
			a_parameter: ET_ACTUAL_PARAMETER
		do
			a_parameter := actual_parameter.resolved_formal_parameters (a_parameters)
			if a_parameter /= actual_parameter then
				create Result.make (a_parameter, comma)
			else
				Result := Current
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_actual_parameter_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
