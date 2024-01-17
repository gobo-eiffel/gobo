note

	description:

		"Eiffel argument or target components appearing in feature calls or agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_OPERAND

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset operand as it was just after it was last parsed.
		do
		end

feature -- Status setting

	is_open_operand: BOOLEAN
			-- Is current operand open?
		do
			-- Result := False
		end

	is_instance_free: BOOLEAN
			-- Does current operand not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := True
		end

	is_current: BOOLEAN
			-- Is current operand the 'Current' entity (possibly parenthesized)?
		do
			-- Result := False
		end

feature -- Access

	index: INTEGER
			-- Index of operand in enclosing feature;
			-- Used to get dynamic information about this expression.

feature -- Setting

	set_index (i: INTEGER)
			-- Set `index' to `i'.
		require
			i_not_negative: i >= 0
		do
			index := i
		ensure
			index_set: index = i
		end

end
