indexing

	description:

		"External identifier in DTD"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_EXTERNAL_ID

creation 

	make

feature {NONE} -- Creation

	make is
			-- Do nothing.
		do
		end

feature -- Access

	base: UC_STRING
			-- Base URI

	system_id: UC_STRING
			-- SYSTEM

	public_id: UC_STRING
			-- PUBLIC

feature -- Set

	set_base (a: like base) is
			-- Set base URI.
		do
			base := a
		ensure
			set: base = a
		end

	set_system (a: like system_id) is
			-- Set SYSTEM
		do
			system_id := a
		ensure
			set: system_id = a
		end

	set_public (a: like public_id) is
			-- Set PUBLIC
		do
			public_id := a
		ensure
			set: public_id = a
		end

end
