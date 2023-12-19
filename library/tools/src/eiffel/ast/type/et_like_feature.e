note

	description:

		"Eiffel 'like feature' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_FEATURE

inherit

	ET_LIKE_IDENTIFIER
		redefine
			reset,
			named_type_with_type_mark,
			shallow_named_type_with_type_mark,
			named_type_has_class,
			named_type_is_formal_type,
			add_adapted_base_classes_to_list,
			adapted_base_class_with_named_feature,
			adapted_base_class_with_seeded_feature,
			same_syntactical_like_feature_with_type_marks,
			same_named_class_type_with_type_marks,
			same_named_formal_parameter_type_with_type_marks,
			same_named_tuple_type_with_type_marks,
			same_base_class_type_with_type_marks,
			same_base_formal_parameter_type_with_type_marks,
			same_base_tuple_type_with_type_marks,
			conforms_from_class_type_with_type_marks,
			conforms_from_formal_parameter_type_with_type_marks,
			conforms_from_tuple_type_with_type_marks,
			type_with_type_mark,
			is_type_reference_with_type_mark,
			is_type_detachable_with_type_mark,
			has_unqualified_anchored_type,
			depends_on_qualified_anchored_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name)
			-- Create a new 'like name' type.
		require
			a_name_not_void: a_name /= Void
		do
			type_mark := a_type_mark
			like_keyword := tokens.like_keyword
			name := a_name
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
		end

feature -- Initialization

	reset
			-- Reset type as it was just after it was last parsed.
		do
			if is_like_argument then
				if attached {ET_IDENTIFIER} name as l_identifier then
					l_identifier.set_feature_name (True)
				end
			end
			name.reset
			is_procedure := False
			seed := 0
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	name: ET_FEATURE_NAME
			-- Name of the feature associated with current type

	seed: INTEGER
			-- Feature ID of one of the seeds of the feature associated
			-- with current type or of the feature containing the argument
			-- in case of 'like argument';
			-- 0 if not resolved yet

	index: INTEGER
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

	named_base_class (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.named_base_class (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.named_base_class (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	adapted_base_class_with_named_feature (a_name: ET_CALL_NAME; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint adapted base classes containing
			-- a feature named `a_name' (or any of the constraints if none contains such
			-- feature)
		local
			l_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				l_class := a_context.base_class
				l_index := index
				if attached l_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.adapted_base_class_with_named_feature (a_name, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				l_class := a_context.base_class
				if attached l_class.seeded_query (seed) as l_query then
					Result := l_query.type.adapted_base_class_with_named_feature (a_name, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	adapted_base_class_with_seeded_feature (a_seed: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint adapted base classes containing
			-- a feature with seed `a_seed' (or any of the constraints if none contains
			-- such feature)
		local
			l_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				l_class := a_context.base_class
				l_index := index
				if attached l_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.adapted_base_class_with_seeded_feature (a_seed, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				l_class := a_context.base_class
				if attached l_class.seeded_query (seed) as l_query then
					Result := l_query.type.adapted_base_class_with_seeded_feature (a_seed, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.base_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.base_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	shallow_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.root_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.shallow_base_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.root_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.shallow_base_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.base_type_actual (i, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.base_type_actual (i, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.base_type_actual_parameter (i, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.base_type_actual_parameter (i, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := 0
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.base_type_index_of_label (a_label, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := 0
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.base_type_index_of_label (a_label, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := 0
				end
			end
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.named_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.named_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	shallow_named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `shallow_named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := tokens.unknown_class
			elseif is_like_argument then
				a_class := a_context.root_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.shallow_named_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			else
				a_class := a_context.root_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.shallow_named_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_LIKE_FEATURE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark = type_mark then
				Result := Current
			else
				Result := twin
				Result.set_type_mark (a_type_mark)
			end
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := seed
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached type_mark as l_type_mark and then not l_type_mark.is_implicit_mark and then not l_type_mark.position.is_null then
				Result := l_type_mark.position
			else
				Result := like_keyword.position
			end
			if Result.is_null then
				Result := name.position
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := name.last_leaf
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := 0
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.base_type_actual_count (a_context)

				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := 0
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.base_type_actual_count (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := 0
				end
			end
		end

feature -- Setting

	set_like_keyword (a_like: like like_keyword)
			-- Set `like_keyword' to `a_like'.
		require
			a_like_not_void: a_like /= Void
		do
			like_keyword := a_like
		ensure
			like_keyword_set: like_keyword = a_like
		end

	set_type_mark (a_type_mark: like type_mark)
			-- Set `type_mark' to `a_type_mark'.
		do
			type_mark := a_type_mark
		ensure
			type_mark_set: type_mark = a_type_mark
		end

feature -- Status report

	is_like_argument: BOOLEAN
			-- Is this type a 'like argument' (rather than a 'like feature')?
			-- Note that 'like argument' is not a valid construct in ECMA Eiffel.
			-- This is supported here for backward compatibility.
		do
			Result := name.is_argument
		ensure then
			definition: Result = name.is_argument
		end

	is_procedure: BOOLEAN
			-- Is the feature with seed `seed' a procedure?
			-- Only make sense in case of 'like argument',
			-- otherwise the feature has to be a query.

	is_type_separate_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_separate' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.is_type_separate_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.is_type_separate_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.is_type_attached_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.is_type_attached_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.is_type_detachable_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.is_type_detachable_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	has_non_separate_reference_attributes (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type contain attributes whose types are declared
			-- of non-separate reference types when viewed from `a_context'?
			-- True in case of a formal generic parameter because the actual
			-- generic parameter may contain non-separate reference attributes.
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.has_non_separate_reference_attributes (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.has_non_separate_reference_attributes (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	has_nested_non_separate_reference_attributes (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type contain non-separate reference attributes when
			-- viewed from `a_context', or recursively does it contain expanded
			-- attributes whose types contain non-separate reference attributes?
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.has_nested_non_separate_reference_attributes (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.has_nested_non_separate_reference_attributes (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	has_unqualified_anchored_type: BOOLEAN
			-- Does current type contain an unqualified anchored type
			-- (i.e. 'like Current' or 'like feature_name')?
		do
			Result := True
		end

	depends_on_qualified_anchored_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type depend on a qualified anchored type when
			-- viewed from `a_context' when trying to determine its base type?
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.depends_on_qualified_anchored_type (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.depends_on_qualified_anchored_type (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	named_type_is_formal_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is named type of current type a formal parameter when viewed from `a_context'?
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.named_type_is_formal_type (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.named_type_is_formal_type (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			a_base_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_class.is_unknown
			elseif is_like_argument then
				a_base_class := a_context.base_class
				l_index := index
				if attached a_base_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.base_type_has_class (a_class, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := a_class.is_unknown
				end
			else
				a_base_class := a_context.base_class
				if attached a_base_class.seeded_query (seed) as l_query then
					Result := l_query.type.base_type_has_class (a_class, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := a_class.is_unknown
				end
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			a_base_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_class.is_unknown
			elseif is_like_argument then
				a_base_class := a_context.base_class
				l_index := index
				if attached a_base_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.named_type_has_class (a_class, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := a_class.is_unknown
				end
			else
				a_base_class := a_context.base_class
				if attached a_base_class.seeded_query (seed) as l_query then
					Result := l_query.type.named_type_has_class (a_class, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := a_class.is_unknown
				end
			end
		end

	named_type_has_class_with_ancestors_not_built_successfully (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain a class
			-- whose ancestors have not been built successfully
			-- when it appears in `a_context'?
		local
			a_base_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_base_class := a_context.base_class
				l_index := index
				if attached a_base_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.named_type_has_class_with_ancestors_not_built_successfully (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_base_class := a_context.base_class
				if attached a_base_class.seeded_query (seed) as l_query then
					Result := l_query.type.named_type_has_class_with_ancestors_not_built_successfully (a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature -- Basic operations

	add_adapted_base_classes_to_list (a_list: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT)
			-- Add to `a_list' the base class of current type when it appears in `a_context' or
			-- the adapted base classes of the constraints (in the same order they appear in
			-- 'constraint_base_types') in case of a formal parameter.
		local
			l_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				a_list.force_last (tokens.unknown_class)
			elseif is_like_argument then
				l_class := a_context.base_class
				l_index := index
				if attached l_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					l_args.item (l_index).type.add_adapted_base_classes_to_list (a_list, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					a_list.force_last (tokens.unknown_class)
				end
			else
				l_class := a_context.base_class
				if attached l_class.seeded_query (seed) as l_query then
					l_query.type.add_adapted_base_classes_to_list (a_list, a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					a_list.force_last (tokens.unknown_class)
				end
			end
		end

feature -- Comparison

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				Result := other.same_syntactical_like_feature_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_like_feature_with_type_marks (other: ET_LIKE_FEATURE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_feature: detachable ET_FEATURE
			l_query: detachable ET_QUERY
			l_class: ET_CLASS
			l_other_seed: INTEGER
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				-- Result := False
			elseif a_context.attachment_type_conformance_mode and then not same_attachment_marks_with_default (overridden_type_mark (a_type_mark), other.overridden_type_mark (other_type_mark), Void) then
				Result := False
			elseif is_like_argument then
					-- If they are 'like argument' they should
					-- refer to the same argument.
				if other.is_like_argument and then other.index = index then
						-- They should refer to the same feature.
					if other.seed = seed then
						Result := True
					else
						l_class := other_context.base_class
						l_other_seed := other.seed
						l_feature := l_class.seeded_feature (l_other_seed)
						Result := l_feature /= Void and then l_feature.has_seed (seed)
						if not Result then
							l_class := a_context.base_class
							l_feature := l_class.seeded_feature (seed)
							Result := l_feature /= Void and then l_feature.has_seed (l_other_seed)
						end
					end
				end
			elseif not other.is_like_argument then
					-- They should refer to the same feature.
				if other.seed = seed then
					Result := True
				else
					l_query := other_context.base_class.seeded_query (other.seed)
					Result := l_query /= Void and then l_query.has_seed (seed)
					if not Result then
						l_query := a_context.base_class.seeded_query (seed)
						Result := l_query /= Void and then l_query.has_seed (other.seed)
					end
				end
			else
				-- Result := False
			end
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context,  overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

	conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			a_class: ET_CLASS
			l_index: INTEGER
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			elseif is_like_argument then
				a_class := a_context.base_class
				l_index := index
				if attached a_class.seeded_feature (seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
					Result := l_args.item (l_index).type.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			else
				a_class := a_context.base_class
				if attached a_class.seeded_query (seed) as l_query then
					Result := l_query.type.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we resolved
						-- current anchored type.
					Result := False
				end
			end
		end

feature -- Resolving

	resolve_like_feature (a_query: ET_QUERY)
			-- Resolve current 'like feature' type where
			-- `a_query' if the associated feature.
		require
			a_query_not_void: a_query /= Void
			is_like_feature: not is_like_argument
		do
			seed := a_query.first_seed
			name.set_seed (seed)
		ensure
			seed_set: seed = a_query.first_seed
		end

	resolve_like_argument (a_feature: ET_FEATURE)
			-- Resolve current 'like argument' type in `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			is_like_argument: is_like_argument
		do
			seed := a_feature.first_seed
			is_procedure := a_feature.is_procedure
		ensure
			seed_set: seed = a_feature.first_seed
		end

feature -- Output

	append_to_string (a_string: STRING)
			-- Append textual representation of
			-- current type to `a_string'.
		do
			if attached type_mark as l_type_mark then
				l_type_mark.append_to_string_with_space (a_string)
			end
			a_string.append_string (like_space)
			a_string.append_string (name.lower_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_like_feature (Current)
		end

end
