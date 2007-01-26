indexing

	description:

		"Eiffel addresses of Result"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_RESULT_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new address of 'Result'.
		do
			dollar := tokens.dollar_symbol
			result_keyword := tokens.result_keyword
		end

feature -- Access

	result_keyword: ET_RESULT
			-- 'Result' keyword

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := result_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := result_keyword.break
		end

feature -- Setting

	set_result_keyword (a_result: like result_keyword) is
			-- Set `result_keyword' to `a_keyword'.
		require
			a_result_not_void: a_result /= Void
		do
			result_keyword := a_result
		ensure
			result_keyword_set: result_keyword = a_result
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_result_address (Current)
		end

invariant

	result_keyword_not_void: result_keyword /= Void

end
