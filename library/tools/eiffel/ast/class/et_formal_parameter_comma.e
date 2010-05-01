note

	description:

		"Eiffel formal generic parameters followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_COMMA

inherit

	ET_FORMAL_PARAMETER_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_formal: like formal_parameter; a_comma: like comma) is
			-- Create a new formal_parameter-comma.
		require
			a_formal_not_void: a_formal /= Void
			a_comma_not_void: a_comma /= Void
		do
			formal_parameter := a_formal
			comma := a_comma
		ensure
			formal_parameter_set: formal_parameter = a_formal
			comma_set: comma = a_comma
		end

feature -- Access

	formal_parameter: ET_FORMAL_PARAMETER
			-- Formal generic parameter in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := formal_parameter.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := formal_parameter.first_leaf
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

	resolved_formal_parameters_with_type (a_type: ET_TYPE): ET_ACTUAL_PARAMETER_ITEM is
			-- Version of current actual parameter where its type
			-- is replaced by `a_type'
		do
			if a_type /= formal_parameter then
				create {ET_ACTUAL_PARAMETER_COMMA} Result.make (a_type, comma)
			else
				Result := Current
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_parameter_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
