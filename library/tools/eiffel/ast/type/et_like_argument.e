indexing

	description:

		"Eiffel 'like argument' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_ARGUMENT

inherit

	ET_LIKE_IDENTIFIER
		rename
			make as make_like_identifier
		redefine
			same_syntactical_type, base_type,
			deep_cloned_type, process
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_index: INTEGER) is
			-- Create a new 'like argument' type.
		require
			a_name_not_void: a_name /= Void
			an_index_positive: an_index >= 1
		do
			like_keyword := tokens.like_keyword
			name := a_name
			index := an_index
		ensure
			name_set: name = a_name
			index_set: index = an_index
		end

feature -- Access

	index: INTEGER
			-- Index in the argument list of the
			-- argument associated with current type

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_like: ET_LIKE_ARGUMENT
		do
			a_like ?= other
			if a_like /= Void then
				Result := (a_like.index = index)
			end
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p. 198)
		local
			a_routine: ET_ROUTINE
			args: ET_FORMAL_ARGUMENT_LIST
		do
			a_routine ?= a_feature
			if a_routine /= Void then
				args := a_routine.arguments
				if args = Void or else index > args.count then
-- TODO:
-- ERROR
					Result := Current
				else
						-- `a_type' has been flattened and no
						-- error occurred, so there is no loop in
						-- anchored types.
					Result := args.item (index).type.base_type (a_feature, a_type)
				end
			else
-- TODO:
-- ERROR
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (name, index)
			Result.set_like_keyword (like_keyword)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_like_argument (Current)
		end

invariant

	index_positive: index >= 1

end
