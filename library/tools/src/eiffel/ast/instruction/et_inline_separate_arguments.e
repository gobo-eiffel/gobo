﻿note

	description:

		"Eiffel comma-separated lists of arguments in inline separate instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2024, Eric Bezault and others"
	license: "MIT License"

class ET_INLINE_SEPARATE_ARGUMENTS

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INLINE_SEPARATE_ARGUMENT_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new inline separate argument list.
		do
			separate_keyword := tokens.separate_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new inline separate argument list with capacity `nb'.
		do
			separate_keyword := tokens.separate_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset inline separate arguments as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).argument.reset
				i := i + 1
			end
		end

feature -- Access

	argument (i: INTEGER): ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).argument
		ensure
			argument_not_void: Result /= Void
		end

	separate_keyword: ET_KEYWORD
			-- 'separate' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := separate_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := separate_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := separate_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of the current inline
			-- separate arguments or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).argument.has_result then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of the current inline
			-- separate arguments or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).argument.has_address_expression then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of the current inline
			-- separate arguments or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).argument.has_agent then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in one of the current inline
			-- separate arguments or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).argument.has_typed_object_test then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

feature -- Setting

	set_separate_keyword (a_keyword: like separate_keyword)
			-- Set `separate_keyword' to `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			separate_keyword := a_keyword
		ensure
			separate_keyword_set: separate_keyword = a_keyword
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inline_separate_arguments (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INLINE_SEPARATE_ARGUMENT_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	separate_keyword_not_void: separate_keyword /= Void

end
