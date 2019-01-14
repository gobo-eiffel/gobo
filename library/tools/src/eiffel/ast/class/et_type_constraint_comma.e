note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		followed by a comma.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TYPE_CONSTRAINT_COMMA

inherit

	ET_TYPE_CONSTRAINT_ITEM
		redefine
			renames
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_constraint: like type_constraint; a_comma: like comma)
			-- Create a new type_constraint-comma.
		require
			a_type_constraint_not_void: a_type_constraint /= Void
			a_comma_not_void: a_comma /= Void
		do
			type_constraint := a_type_constraint
			comma := a_comma
		ensure
			type_constraint_set: type_constraint = a_type_constraint
			comma_set: comma = a_comma
		end

feature -- Access

	type_constraint: ET_TYPE_CONSTRAINT
			-- Type constraint pe in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	type: ET_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform
		do
			Result := type_constraint.type
		end

	renames: detachable ET_CONSTRAINT_RENAME_LIST
			-- Rename clause to be applied to the features of `type'
		do
			Result := type_constraint.renames
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := type_constraint.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := type_constraint.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Setting

	set_type_constraint (a_type_constraint: like type_constraint)
			-- Set `type_constraint' to `a_type_constraint'.
		require
			a_type_constraint_not_void: a_type_constraint /= Void
		do
			type_constraint := a_type_constraint
		ensure
			type_constraint_set: type_constraint = a_type_constraint
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_type_constraint_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
