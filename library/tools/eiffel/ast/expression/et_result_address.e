indexing

	description:

		"Eiffel addresses of Result"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_RESULT_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (d: like dollar; r: like result_entity) is
			-- Create a new address of Result.
		require
			d_not_void: d /= Void
			r_not_void: r /= Void
		do
			dollar := d
			result_entity := r
		ensure
			dollar_set: dollar = d
			result_entity_set: result_entity = r
		end

feature -- Access

	result_entity: ET_RESULT
			-- Result entity

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := result_entity.break
		end

invariant

	result_entity_not_void: result_entity /= Void

end -- class ET_RESULT_ADDRESS
