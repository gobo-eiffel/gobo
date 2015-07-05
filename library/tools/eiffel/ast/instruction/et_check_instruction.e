note

	description:

		"Eiffel check instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CHECK_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

	ET_ASSERTIONS
		redefine
			make, make_with_capacity,
			reset
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new check instruction.
		do
			check_keyword := tokens.check_keyword
			end_keyword := tokens.end_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new check instruction with capacity `nb'.
		do
			check_keyword := tokens.check_keyword
			end_keyword := tokens.end_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset check instruction as it was just after it was last parsed.
		do
			precursor {ET_ASSERTIONS}
			if attached then_compound as l_then_compound then
				l_then_compound.reset
			end
		end

feature -- Access

	check_keyword: ET_KEYWORD
			-- 'check' keyword

	then_compound: detachable ET_COMPOUND
			-- Then part

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := check_keyword.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := check_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Setting

	set_check_keyword (a_check: like check_keyword)
			-- Set `check_keyword' to `a_check'.
		require
			a_check_not_void: a_check /= Void
		do
			check_keyword := a_check
		ensure
			check_keyword_set: check_keyword = a_check
		end

	set_then_compound (a_compound: like then_compound)
			-- Set `then_compound' to `a_compound'.
		do
			then_compound := a_compound
		ensure
			then_compound_set: then_compound = a_compound
		end

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_check_instruction (Current)
		end

invariant

	check_keyword_not_void: check_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end
