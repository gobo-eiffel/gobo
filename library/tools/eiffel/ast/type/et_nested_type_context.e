indexing

	description:

		"Nested contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NESTED_TYPE_CONTEXT

inherit

	ET_TYPE_CONTEXT

	ET_TAIL_LIST [ET_TYPE]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_context: like root_context) is
			-- Create a new nested type context.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			root_context := a_context
			make_ast_list
		ensure
			root_context_set: root_context = a_context
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_context: like root_context; nb: INTEGER) is
			-- Create a new nested type context with capacity `nb'.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			nb_positive: nb >= 0
		do
			root_context := a_context
			make_ast_list_with_capacity (nb)
		ensure
			root_context_set: root_context = a_context
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Initialization

	reset (a_context: like root_context) is
			-- Reset current nested type context.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			wipe_out
			root_context := a_context
		ensure
			root_context_set: root_context = a_context
			is_empty: is_empty
			same_capacity: capacity = old capacity
		end

feature -- Access

	root_context: ET_BASE_TYPE
			-- Root context

	new_type_context (a_type: ET_TYPE): ET_NESTED_TYPE_CONTEXT is
			-- New type context made up of `a_type' in current context
		do
			Result := cloned_type_context
			Result.force_last (a_type)
		end

	base_class (a_universe: ET_UNIVERSE): ET_CLASS is
			-- Base class of current context in `a_universe'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_class (a_universe)
			when 1 then
				Result := last.base_class (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_class (Current, a_universe)
				put_last (l_type)
			end
		end

	base_type (a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Base type of current context in `a_universe'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type (a_universe)
			when 1 then
				Result := last.base_type (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_type (Current, a_universe)
				put_last (l_type)
			end
		end

	base_type_actual (i: INTEGER; a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- `i'-th actual generic parameter's type of `base_type'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_actual (i, a_universe)
			when 1 then
				Result := last.base_type_actual (i, root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_actual (i, Current, a_universe)
				put_last (l_type)
			end
		end

	base_type_actual_parameter (i: INTEGER; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- `i'-th actual generic parameter of `base_type'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_actual_parameter (i, a_universe)
			when 1 then
				Result := last.base_type_actual_parameter (i, root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_actual_parameter (i, Current, a_universe)
				put_last (l_type)
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_universe: ET_UNIVERSE): INTEGER is
			-- Index of actual generic parameter with label `a_label' in `base_type';
			-- 0 if it does not exist
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_index_of_label (a_label, a_universe)
			when 1 then
				Result := last.base_type_index_of_label (a_label, root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_index_of_label (a_label, Current, a_universe)
				put_last (l_type)
			end
		end

	named_type (a_universe: ET_UNIVERSE): ET_NAMED_TYPE is
			-- Same as `base_type' except when the type is still
			-- a formal generic parameter after having been replaced
			-- by its actual counterpart in `a_universe'. Return this
			-- new formal type in that case instead of the base
			-- type of its constraint.
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_named_type (a_universe)
			when 1 then
				Result := last.named_type (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.named_type (Current, a_universe)
				put_last (l_type)
			end
		end

feature -- Setting

	set_root_context (a_context: like root_context) is
			-- Set `root_context' to `a_context'.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			root_context := a_context
		ensure
			root_context_set: root_context = a_context
		end

	set (a_type: ET_TYPE; a_context: like root_context) is
			-- Reset nested type context.
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			wipe_out
			root_context := a_context
			force_last (a_type)
		ensure
			root_context_set: root_context = a_context
			count_set: count = 1
			last_set: last = a_type
		end

feature -- Measurement

	base_type_actual_count (a_universe: ET_UNIVERSE): INTEGER is
			-- Number of actual generic parameters of `base_type'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_actual_count (a_universe)
			when 1 then
				Result := last.base_type_actual_count (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_actual_count (Current, a_universe)
				put_last (l_type)
			end
		end

feature -- Status report

	is_valid_context: BOOLEAN is True
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves

	is_type_expanded (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `base_type' expanded in `a_universe'?
			-- (Note that the feature name `is_expanded_type' is
			-- already the name of a feature in SmartEiffel's GENERAL.)
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_is_type_expanded (a_universe)
			when 1 then
				Result := last.is_type_expanded (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.is_type_expanded (Current, a_universe)
				put_last (l_type)
			end
		end

	is_type_reference (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `base_type' reference in `a_universe'?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_is_type_reference (a_universe)
			when 1 then
				Result := last.is_type_reference (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.is_type_reference (Current, a_universe)
				put_last (l_type)
			end
		end

	has_formal_type (i: INTEGER; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current context in `a_universe'
			-- contain the formal generic parameter with index `i'?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_has_formal_type (i, a_universe)
			when 1 then
				Result := last.has_formal_type (i, root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.has_formal_type (i, Current, a_universe)
				put_last (l_type)
			end
		end

	has_formal_types (a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current context in `a_universe'
			-- contain a formal generic parameter?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_has_formal_types (a_universe)
			when 1 then
				Result := last.has_formal_types (root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.has_formal_types (Current, a_universe)
				put_last (l_type)
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the base type of current context contain `a_class'
			-- in `a_universe'?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_has_class (a_class, a_universe)
			when 1 then
				Result := last.base_type_has_class (a_class, root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_has_class (a_class, Current, a_universe)
				put_last (l_type)
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named type of current context contain `a_class'
			-- in `a_universe'?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_named_type_has_class (a_class, a_universe)
			when 1 then
				Result := last.named_type_has_class (a_class, root_context, a_universe)
			else
				l_type := last
				remove_last
				Result := l_type.named_type_has_class (a_class, Current, a_universe)
				put_last (l_type)
			end
		end

feature -- Comparison

	same_named_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in `other_context'
			-- have the same named type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_named_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_base_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in `other_context'
			-- have the same base type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_base_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_type (other, other_context, a_context, a_universe)
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_named_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_bit_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_named_bit_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_bit_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_bit_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_named_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_class_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_named_class_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_class_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_class_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_named_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_formal_parameter_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_named_formal_parameter_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_formal_parameter_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_formal_parameter_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_named_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_tuple_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_named_tuple_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_tuple_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_tuple_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_bit_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_base_bit_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_bit_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_bit_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_base_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_class_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_base_class_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_class_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_class_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_base_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_formal_parameter_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_base_formal_parameter_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_formal_parameter_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_formal_parameter_type (other, other_context, a_context, a_universe)
				end
			end
		end

	same_base_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_tuple_type (other, other_context, a_universe)
			when 1 then
				Result := last.same_base_tuple_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_tuple_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_tuple_type (other, other_context, a_context, a_universe)
				end
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does current context conform to `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_to_type (other, other_context, a_universe)
			when 1 then
				Result := last.conforms_to_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_to_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_to_type (other, other_context, a_context, a_universe)
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_bit_type (other, other_context, a_universe)
			when 1 then
				Result := last.conforms_from_bit_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_bit_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_bit_type (other, other_context, a_context, a_universe)
				end
			end
		end

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_class_type (other, other_context, a_universe)
			when 1 then
				Result := last.conforms_from_class_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_class_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_class_type (other, other_context, a_context, a_universe)
				end
			end
		end

	conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_formal_parameter_type (other, other_context, a_universe)
			when 1 then
				Result := last.conforms_from_formal_parameter_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_formal_parameter_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_formal_parameter_type (other, other_context, a_context, a_universe)
				end
			end
		end

	conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform to current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_tuple_type (other, other_context, a_universe)
			when 1 then
				Result := last.conforms_from_tuple_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_tuple_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_tuple_type (other, other_context, a_context, a_universe)
				end
			end
		end

feature -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_to_type (other: ET_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of current context conform to
			-- the reference version of `other' type appearing in `other_context'?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.reference_context_conforms_to_type (other, other_context, a_universe)
			when 1 then
				Result := last.reference_conforms_to_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.reference_conforms_to_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.reference_conforms_to_type (other, other_context, a_context, a_universe)
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance of reference version of types (compatilibity with ISE 5.6.0610, to be removed later)

	reference_conforms_from_bit_type (other: ET_BIT_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.reference_context_conforms_from_bit_type (other, other_context, a_universe)
			when 1 then
				Result := last.reference_conforms_from_bit_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.reference_conforms_from_bit_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.reference_conforms_from_bit_type (other, other_context, a_context, a_universe)
				end
			end
		end

	reference_conforms_from_class_type (other: ET_CLASS_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.reference_context_conforms_from_class_type (other, other_context, a_universe)
			when 1 then
				Result := last.reference_conforms_from_class_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.reference_conforms_from_class_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.reference_conforms_from_class_type (other, other_context, a_context, a_universe)
				end
			end
		end

	reference_conforms_from_formal_parameter_type (other: ET_FORMAL_PARAMETER_TYPE;
		other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.reference_context_conforms_from_formal_parameter_type (other, other_context, a_universe)
			when 1 then
				Result := last.reference_conforms_from_formal_parameter_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.reference_conforms_from_formal_parameter_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.reference_conforms_from_formal_parameter_type (other, other_context, a_context, a_universe)
				end
			end
		end

	reference_conforms_from_tuple_type (other: ET_TUPLE_TYPE; other_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the reference version of `other' type appearing in `other_context'
			-- conform to the reference version of current context?
			-- (Note: 'a_universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.reference_context_conforms_from_tuple_type (other, other_context, a_universe)
			when 1 then
				Result := last.reference_conforms_from_tuple_type (other, other_context, root_context, a_universe)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.reference_conforms_from_tuple_type (other, other_context, Current, a_universe)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.reference_conforms_from_tuple_type (other, other_context, a_context, a_universe)
				end
			end
		end

feature -- Link

	next: like Current
			-- Next linked context if list of contexts

	set_next (a_next: like Current) is
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

feature -- Duplication

	cloned_type_context: ET_NESTED_TYPE_CONTEXT is
			-- Cloned version of current context
		local
			i, nb: INTEGER
		do
			create Result.make_with_capacity (root_context, capacity)
			nb := count
			from i := 1 until i > nb loop
				Result.put_last (item (i))
				i := i + 1
			end
		ensure
			cloned_type_context_not_void: Result /= Void
		end

	copy_type_context (other: ET_NESTED_TYPE_CONTEXT) is
			-- Copy `other' to current context.
		local
			i, nb: INTEGER
		do
			wipe_out
			set_root_context (other.root_context)
			nb := other.count
			from i := 1 until i > nb loop
				force_last (other.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_TYPE] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	is_valid_context: is_valid_context

end
