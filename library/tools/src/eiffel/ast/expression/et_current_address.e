note

	description:

		"Eiffel addresses of Current"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CURRENT_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION
		redefine
			is_instance_free
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new address of 'Current'.
		do
			dollar := tokens.dollar_symbol
			current_keyword := tokens.current_keyword
		end

feature -- Access

	current_keyword: ET_CURRENT
			-- 'Current' keyword

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := current_keyword
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := False
		end

feature -- Setting

	set_current_keyword (a_current: like current_keyword)
			-- Set `current_keyword' to `a_current'.
		require
			a_current_not_void: a_current /= Void
		do
			current_keyword := a_current
		ensure
			current_keyword_set: current_keyword = a_current
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_current_address (Current)
		end

invariant

	current_keyword_not_void: current_keyword /= Void

end
