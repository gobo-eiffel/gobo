indexing

	description:

		"Eiffel qualified anchored types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_TYPE

inherit

	ET_LIKE_IDENTIFIER
		redefine
			named_type,
			is_formal_type,
			has_qualified_type,
			same_syntactical_qualified_type,
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
			convertible_from_class_type,
			convertible_from_formal_parameter_type
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

	base_class (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- in `a_universe' (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.base_class (a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.base_type (a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := a_universe.unknown_class
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.named_type (a_target_context, a_universe)
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
				Result := target_type.position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := qualified_name.break
		end

feature -- Status report

	is_like_argument: BOOLEAN is False
			-- Is this type a 'like argument' (rather than a
			-- 'like feature' or a 'like *.feature')?

	is_type_expanded (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type expanded when viewed from
			-- `a_context' in `a_universe'?
		local
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				-- Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.is_type_expanded (a_target_context, a_universe)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						-- Result := False
					end
				else
						-- Internal error: an inconsistency has been
						-- introduced in the AST since we relsolved
						-- current anchored type.
					-- Result := False
				end
			end
		end

	is_formal_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type a formal parameter when viewed from
			-- `a_context', or if it is a qualified type is its
			-- target type (recursively) a formal parameter?
		do
			Result := target_type.is_formal_type (a_context, a_universe)
		end

	has_qualified_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type a qualified anchored type (other than of
			-- the form 'like Current.b') when viewed from `a_context',
			-- or do its actual generic parameters (recursively)
			-- contain qualified types?
		do
			Result := True
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
				Result := other.same_syntactical_qualified_type (Current, a_context, other_context, a_universe)
			end
		end

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_named_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_base_type (other, other_context, a_target_context, a_universe)
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

feature {ET_TYPE} -- Comparison

	same_syntactical_qualified_type (other: ET_QUALIFIED_TYPE;
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
			a_class: ET_CLASS
		do
			if other = Current and other_context = a_context then
				Result := True
			elseif seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
					-- They should have the same target type.
				if target_type.same_syntactical_type (other.target_type, other_context, a_context, a_universe) then
						-- They should refer to the same feature.
					if other.seed = seed then
						Result := True
					else
						a_class := other.target_type.base_class (other_context, a_universe)
						a_feature := a_class.seeded_feature (other.seed)
						Result := a_feature /= Void and then a_feature.has_seed (seed)
						if not Result then
							a_class := target_type.base_class (a_context, a_universe)
							a_feature := a_class.seeded_feature (seed)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_named_bit_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_named_class_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_named_formal_parameter_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_named_tuple_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_base_bit_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_base_class_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_base_formal_parameter_type (other, other_context, a_target_context, a_universe)
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
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Anchored type not resolved yet.
				Result := False
			else
				a_target_type := target_type
				a_class := a_target_type.base_class (a_context, a_universe)
				seeded_feature := a_class.seeded_feature (seed)
				if seeded_feature /= Void then
					a_query_type := seeded_feature.type
					if a_query_type /= Void then
						create a_target_context.make (a_target_type, a_context)
						Result := a_query_type.same_base_tuple_type (other, other_context, a_target_context, a_universe)
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
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				if seed = 0 then
						-- Qualified anchored type not resolved yet.
						-- Try to resolve it now.
					a_class := a_context.base_class (a_universe)
					a_class.process (a_universe.qualified_signature_resolver)
				end
				if seed = 0 then
						-- Qualified anchored type still not resolved.
					Result := False
				else
					a_target_type := target_type
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.conforms_to_type (other, other_context, a_target_context, a_universe)
							if not Result then
									-- Covers the case where only 'like {G}.a'
									-- conforms to 'like {G}.a'.
								Result := other.same_syntactical_qualified_type (Current, a_context, other_context, a_universe)
							end
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
		end

feature {ET_TYPE} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
					-- Try to resolve it now.
				a_class := a_context.base_class (a_universe)
				a_class.process (a_universe.qualified_signature_resolver)
			end
			if seed = 0 then
					-- Qualified anchored type still not resolved.
				Result := False
			else
				a_target_type := target_type
				if a_target_type.is_formal_type (a_context, a_universe) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.conforms_from_bit_type (other, other_context, a_target_context, a_universe)
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
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
					-- Try to resolve it now.
				a_class := a_context.base_class (a_universe)
				a_class.process (a_universe.qualified_signature_resolver)
			end
			if seed = 0 then
					-- Qualified anchored type still not resolved.
				Result := False
			else
				a_target_type := target_type
				if a_target_type.is_formal_type (a_context, a_universe) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.conforms_from_class_type (other, other_context, a_target_context, a_universe)
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
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
					-- Try to resolve it now.
				a_class := a_context.base_class (a_universe)
				a_class.process (a_universe.qualified_signature_resolver)
			end
			if seed = 0 then
					-- Qualified anchored type still not resolved.
				Result := False
			else
				a_target_type := target_type
				if a_target_type.is_formal_type (a_context, a_universe) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.conforms_from_formal_parameter_type (other, other_context, a_target_context, a_universe)
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
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance, and 'a_universe.qualified_signature_resolver'
			-- is used on classes whose qualified anchored types need to be
			-- resolved in order to check conformance.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
					-- Try to resolve it now.
				a_class := a_context.base_class (a_universe)
				a_class.process (a_universe.qualified_signature_resolver)
			end
			if seed = 0 then
					-- Qualified anchored type still not resolved.
				Result := False
			else
				a_target_type := target_type
				if a_target_type.is_formal_type (a_context, a_universe) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.conforms_from_tuple_type (other, other_context, a_target_context, a_universe)
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
		end

feature -- Convertibility

	convertible_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current type appearing in `a_context' convertible
			-- to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				if seed = 0 then
						-- Qualified anchored type not resolved yet.
						-- Try to resolve it now.
					a_class := a_context.base_class (a_universe)
					a_class.process (a_universe.qualified_signature_resolver)
				end
				if seed = 0 then
						-- Qualified anchored type still not resolved.
					Result := False
				else
					a_target_type := target_type
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.convertible_to_type (other, other_context, a_target_context, a_universe)
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
		end

feature {ET_TYPE} -- Convertibility

	convertible_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `other' type appearing in `other_context' convertible
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
					-- Try to resolve it now.
				a_class := a_context.base_class (a_universe)
				a_class.process (a_universe.qualified_signature_resolver)
			end
			if seed = 0 then
					-- Qualified anchored type still not resolved.
				Result := False
			else
				a_target_type := target_type
				if a_target_type.is_formal_type (a_context, a_universe) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.convertible_from_class_type (other, other_context, a_target_context, a_universe)
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
		end

	convertible_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `other' type appearing in `other_context' convertible
			-- to current type appearing in `a_context'?
			-- (Note: 'a_universe.qualified_signature_resolver' is
			-- used on classes whose qualified anchored types need
			-- to be resolved in order to check convertibility.)
		local
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_class: ET_CLASS
			seeded_feature: ET_FEATURE
			a_query_type: ET_TYPE
		do
			if seed = 0 then
					-- Qualified anchored type not resolved yet.
					-- Try to resolve it now.
				a_class := a_context.base_class (a_universe)
				a_class.process (a_universe.qualified_signature_resolver)
			end
			if seed = 0 then
					-- Qualified anchored type still not resolved.
				Result := False
			else
				a_target_type := target_type
				if a_target_type.is_formal_type (a_context, a_universe) then
						-- Current type is of the unfolded form 'like {G}.a'
						-- and only 'like {G}.a' conforms to itself.
					Result := False
				else
					a_class := a_target_type.base_class (a_context, a_universe)
					seeded_feature := a_class.seeded_feature (seed)
					if seeded_feature /= Void then
						a_query_type := seeded_feature.type
						if a_query_type /= Void then
							create a_target_context.make (a_target_type, a_context)
							Result := a_query_type.convertible_from_formal_parameter_type (other, other_context, a_target_context, a_universe)
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
