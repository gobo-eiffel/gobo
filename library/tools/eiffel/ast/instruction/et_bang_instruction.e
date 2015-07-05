note

	description:

		"Eiffel bang creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BANG_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_target: like target; a_call: like creation_call)
			-- Create a new bang creation instruction.
		require
			a_target_not_void: a_target /= Void
		do
			type := a_type
			target := a_target
			creation_call := a_call
			left_bang := tokens.bang_symbol
			right_bang := tokens.bang_symbol
		ensure
			type_set: type = a_type
			target_set: target = a_target
			creation_call_set: creation_call = a_call
		end

feature -- Access

	left_bang: ET_SYMBOL
			-- Left '!' symbol

	type: detachable ET_TYPE
			-- Creation type

	right_bang: ET_SYMBOL
			-- Right '!' symbol

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not left_bang.position.is_null then
				Result := left_bang.position
			elseif attached type as l_type then
				Result := l_type.position
			else
				Result := target.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_bang
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached creation_call as l_creation_call then
				Result := l_creation_call.last_leaf
			else
				Result := target.last_leaf
			end
		end

feature -- Setting

	set_left_bang (a_bang: like left_bang)
			-- Set `left_bang' to `a_bang'.
		require
			a_bang_not_void: a_bang /= Void
		do
			left_bang := a_bang
		ensure
			left_bang_set: left_bang = a_bang
		end

	set_right_bang (a_bang: like right_bang)
			-- Set `right_bang' to `a_bang'.
		require
			a_bang_not_void: a_bang /= Void
		do
			right_bang := a_bang
		ensure
			right_bang_set: right_bang = a_bang
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_bang_instruction (Current)
		end

invariant

	left_bang_not_void: left_bang /= Void
	right_bang_not_void: right_bang /= Void

end
