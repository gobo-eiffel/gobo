indexing

	description:

		"Eiffel formal generic parameters followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER_COMMA is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		local
			a_type: ET_TYPE
		do
			a_type := formal_parameter.resolved_formal_parameters (actual_parameters)
			if a_type /= formal_parameter then
				create Result.make (a_type, comma)
			else
				create Result.make (formal_parameter, comma)
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
