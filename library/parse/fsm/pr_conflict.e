indexing

	description:

		"Shift/reduce conflicts"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_CONFLICT

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_state: like state; a_rule: like rule; a_token: like token; a_resolution: like resolution) is
			-- Create a new shift/reduce conflict in `a_state'
			-- between `a_rule' and `a_token' resolved as
			-- `a_resolution'.
		require
			a_state_not_void: a_state /= Void
			a_rule_not_void: a_rule /= Void
			a_token_not_void: a_token /= Void
			a_resultion_not_void: a_resolution /= Void
		do
			state := a_state
			rule := a_rule
			token := a_token
			resolution := a_resolution
		ensure
			state_set: state = a_state
			rule_set: rule = a_rule
			token_set: token = a_token
			resolution_set: resolution = a_resolution
		end

feature -- Access

	state: PR_STATE
			-- State where current conflict occurs

	rule: PR_RULE
			-- Rule involved in current conflict

	token: PR_TOKEN
			-- Token involved in current conflict

	resolution: STRING
			-- How current conflict has been resolved

feature -- Output

	print_conflict (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of
			-- current conflict to `a_file.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("Conflict in state ")
			a_file.put_integer (state.id)
			a_file.put_string (" between rule ")
			a_file.put_integer (rule.id)
			a_file.put_string (" and token ")
			a_file.put_integer (token.id)
			a_file.put_string (" resolved as ")
			a_file.put_string (resolution)
			a_file.put_string (".%N")
		end

invariant

	state_not_void: state /= Void
	rule_not_void: rule /= Void
	token_not_void: token /= Void
	resultion_not_void: resolution /= Void

end -- class PR_CONFLICT
