indexing

	description:

		"Eiffel addresses of features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (d: like dollar; a_name: like name) is
			-- Create a new feature address.
		require
			d_not_void: d /= Void
			a_name_not_void: a_name /= Void
		do
			dollar := d
			name := a_name
		ensure
			dollar_set: dollar = d
			name_set: name = a_name
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

invariant

	name_not_void: name /= Void

end -- class ET_FEATURE_ADDRESS
