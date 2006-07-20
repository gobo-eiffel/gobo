indexing

	description:

		"Built-in groups of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BUILTIN_GROUP

inherit

	ET_GROUP

create

	make

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new built-in group.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Status report

	is_override: BOOLEAN is False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

	is_read_only: BOOLEAN is True
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)

feature -- Access

	name: STRING
			-- Name

	pathname: STRING is
			-- Directory pathname (may be Void)
		do
		end

feature -- Nested

	parent: ET_GROUP is
			-- Parent group
		do
			-- Result := Void
		end

end
