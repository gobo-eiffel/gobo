indexing

	description:

		"Grammar symbols. For details about symbols, %
		%see $GOBO\doc\geyacc\symbols.html"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class PR_SYMBOL

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_name: like name) is
			-- Create a new symbol named `a_name'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: not a_name.empty
		do
			id := an_id
			name := a_name
		ensure
			id_set: id = an_id
			name_set: name = a_name
		end

feature -- Status report

	is_terminal: BOOLEAN is
			-- Is current symbol terminal?
		deferred
		end

feature -- Access

	name: STRING
			-- Symbol name

	id: INTEGER
			-- Internal symbol id used in generated tables
			-- (Symbols are indexed from 0.)

invariant

	valid_id: id >= 0
	name_not_void: name /= Void
	name_long_enough: not name.empty

end -- class PR_SYMBOL
