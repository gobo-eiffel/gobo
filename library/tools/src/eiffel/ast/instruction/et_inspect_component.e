note

	description:

		"Eiffel inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INSPECT_COMPONENT

inherit

	ET_AST_NODE

feature -- Access

	conditional: ET_CONDITIONAL
			-- Condition

	expression: ET_EXPRESSION
			-- Inspected expression
		do
			Result := conditional.expression
		ensure
			expression_not_void: Result /= Void
		end

	when_parts: detachable ET_WHEN_COMPONENT_LIST
			-- When parts
		deferred
		end

	else_part: detachable ET_AST_NODE
			-- Else part
		deferred
		end

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := conditional.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := conditional.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

invariant

	conditional_not_void: conditional /= Void
	end_keyword_not_void: end_keyword /= Void

end
