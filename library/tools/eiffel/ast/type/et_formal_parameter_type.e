indexing

	description:

		"Eiffel formal generic parameter types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_TYPE

inherit

	ET_NAMED_TYPE
		redefine
			named_type,
			shallow_named_type,
			named_type_has_class,
			name, is_formal_type,
			is_type_reference,
			has_anchored_type,
			has_formal_type,
			has_formal_types,
			same_syntactical_bit_type,
			same_syntactical_class_type,
			same_syntactical_formal_parameter_type,
			same_syntactical_like_current,
			same_syntactical_like_feature,
			same_syntactical_tuple_type,
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
			resolved_formal_parameters,
			is_valid_context_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_index: INTEGER) is
			-- Create a new formal generic type.
		require
			a_name_not_void: a_name /= Void
			an_index_positive: an_index >= 1
		do
			name := a_name
			index := an_index
		ensure
			name_set: name = a_name
			index_set: index = an_index
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name of type

	index: INTEGER
			-- Position in list of generic parameters

	base_class (a_context: ET_TYPE_CONTEXT): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.root_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.base_class
						elseif not a_class.is_preparsed then
								-- Internal error: we have a formal parameter of a class that
								-- is not even preparsed (i.e. for which we know nothing,
								-- not even its filename). Therefore it is impossible to
								-- determine its base class.
							Result := tokens.unknown_class
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base class is considered to be
								-- "ANY" in these two cases.
							Result := a_class.current_system.any_class
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					Result := an_actual.base_class (a_context.root_context)
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
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
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.root_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type
						elseif not a_class.is_preparsed then
								-- Internal error: we have a formal parameter of a class that
								-- is not even preparsed (i.e. for which we know nothing,
								-- not even its filename). Therefore it is impossible to
								-- determine its base type.
							Result := tokens.unknown_class
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := a_class.current_system.any_type
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					Result ?= an_actual
					if Result = Void then
							 -- Should never happen: `a_context.base_type' is the
							 -- result of call to `base_type'. So `an_actual'
							 -- is either a formal generic parameter or a
							 -- base type itself.
						 Result := tokens.unknown_class
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	shallow_base_type (a_context: ET_BASE_TYPE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- but where the actual generic parameters are not replaced
			-- by their named version and should still be considered as
			-- viewed from `a_context'
		local
			an_actual: ET_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.actual_parameter_count then
				an_actual := a_context.actual_parameters.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type
						elseif not a_class.is_preparsed then
								-- Internal error: we have a formal parameter of a class that
								-- is not even preparsed (i.e. for which we know nothing,
								-- not even its filename). Therefore it is impossible to
								-- determine its base type.
							Result := tokens.unknown_class
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := a_class.current_system.any_type
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					Result ?= an_actual
					if Result = Void then
							 -- Should never happen: `a_context' is a valid context,
							 -- so its actual parameters are either formal generic
							 -- parameters or a base types.
						 Result := tokens.unknown_class
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.root_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.base_type_actual (i, a_context.root_context)
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := tokens.unknown_class
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					Result := an_actual.base_type_actual (i, a_context.root_context)
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.root_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.base_type_actual_parameter (i, a_context.root_context)
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := tokens.unknown_class
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					Result := an_actual.base_type_actual_parameter (i, a_context.root_context)
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER is
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.root_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.base_type_index_of_label (a_label, a_context.root_context)
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := 0
						end
					else
							-- Internal error: formal parameter not matched.
						Result := 0
					end
				else
					Result := an_actual.base_type_index_of_label (a_label, a_context.root_context)
				end
			else
					-- Internal error: formal parameter not matched.
				Result := 0
			end
		end

	named_type (a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE is
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		do
			if index <= a_context.base_type_actual_count then
				Result := a_context.base_type_actual (index)
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	shallow_named_type (a_context: ET_BASE_TYPE): ET_NAMED_TYPE is
			-- Same as `shallow_base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		do
			if index <= a_context.actual_parameter_count then
				Result ?= a_context.actual_parameters.type (index)
				if Result = Void then
						 -- Should never happen: `a_context' is a valid context,
						 -- so its actual parameters are either formal generic
						 -- parameters or a base types.
					Result := tokens.unknown_class
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := name
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := name
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER is
			-- Number of actual generic parameters of the base type of current type
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_class := a_context.root_context.base_class
					a_formals := a_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.actual_parameter_count
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := 0
						end
					else
							-- Internal error: formal parameter not matched.
						Result := 0
					end
				else
					a_base_type ?= an_actual
					if a_base_type = Void then
							 -- Should never happen: `a_context.base_type' is the
							 -- result of call to `base_type'. So `an_actual'
							 -- is either a formal generic parameter or a
							 -- base type itself.
						 Result := 0
					else
						Result := a_base_type.actual_parameter_count
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := 0
			end
		end

feature -- Status report

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type expanded when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_formal_index: INTEGER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_formal_index := a_formal_type.index
					a_formal_parameters := a_context.root_context.base_class.formal_parameters
					if a_formal_parameters /= Void and then a_formal_index <= a_formal_parameters.count then
						Result := a_formal_parameters.formal_parameter (a_formal_index).is_expanded
					else
							-- Internal error: does current type really
							-- appear in `a_context'?
						Result := False
					end
				else
					Result := an_actual.is_type_expanded (a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	is_type_reference (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type reference when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_formal_index: INTEGER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_formal_index := a_formal_type.index
					a_formal_parameters := a_context.root_context.base_class.formal_parameters
					if a_formal_parameters /= Void and then a_formal_index <= a_formal_parameters.count then
						Result := a_formal_parameters.formal_parameter (a_formal_index).is_reference
					else
							-- Internal error: does current type really
							-- appear in `a_context'?
						Result := False
					end
				else
					Result := an_actual.is_type_reference (a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	has_anchored_type (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type contain an anchored type
			-- when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.has_anchored_type (a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	has_formal_type (i: INTEGER; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named type of current type contain the formal generic parameter
			-- with index `i' when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := a_formal_type.index = i
				else
					Result := an_actual.has_formal_type (i, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named type of current type contain a formal generic parameter
			-- when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := True
				else
					Result := an_actual.has_formal_types (a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	is_formal_type (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type a formal parameter when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := True
				else
					Result := an_actual.is_formal_type (a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_base_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			an_index: INTEGER
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					a_base_class := a_context.root_context.base_class
					a_formals := a_base_class.formal_parameters
					an_index := a_formal_type.index
					if a_formals /= Void and then an_index <= a_formals.count then
						a_formal := a_formals.formal_parameter (an_index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.base_type_has_class (a_class, a_context.root_context)
						elseif not a_base_class.is_preparsed then
								-- Internal error: we have a formal parameter of a class that
								-- is not even preparsed (i.e. for which we know nothing,
								-- not even its filename). Therefore it is impossible to
								-- determine its base class.
							Result := a_class.is_unknown
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := (a_class = a_base_class.current_system.any_class)
						end
					else
							-- Internal error: formal parameter not matched.
						Result := a_class.is_unknown
					end
				else
					Result := an_actual.base_type_has_class (a_class, a_context.root_context)
				end
			else
					-- Internal error: formal parameter not matched.
				Result := a_class.is_unknown
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
					Result := False
				else
					Result := an_actual.named_type_has_class (a_class, a_context.root_context)
				end
			else
					-- Internal error: formal parameter not matched.
				Result := a_class.is_unknown
			end
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := other.same_syntactical_formal_parameter_type (a_formal_type, a_context.root_context, other_context)
				else
					Result := an_actual.same_syntactical_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := other.same_named_formal_parameter_type (a_formal_type, a_context.root_context, other_context)
				else
					Result := an_actual.same_named_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := other.same_base_formal_parameter_type (a_formal_type, a_context.root_context, other_context)
				else
					Result := an_actual.same_base_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_syntactical_bit_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- no_cycle: no cycle in anchored types involved.
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_syntactical_class_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := a_formal_type.index = other.index
				else
					Result := an_actual.same_syntactical_formal_parameter_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_like_current (other: ET_LIKE_CURRENT; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_syntactical_like_current (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_like_feature (other: ET_LIKE_FEATURE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_syntactical_like_feature (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_syntactical_tuple_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_named_bit_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_named_class_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := a_formal_type.index = other.index
				else
					Result := an_actual.same_named_formal_parameter_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_named_tuple_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_base_bit_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_base_class_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := a_formal_type.index = other.index
				else
					Result := an_actual.same_base_formal_parameter_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					Result := an_actual.same_base_tuple_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := other.conforms_from_formal_parameter_type (a_formal_type, a_context.root_context, other_context)
				else
					Result := an_actual.conforms_to_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- No type other than itself conforms to a formal generic type.
					Result := False
				else
					Result := an_actual.conforms_from_bit_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- No type other than itself conforms to a formal generic type,
						-- unless it is declared as 'reference' in which case "NONE"
						-- conforms to it.
					Result := is_type_reference (a_context) and other.base_class.is_none
				else
					Result := an_actual.conforms_from_class_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			an_index, other_index: INTEGER
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: ET_TYPE
			a_base_type: ET_BASE_TYPE
			visited: ARRAY [BOOLEAN]
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					an_index := a_formal_type.index
					other_index := other.index
					if an_index = other_index then
						Result := True
					else
							-- Check for constraints of the form "[G -> H,
							-- H -> K, K]" where "G" conforms to "K".
							-- (Note that since `a_context' and `other_context'
							-- are both root contexts, and knowing that their
							-- root contexts are the same, it does not matter
							-- whether we operate in `a_context' or `other_context'
							-- from now on.)
						a_class := a_context.root_context.base_class
						a_formals := a_class.formal_parameters
						if a_formals /= Void and then other_index <= a_formals.count then
							a_formal := a_formals.formal_parameter (other_index)
							a_constraint := a_formal.constraint
							if a_constraint /= Void then
									-- We know that there is a constraint.
								a_base_type := a_formal.constraint_base_type
								if a_base_type /= Void then
										-- There is no cycle of the form
										-- "[G -> G]" or "[G -> H, H -> G]".
									Result := a_constraint.conforms_to_type (Current, a_context.root_context, other_context)
								else
										-- There is a cycle. If `other' is "G" and current
										-- type is "K", we still want to return True when
										-- "[G -> H, H -> K, K -> G]" but False (and
										-- without entering an infinite loop) when
										-- "[G -> H, H -> G, K]".
									a_formal_type ?= a_constraint
									if a_formal_type /= Void then
										from
											create visited.make (1, a_formals.count)
											visited.put (True, other_index)
											other_index := a_formal_type.index
											Result := an_index = other_index
										until
											Result or visited.item (other_index)
										loop
											visited.put (True, other_index)
											if other_index <= a_formals.count then
												a_formal := a_formals.formal_parameter (other_index)
												a_formal_type ?= a_formal.constraint
												if a_formal_type /= Void then
													other_index := a_formal_type.index
													Result := an_index = other_index
												else
														-- Internal error: we know that there is a cycle
														-- of the form "[G -> H, H -> G]", so the constraint
														-- has to be a formal parameter.
													Result := False
												end
											else
													-- Internal error: does `other' type really
													-- appear in `other_context'?
												Result := False
											end
										end
									else
											-- Internal error: we know that there is a cycle
											-- of the form "[G -> H, H -> G]", so the constraint
											-- has to be a formal parameter.
										Result := False
									end
								end
							end
						else
								-- Internal error: does `other' type really appear in `other_context'?
							Result := False
						end
					end
				else
					Result := an_actual.conforms_from_formal_parameter_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		local
			an_actual: ET_NAMED_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
		do
			if index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void then
						-- No type other than itself conforms to a formal generic type.
					Result := False
				else
					Result := an_actual.conforms_from_tuple_type (other, other_context, a_context.root_context)
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_TYPE is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		local
			a_type: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER_TYPE
		do
			Result := Current
			if index <= a_parameters.count then
				a_type := a_parameters.type (index)
				a_formal ?= a_type
				if a_formal = Void or else a_formal.index /= index then
					Result := a_type
				end
			end
		end

feature -- Type context

	is_valid_context_type (a_root_context: ET_BASE_TYPE): BOOLEAN is
			-- Is current type only made up of class names and
			-- formal generic parameter names, and are the actual
			-- parameters of these formal parameters themselves
			-- in `a_root_context'?
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER_TYPE
		do
			a_parameters := a_root_context.actual_parameters
			if a_parameters /= Void and then index <= a_parameters.count then
				a_formal ?= a_parameters.type (index)
				Result := a_formal /= Void and then a_formal.index = index
			end
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (upper_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_parameter_type (Current)
		end

invariant

	index_positive: index >= 1

end
