indexing

	description:

		"Finite State Machine transitions"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_TRANSITION

inherit

	DS_NESTED_LIST [PR_TOKEN]
		rename
			local_items as following_tokens,
			remote_items as included_tokens
		end

creation

	make

feature {NONE} -- Initialization

	make (a_source: like source; a_target: like target) is
			-- Create a new transition from 
			-- `a_source' to `a_target'.
		require
			a_source_not_void: a_source /= Void
			a_target_not_void: a_target /= Void
		do
			source := a_source
			target := a_target
			!! following_tokens.make
			!! included_tokens.make
		ensure
			source_set: source = a_source
			target_set: target = a_target
		end

feature -- Access

	source, target: PR_STATE
			-- Source and target of current transition

	symbol: PR_SYMBOL is
			-- Transition symbol
		do
			Result := target.accessing_symbol
		ensure
			symbol_not_void: Result /= Void
		end

	following_tokens: DS_LINKED_LIST [PR_TOKEN]
			-- Tokens which can be accepted after `target'
			-- state has been reached

	included_tokens: DS_LINKED_LIST [PR_TRANSITION]
			-- Transitions whose `following_tokens' may
			-- also follow current transition

invariant

	source_not_void: source /= Void
	target_not_void: target /= Void
	no_void_following_tokens: not following_tokens.has (Void)
	no_void_included_tokens: not included_tokens.has (Void)

end -- class PR_TRANSITION
