note

	description:

		"Eiffel formal generic parameter types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_TYPE

inherit

	ET_NAMED_TYPE
		redefine
			named_type_with_type_mark,
			shallow_named_type_with_type_mark,
			named_type_has_class,
			named_type_is_formal_type,
			name,
			is_type_reference_with_type_mark,
			is_type_detachable_with_type_mark,
			has_formal_types,
			is_formal_parameter,
			same_syntactical_class_type_with_type_marks,
			same_syntactical_formal_parameter_type_with_type_marks,
			same_syntactical_like_current_with_type_marks,
			same_syntactical_like_feature_with_type_marks,
			same_syntactical_qualified_like_identifier_with_type_marks,
			same_syntactical_tuple_type_with_type_marks,
			same_named_class_type_with_type_marks,
			same_named_formal_parameter_type_with_type_marks,
			same_named_tuple_type_with_type_marks,
			same_base_class_type_with_type_marks,
			same_base_formal_parameter_type_with_type_marks,
			same_base_tuple_type_with_type_marks,
			conforms_from_class_type_with_type_marks,
			conforms_from_formal_parameter_type_with_type_marks,
			conforms_from_tuple_type_with_type_marks,
			resolved_formal_parameters_with_type_mark,
			is_valid_context_type,
			type_with_type_mark,
			type_mark
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name; an_index: INTEGER; a_class: ET_CLASS)
			-- Create a new formal generic parameter type.
		require
			a_name_not_void: a_name /= Void
			an_index_positive: an_index >= 1
			a_class_not_void: a_class /= Void
		do
			type_mark := a_type_mark
			name := a_name
			index := an_index
			implementation_class := a_class
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			index_set: index = an_index
			implementation_class_set: implementation_class = a_class
		end

feature -- Access

	type_mark: detachable ET_TYPE_MARK
			-- 'attached' or 'detachable' keyword,
			-- or '!' or '?' symbol

	name: ET_IDENTIFIER
			-- Name of type

	index: INTEGER
			-- Position in list of generic parameters

	implementation_class: ET_CLASS
			-- Class where the current formal generic parameter appears

	named_base_class (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).named_base_class (a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there should not be a mismatch between the number
						-- of actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							Result := l_base_type.named_base_class
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
								-- "detachable ANY" in these two cases.
							Result := a_class.universe.detachable_any_type.named_base_class
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					if a_context.is_root_context then
						Result := an_actual.named_base_class (a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.named_base_class (l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).base_type_with_type_mark (l_type_mark, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there should not be a mismatch between the number
						-- of actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							Result := l_base_type.type_with_type_mark (l_type_mark)
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
								-- "detachable ANY" in these two cases.
							Result := a_class.universe.detachable_any_type.type_with_type_mark (l_type_mark)
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					if attached {ET_BASE_TYPE} an_actual as l_base_type then
						Result := l_base_type.type_with_type_mark (l_type_mark)
					else
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

	shallow_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_type_mark: detachable ET_TYPE_MARK
			l_root_context: ET_BASE_TYPE
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			l_root_context := a_context.root_context
			l_context_base_class := l_root_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).shallow_base_type_with_type_mark (l_type_mark, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there should not be a mismatch between the number
						-- of actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif attached l_root_context.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
				an_actual := l_actual_parameters.type (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					an_index := l_formal_type.index
					if attached l_context_base_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							Result := l_base_type.type_with_type_mark (l_type_mark)
						elseif not l_context_base_class.is_preparsed then
								-- Internal error: we have a formal parameter of a class that
								-- is not even preparsed (i.e. for which we know nothing,
								-- not even its filename). Therefore it is impossible to
								-- determine its base type.
							Result := tokens.unknown_class
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "detachable ANY" in these two cases.
							Result := l_context_base_class.current_system.detachable_any_type.type_with_type_mark (l_type_mark)
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					if attached {ET_BASE_TYPE} an_actual as l_base_type then
						Result := l_base_type.type_with_type_mark (l_type_mark)
					else
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

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).base_type_actual (i, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							if a_context.is_root_context then
								Result := l_base_type.base_type_actual (i, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_base_type.base_type_actual (i, l_root_context)
								l_root_context.remove_last
							end
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "detachable ANY" in these two cases.
							Result := tokens.unknown_class
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					if a_context.is_root_context then
						Result := an_actual.base_type_actual (i, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.base_type_actual (i, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached  l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).base_type_actual_parameter (i, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							if a_context.is_root_context then
								Result := l_base_type.base_type_actual_parameter (i, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_base_type.base_type_actual_parameter (i, l_root_context)
								l_root_context.remove_last
							end
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "detachable ANY" in these two cases.
							Result := tokens.unknown_class
						end
					else
							-- Internal error: formal parameter not matched.
						Result := tokens.unknown_class
					end
				else
					if a_context.is_root_context then
						Result := an_actual.base_type_actual_parameter (i, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.base_type_actual_parameter (i, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).base_type_index_of_label (a_label, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := 0
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							if a_context.is_root_context then
								Result := l_base_type.base_type_index_of_label (a_label, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_base_type.base_type_index_of_label (a_label, l_root_context)
								l_root_context.remove_last
							end
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "detachable ANY" in these two cases.
							Result := 0
						end
					else
							-- Internal error: formal parameter not matched.
						Result := 0
					end
				else
					if a_context.is_root_context then
						Result := an_actual.base_type_index_of_label (a_label, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.base_type_index_of_label (a_label, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := 0
			end
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_context_base_class: ET_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).named_type_with_type_mark (l_type_mark, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif index <= a_context.base_type_actual_count then
				Result := a_context.base_type_actual (index).type_with_type_mark (l_type_mark)
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

	shallow_named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `shallow_named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_context_base_class: ET_CLASS
			l_type_mark: detachable ET_TYPE_MARK
			l_root_context: ET_BASE_TYPE
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			l_root_context := a_context.root_context
			l_context_base_class := l_root_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).shallow_named_type_with_type_mark (l_type_mark, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := tokens.unknown_class
				end
			elseif attached l_root_context.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
				if attached {ET_NAMED_TYPE} l_actual_parameters.type (index) as l_named_type then
					Result := l_named_type.type_with_type_mark (l_type_mark)
				else
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

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_FORMAL_PARAMETER_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark = type_mark then
				Result := Current
			else
				create Result.make (l_type_mark, name, index, implementation_class)
			end
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached type_mark as l_type_mark and then not l_type_mark.is_implicit_mark and then not l_type_mark.position.is_null then
				Result := l_type_mark.position
			else
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached type_mark as l_type_mark and then not l_type_mark.is_implicit_mark then
				Result := l_type_mark.first_leaf
			else
				Result := name
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := name
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).base_type_actual_count (a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := 0
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							Result := l_base_type.actual_parameter_count
						else
								-- This formal parameter has either no constraint
								-- or a cyclic constraint of the form "[G -> H,
								-- H -> G]". The base type is considered to be
								-- "detachable ANY" in these two cases.
							Result := 0
						end
					else
							-- Internal error: formal parameter not matched.
						Result := 0
					end
				elseif attached {ET_BASE_TYPE} an_actual as l_base_type then
					Result := l_base_type.actual_parameter_count
				else
						-- Should never happen: `a_context.base_type' is the
						-- result of call to `base_type'. So `an_actual'
						-- is either a formal generic parameter or a
						-- base type itself.
					Result := 0
				end
			else
					-- Internal error: formal parameter not matched.
				Result := 0
			end
		end

feature -- Status report

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						Result := a_formal.is_expanded
					else
							-- Internal error: does current type really
							-- appear in `a_context'?
						Result := False
					end
				else
					if a_context.is_root_context then
						Result := an_actual.is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						Result := a_formal.is_reference
					else
							-- Internal error: does current type really
							-- appear in `a_context'?
						Result := False
					end
				else
					if a_context.is_root_context then
						Result := an_actual.is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_type_mark: detachable ET_TYPE_MARK
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).is_type_attached_with_type_mark (l_type_mark, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if a_formal.is_expanded then
							Result := True
						elseif l_formal_type /= Current then
							if a_context.is_root_context then
								Result := l_formal_type.is_type_attached_with_type_mark (l_type_mark, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_formal_type.is_type_attached_with_type_mark (l_type_mark, l_root_context)
								l_root_context.remove_last
							end
						elseif attached a_formal.constraint_base_type as l_base_type then
							if a_context.is_root_context then
								Result := l_base_type.is_type_attached_with_type_mark (l_type_mark, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_base_type.is_type_attached_with_type_mark (l_type_mark, l_root_context)
								l_root_context.remove_last
							end
						else
							Result := l_type_mark /= Void and then l_type_mark.is_attached_mark
						end
					else
							-- Internal error: does current type really
							-- appear in `a_context'?
						Result := False
					end
				else
					if a_context.is_root_context then
						Result := an_actual.is_type_attached_with_type_mark (l_type_mark, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.is_type_attached_with_type_mark (l_type_mark, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			a_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_type_mark: detachable ET_TYPE_MARK
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).is_type_detachable_with_type_mark (l_type_mark, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if a_formal.is_expanded then
							Result := False
						elseif l_formal_type = Current then
							Result := l_type_mark /= Void and then l_type_mark.is_detachable_mark
						else
							if a_context.is_root_context then
								Result := l_formal_type.is_type_detachable_with_type_mark (l_type_mark, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_formal_type.is_type_detachable_with_type_mark (l_type_mark, l_root_context)
								l_root_context.remove_last
							end
						end
					else
							-- Internal error: does current type really
							-- appear in `a_context'?
						Result := False
					end
				else
					if a_context.is_root_context then
						Result := an_actual.is_type_detachable_with_type_mark (l_type_mark, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.is_type_detachable_with_type_mark (l_type_mark, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does current type contain a formal generic parameter
			-- when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).has_formal_types (a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := True
				else
					if a_context.is_root_context then
						Result := an_actual.has_formal_types (a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.has_formal_types (l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	named_type_is_formal_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is named type of current type, or if it is a qualified type
			-- is the named type of its  target type (recursively),
			-- a formal parameter when viewed from `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).named_type_is_formal_type (a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := True
				else
					if a_context.is_root_context then
						Result := an_actual.named_type_is_formal_type (a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.named_type_is_formal_type (l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			a_base_class: ET_CLASS
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).base_type_has_class (a_class, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := a_class.is_unknown
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					a_base_class := a_context.root_context.base_class
					an_index := l_formal_type.index
					if attached a_base_class.formal_parameters as l_formals and then an_index <= l_formals.count then
						a_formal := l_formals.formal_parameter (an_index)
						if attached a_formal.constraint_base_type as l_base_type then
							if a_context.is_root_context then
								Result := l_base_type.base_type_has_class (a_class, a_context)
							else
								l_root_context := a_context.as_nested_type_context
								l_root_context.force_last (tokens.like_0)
								Result := l_base_type.base_type_has_class (a_class, l_root_context)
								l_root_context.remove_last
							end
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
								-- "detachable ANY" in these two cases.
							Result := (a_class = a_base_class.universe.detachable_any_type.base_class)
						end
					else
							-- Internal error: formal parameter not matched.
						Result := a_class.is_unknown
					end
				else
					if a_context.is_root_context then
						Result := an_actual.base_type_has_class (a_class, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.base_type_has_class (a_class, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := a_class.is_unknown
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).named_type_has_class (a_class, a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := a_class.is_unknown
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.named_type_has_class (a_class, a_context)
					else
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.named_type_has_class (a_class, l_root_context)
						l_root_context.remove_last
					end
				end
			else
					-- Internal error: formal parameter not matched.
				Result := a_class.is_unknown
			end
		end

	is_formal_parameter (i: INTEGER): BOOLEAN
			-- Is current type a formal generic parameter with index `i'?
		do
			Result := index = i
		ensure then
			definition: Result = (index = i)
		end

feature -- Comparison

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					if a_context.is_root_context then
						Result := other.same_syntactical_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context, other_type_mark, other_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := other.same_syntactical_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), l_root_context, other_type_mark, other_context)
						l_root_context.remove_last
					else
						Result := other.same_syntactical_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context.root_context, other_type_mark, other_context)
					end
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					if a_context.is_root_context then
						Result := other.same_named_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context, other_type_mark, other_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := other.same_named_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), l_root_context, other_type_mark, other_context)
						l_root_context.remove_last
					else
						Result := other.same_named_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context.root_context, other_type_mark, other_context)
					end
				else
					if a_context.is_root_context then
						Result := an_actual.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					if a_context.is_root_context then
						Result := other.same_base_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context, other_type_mark, other_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := other.same_base_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), l_root_context, other_type_mark, other_context)
						l_root_context.remove_last
					else
						Result := other.same_base_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context.root_context, other_type_mark, other_context)
					end
				else
					if a_context.is_root_context then
						Result := an_actual.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
			l_root_context_base_class: ET_CLASS
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					l_root_context_base_class := a_context.root_context.base_class
					if other_context.base_class /= l_root_context_base_class then
						Result := False
					elseif l_formal_type.index = other.index then
						if a_context.attachment_type_conformance_mode then
							Result := is_type_attached_with_type_mark (a_type_mark, a_context) = other.is_type_attached_with_type_mark (other_type_mark, other_context)
								and is_type_detachable_with_type_mark (a_type_mark, a_context) = other.is_type_detachable_with_type_mark (other_type_mark, other_context)
						else
							Result := True
						end
					end
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_like_current_with_type_marks (other: ET_LIKE_CURRENT; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_like_current_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_like_current_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_like_current_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_like_current_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_like_feature_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_like_feature_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_like_feature_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_like_feature_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_qualified_like_identifier_with_type_marks (other: ET_QUALIFIED_LIKE_IDENTIFIER; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_qualified_like_identifier_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_qualified_like_identifier_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_qualified_like_identifier_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_qualified_like_identifier_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really
					-- appear in `a_context'?
				Result := False
			end
		end

	same_syntactical_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_syntactical_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_syntactical_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_syntactical_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_syntactical_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
			l_root_context_base_class: ET_CLASS
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					l_root_context_base_class := a_context.root_context.base_class
					if other_context.base_class /= l_root_context_base_class then
						Result := False
					elseif l_formal_type.index = other.index then
						if a_context.attachment_type_conformance_mode then
							Result := is_type_attached_with_type_mark (a_type_mark, a_context) = other.is_type_attached_with_type_mark (other_type_mark, other_context)
								and is_type_detachable_with_type_mark (a_type_mark, a_context) = other.is_type_detachable_with_type_mark (other_type_mark, other_context)
						else
							Result := True
						end
					end
				else
					if a_context.is_root_context then
						Result := an_actual.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
			l_root_context_base_class: ET_CLASS
			l_use_base_type: BOOLEAN
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					l_root_context_base_class := a_context.root_context.base_class
					if other_context.base_class /= l_root_context_base_class then
						l_use_base_type := True
					elseif l_formal_type.index = other.index then
						if a_context.attachment_type_conformance_mode then
							Result := is_type_attached_with_type_mark (a_type_mark, a_context) = other.is_type_attached_with_type_mark (other_type_mark, other_context)
								and is_type_detachable_with_type_mark (a_type_mark, a_context) = other.is_type_detachable_with_type_mark (other_type_mark, other_context)
						else
							Result := True
						end
					else
						l_use_base_type := True
					end
					if l_use_base_type then
						if a_context.is_root_context then
							Result := base_type (a_context).same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
						elseif a_context /= other_context then
							l_root_context := a_context.as_nested_type_context
							l_root_context.force_last (tokens.like_0)
							Result := base_type (l_root_context).same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, l_root_context)
							l_root_context.remove_last
						else
							Result := base_type (a_context.root_context).same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context.root_context)
						end
					end
				else
					if a_context.is_root_context then
						Result := an_actual.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context)
						l_root_context.remove_last
					else
						Result := an_actual.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
						-- The context of the formal generic parameter is the root context of `a_context'
						-- (because we took the actual parameter of its base type).
						-- Note that other types may be temporarily added to `a_context' or `other_context'
						-- when calling other nested "conforms_*" routines below. When these contexts are different,
						-- then the types are added directly to these contexts if they are nested (hence the use of
						-- 'like_0' below). Otherwise a copy of the context will be done and the types added to
						-- this copy. We don't do the copy now, but postpone it to when/if types need to be added.
						-- Hence the use of 'a_context.root_context' which will force the creation of a new
						-- nested context when calling 'a_context.as_nested_type_context' (because it's not a
						-- nested context).
					if a_context.is_root_context then
						Result := other.conforms_from_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context, other_type_mark, other_context, a_system_processor)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := other.conforms_from_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), l_root_context, other_type_mark, other_context, a_system_processor)
						l_root_context.remove_last
					else
						Result := other.conforms_from_formal_parameter_type_with_type_marks (l_formal_type, overridden_type_mark (a_type_mark), a_context.root_context, other_type_mark, other_context, a_system_processor)
					end
				else
					if a_context.is_root_context then
						Result := an_actual.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context, a_system_processor)
						l_root_context.remove_last
					else
						Result := an_actual.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context, a_system_processor)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
						-- No type other than itself conforms to a formal generic type,
						-- unless it is declared as 'reference' and 'detachable' in
						-- which case "detachable NONE" and "attached NONE" conform
						-- to it, or it is declared as 'reference' and not declared
						-- as 'detachable' in which case "attached NONE" conforms to it.
					if is_type_reference_with_type_mark (a_type_mark, a_context) and other.base_class.is_none then
						if other_context.attachment_type_conformance_mode then
							Result := is_type_detachable_with_type_mark (a_type_mark, a_context) or other.is_type_attached_with_type_mark (other_type_mark, other_context)
						else
							Result := True
						end
					end
				else
					if a_context.is_root_context then
						Result := an_actual.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context, a_system_processor)
						l_root_context.remove_last
					else
						Result := an_actual.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context, a_system_processor)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
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
			an_actual: ET_NAMED_TYPE
			an_index, other_index: INTEGER
			l_formal: ET_FORMAL_PARAMETER
			l_context_base_class: ET_CLASS
			l_root_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
			l_done: BOOLEAN
			i, nb: INTEGER
			l_type: ET_TYPE
			l_has_other_formal: BOOLEAN
			l_visited: ARRAY [NATURAL_32]
			j, nb2: INTEGER
			l_formal_type_mark: detachable ET_TYPE_MARK
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual as l_formal_type then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
					an_index := l_formal_type.index
					other_index := other.index
					l_root_context_base_class := a_context.root_context.base_class
					if other_context.base_class /= l_root_context_base_class then
						Result := False
					elseif an_index = other_index then
						if other_context.attachment_type_conformance_mode then
							Result := (is_type_attached_with_type_mark (a_type_mark, a_context) implies other.is_type_attached_with_type_mark (other_type_mark, other_context))
								and (other.is_type_detachable_with_type_mark (other_type_mark, other_context) implies is_type_detachable_with_type_mark (a_type_mark, a_context))
						else
							Result := True
						end
					else
							-- Check for constraints of the form "[G -> H,
							-- H -> K, K]" where "G" conforms to "K".
						if attached l_root_context_base_class.formal_parameters as l_formals and then other_index <= l_formals.count then
							l_formal := l_formals.formal_parameter (other_index)
							if attached l_formal.constraint as l_constraint then
									-- We know that there is a constraint.
								if not l_formal.has_constraint_cycle then
										-- There is no cycle of the form
										-- "[G -> G]" or "[G -> H, H -> G]".
									Result := l_constraint.conforms_to_type_with_type_marks (Current, a_type_mark, a_context, other.overridden_type_mark (other_type_mark), other_context, a_system_processor)
								else
										-- There is a cycle. If `other' is "H" and current
										-- type is "G", we still want to return True when
										-- "[G -> H, H -> K, K -> G]" but False (and
										-- without entering an infinite loop) when
										-- "[G, H -> K, K -> H]".
									nb := l_constraint.count
									from i := 1 until i > nb loop
										l_type := l_constraint.type_constraint (i).type
										if attached {ET_FORMAL_PARAMETER_TYPE} l_type as l_constraint_formal_type then
											if l_constraint_formal_type.index = an_index then
												if other_context.attachment_type_conformance_mode then
													l_formal_type_mark := other.overridden_type_mark (other_type_mark)
													Result := (is_type_attached_with_type_mark (a_type_mark, a_context) implies l_constraint_formal_type.is_type_attached_with_type_mark (l_formal_type_mark, other_context))
														and (l_constraint_formal_type.is_type_detachable_with_type_mark (l_formal_type_mark, other_context) implies is_type_detachable_with_type_mark (a_type_mark, a_context))
												else
													Result := True
												end
												if Result = True then
													i := nb -- Jump out of the loop.
												end
											else
												l_has_other_formal := True
											end
										end
										i := i + 1
									end
									if not Result and l_has_other_formal then
											-- We didn't find a conforming version (taking into account attachment marks)
											-- of `Current' in `l_constraint'. But there are some other formal parameters
											-- to follow in `l_constraint'. Let's check first that `Current' (modulo
											-- attachmnent marks) is at least in one of the constraints of `l_formals'.
										nb := l_formals.count
										l_done := True
										from i := 1 until i > nb loop
											if attached l_formals.formal_parameter (i).constraint as l_other_constraint and then l_other_constraint.has_formal_parameter (an_index) then
												l_done := False
												i := nb -- Jump out of the loop.
											end
											i := i + 1
										end
										if not l_done then
											from
												create l_visited.make_filled (0, 1, nb)
												l_visited.put (0b01, other_index)
											until
												l_done
											loop
												l_done := True
												from i := 1 until i > nb loop
													if l_visited.item (i) & 0b11 = 0b01 or l_visited.item (i) & 0b1100 = 0b0100 or l_visited.item (i) & 0b010000 = 0b110000 then
														if attached l_formals.formal_parameter (i).constraint as l_other_constraint then
															nb2 := l_other_constraint.count
															from j := 1 until j > nb2 loop
																if attached {ET_FORMAL_PARAMETER_TYPE} l_other_constraint.type_constraint (j).type as l_constraint_formal_type then
																	other_index := l_constraint_formal_type.index
																	if l_visited.item (i) & 0b11 = 0b01 then
																			-- No type mark.
																		if not attached l_constraint_formal_type.type_mark as l_constraint_type_mark or else not l_constraint_type_mark.is_attachment_mark then
																			if l_visited.item (other_index) & 0b11 = 0 then
																				l_visited.put (l_visited.item (other_index) | 0b01, other_index)
																				l_done := False
																			end
																		elseif l_constraint_type_mark.is_attached_mark then
																			if l_visited.item (other_index) & 0b1100 = 0 then
																				l_visited.put (l_visited.item (other_index) | 0b0100, other_index)
																				l_done := False
																			end
																		else
																			if l_visited.item (other_index) & 0b110000 = 0 then
																				l_visited.put (l_visited.item (other_index) | 0b010000, other_index)
																				l_done := False
																			end
																		end
																	end
																	if l_visited.item (i) & 0b1100 = 0b0100 then
																			-- 'attached' type mark.
																		if l_visited.item (other_index) & 0b1100 = 0 then
																			l_visited.put (l_visited.item (other_index) | 0b0100, other_index)
																			l_done := False
																		end
																	end
																	if l_visited.item (i) & 0b010000 = 0b110000 then
																			-- 'detachable' type mark
																		if l_visited.item (other_index) & 0b110000 = 0 then
																			l_visited.put (l_visited.item (other_index) | 0b010000, other_index)
																			l_done := False
																		end
																	end
																end
																j := j + 1
															end
														end
													end
													i := i + 1
												end
											end
											if l_visited.item (an_index) /= 0 then
												if l_visited.item (an_index) & 0b11 /= 0 then
														-- It's as if we had "[G, H -> G]".
													if other_context.attachment_type_conformance_mode then
														l_formal_type_mark := other.overridden_type_mark (other_type_mark)
														l_formal := l_formals.formal_parameter (an_index)
														Result := (is_type_attached_with_type_mark (a_type_mark, a_context) implies l_formal.is_type_attached_with_type_mark (l_formal_type_mark, other_context))
															and (l_formal.is_type_detachable_with_type_mark (l_formal_type_mark, other_context) implies is_type_detachable_with_type_mark (a_type_mark, a_context))
													else
														Result := True
													end
												end
												if not Result and l_visited.item (an_index) & 0b1100 /= 0 then
														-- It's as if we had "[G, H -> attached G]".
													if other_context.attachment_type_conformance_mode then
														l_formal_type_mark := tokens.attached_keyword.overridden_type_mark (other.overridden_type_mark (other_type_mark))
														l_formal := l_formals.formal_parameter (an_index)
														Result := (is_type_attached_with_type_mark (a_type_mark, a_context) implies l_formal.is_type_attached_with_type_mark (l_formal_type_mark, other_context))
															and (l_formal.is_type_detachable_with_type_mark (l_formal_type_mark, other_context) implies is_type_detachable_with_type_mark (a_type_mark, a_context))
													else
														Result := True
													end
												end
												if not Result and l_visited.item (an_index) & 0b110000 /= 0 then
														-- It's as if we had "[G, H -> detachable G]".
													if other_context.attachment_type_conformance_mode then
														l_formal_type_mark := tokens.detachable_keyword.overridden_type_mark (other.overridden_type_mark (other_type_mark))
														l_formal := l_formals.formal_parameter (an_index)
														Result := (is_type_attached_with_type_mark (a_type_mark, a_context) implies l_formal.is_type_attached_with_type_mark (l_formal_type_mark, other_context))
															and (l_formal.is_type_detachable_with_type_mark (l_formal_type_mark, other_context) implies is_type_detachable_with_type_mark (a_type_mark, a_context))
													else
														Result := True
													end
												end
											end
										end
									end
								end
							end
						else
								-- Internal error: does `other' type really appear in `other_context'?
							Result := False
						end
					end
				else
					if a_context.is_root_context then
						Result := an_actual.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context, a_system_processor)
						l_root_context.remove_last
					else
						Result := an_actual.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context, a_system_processor)
 					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
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
			an_actual: ET_NAMED_TYPE
			l_context_base_class: ET_CLASS
			l_root_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context_base_class := a_context.base_class
			if l_context_base_class /= implementation_class then
				if attached l_context_base_class.ancestor (implementation_class) as l_ancestor and then attached l_ancestor.actual_parameters as l_actual_parameters and then index <= l_actual_parameters.count then
					Result := l_actual_parameters.type (index).conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
				else
						-- Internal error: `l_context_base_class' is a descendant of `implementation_class'.
						-- So `l_ancestor' should not be Void. Furthermore `implementation_class' is the
						-- base class of `l_ancestor'. So there is a mismatch between the number of
						-- actual and formal generic parameters in `l_ancestor'.
					Result := False
				end
			elseif index <= a_context.base_type_actual_count then
				an_actual := a_context.base_type_actual (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} an_actual then
						-- The actual parameter associated with current
						-- type is itself a formal generic parameter.
						-- No type other than itself conforms to a formal generic type.
					Result := False
				else
					if a_context.is_root_context then
						Result := an_actual.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context, a_system_processor)
					elseif a_context /= other_context then
						l_root_context := a_context.as_nested_type_context
						l_root_context.force_last (tokens.like_0)
						Result := an_actual.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_root_context, a_system_processor)
						l_root_context.remove_last
					else
						Result := an_actual.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_context.root_context, a_system_processor)
					end
				end
			else
					-- Internal error: does current type really appear in `a_context'?
				Result := False
			end
		end

feature -- Type processing

	resolved_formal_parameters_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETERS): ET_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			if index <= a_parameters.count then
				Result := a_parameters.type (index)
				if attached {ET_FORMAL_PARAMETER_TYPE} Result as l_formal and then l_formal.index = index and then l_formal.implementation_class = implementation_class then
					Result := Current
				end
				l_type_mark := overridden_type_mark (a_type_mark)
				Result := Result.type_with_type_mark (l_type_mark)
			else
					-- Internal error: formal parameter not matched.
				Result := tokens.unknown_class
			end
		end

feature -- Type context

	is_valid_context_type (a_root_context: ET_BASE_TYPE): BOOLEAN
			-- Is current type only made up of class names and
			-- formal generic parameter names, and are the actual
			-- parameters of these formal parameters themselves
			-- in `a_root_context'?
		do
			if attached a_root_context.actual_parameters as l_parameters and then index <= l_parameters.count then
				Result := attached {ET_FORMAL_PARAMETER_TYPE} l_parameters.type (index) as l_formal and then l_formal.index = index and a_root_context.base_class = implementation_class
			end
		end

feature -- Output

	append_to_string (a_string: STRING)
			-- Append textual representation of
			-- current type to `a_string'.
		do
			if attached type_mark as l_type_mark then
				l_type_mark.append_to_string_with_space (a_string)
			end
			a_string.append_string (upper_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_formal_parameter_type (Current)
		end

invariant

	index_positive: index >= 1
	implementation_class_not_void: implementation_class /= Void

end
