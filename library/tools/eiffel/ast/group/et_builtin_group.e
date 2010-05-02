note

	description:

		"Built-in groups of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BUILTIN_GROUP

inherit

	ET_GROUP

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

feature -- Nested

	parent: ET_GROUP
			-- Parent group
		do
			-- Result := Void
		end

end
