indexing

	description:

		"Grammar symbols. For details about symbols, %
		%see $GOBO\doc\geyacc\symbols.html"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class PR_SYMBOL

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_name: like name; a_type: like type) is
			-- Create a new symbol named `a_name'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_not_void: a_type /= Void
		do
			id := an_id
			name := a_name
			type := a_type
		ensure
			id_set: id = an_id
			name_set: name = a_name
			type_set: type = a_type
		end

feature -- Status report

	is_terminal: BOOLEAN is
			-- Is current symbol terminal?
		deferred
		end

	is_useful: BOOLEAN
			-- Is current symbol useful?

feature -- Access

	name: STRING
			-- Symbol name

	type: PR_TYPE
			-- Symbol type

	id: INTEGER
			-- Internal symbol id used in generated tables
			-- (Symbols are indexed from 0.)

feature -- Status setting

	set_useful (b: BOOLEAN) is
			-- Set `is_useful' to `b'.
		do
			is_useful := b
		ensure
			useful_set: is_useful = b
		end

feature -- Setting

	set_type (a_type: like type) is
			-- Set `a_type' to `type'.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

	set_id (i: INTEGER) is
			-- Set `id' to i'.
		require
			valid_id: i >= 0
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Output

	print_symbol (a_grammar: PR_GRAMMAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of current
			-- symbol to `a_file' with rules where it
			-- appears in `a_grammar'.
		require
			a_grammar_not_void: a_grammar /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		deferred
		end

invariant

	valid_id: id >= 0
	name_not_void: name /= Void
	name_long_enough: name.count > 0
	type_not_void: type /= Void

end -- class PR_SYMBOL
