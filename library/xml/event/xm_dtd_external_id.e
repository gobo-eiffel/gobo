indexing

	description:

		"External identifiers in DTD"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_EXTERNAL_ID

creation 

	make

feature {NONE} -- Initialization

	make is
			-- Do nothing.
		do
		end

feature -- Access

	base: STRING
			-- Base URI

	system_id: STRING
			-- SYSTEM

	public_id: STRING
			-- PUBLIC

feature -- Setting

	set_base (a_base: like base) is
			-- Set base URI.
		do
			base := a_base
		ensure
			base_set: base = a_base
		end

	set_system (a_system_id: like system_id) is
			-- Set SYSTEM.
		do
			system_id := a_system_id
		ensure
			system_id_set: system_id = a_system_id
		end

	set_public (a_public_id: like public_id) is
			-- Set PUBLIC.
		do
			public_id := a_public_id
		ensure
			public_id_set: public_id = a_public_id
		end

end
