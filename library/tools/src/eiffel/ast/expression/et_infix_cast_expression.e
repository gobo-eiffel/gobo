note

	description:

		"Eiffel expressions changing the target type of infix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"

class ET_INFIX_CAST_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			is_instance_free
		end

create

	make

feature {NONE} -- Initialization

	make (e: like expression; a_type: like type)
			-- Create a new infix cast expression.
		require
			e_not_void: e /= Void
			a_type_not_void: a_type /= Void
		do
			expression := e
			type := a_type
		ensure
			expression_set: expression = e
			type_set: type = a_type
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression to be casted, already converted to the expected type

	type: ET_TYPE
			-- Cast type

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := expression.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := expression.is_instance_free
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_infix_cast_expression (Current)
		end

invariant

	expression_not_void: expression /= Void
	type_not_void: type /= Void

end
