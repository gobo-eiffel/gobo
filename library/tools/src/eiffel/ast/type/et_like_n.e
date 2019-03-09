note

	description:

		"Eiffel types appearing in nested type contexts and representing n-th type in these contexts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2015-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_N

inherit

	ET_LIKE_TYPE
		redefine
			named_type_with_type_mark,
			shallow_named_type_with_type_mark,
			named_type_has_class,
			add_adapted_classes_to_list,
			adapted_class_with_named_feature,
			adapted_class_with_seeded_feature,
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
			is_type_detachable_with_type_mark
		end

create

	make_zero,
	make

feature {NONE} -- Initialization

	make_zero (a_type_mark: like type_mark)
			-- Create a new 'like 0' type.
		do
			type_mark := a_type_mark
			like_keyword := tokens.like_keyword
			index := 0
			previous := Current
		ensure
			type_mark_set: type_mark = a_type_mark
			zero: index = 0
		end

	make (a_type_mark: like type_mark; a_previous: ET_LIKE_N)
			-- Create a new 'like N' type.
		require
			a_previous_not_void: a_previous /= Void
		do
			type_mark := a_type_mark
			like_keyword := tokens.like_keyword
			previous := a_previous
			index := a_previous.index + 1
		ensure
			type_mark_set: type_mark = a_type_mark
			previous_set: previous = a_previous
			index_set: index = a_previous.index + 1
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	index: INTEGER
			-- Index in nested type context

	previous: ET_LIKE_N
			-- Previous index in nested type context

	named_base_class (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context := a_context.as_nested_type_context
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).named_base_class (l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				Result := l_previous_context.root_context.named_base_class
			end
		end

	adapted_class_with_named_feature (a_name: ET_CALL_NAME; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint base types containing a feature
			-- named `a_name' (or any of the constraints if none contains such feature)
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context := a_context.as_nested_type_context
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).adapted_class_with_named_feature (a_name, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				Result := l_previous_context.root_context.context_adapted_class_with_named_feature (a_name)
			end
		end

	adapted_class_with_seeded_feature (a_seed: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint base types containing a feature
			-- with seed `a_seed' (or any of the constraints if none contains such feature)
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context := a_context.as_nested_type_context
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).adapted_class_with_seeded_feature (a_seed, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				Result := l_previous_context.root_context.context_adapted_class_with_seeded_feature (a_seed)
			end
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).base_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.base_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	shallow_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).shallow_base_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.shallow_base_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).base_type_actual (i, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.base_type_actual (i, l_previous_context)
				l_previous_context.remove_last
			end
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).base_type_actual_parameter (i, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.base_type_actual_parameter (i, l_previous_context)
				l_previous_context.remove_last
			end
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).base_type_index_of_label (a_label, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.base_type_index_of_label (a_label, l_previous_context)
				l_previous_context.remove_last
			end
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).named_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.named_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	shallow_named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `shallow_named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).shallow_named_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.shallow_named_type_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_LIKE_N
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark = type_mark then
				Result := Current
			else
				create Result.make (a_type_mark, previous)
				Result.set_like_keyword (like_keyword)
			end
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := 1
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
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := like_keyword
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).base_type_actual_count (l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.base_type_actual_count (l_previous_context)
				l_previous_context.remove_last
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

feature -- Status report

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.is_type_reference_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).is_type_attached_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.is_type_attached_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).is_type_detachable_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.is_type_detachable_with_type_mark (overridden_type_mark (a_type_mark), l_previous_context)
				l_previous_context.remove_last
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).base_type_has_class (a_class, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.base_type_has_class (a_class, l_previous_context)
				l_previous_context.remove_last
			end
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context.force_last (previous)
				Result := l_previous_context.item (index).named_type_has_class (a_class, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.force_last (tokens.like_0)
				Result := l_previous_context.root_context.named_type_has_class (a_class, l_previous_context)
				l_previous_context.remove_last
			end
		end

feature -- Basic operations

	add_adapted_classes_to_list (a_list: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT)
			-- Add to `a_list' the base class of current type when it appears in `a_context' or
			-- the constraint base types (in the same order they appear in 'constraint_base_types')
			-- in case of a formal parameter.
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				l_previous_context := a_context.as_nested_type_context
				l_previous_context.force_last (previous)
				l_previous_context.item (index).add_adapted_classes_to_list (a_list, l_previous_context)
				l_previous_context.remove_last
			else
					-- We reached the root context.
				l_previous_context.root_context.context_add_adapted_classes_to_list (a_list)
			end
		end

feature -- Comparison

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
				-- 'like N' is not a syntactical type.
			Result := False
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				l_previous_context := a_context.as_nested_type_context
				if l_previous_context.valid_index (index) then
					if a_context /= other_context then
						l_previous_context.force_last (previous)
						Result := l_previous_context.item (index).same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
						l_previous_context.remove_last
					else
						l_previous_context := a_context.to_nested_type_context
						l_previous_context.force_last (previous)
						Result := l_previous_context.item (index).same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					end
				else
						-- We reached the root context.
					if l_previous_context.is_root_context then
						Result := l_previous_context.root_context.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					elseif a_context /= other_context then
						l_previous_context.force_last (tokens.like_0)
						Result := l_previous_context.root_context.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
						l_previous_context.remove_last
					else
						l_previous_context := a_context.to_nested_type_context
						l_previous_context.force_last (tokens.like_0)
						Result := l_previous_context.root_context.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					end
				end
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				l_previous_context := a_context.as_nested_type_context
				if l_previous_context.valid_index (index) then
					if a_context /= other_context then
						l_previous_context.force_last (previous)
						Result := l_previous_context.item (index).same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
						l_previous_context.remove_last
					else
						l_previous_context := a_context.to_nested_type_context
						l_previous_context.force_last (previous)
						Result := l_previous_context.item (index).same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					end
				else
						-- We reached the root context.
					if l_previous_context.is_root_context then
						Result := l_previous_context.root_context.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					elseif a_context /= other_context then
						l_previous_context.force_last (tokens.like_0)
						Result := l_previous_context.root_context.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
						l_previous_context.remove_last
					else
						l_previous_context := a_context.to_nested_type_context
						l_previous_context.force_last (tokens.like_0)
						Result := l_previous_context.root_context.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					end
				end
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			end
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			end
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			end
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			end
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			end
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context)
				end
			end
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				l_previous_context := a_context.as_nested_type_context
				if l_previous_context.valid_index (index) then
					if a_context /= other_context then
						l_previous_context.force_last (previous)
						Result := l_previous_context.item (index).conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
						l_previous_context.remove_last
					else
						l_previous_context := a_context.to_nested_type_context
						l_previous_context.force_last (previous)
						Result := l_previous_context.item (index).conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					end
				else
						-- We reached the root context.
					if l_previous_context.is_root_context then
						Result := l_previous_context.root_context.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					elseif a_context /= other_context then
						l_previous_context.force_last (tokens.like_0)
						Result := l_previous_context.root_context.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
						l_previous_context.remove_last
					else
						l_previous_context := a_context.to_nested_type_context
						l_previous_context.force_last (tokens.like_0)
						Result := l_previous_context.root_context.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					end
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
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
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
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
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
			l_previous_context: ET_NESTED_TYPE_CONTEXT
		do
			l_previous_context := a_context.as_nested_type_context
			if l_previous_context.valid_index (index) then
				if a_context /= other_context then
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (previous)
					Result := l_previous_context.item (index).conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				end
			else
					-- We reached the root context.
				if l_previous_context.is_root_context then
					Result := l_previous_context.root_context.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				elseif a_context /= other_context then
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
					l_previous_context.remove_last
				else
					l_previous_context := a_context.to_nested_type_context
					l_previous_context.force_last (tokens.like_0)
					Result := l_previous_context.root_context.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), l_previous_context, a_system_processor)
				end
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
			a_string.append_string (like_space)
			a_string.append_integer (index)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_like_n (Current)
		end

invariant

	index_not_negative: index >= 0
	previous_not_void: previous /= Void
	previous_definition: previous.index = (index - 1).max (0)

end
