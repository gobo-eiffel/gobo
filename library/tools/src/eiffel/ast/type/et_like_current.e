note

	description:

		"Eiffel 'like Current' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_CURRENT

inherit

	ET_LIKE_TYPE
		redefine
			named_type_with_type_mark,
			shallow_named_type_with_type_mark,
			named_type_has_class,
			is_like_current,
			add_adapted_base_classes_to_list,
			adapted_base_class_with_named_feature,
			adapted_base_class_with_seeded_feature,
			same_syntactical_like_current_with_type_marks,
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
			has_unqualified_anchored_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark)
			-- Create a new 'like Current' type.
		do
			type_mark := a_type_mark
			like_keyword := tokens.like_keyword
			current_keyword := tokens.current_keyword
		ensure
			type_mark_set: type_mark = a_type_mark
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword

	current_keyword: ET_CURRENT
			-- 'current' keyword

	named_base_class (a_context: ET_TYPE_CONTEXT): ET_NAMED_CLASS
			-- Same as `base_class' except that it returns information about this
			-- class (e.g. its name) as known from the universe it is used from
			-- (instead of from the universe it is written in).
			-- Return "*UNKNOWN*" class if unresolved identifier type,
			-- or unmatched formal generic parameter.
		do
			Result := a_context.named_base_class
		end

	adapted_base_class_with_named_feature (a_name: ET_CALL_NAME; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint adapted base classes containing
			-- a feature named `a_name' (or any of the constraints if none contains such
			-- feature)
		do
			Result := a_context.adapted_base_class_with_named_feature (a_name)
		end

	adapted_base_class_with_seeded_feature (a_seed: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ADAPTED_CLASS
			-- Base class of current type when it appears in `a_context', or in case of
			-- a formal parameter one of its constraint adapted base classes containing
			-- a feature with seed `a_seed' (or any of the constraints if none contains
			-- such feature)
		do
			Result := a_context.adapted_base_class_with_seeded_feature (a_seed)
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.base_type_with_type_mark (overridden_type_mark (a_type_mark))
		end

	shallow_base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.root_context.shallow_base_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
		end

	base_type_actual (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- `i'-th actual generic parameter's type of the base type of current
			-- type when it appears in `a_context'
		do
			Result := a_context.base_type_actual (i)
		end

	base_type_actual_parameter (i: INTEGER; a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
			-- `i'-th actual generic parameter of the base type of current
			-- type when it appears in `a_context'
		do
			Result := a_context.base_type_actual_parameter (i)
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label' in
			-- the base type of current type when it appears in `a_context';
			-- 0 if it does not exist
		do
			Result := a_context.base_type_index_of_label (a_label)
		end

	named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.named_type_with_type_mark (overridden_type_mark (a_type_mark))
		end

	shallow_named_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_NAMED_TYPE
			-- Same as `shallow_named_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.root_context.shallow_named_type_with_type_mark (overridden_type_mark (a_type_mark), a_context)
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_LIKE_CURRENT
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark = type_mark then
				Result := Current
			else
				create Result.make (a_type_mark)
				Result.set_like_keyword (like_keyword)
				Result.set_current_keyword (current_keyword)
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
			if Result.is_null then
				Result := current_keyword.position
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := current_keyword
		end

feature -- Measurement

	base_type_actual_count (a_context: ET_TYPE_CONTEXT): INTEGER
			-- Number of actual generic parameters of the base type of current type
		do
			Result := a_context.base_type_actual_count
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

	set_current_keyword (a_current: like current_keyword)
			-- Set `current_keyword' to `a_current'.
		require
			a_current_not_void: a_current /= Void
		do
			current_keyword := a_current
		ensure
			current_keyword_set: current_keyword = a_current
		end

feature -- Status report

	is_like_current: BOOLEAN = True
			-- Is current type of the form 'like Current'?

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.is_type_expanded_with_type_mark (overridden_type_mark (a_type_mark))
		end

	is_type_reference_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_reference' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.is_type_reference_with_type_mark (overridden_type_mark (a_type_mark))
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.is_type_attached_with_type_mark (overridden_type_mark (a_type_mark))
		end

	is_type_detachable_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_detachable' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := a_context.is_type_detachable_with_type_mark (overridden_type_mark (a_type_mark))
		end

	has_unqualified_anchored_type: BOOLEAN
			-- Does current type contain an unqualified anchored type
			-- (i.e. 'like Current' or 'like feature_name')?
		do
			Result := True
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		do
			Result := a_context.base_type_has_class (a_class)
		end

	named_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named type of current type contain `a_class'
			-- when it appears in `a_context'?
		do
			Result := a_context.named_type_has_class (a_class)
		end

feature -- Basic operations

	add_adapted_base_classes_to_list (a_list: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT)
			-- Add to `a_list' the base class of current type when it appears in `a_context' or
			-- the adapted base classes of the constraints (in the same order they appear in
			-- 'constraint_base_types') in case of a formal parameter.
		do
			a_context.add_adapted_base_classes_to_list (a_list)
		end

feature -- Comparison

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if other = Current and then other_type_mark = a_type_mark then
				Result := True
			else
				Result := other.same_syntactical_like_current_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				Result := a_context.same_named_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				Result := a_context.same_base_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

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
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			elseif a_context.attachment_type_conformance_mode then
				Result := same_attachment_marks_with_default (overridden_type_mark (a_type_mark), other.overridden_type_mark (other_type_mark), Void)
			else
				Result := True
			end
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := a_context.same_named_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
		end

	same_named_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := a_context.same_named_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
		end

	same_named_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := a_context.same_named_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := a_context.same_base_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
		end

	same_base_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := a_context.same_base_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
		end

	same_base_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := a_context.same_base_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark))
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if other = Current and then other_type_mark = a_type_mark and then other_context = a_context then
				Result := True
			else
				Result := a_context.conforms_to_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_system_processor)
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
		do
			Result := a_context.conforms_from_class_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_system_processor)
		end

	conforms_from_formal_parameter_type_with_type_marks (other: ET_FORMAL_PARAMETER_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := a_context.conforms_from_formal_parameter_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_system_processor)
		end

	conforms_from_tuple_type_with_type_marks (other: ET_TUPLE_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			Result := a_context.conforms_from_tuple_type_with_type_marks (other, other_type_mark, other_context, overridden_type_mark (a_type_mark), a_system_processor)
		end

feature -- Output

	append_to_string (a_string: STRING)
			-- Append textual representation of
			-- current type to `a_string'.
		do
			if attached type_mark as l_type_mark then
				l_type_mark.append_to_string_with_space (a_string)
			end
			a_string.append_string (like_space_current)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_like_current (Current)
		end

feature {NONE} -- Constants

	like_space_current: STRING = "like Current"
			-- Eiffel keywords

invariant

	current_keyword_not_void: current_keyword /= Void

end
