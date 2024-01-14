note

	description:

		"Eiffel actual generic parameters followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"

class ET_ACTUAL_PARAMETER_COMMA

inherit

	ET_ACTUAL_PARAMETER_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_parameter: like actual_parameter; a_comma: like comma)
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

	type: ET_TYPE
			-- Type of `actual_parameter'
		do
			Result := actual_parameter.type
		end

	label: detachable ET_IDENTIFIER
			-- Label of `actual_parameter';
			-- Useful when part of a labeled tuple, Void if no label
		do
			Result := actual_parameter.label
		end

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := actual_parameter.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := actual_parameter.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Type processing

	resolved_formal_parameters_with_type (a_type: ET_TYPE): ET_ACTUAL_PARAMETER_COMMA
			-- Version of current actual parameter where its type
			-- is replaced by `a_type'
		local
			a_parameter: ET_ACTUAL_PARAMETER
		do
			a_parameter := actual_parameter.resolved_formal_parameters_with_type (a_type)
			if a_parameter /= actual_parameter then
				create Result.make (a_parameter, comma)
			else
				Result := Current
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_actual_parameter_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
