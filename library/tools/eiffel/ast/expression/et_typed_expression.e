indexing

	description:

		"Eiffel typed expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TYPED_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like cast_type; an_expression: like expression) is
			-- Create a new typed expression.
		require
			a_type_not_void: a_type /= Void
			an_expression_not_void: an_expression /= Void
		do
			cast_type := a_type
			expression := an_expression
		ensure
			cast_type_set: cast_type = a_type
			expression_set: expression = an_expression
		end

feature -- Initialization

	reset is
			-- Reset expression as it was when it was first parsed.
		local
			l_convert: ET_CONVERT_EXPRESSION
		do
			type.reset
			l_convert ?= expression
			if l_convert /= Void then
				expression := l_convert.expression
			end
			expression.reset
		end

feature -- Access

	cast_type: ET_TARGET_TYPE
			-- Cast type

	type: ET_TYPE is
			-- Type of expression
		do
			Result := cast_type.type
		ensure
			type_not_void: Result /= Void
		end

	expression: ET_EXPRESSION
			-- Expression casted

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := cast_type.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := cast_type.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := expression.break
		end

feature -- Setting

	set_expression (an_expression: like expression) is
			-- Set `expression' to `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			expression := an_expression
		ensure
			expression_set: expression = an_expression
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_typed_expression (Current)
		end

invariant

	cast_type_not_void: cast_type /= Void
	expression_not_void: expression /= Void

end
