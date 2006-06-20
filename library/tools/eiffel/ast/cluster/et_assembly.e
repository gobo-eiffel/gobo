indexing

	description:

		".NET Assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSEMBLY

inherit

	ET_GROUP
		redefine
			is_assembly
		end

feature -- Status report

	is_assembly: BOOLEAN is True
			-- Is current group an assembly?

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

	class_prefix: STRING is
			-- Prefix for classnames of current assembly
			-- (may be Void)
		deferred
		end

feature -- Nested

	parent: ET_ASSEMBLY is
			-- Parent group
		do
			-- Result := Void
		end

end
