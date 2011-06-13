note

	description:

	"[
		Primary groups of Eiffel classes.
		It means that their classes have been declared in these groups
		or recursively in one of their subgroups.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PRIMARY_GROUP

inherit

	ET_GROUP
		redefine
			is_primary,
			as_primary
		end

feature -- Status report

	is_primary: BOOLEAN = True
			-- Is current group a primary group?

feature -- Conversion

	as_primary: ET_PRIMARY_GROUP
			-- Current group viewed as a primary group
		do
			Result := Current
		end

end
