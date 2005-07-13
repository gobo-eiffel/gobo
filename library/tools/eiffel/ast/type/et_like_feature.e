indexing

	description:

		"Eiffel 'like feature' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_FEATURE

inherit

	ET_LIKE_IDENTIFIER
		redefine
			reset,
			named_type,
			named_type_has_class,
			is_formal_type,
			has_formal_type,
			has_formal_types,
			same_syntactical_like_feature,
			same_named_bit_type,
			same_named_class_type,
			same_named_formal_parameter_type,
			same_named_tuple_type,
			same_base_bit_type,
			same_base_class_type,
			same_base_formal_parameter_type,
			same_base_tuple_type,
			conforms_from_bit_type,
			conforms_from_class_type,
			conforms_from_formal_parameter_type,
			conforms_from_tuple_type,
			reference_conforms_from_bit_type,
			reference_conforms_from_class_type,
			reference_conforms_from_formal_parameter_type,
			reference_conforms_from_tuple_type
		end

create

	make, make_with_seed

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new 'like name' type.
		require
			a_name_not_void: a_name /= Void
		do
			like_keyword := tokens.like_keyword
			name := a_name
		ensure
			name_set: name = a_name
		end

	make_with_seed (a_name: like name; a_seed: INTEGER) is
			-- Create a new 'like name' type.
		require
			a_name_not_void: a_name /= Void
			a_seed_positive: a_seed >= 0
		do
			like_keyword := tokens.like_keyword
			name := a_name
			seed := a_seed
		ensure
			name_set: name = a_name
			seed_set: seed = a_seed
		end

feature -- Initialization

	reset is
			-- Reset type as it was when it was first parsed.
		local
			an_identifier: ET_IDENTIFIER
		do
			if is_like_argument then
				an_identifier ?= name
				if an_identifier /= Void then
					an_identifier.set_argument (False)
				end
			end
			name.reset
			seed := 0
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	name: ET_FEATURE_NAME
			-- Name of the feature associated with current type

	seed: INTEGER
			-- Feature ID of one of the seeds of the
			-- feature associated with current type;
			-- 0 if not resolved yet

	index: INTEGER is
			-- Index in the argument list of the
			-- feature associated with current type
		require
			is_like_argument: is_like_argument
		do
			Result := name.seed
		ensure
			definition: Result = name.seed
			index_positive: Result >= 1
		end

	base_class (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- in `a_universe' (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					else
						Result := args.item (an_index).type.base_class (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.base_class (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			end
		end

	base_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, or unmatched formal generic parameter if this parameter
			-- is current type.
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					else
						Result := args.item (an_index).type.base_type (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.base_type (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			end
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					else
						Result := args.item (an_index).type.base_type_actual (i, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.base_type_actual (i, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context' in `a_universe'
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					else
						Result := args.item (an_index).type.base_type_actual_parameter (i, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.base_type_actual_parameter (i, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			end
		end

	named_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					else
						Result := args.item (an_index).type.named_type (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.named_type (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := a_universe.unknown_class
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := a_universe.unknown_class
				end
			end
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := seed
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := like_keyword.position
			if Result.is_null then
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := like_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := name.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of the base type of current type
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := 0
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := 0
					else
						Result := args.item (an_index).type.base_type_actual_count (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := 0
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.base_type_actual_count (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := 0
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := 0
				end
			end
		end

feature -- Setting

	set_like_keyword (a_like: like like_keyword) is
			-- Set `like_keyword' to `a_like'.
		require
			a_like_not_void: a_like /= Void
		do
			like_keyword := a_like
		ensure
			like_keyword_set: like_keyword = a_like
		end

feature -- Status report

	is_like_argument: BOOLEAN is
			-- Is this type a 'like argument' (rather than a 'like feature')?
		do
			Result := name.is_argument
		ensure then
			definition: Result = name.is_argument
		end

	is_type_expanded (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type expanded when viewed from
			-- `a_context' in `a_universe'?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.is_type_expanded (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.is_type_expanded (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	has_formal_type (i: INTEGER; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain the formal generic parameter
			-- with index `i' when viewed from `a_context' in `a_universe'?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.has_formal_type (i, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.has_formal_type (i, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context' in `a_universe'?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						-- Result := False
					else
						Result := args.item (an_index).type.has_formal_types (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.has_formal_types (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	is_formal_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type a formal parameter when viewed from `a_context'?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.is_formal_type (a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.is_formal_type (a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context' in `a_universe'?
		local
			a_base_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := (a_class = a_universe.unknown_class)
			elseif is_like_argument then
				a_base_class := a_context.base_class (a_universe)
				seeded_feature := a_base_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := (a_class = a_universe.unknown_class)
					else
						Result := args.item (an_index).type.base_type_has_class (a_class, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := (a_class = a_universe.unknown_class)
				end
			else
				a_base_class := a_context.base_class (a_universe)
				seeded_feature := a_base_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.base_type_has_class (a_class, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := (a_class = a_universe.unknown_class)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := (a_class = a_universe.unknown_class)
				end
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context' in `a_universe'?
		local
			a_base_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := (a_class = a_universe.unknown_class)
			elseif is_like_argument then
				a_base_class := a_context.base_class (a_universe)
				seeded_feature := a_base_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := (a_class = a_universe.unknown_class)
					else
						Result := args.item (an_index).type.named_type_has_class (a_class, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := (a_class = a_universe.unknown_class)
				end
			else
				a_base_class := a_context.base_class (a_universe)
				seeded_feature := a_base_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.named_type_has_class (a_class, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := (a_class = a_universe.unknown_class)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := (a_class = a_universe.unknown_class)
				end
			end
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if other = Current and other_context = a_context then
				Result := True
			else
				Result := other.same_syntactical_like_feature (Current, a_context, other_context, a_universe)
			end
		end

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_named_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_named_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_base_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_base_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_like_feature (other: ET_LIKE_FEATURE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			a_feature: ET_FEATURE
		do
			if other = Current and other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
					-- If they are 'like argument' they should
					-- refer to the same argument.
				if is_like_argument implies other.index = index then
						-- They should refer to the same feature.
					if other.seed = seed then
						Result := True
					else
						a_feature := other_context.base_class (a_universe).seeded_feature (other.seed)
						Result := a_feature /= Void and then a_feature.has_seed (seed)
						if not Result then
							a_feature := a_context.base_class (a_universe).seeded_feature (seed)
							Result := a_feature /= Void and then a_feature.has_seed (other.seed)
						end
					end
				end
			end
		end

	same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_named_bit_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_named_bit_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_named_class_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_named_class_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_named_formal_parameter_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_named_formal_parameter_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_named_tuple_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_named_tuple_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_base_bit_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_base_bit_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_base_class_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_base_class_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_base_formal_parameter_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_base_formal_parameter_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.same_base_tuple_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.same_base_tuple_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.conforms_to_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.conforms_to_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.conforms_from_bit_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.conforms_from_bit_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.conforms_from_class_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.conforms_from_class_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.conforms_from_formal_parameter_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.conforms_from_formal_parameter_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.conforms_from_tuple_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.conforms_from_tuple_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of current type appearing in `a_context'
			-- conform to the reference version `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.reference_conforms_to_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.reference_conforms_to_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.reference_conforms_from_bit_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.reference_conforms_from_bit_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	reference_conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.reference_conforms_from_class_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.reference_conforms_from_class_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	reference_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.reference_conforms_from_formal_parameter_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.reference_conforms_from_formal_parameter_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

	reference_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					args := seeded_feature.arguments
					an_index := index
					if args = Void or else an_index > args.count then
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					else
						Result := args.item (an_index).type.reference_conforms_from_tuple_type (other, other_context, a_context, a_universe)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class (a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						Result := a_query_type.reference_conforms_from_tuple_type (other, other_context, a_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature -- Resolving

	resolve_like_feature (a_seed: INTEGER) is
			-- Resolve current 'like feature' type with `a_seed'.
		require
			a_seed_positive: a_seed > 0
		local
			an_identifier: ET_IDENTIFIER
		do
			seed := a_seed
			name.set_seed (a_seed)
			if is_like_argument then
				an_identifier ?= name
				if an_identifier /= Void then
					an_identifier.set_argument (False)
				end
			end
		ensure
			seed_set: seed = a_seed
			is_like_feature: not is_like_argument
		end

	resolve_like_argument (a_seed, an_index: INTEGER; an_argument_name: ET_IDENTIFIER) is
			-- Resolve current 'like argument' type with
			-- `a_seed' and `an_index'.
		require
			a_seed_positive: a_seed > 0
			an_index_positive: an_index >= 1
			valid_argument_name: an_argument_name = name
		do
			seed := a_seed
			name.set_seed (an_index)
			an_argument_name.set_argument (True)
		ensure
			seed_set: seed = a_seed
			is_like_argument: is_like_argument
			index_set: index = an_index
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
			a_processor.process_like_feature (Current)
		end

invariant

	name_not_void: name /= Void
	seed_positive: seed >= 0

end
