note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		and with a rename clause.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2024, Eric Bezault and others"
	license: "MIT License"

class ET_TYPE_RENAME_CONSTRAINT

inherit

	ET_TYPE_CONSTRAINT
		redefine
			renames,
			reset_renames,
			is_formal_parameter
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_renames: like renames)
			-- Create a new type-rename.
		require
			a_type_not_void: a_type /= Void
			a_renames_not_void: a_renames /= Void
		do
			type := a_type
			renames := a_renames
		ensure
			type_set: type = a_type
			renames_set: renames = a_renames
		end

feature -- Initialization

	reset
			-- Reset constraint as it was just after it was last parsed.
		do
			type.reset
			renames.reset
		end

	reset_renames
			-- Reset renames as they were just
			-- after they were last parsed.
		do
			renames.reset
		end

feature -- Access

	type: ET_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform

	renames: ET_CONSTRAINT_RENAME_LIST
			-- Rename clause to be applied to the features of `type'

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := type.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := renames.last_leaf
		end

feature -- Status report

	is_formal_parameter (i: INTEGER): BOOLEAN
			-- Is `type' the `i'-th formal generic parameter of the enclosing class?
		do
			Result := type.is_formal_parameter (i)
		end

	is_named_type: BOOLEAN
			-- Is `type' a named type (only made up of named types)?
		do
			Result := type.is_named_type
		end

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is the type of the current constraint an expanded type when viewed from `a_context'?
		do
			Result := type.is_type_expanded (a_context)
		end

	is_type_attached (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is the type of the current constraint attached when viewed from `a_context'?
		do
			Result := type.is_type_attached (a_context)
		end

	is_type_non_separate (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is one of the constraint types non-separate when viewed from `a_context'?
		do
			Result := type.is_type_non_separate (a_context)
		end

	has_non_separate_reference_attributes (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the type of the current constraint contain attributes whose types are declared
			-- of non-separate reference types when viewed from `a_context'?
			-- True in case of a formal generic parameter because the actual
			-- generic parameter may contain non-separate reference attributes.
		do
			Result := type.has_non_separate_reference_attributes (a_context)
		end

	has_nested_non_separate_reference_attributes (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the type of the current constraint contain non-separate reference attributes
			-- when viewed from `a_context', or recursively does it contain expanded
			-- attributes whose types contain non-separate reference attributes?
		do
			Result := type.has_nested_non_separate_reference_attributes (a_context)
		end

feature -- Setting

	set_type (a_type: like type)
			-- Set `type' to `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_type_rename_constraint (Current)
		end

invariant

	renames_not_void: renames /= Void

end
