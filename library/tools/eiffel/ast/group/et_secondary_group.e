note

	description:

	"[
		Groups of Eiffel classes which primarily belongs to other groups.
		Useful when grouping classes together in favorites in an IDE, e.g.
		classes from different clusters but which should be checked-in
		together in the source control repository.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SECONDARY_GROUP

inherit

	ET_GROUP

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_universe: ET_UNIVERSE)
			-- Create a new secondary group.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			universe := a_universe
		ensure
			name_set: name = a_name
			universe_set: universe = a_universe
		end

feature -- Status report

	is_override: BOOLEAN = False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

	is_read_only: BOOLEAN = True
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)

	is_preparsed: BOOLEAN = True
			-- Has current group already been traversed to look for its classes?

feature -- Access

	name: STRING
			-- Name

	pathname: STRING
			-- Directory pathname (may be Void)
		do
		end

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Nested

	parent: ET_GROUP
			-- Parent group
		do
			-- Result := Void
		end

end
