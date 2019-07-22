note

	description:

		"Lexical analyzer start conditions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_START_CONDITION

create

	make

feature {NONE} -- Initialization

	make (nm: STRING; i: INTEGER; excl: BOOLEAN)
			-- Create a new start condition named `nm'.
		require
			nm_not_void: nm /= Void
			positive_i: i >= 0
		do
			name := nm
			id := i
			is_exclusive := excl
			create patterns.make (50)
			create bol_patterns.make (50)
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

	patterns: DS_ARRAYED_LIST [LX_NFA]
			-- NFAs active in current start condition

	bol_patterns: DS_ARRAYED_LIST [LX_NFA]
			-- NFAs active in current start condition
			-- only when at beginning of line

feature -- Status report

	is_exclusive: BOOLEAN
			-- Is start condition exclusive?

	has_eof: BOOLEAN
			-- Has start condition an EOF rule?

feature -- Status setting

	set_has_eof (b: like has_eof)
			-- Set `has_eof' to `b'.
		do
			has_eof := b
		ensure
			has_eof_set: has_eof = b
		end

feature -- Element change

	put_nfa (a_nfa: LX_NFA)
			-- Add `a_nfa' to `patterns'.
		require
			a_nfa_not_void: a_nfa /= Void
		do
			patterns.force_last (a_nfa)
		end

	put_bol_nfa (a_nfa: LX_NFA)
			-- Add `a_nfa' to `bol_patterns'.
		require
			a_nfa_not_void: a_nfa /= Void
		do
			bol_patterns.force_last (a_nfa)
		end

	add_nfa (a_nfa: LX_NFA; a_bol: BOOLEAN)
			-- Add `a_nfa' to `patterns' or `bol_patterns'
			-- depending on the value of `a_bol'
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if a_bol then
				put_bol_nfa (a_nfa)
			else
				put_nfa (a_nfa)
			end
		end

invariant

	name_not_void: name /= Void
	positive_id: id >= 0
	patterns_not_void: patterns /= Void
	no_void_pattern: not patterns.has_void
	bol_patterns_not_void: bol_patterns /= Void
	no_void_bol_pattern: not bol_patterns.has_void

end
