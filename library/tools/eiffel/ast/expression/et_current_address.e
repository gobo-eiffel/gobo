indexing

	description:

		"Eiffel addresses of Current"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 199-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CURRENT_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (d: like dollar; c: like current_entity) is
			-- Create a new address of Current.
		require
			d_not_void: d /= Void
			c_not_void: c /= Void
		do
			dollar := d
			current_entity := c
		ensure
			dollar_set: dollar = d
			current_entity_set: current_entity = c
		end

feature -- Access

	current_entity: ET_CURRENT
			-- Current entity

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := current_entity.break
		end

invariant

	current_entity_not_void: current_entity /= Void

end
