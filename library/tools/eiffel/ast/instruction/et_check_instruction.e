indexing

	description:

		"Eiffel check instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CHECK_INSTRUCTION

inherit

	ET_INSTRUCTION
	ET_ASSERTIONS

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_check: like check_keyword; an_end: like end_keyword) is
			-- Create a new check instruction.
		require
			a_check_not_void: a_check /= Void
			an_end_not_void: an_end /= Void
		do
			check_keyword := a_check
			end_keyword := an_end
			make_ast_list
		ensure
			check_keyword_set: check_keyword = a_check
			end_keyword_set: end_keyword = an_end
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_check: like check_keyword; an_end: like end_keyword; nb: INTEGER) is
			-- Create a new check instruction with capacity `nb'.
		require
			a_check_not_void: a_check /= Void
			an_end_not_void: an_end /= Void
			nb_positive: nb >= 0
		do
			check_keyword := a_check
			end_keyword := an_end
			make_ast_list_with_capacity (nb)
		ensure
			check_keyword_set: check_keyword = a_check
			end_keyword_set: end_keyword = an_end
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	check_keyword: ET_TOKEN
			-- 'check' keyword

	end_keyword: ET_TOKEN
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := check_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_check_instruction (Current)
		end

invariant

	check_keyword_not_void: check_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end
