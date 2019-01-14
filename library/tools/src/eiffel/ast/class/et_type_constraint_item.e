note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		which appear in a comma-separated list of constraint types.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_CONSTRAINT_ITEM

inherit

	ET_AST_NODE

feature -- Access

	type_constraint: ET_TYPE_CONSTRAINT
			-- Type constraint in comma-separated list
		deferred
		ensure
			type_constraint_not_void: Result /= Void
		end
		
	type: ET_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform
		deferred
		ensure
			type_not_void: Result /= Void
		end

	renames: detachable ET_CONSTRAINT_RENAME_LIST
			-- Rename clause to be applied to the features of `type'
		do
			-- Result := Void
		end
			
end
