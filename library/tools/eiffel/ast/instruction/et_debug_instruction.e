indexing

	description:

		"Eiffel debug instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
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

	make (a_keys: like keys; a_compound: like compound) is
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

	reset is
			-- Reset instruction as it was when it was first parsed.
		do
			if compound /= Void then
				compound.reset
			end
		end

feature -- Access

	compound: ET_COMPOUND
			-- Debug instructions

	keys: ET_MANIFEST_STRING_LIST
			-- Debug keys

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		local
			a_debug_keyword: ET_KEYWORD
		do
			if compound /= Void then
				a_debug_keyword := compound.keyword
				if not a_debug_keyword.position.is_null then
					Result := a_debug_keyword.position
				elseif keys /= Void then
					Result := keys.position
				elseif not compound.is_empty then
					Result := compound.item (1).position
				else
					Result := end_keyword.position
				end
			elseif keys /= Void then
				Result := keys.position
			else
				Result := end_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if compound /= Void then
				Result := compound.keyword
			elseif keys /= Void then
				Result := keys.first_leaf
			else
				Result := end_keyword
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Setting

	set_keys (a_keys: like keys) is
			-- Set `keys' to `a_keys'.
		do
			keys := a_keys
		ensure
			keys_set: keys = a_keys
		end

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_debug_instruction (Current)
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end
