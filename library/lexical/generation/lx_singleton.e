indexing

	description:

		"Info about DFA states with only one out-transition"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_SINGLETON

creation

	make

feature {NONE} -- Initialization

	make (id, def, symb, targ: INTEGER) is
			-- Create a new single out-transition state info.
		do
			state_id := id
			default_id := def
			symbol := symb
			target_id := targ
		ensure
			state_id_set: state_id = id
			default_id_set: default_id = def
			symbol_set: symbol = symb
			target_id_set: target_id = targ
		end

feature -- Access

	state_id: INTEGER
			-- State id

	symbol: INTEGER
			-- Out-transition label

	target_id: INTEGER
			-- Id of out-transtion destination state

	default_id: INTEGER
			-- Default base entry

end -- class LX_SINGLETON
