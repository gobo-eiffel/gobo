indexing

	description:

		"Eiffel formal generic parameter types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_TYPE

inherit

	ET_NAMED_TYPE
		redefine
			name, named_type,
			same_syntactical_formal_parameter_type,
			conforms_from_bit_type,
			conforms_from_class_type,
			conforms_from_formal_parameter_type,
			conforms_from_tuple_type,
			resolved_formal_parameters,
			is_valid_context_type
		end

creation

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

	direct_base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Class on which current type is directly based
			-- (e.g. a Class_type, a Tuple_type or a Bit_type);
			-- Return Void if not directly based on a class
			-- (e.g. Anchored_type). `a_universe' is the
			-- surrounding universe holding all classes.
		do
			-- Result := Void
		ensure then
			no_direct_base_type: Result = Void
		end

	base_class (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current type when it appears in `a_context'
			-- in `a_universe' (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- anchored type involved in a cycle, or unmatched formal
			-- generic parameter.
		local
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals /= Void and then index <= an_actuals.count then
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
					a_class := a_context_type.direct_base_class (a_universe)
					a_formals := a_class.formal_parameters
					if a_formals /= Void and then index <= a_formals.count then
						a_formal := a_formals.formal_parameter (index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type.direct_base_class (a_universe)
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base class is considered to be
								-- "ANY" in these two cases.
							Result := a_universe.any_class
						end
					else
							-- Error: formal parameter not matched.
						Result := a_universe.unknown_class
					end
				else
					Result := an_actual.base_class (a_context.context, a_universe)
				end
			else
					-- Error: formal parameter not matched.
				Result := a_universe.unknown_class
			end
		end

	base_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context'
			-- in `a_universe', only made up of class names and generic
			-- formal parameters when the root type of `a_context' is a
			-- generic type not fully derived (Definition of base type in
			-- ETL2 p.198). Replace by "*UNKNOWN*" any unresolved identifier
			-- type, anchored type involved in a cycle, or unmatched formal
			-- generic parameter if this parameter is current type.
		local
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_base_type: ET_BASE_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals /= Void and then index <= an_actuals.count then
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
					a_class := a_context_type.direct_base_class (a_universe)
					a_formals := a_class.formal_parameters
					if a_formals /= Void and then index <= a_formals.count then
						a_formal := a_formals.formal_parameter (index)
						a_base_type := a_formal.constraint_base_type
						if a_base_type /= Void then
							Result := a_base_type
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "ANY" in these two cases.
							Result := a_universe.any_type
						end
					else
							-- Error: formal parameter not matched.
						Result := a_universe.unknown_class
					end
				else
					Result := an_actual.base_type (a_context.context, a_universe)
				end
			else
					-- Error: formal parameter not matched.
				Result := a_universe.unknown_class
			end
		end

	named_type (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- Same as `base_type' except when current type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_context'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		local
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			an_actual: ET_TYPE
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals /= Void and then index <= an_actuals.count then
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
					Result := a_formal_type
				else
					Result := an_actual.base_type (a_context.context, a_universe)
				end
			else
					-- Error: formal parameter not matched.
				Result := a_universe.unknown_class
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
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
		local
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := other.same_syntactical_formal_parameter_type (a_formal_type, a_context, other_context, a_universe)
				else
					Result := an_actual.same_syntactical_type (other, other_context, a_context.context, a_universe)
				end
			end
		end

feature {ET_TYPE} -- Comparison

	same_syntactical_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
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
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := a_formal_type.index = other.index
				else
					Result := an_actual.same_syntactical_formal_parameter_type (other, other_context, a_context.context, a_universe)
				end
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for conformance.)
		local
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := other.conforms_from_formal_parameter_type (a_formal_type, a_context, other_context, a_processor)
				else
					Result := an_actual.conforms_to_type (other, other_context, a_context.context, a_processor)
				end
			end
		end

feature {ET_TYPE} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for conformance.)
		local
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- No type other than itself conforms to
						-- a formal generic type.
					Result := False
				else
					Result := an_actual.conforms_from_bit_type (other, other_context, a_context.context, a_processor)
				end
			end
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for conformance.)
		local
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- No type other than itself conforms to
						-- a formal generic type.
					Result := False
				else
					Result := an_actual.conforms_from_class_type (other, other_context, a_context.context, a_processor)
				end
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_context: ET_TYPE_CONTEXT;
		a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for conformance.)
		local
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
			an_index, other_index: INTEGER
			a_class: ET_CLASS
			a_formals: ET_FORMAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: ET_TYPE
			a_base_type: ET_BASE_TYPE
			visited: ARRAY [BOOLEAN]
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					an_index := a_formal_type.index
					other_index := other.index
					if an_index = an_index then
						Result := True
					else
							-- Check for constraints of the form "[G -> H,
							-- H -> K, K]" where "G" conforms to "K".
							-- (Note that since `a_context' and `other_context'
							-- are both root contexts, and knowing that their
							-- root contexts are the same, it does not matter
							-- whether we operate in `a_context' or `other_context'
							-- from now on.)
						a_class := a_context_type.direct_base_class (a_processor.universe)
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
									Result := a_constraint.conforms_to_type (Current, a_context, other_context, a_processor)
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
								-- Internal error: does `other' type really
								-- appear in `other_context'?
							Result := False
						end
					end
				else
					Result := an_actual.conforms_from_formal_parameter_type (other, other_context, a_context.context, a_processor)
				end
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT;
		a_context: ET_TYPE_CONTEXT; a_processor: ET_AST_PROCESSOR): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: Use `a_processor' on the classes whose ancestors
			-- need to be built in order to check for conformance.)
		local
			an_actual: ET_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_formal_type: ET_FORMAL_PARAMETER_TYPE
			a_context_type: ET_BASE_TYPE
		do
			a_context_type := a_context.type
			an_actuals := a_context_type.actual_parameters
			if an_actuals = Void or else index > an_actuals.count then
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			else
				an_actual := an_actuals.type (index)
				a_formal_type ?= an_actual
				if a_formal_type /= Void and a_context.is_root_context then
						-- No type other than itself conforms to
						-- a formal generic type.
					Result := False
				else
					Result := an_actual.conforms_from_tuple_type (other, other_context, a_context.context, a_processor)
				end
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

	is_valid_context_type (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type only made up of class names and
			-- formal generic parameter names, and are the actual
			-- parameters of these formal parameters themselves
			-- in `a_context'?
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			a_formal: ET_FORMAL_PARAMETER_TYPE
		do
			a_parameters := a_context.type.actual_parameters
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
			a_string.append_string (name.name)
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
