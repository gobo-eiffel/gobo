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

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_like: like like_keyword; a_name: like name; an_index: INTEGER) is
			-- Create a new 'like argument' type.
		require
			a_like_not_void: a_like /= Void
			a_name_not_void: a_name /= Void
			an_index_positive: an_index >= 1
		do
			like_keyword := a_like
			name := a_name
			index := an_index
		ensure
			like_keyword_set: like_keyword = a_like
			name_set: name = a_name
			index_set: index = an_index
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	name: ET_IDENTIFIER
			-- Name of the argument associated
			-- with current type

	index: INTEGER
			-- Index in the argument list of the
			-- argument associated with current type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := like_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

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

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		do
			Result := False
			an_heir.error_handler.report_vhpr3_error (an_heir, Current)
		end

	check_constraint_validity (a_formal: ET_FORMAL_GENERIC_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of the formal generic
			-- parameter `a_formal' in class `a_class'.
			-- `a_sorter' is used to find possible cycle in
			-- formal generic parameter declaration.
			-- Report errors if not valid.
		do
			Result := False
			a_class.error_handler.report_vcfg3_error (a_class, Current)
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p. 198)
		local
			a_routine: ET_ROUTINE
			args: ET_FORMAL_ARGUMENTS
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
			!! Result.make (like_keyword, name, index)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_space)
			a_string.append_string (name.name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_like_argument (Current)
		end

feature {NONE} -- Constants

	like_space: STRING is "like "
			-- Eiffel keywords

invariant

	like_keyword_not_void: like_keyword /= Void
	name_not_void: name /= Void
	index_positive: index >= 1

end
