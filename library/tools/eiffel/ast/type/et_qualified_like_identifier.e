note

	description:

		"Eiffel qualified anchored types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_LIKE_IDENTIFIER

inherit

	ET_LIKE_IDENTIFIER
		redefine
			reset,
			reset_qualified_anchored_types,
			named_type,
			shallow_named_type,
			named_type_has_class,
			named_type_is_formal_type,
			has_formal_types,
			same_syntactical_qualified_like_identifier,
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
			conforms_from_tuple_type
		end

feature -- Initialization

	reset is
			-- Reset type as it was just after it was last parsed.
		do
			name.reset
			target_type.reset
		end

	reset_qualified_anchored_types is
			-- Reset qualified anchored types contained in current type
			-- as they were just after they were last parsed.
		do
			name.reset
			target_type.reset_qualified_anchored_types
		end

feature -- Access

	target_type: ET_TYPE is
			-- Target anchored type
		deferred
		ensure
			target_type_not_void: Result /= Void
		end

	name: ET_FEATURE_NAME is
			-- Name of the feature in `target_type'
			-- associated with current type
		do
			Result := qualified_name.feature_name
		ensure then
			definition: Result = qualified_name.feature_name
		end

	qualified_name: ET_QUALIFIED_FEATURE_NAME
			-- Qualified feature name

	seed: INTEGER is
			-- Feature ID of one of the seeds of the
			-- feature associated with current type;
			-- 0 if not resolved yet
		do
			Result := name.seed
		end

	named_base_class (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS is
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.named_base_class (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type (a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- only made up of class names and generic formal parameters
			-- when the root type of `a_context' is a generic type not
			-- fully derived (Definition of base type in ETL2 p.198).
			-- Replace by "*UNKNOWN*" any unresolved identifier type, or
			-- unmatched formal generic parameter if this parameter
			-- is current type.
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
-- TODO: take `type_mark' into account.
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.base_type (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	shallow_base_type (a_context: ET_BASE_TYPE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- but where the actual generic parameters are not replaced
			-- by their named version and should still be considered as
			-- viewed from `a_context'
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
-- TODO: take `type_mark' into account.
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
						-- Here we have to use `base_type' and not `shallow_base_type'
						-- because otherwise the actual generic parameters will not
						-- be viewed from `a_context' but from `l_target_context'.
					Result := l_query.type.base_type (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.base_type_actual (i, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.base_type_actual_parameter (i, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER is
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := 0
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.base_type_index_of_label (a_label, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := 0
				end
			end
		end

	named_type (a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE is
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
-- TODO: take `type_mark' into account.
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.named_type (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
				end
			end
		end

	shallow_named_type (a_context: ET_BASE_TYPE): ET_NAMED_TYPE is
			-- Same as `shallow_base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
-- TODO: take `type_mark' into account.
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := tokens.unknown_class
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
						-- Here we have to use `named_type' and not `shallow_named_type'
						-- because otherwise the actual generic parameters will not
						-- be viewed from `a_context' but from `l_target_context'.
					Result := l_query.type.named_type (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := tokens.unknown_class
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
			if type_mark /= Void then
				Result := type_mark.position
			end
			if Result = Void or else Result.is_null then
				Result := like_keyword.position
				if Result.is_null then
					Result := target_type.position
				end
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if type_mark /= Void then
				Result := type_mark
			else
				Result := like_keyword
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := qualified_name.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := qualified_name.break
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER is
			-- Number of actual generic parameters of the base type of current type
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := 0
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.base_type_actual_count (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := 0
				end
			end
		end

feature -- Status report

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type expanded when viewed from `a_context'?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.is_type_expanded (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type contain a formal generic parameter
			-- when viewed from `a_context'?
		do
			Result := target_type.has_formal_types (a_context)
		end

	named_type_is_formal_type (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is named type of current type, or if it is a qualified type
			-- is the named type of its  target type (recursively),
			-- a formal parameter when viewed from `a_context'?
		local
			l_base_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			l_target_type := target_type
			if l_target_type.named_type_is_formal_type (a_context) then
				Result := True
			elseif seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_base_class := l_target_type.base_class (a_context)
				l_query := l_base_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.named_type_is_formal_type (l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			l_base_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := a_class.is_unknown
			else
				l_target_type := target_type
				l_base_class := l_target_type.base_class (a_context)
				l_query := l_base_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.base_type_has_class (a_class, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := a_class.is_unknown
				end
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			l_base_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := a_class.is_unknown
			else
				l_target_type := target_type
				l_base_class := l_target_type.base_class (a_context)
				l_query := l_base_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.named_type_has_class (a_class, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := a_class.is_unknown
				end
			end
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if other = Current and other_context = a_context then
				Result := True
			else
				Result := other.same_syntactical_qualified_like_identifier (Current, a_context, other_context)
			end
		end

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_named_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_base_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_qualified_like_identifier (other: ET_QUALIFIED_LIKE_IDENTIFIER; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			l_query: ET_QUERY
			l_class: ET_CLASS
			l_target_type: ET_TYPE
			l_other_target_type: ET_TYPE
		do
			if other = Current and other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
					-- They should have the same target type.
				l_target_type := target_type
				l_other_target_type := other.target_type
				if l_target_type.same_syntactical_type (l_other_target_type, other_context, a_context) then
						-- They should refer to the same feature.
					if other.seed = seed then
						Result := True
					else
						l_class := l_other_target_type.base_class (other_context)
						l_query := l_class.seeded_query (other.seed)
						Result := l_query /= Void and then l_query.has_seed (seed)
						if not Result then
							l_class := l_target_type.base_class (a_context)
							l_query := l_class.seeded_query (seed)
							Result := l_query /= Void and then l_query.has_seed (other.seed)
						end
					end
				end
			end
		end

	same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_named_bit_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_named_class_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_named_formal_parameter_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_named_tuple_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_base_bit_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_base_class_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_base_formal_parameter_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.same_base_tuple_type (other, other_context, l_target_context)
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				l_class := l_target_type.base_class (a_context)
				l_query := l_class.seeded_query (seed)
				if l_query /= Void then
					l_target_context := a_context.new_type_context (l_target_type)
					Result := l_query.type.conforms_to_type (other, other_context, l_target_context)
					if not Result then
							-- Covers the case where only 'like {G}.a'
							-- conforms to 'like {G}.a'.
						Result := other.same_syntactical_qualified_like_identifier (Current, a_context, other_context)
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current qualified anchored type.
					Result := False
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				if l_target_type.named_type_is_formal_type (a_context) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					l_class := l_target_type.base_class (a_context)
					l_query := l_class.seeded_query (seed)
					if l_query /= Void then
						l_target_context := a_context.new_type_context (l_target_type)
						Result := l_query.type.conforms_from_bit_type (other, other_context, l_target_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current qualified anchored type.
						Result := False
					end
				end
			end
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				if l_target_type.named_type_is_formal_type (a_context) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					l_class := l_target_type.base_class (a_context)
					l_query := l_class.seeded_query (seed)
					if l_query /= Void then
						l_target_context := a_context.new_type_context (l_target_type)
						Result := l_query.type.conforms_from_class_type (other, other_context, l_target_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current qualified anchored type.
						Result := False
					end
				end
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				if l_target_type.named_type_is_formal_type (a_context) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					l_class := l_target_type.base_class (a_context)
					l_query := l_class.seeded_query (seed)
					if l_query /= Void then
						l_target_context := a_context.new_type_context (l_target_type)
						Result := l_query.type.conforms_from_formal_parameter_type (other, other_context, l_target_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current qualified anchored type.
						Result := False
					end
				end
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
				Result := False
			else
				l_target_type := target_type
				if l_target_type.named_type_is_formal_type (a_context) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					l_class := l_target_type.base_class (a_context)
					l_query := l_class.seeded_query (seed)
					if l_query /= Void then
						l_target_context := a_context.new_type_context (l_target_type)
						Result := l_query.type.conforms_from_tuple_type (other, other_context, l_target_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current qualified anchored type.
						Result := False
					end
				end
			end
		end

feature -- Resolving

	resolve_identifier_type (a_seed: INTEGER) is
			-- Resolve current type with `a_seed'.
		require
			a_seed_positive: a_seed > 0
		do
			name.set_seed (a_seed)
		ensure
			seed_set: seed = a_seed
		end

invariant

	qualified_name_not_void: qualified_name /= Void

end
