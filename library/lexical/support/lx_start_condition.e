indexing

	description:

		"Lexical analyzer start conditions";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_START_CONDITION

creation

	make

feature {NONE} -- Initialization

	make (nm: STRING; i: INTEGER; excl: BOOLEAN) is
			-- Create a new start condition named `nm'.
		require
			nm_not_void: nm /= Void
			positive_i: i >= 0
		do
			name := nm
			id := i
			is_exclusive := excl
			!! start_states.make (50)
			!! bol_start_states.make (50)
		ensure
			name_set: name = nm
			id_set: id = i
			exclusive_set: is_exclusive = excl
		end

feature -- Access

	id: INTEGER
			-- Start condition id

	name: STRING
			-- Name of the start condition

	start_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			-- NFA start states (or corresponding DFA start state)

	bol_start_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			-- NFA start states (or corresponding DFA start state)
			-- only active at beginning of line

feature -- Status report

	is_exclusive: BOOLEAN
			-- Is start condition exclusive?

	has_eof: BOOLEAN
			-- Has start condition an EOF rule?

feature -- Status setting

	set_has_eof (b: like has_eof) is
			-- Set `has_eof' to `b'.
		do
			has_eof := b
		ensure
			has_eof_set: has_eof = b
		end

feature -- Element change

	put_state (state: LX_NFA_STATE) is
			-- Add `state' to NFA start states associated
			-- with current start condition.
		require
			state_not_void: state /= Void
		do
			start_states.force_last (state)
		end

	put_bol_state (state: LX_NFA_STATE) is
			-- Add `state' to NFA start states only active
			-- at beginning of line, associated with current
			-- start condition.
		require
			state_not_void: state /= Void
		do
			bol_start_states.force_last (state)
		end

invariant

	name_not_void: name /= Void
	positive_id: id >= 0
	start_states_not_void: start_states /= Void
	no_void_start_state: not start_states.has (Void)
	bol_start_states_not_void: bol_start_states /= Void
	no_void_bol_start_state: not bol_start_states.has (Void)

end -- class LX_START_CONDITION
