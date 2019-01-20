note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		which is a base type.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BASE_TYPE_CONSTRAINT

inherit

	ET_CONSTRAINT_BASE_TYPES

	ET_TYPE_CONSTRAINT
		redefine
			type_constraint,
			type
		end

feature -- Access

	type_constraint (i: INTEGER): ET_BASE_TYPE_CONSTRAINT
			-- `i'-th type constraint
		do
			Result := Current
		end

	type: ET_BASE_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform
		deferred
		ensure then
			is_named_type: Result.is_named_type
		end

end
