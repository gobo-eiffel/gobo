note

	description:

		"Nested contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NESTED_TYPE_CONTEXT

inherit

	ET_TYPE_CONTEXT
		redefine
			as_nested_type_context
		end

	ET_TAIL_LIST [ET_TYPE]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_context: like root_context)
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

	make_with_capacity (a_context: like root_context; nb: INTEGER)
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

	reset (a_context: like root_context)
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

	new_type_context (a_type: ET_TYPE): ET_NESTED_TYPE_CONTEXT
			-- New type context made up of `a_type' in current context
		do
			Result := cloned_type_context
			Result.force_last (a_type)
		end

	named_base_class: ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in)
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.named_base_class
			when 1 then
				Result := last.named_base_class (root_context)
			else
				l_type := last
				remove_last
				Result := l_type.named_base_class (Current)
				put_last (l_type)
			end
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_with_type_mark (a_type_mark)
			when 1 then
				Result := last.base_type_with_type_mark (a_type_mark, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_with_type_mark (a_type_mark, Current)
				put_last (l_type)
			end
		end

	base_type_actual (i: INTEGER): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of `base_type'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_actual (i)
			when 1 then
				Result := last.base_type_actual (i, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_actual (i, Current)
				put_last (l_type)
			end
		end

	base_type_actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of `base_type'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_actual_parameter (i)
			when 1 then
				Result := last.base_type_actual_parameter (i, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_actual_parameter (i, Current)
				put_last (l_type)
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER): INTEGER
			-- Index of actual generic parameter with label `a_label' in `base_type';
			-- 0 if it does not exist
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_index_of_label (a_label)
			when 1 then
				Result := last.base_type_index_of_label (a_label, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_index_of_label (a_label, Current)
				put_last (l_type)
			end
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_named_type_with_type_mark (a_type_mark)
			when 1 then
				Result := last.named_type_with_type_mark (a_type_mark, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.named_type_with_type_mark (a_type_mark, Current)
				put_last (l_type)
			end
		end

feature -- Setting

	set_root_context (a_context: like root_context)
			-- Set `root_context' to `a_context'.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			root_context := a_context
		ensure
			root_context_set: root_context = a_context
		end

	set (a_type: ET_TYPE; a_context: like root_context)
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

	base_type_actual_count: INTEGER
			-- Number of actual generic parameters of `base_type'
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_actual_count
			when 1 then
				Result := last.base_type_actual_count (root_context)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_actual_count (Current)
				put_last (l_type)
			end
		end

feature -- Status report

	is_valid_context: BOOLEAN = True
			-- A context is valid if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_is_type_expanded_with_type_mark (a_type_mark)
			when 1 then
				Result := last.is_type_expanded_with_type_mark (a_type_mark, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.is_type_expanded_with_type_mark (a_type_mark, Current)
				put_last (l_type)
			end
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_is_type_reference_with_type_mark (a_type_mark)
			when 1 then
				Result := last.is_type_reference_with_type_mark (a_type_mark, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.is_type_reference_with_type_mark (a_type_mark, Current)
				put_last (l_type)
			end
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_is_type_attached_with_type_mark (a_type_mark)
			when 1 then
				Result := last.is_type_attached_with_type_mark (a_type_mark, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.is_type_attached_with_type_mark (a_type_mark, Current)
				put_last (l_type)
			end
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_is_type_detachable_with_type_mark (a_type_mark)
			when 1 then
				Result := last.is_type_detachable_with_type_mark (a_type_mark, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.is_type_detachable_with_type_mark (a_type_mark, Current)
				put_last (l_type)
			end
		end

	base_type_has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the base type of current context contain `a_class'?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_base_type_has_class (a_class)
			when 1 then
				Result := last.base_type_has_class (a_class, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.base_type_has_class (a_class, Current)
				put_last (l_type)
			end
		end

	named_type_has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the named type of current context contain `a_class'?
		local
			l_type: ET_TYPE
		do
			inspect count
			when 0 then
				Result := root_context.context_named_type_has_class (a_class)
			when 1 then
				Result := last.named_type_has_class (a_class, root_context)
			else
				l_type := last
				remove_last
				Result := l_type.named_type_has_class (a_class, Current)
				put_last (l_type)
			end
		end

feature -- Comparison

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_named_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_base_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_named_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_named_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_named_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_base_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_base_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_base_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Do current context and `other' type appearing in
			-- `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.conforms_from_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	conforms_from_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

	conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK): BOOLEAN
			-- Does `other' type appearing in `other_context' conform to current context?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			l_type: ET_TYPE
			a_context: ET_NESTED_TYPE_CONTEXT
		do
			inspect count
			when 0 then
				Result := root_context.context_conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark)
			when 1 then
				Result := last.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, root_context)
			else
				if other_context /= Current then
					l_type := last
					remove_last
					Result := l_type.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, Current)
					put_last (l_type)
				else
					l_type := last
					a_context := cloned_type_context
					a_context.remove_last
					Result := l_type.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
				end
			end
		end

feature -- Conversion

	as_nested_type_context: ET_NESTED_TYPE_CONTEXT
			-- Nested type context corresponding to the same type as current;
			-- Return `Current' is already a nested type context.
		do
			Result := Current
		ensure then
			same_object: Result = Current
		end

	to_nested_type_context: ET_NESTED_TYPE_CONTEXT
			-- Nested type context corresponding to the same type as current;
			-- Return a new object at each call.
		do
			Result := cloned_type_context
		end

feature -- Link

	next: detachable like Current
			-- Next linked context if list of contexts

	set_next (a_next: like Current)
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

feature -- Duplication

	cloned_type_context: ET_NESTED_TYPE_CONTEXT
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

	copy_type_context (other: ET_NESTED_TYPE_CONTEXT)
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

	fixed_array: KL_SPECIAL_ROUTINES [ET_TYPE]
			-- Fixed array routines
		once
			create Result
		end

invariant

	is_valid_context: is_valid_context

end
