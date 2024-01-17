note

	description:

	"[
		Groups of Eiffel classes which primarily belong to other groups.
		Useful when grouping classes together in favorites in an IDE, e.g.
		classes from different clusters but which should be checked-in
		together in the source control repository.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"

deferred class ET_SECONDARY_GROUP

inherit

	ET_GROUP
		redefine
			is_secondary,
			as_secondary
		end

feature -- Status report

	is_secondary: BOOLEAN = True
			-- Is current group a secondary group?

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

	pathname: detachable STRING
			-- Directory pathname (may be Void)
		do
		end

feature -- Conversion

	as_secondary: ET_SECONDARY_GROUP
			-- Current group viewed as a secondary group
		do
			Result := Current
		end

feature -- Nested

	parent: detachable ET_GROUP
			-- Parent group
		do
			-- Result := Void
		end

end
