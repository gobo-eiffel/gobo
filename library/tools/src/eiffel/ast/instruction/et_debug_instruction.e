note

	description:

		"Eiffel debug instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DEBUG_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
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
