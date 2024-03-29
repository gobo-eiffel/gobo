﻿note

	description:

		"Eiffel debug instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_DEBUG_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			has_inline_separate_instruction,
			nested_instruction_count
		end

create

	make

feature {NONE} -- Initialization

	make (a_keys: like keys; a_compound: like compound)
			-- Create a new debug instruction.
		do
			keys := a_keys
			compound := a_compound
			end_keyword := tokens.end_keyword
		ensure
			keys_set: keys = a_keys
			compound_set: compound = a_compound
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			if attached compound as l_compound then
				l_compound.reset
			end
		end

feature -- Access

	compound: detachable ET_COMPOUND
			-- Debug instructions

	keys: detachable ET_MANIFEST_STRING_LIST
			-- Debug keys

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		local
			a_debug_keyword: ET_KEYWORD
		do
			if attached compound as l_compound then
				a_debug_keyword := l_compound.keyword
				if not a_debug_keyword.position.is_null then
					Result := a_debug_keyword.position
				elseif attached keys as l_keys then
					Result := l_keys.position
				elseif not l_compound.is_empty then
					Result := l_compound.item (1).position
				else
					Result := end_keyword.position
				end
			elseif attached keys as l_keys then
				Result := l_keys.position
			else
				Result := end_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached compound as l_compound then
				Result := l_compound.keyword
			elseif attached keys as l_keys then
				Result := l_keys.first_leaf
			else
				Result := end_keyword
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := attached compound as l_compound and then l_compound.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := attached compound as l_compound and then l_compound.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := attached compound as l_compound and then l_compound.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := attached compound as l_compound and then l_compound.has_typed_object_test
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current instruction or
			-- (recursively) in one of its subinstructions?
		do
			Result := attached compound as l_compound and then l_compound.has_inline_separate_instruction
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current instruction and
			-- (recursively) in its subinstructions?
		do
			if attached compound as l_compound then
				Result := l_compound.nested_instruction_count
			end
		end

feature -- Setting

	set_keys (a_keys: like keys)
			-- Set `keys' to `a_keys'.
		do
			keys := a_keys
		ensure
			keys_set: keys = a_keys
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
			a_processor.process_debug_instruction (Current)
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end
