note

	description:

		"Eiffel class types"

	library: "Gobo Eiffel Tools Library"
	copyright:  "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_TYPE

inherit

	ET_BASE_TYPE
		redefine
			actual_parameters,
			same_syntactical_class_type_with_type_marks,
			same_named_class_type_with_type_marks,
			same_base_class_type_with_type_marks,
			same_as_base_class,
			conforms_from_class_type_with_type_marks,
			resolved_formal_parameters_with_type_mark,
			append_unaliased_to_string,
			append_runtime_name_to_string,
			type_with_type_mark,
			type_mark,
			overridden_type_mark,
			reset
		end

	ET_SHARED_FEATURE_NAME_TESTER

create

	make,
	make_generic

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name; a_named_base_class: like named_base_class)
			-- Create a new class type.
		require
			a_name_not_void: a_name /= Void
			a_named_base_class_not_void: a_named_base_class /= Void
		do
			type_mark := a_type_mark
			name := a_name
			named_base_class := a_named_base_class
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			named_base_class_set: named_base_class = a_named_base_class
		end

	make_generic (a_type_mark: like type_mark; a_name: like name;
		a_parameters: attached like actual_parameters; a_named_base_class: like named_base_class)
			-- Create a new generic class type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
			a_named_base_class_not_void: a_named_base_class /= Void
		do
			type_mark := a_type_mark
			name := a_name
			actual_parameters := a_parameters
			named_base_class := a_named_base_class
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			raw_actual_parameters_set: actual_parameters = a_parameters
			named_base_class_set: named_base_class = a_named_base_class
		end

feature -- Initialization

	reset
			-- Reset type as it was just after it was last parsed.
		do
			if tuple_actual_parameters_unfolded_1 or tuple_actual_parameters_unfolded_2 then
				tuple_actual_parameters_unfolded_1 := False
				tuple_actual_parameters_unfolded_2 := False
				if attached {ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS} actual_parameters as l_actual_parameters then
					actual_parameters := Void
				elseif attached {ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS} actual_parameters as l_actual_parameters then
					actual_parameters := l_actual_parameters.actual_parameters
				end
				if attached {ET_ACTUAL_PARAMETER_SUBLIST} actual_parameters as l_actual_parameters then
					actual_parameters := l_actual_parameters.actual_parameters
				end
			end
			if attached actual_parameters as l_parameters then
				l_parameters.reset
			end
		end

feature -- Access

	actual_parameters: detachable ET_ACTUAL_PARAMETERS
			-- Actual generic parameters

	type_mark: detachable ET_TYPE_MARK
			-- 'attached', 'detachable', 'expanded', 'reference' or 'separate' keyword,
			-- or '!' or '?' symbol

	overridden_type_mark (a_override_type_mark: detachable ET_TYPE_MARK): detachable ET_TYPE_MARK
			-- Version of `type_mark' overridden by `a_override_type_mark'
		local
			l_result_expanded_mark: BOOLEAN
			l_result_reference_mark: BOOLEAN
			l_result_separate_mark: BOOLEAN
			l_result_attached_mark: BOOLEAN
			l_result_detachable_mark: BOOLEAN
			l_current_ok: BOOLEAN
			l_other_ok: BOOLEAN
		do
			if a_override_type_mark = Void then
				Result := type_mark
			else
				l_current_ok := True
				l_other_ok := True
				if a_override_type_mark.is_expandedness_mark then
					if a_override_type_mark.is_expanded_mark then
						if not is_expanded then
							l_current_ok := False
						end
						if not base_class.is_expanded then
							l_result_expanded_mark := True
						end
					else
						if is_expanded then
							l_current_ok := False
						end
						if base_class.is_expanded then
							l_result_reference_mark := True
						end
					end
				elseif attached type_mark as l_type_mark and then l_type_mark.is_expandedness_mark then
					if l_type_mark.is_expanded_mark then
						if not base_class.is_expanded then
							l_other_ok := False
							l_result_expanded_mark := True
						end
					else
						if base_class.is_expanded then
							l_other_ok := False
							l_result_reference_mark := True
						end
					end
				end
				if a_override_type_mark.is_separateness_mark then
					if not is_separate then
						l_current_ok := False
					end
					if not base_class.is_separate then
						l_result_separate_mark := True
					end
				elseif attached type_mark as l_type_mark and then l_type_mark.is_separateness_mark then
					if not base_class.is_separate then
						l_other_ok := False
						l_result_separate_mark := True
					end
				end
				if a_override_type_mark.is_attachment_mark then
					if a_override_type_mark.is_attached_mark then
						if not is_attached then
							l_current_ok := False
						end
						if not (base_class.is_expanded or l_result_expanded_mark) or l_result_reference_mark then
							l_result_attached_mark := True
						end
					else
						if is_attached and not is_expanded then
							l_current_ok := False
						end
						if not (base_class.is_expanded or l_result_expanded_mark) or l_result_reference_mark then
							l_result_detachable_mark := True
						end
					end
				elseif attached type_mark as l_type_mark and then l_type_mark.is_attachment_mark then
					if l_type_mark.is_attached_mark then
						if not base_class.is_expanded then
							l_other_ok := False
						end
						if not (base_class.is_expanded or l_result_expanded_mark) or l_result_reference_mark then
							l_result_attached_mark := True
						end
					else
						if not base_class.is_expanded then
							l_other_ok := False
						end
						if not (base_class.is_expanded or l_result_expanded_mark) or l_result_reference_mark then
							l_result_detachable_mark := True
						end
					end
				end
				if l_current_ok then
					Result := type_mark
				elseif l_other_ok then
					Result := a_override_type_mark
				else
					Result := tokens.implicit_type_mark (l_result_expanded_mark, l_result_reference_mark, l_result_separate_mark, l_result_attached_mark, l_result_detachable_mark)
				end
			end
		end

	base_type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_actual_parameters: like actual_parameters
			l_named_parameters: detachable ET_ACTUAL_PARAMETERS
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_actual_parameters := actual_parameters
			if a_context = Current or (a_context.is_root_context and then a_context.root_context = Current) then
					-- The current type is its own context, therefore it has the same
					-- actual parameters as its base type.
				l_named_parameters := l_actual_parameters
			elseif l_actual_parameters /= Void then
				l_named_parameters := l_actual_parameters.named_types (a_context)
			end
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark or l_named_parameters /= l_actual_parameters then
				if l_named_parameters /= Void then
					create {ET_CLASS_TYPE} Result.make_generic (l_type_mark, name, l_named_parameters, named_base_class)
				else
					create {ET_CLASS_TYPE} Result.make (l_type_mark, name, named_base_class)
				end
			else
				Result := Current
			end
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_CLASS_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark then
				if attached actual_parameters as l_actual_parameters then
					create {ET_CLASS_TYPE} Result.make_generic (l_type_mark, name, l_actual_parameters, named_base_class)
				else
					create {ET_CLASS_TYPE} Result.make (l_type_mark, name, named_base_class)
				end
			else
				Result := Current
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
				Result := name.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.last_leaf
			else
				Result := name.last_leaf
			end
		end

feature -- Status report

	is_separate: BOOLEAN
			-- Is current type separate?
		do
			if attached type_mark as l_type_mark then
				Result := l_type_mark.is_separate_mark
			else
				Result := base_class.is_separate
			end
		end

	is_type_separate_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type separate when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			if a_type_mark = Void then
				Result := is_separate
			elseif a_type_mark.is_separate_mark then
				Result := True
			else
				Result := is_separate
			end
		end

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			if not attached type_mark as l_type_mark then
				Result := base_class.is_expanded
			elseif l_type_mark.is_expanded_mark then
				Result := True
			elseif l_type_mark.is_reference_mark then
				Result := False
			else
				Result := base_class.is_expanded
			end
		end

	is_type_expanded_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is current type expanded when viewed from `a_context'?
		do
			if a_type_mark = Void then
				Result := is_expanded
			elseif a_type_mark.is_expanded_mark then
				Result := True
			elseif a_type_mark.is_reference_mark then
				Result := False
			else
				Result := is_expanded
			end
		end

	is_attached: BOOLEAN
			-- Is current type attached?
		do
			if is_expanded then
				Result := True
			elseif attached type_mark as l_type_mark and then l_type_mark.is_attachment_mark then
				Result := l_type_mark.is_attached_mark
			else
				Result := True
			end
		end

	is_type_attached_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			if a_type_mark = Void then
				Result := is_attached
			elseif a_type_mark.is_attached_mark then
				Result := True
			elseif a_type_mark.is_detachable_mark then
					-- Expanded types are always attached regardless of the type marks.
				Result := is_expanded
			else
				Result := is_attached
			end
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		do
			if a_class = base_class then
				Result := True
			elseif attached actual_parameters as l_actual_parameters then
				Result := l_actual_parameters.named_types_have_class (a_class, a_context)
			end
		end

	tuple_actual_parameters_unfolded_1: BOOLEAN
			-- Has the first phase of Tuple-type-unfolding been performed?

	tuple_actual_parameters_unfolded_2: BOOLEAN
			-- Has the second phase of Tuple-type-unfolding been performed?

feature -- Comparison

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_syntactical_class_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_named_class_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_base_class_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_as_base_class: BOOLEAN
			-- Is current type a non-generic class type with the same
			-- expandedness, attachment and separateness status as its base class,
			-- or is it its own base class?
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif base_class = Current then
				Result := True
			else
				Result := not is_generic and then
					(is_expanded = base_class.is_expanded and
					is_separate = base_class.is_separate) and
					(base_class.current_system.attachment_type_conformance_mode implies is_attached = base_class.is_attached)
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
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif a_context.attachment_type_conformance_mode and then is_type_attached_with_type_mark (a_type_mark, a_context) /= other.is_type_attached_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif base_class /= other.base_class then
				Result := False
			elseif is_type_expanded_with_type_mark (a_type_mark, a_context) /= other.is_type_expanded_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif a_context.scoop_mode and then is_type_separate_with_type_mark (a_type_mark, a_context) /= other.is_type_separate_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif not attached other.actual_parameters as l_other_actual_parameters then
				check other_not_generic: not other.is_generic end
				Result := not is_generic
			elseif not attached actual_parameters as l_actual_parameters then
				check not_generic: not is_generic end
				Result := l_other_actual_parameters.is_empty
			else
				Result := l_actual_parameters.same_syntactical_types (l_other_actual_parameters, other_context, a_context)
			end
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif a_context.attachment_type_conformance_mode and then is_type_attached_with_type_mark (a_type_mark, a_context) /= other.is_type_attached_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif base_class /= other.base_class then
				Result := False
			elseif is_type_expanded_with_type_mark (a_type_mark, a_context) /= other.is_type_expanded_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif a_context.scoop_mode and then is_type_separate_with_type_mark (a_type_mark, a_context) /= other.is_type_separate_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif not attached other.actual_parameters as l_other_actual_parameters then
				check other_not_generic: not other.is_generic end
				Result := not is_generic
			elseif not attached actual_parameters as l_actual_parameters then
				check not_generic: not is_generic end
				Result := l_other_actual_parameters.is_empty
			else
				Result := l_actual_parameters.same_named_types (l_other_actual_parameters, other_context, a_context)
			end
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif a_context.attachment_type_conformance_mode and then is_type_attached_with_type_mark (a_type_mark, a_context) /= other.is_type_attached_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif base_class /= other.base_class then
				Result := False
			elseif is_type_expanded_with_type_mark (a_type_mark, a_context) /= other.is_type_expanded_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif a_context.scoop_mode and then is_type_separate_with_type_mark (a_type_mark, a_context) /= other.is_type_separate_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif not attached other.actual_parameters as l_other_actual_parameters then
				check other_not_generic: not other.is_generic end
				Result := not is_generic
			elseif not attached actual_parameters as l_actual_parameters then
				check not_generic: not is_generic end
				Result := l_other_actual_parameters.is_empty
			else
				Result := l_actual_parameters.same_named_types (l_other_actual_parameters, other_context, a_context)
			end
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.conforms_from_class_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context, a_system_processor)
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
			other_base_class: ET_CLASS
			l_ancestor_context: ET_NESTED_TYPE_CONTEXT
			l_other_type_mark: detachable ET_TYPE_MARK
		do
			other_base_class := other.base_class
			if base_class.is_unknown then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif other_context.attachment_type_conformance_mode and then not (is_type_attached_with_type_mark (a_type_mark, a_context) implies other.is_type_attached_with_type_mark (other_type_mark, other_context)) then
				Result := False
			elseif base_class = other_base_class then
				if is_type_expanded_with_type_mark (a_type_mark, a_context) and not other.is_type_expanded_with_type_mark (other_type_mark, other_context) then
					Result := False
				elseif other_context.scoop_mode and then not (other.is_type_separate_with_type_mark (other_type_mark, other_context) implies is_type_separate_with_type_mark (a_type_mark, a_context)) then
					Result := False
				elseif not attached other.actual_parameters as l_other_actual_parameters then
					check other_not_generic: not other.is_generic end
					Result := not is_generic
				elseif not attached actual_parameters as l_actual_parameters then
					check not_generic: not is_generic end
					Result := l_other_actual_parameters.is_empty
				elseif is_type_expanded_with_type_mark (a_type_mark, a_context) then
						-- * VNCC-4 allows `B [C]` to conform to `B [D]` when class `B` is expanded,
						--   even when `C` and `D` are different types. This means that an entity of
						--   that type can be polymorphic even though it's expanded. However one of
						--   the main purposes of using expanded types, apart from copy semantics, is
						--   that objects of that type will not be allocated on the heap but be
						--   subobjects of other objects. This permits runtime optimizations, but is
						--   incompatible with polymorphism.
						-- * GVNCC-4 is a non-standard extension of VNCC-4 which disallows polymorphism
						--   when the type of the entity is expanded. The associated tests show what
						--   can go wrong when this non-standard extension is not enforced.
					Result := l_other_actual_parameters.same_named_types (l_actual_parameters, a_context, other_context)
				else
--	DISABLED: Use SmartEiffel agent type conformance semantics, where the conformance
--	of the second actual generic parameter is checked in the reverse order.
--					if not other_base_class.is_preparsed then
--							-- This class is not even preparsed (i.e. we know nothing about it,
--							-- not even its filename). Therefore it is impossible to determine
--							-- whether it conforms to current type.
--						Result := False
--					elseif
--						other_base_class = other_base_class.current_system.routine_class or
--						other_base_class = other_base_class.current_system.procedure_class or
--						other_base_class = other_base_class.current_system.function_class or
--						other_base_class = other_base_class.current_system.predicate_class
--					then
--						-- Use SmartEiffel agent type conformance semantics, where the conformance
--						-- of the second actual generic parameter is checked in the reverse order.
--						Result := l_other_actual_parameters.agent_conforms_to_types (2, l_actual_parameters, a_context, other_context, a_system_processor)
--					else
						Result := l_other_actual_parameters.conforms_to_types (l_actual_parameters, a_context, other_context, a_system_processor)
--					end
				end
			elseif other_base_class.is_none then
					-- Class type "detachable NONE" conforms to any class type that is not expanded nor attached.
					-- Class type "attached NONE" conforms to any class type, even expanded types.
				if other_context.attachment_type_conformance_mode then
					Result := is_type_attached_with_type_mark (a_type_mark, a_context) implies other.is_type_attached_with_type_mark (other_type_mark, other_context)
				else
					Result := not is_type_expanded_with_type_mark (a_type_mark, a_context)
				end
			elseif not is_type_expanded_with_type_mark (a_type_mark, a_context) then
				if not other_base_class.is_preparsed then
						-- This class is not even preparsed (i.e. we know nothing about it,
						-- not even its filename). Therefore it is impossible to determine
						-- whether it conforms to current type.
					Result := False
				else
					other_base_class.process (a_system_processor.ancestor_builder)
						-- If there was an error building the ancestors of
						-- `other_base_class', this error has already been
						-- reported, so we assume here that everything went
						-- fine in order to catch other possible errors. Of
						-- course we might catch errors which are not errors
						-- but just consequences of the error which occurred
						-- when building the ancestors, but this is OK.
					if attached other_base_class.conforming_ancestor (Current) as l_ancestor then
						l_other_type_mark := other.overridden_type_mark (other_type_mark)
						if (other.is_expanded and then not l_ancestor.is_expanded) and then (l_other_type_mark = Void or else not l_other_type_mark.is_attached_mark) then
								-- Make sure to cover the case where "INTEGER" conforms to "attached ANY",
								-- even though "INTEGER" has no explicit type mark (the expandedness is
								-- declared in class "INTEGER").
							l_other_type_mark := tokens.implicit_attached_type_mark
						end
						if not l_ancestor.is_generic then
							Result := l_ancestor.conforms_to_type_with_type_marks (Current, a_type_mark, a_context, l_other_type_mark, other_context, a_system_processor)
						else
							if other_context /= a_context then
								l_ancestor_context := other_context.as_nested_type_context
							else
								l_ancestor_context := other_context.to_nested_type_context
							end
							l_ancestor_context.force_last (other)
							Result := l_ancestor.conforms_to_type_with_type_marks (Current, a_type_mark, a_context, l_other_type_mark, l_ancestor_context, a_system_processor)
							l_ancestor_context.remove_last
						end
					elseif base_class.is_system_object_class and then base_class.is_dotnet then
							-- Under .NET all types are considered to conform to "SYSTEM_OBJECT".
						Result := True
					end
				end
			end
		end

feature -- Type processing

	resolve_unfolded_tuple_actual_parameters_1 (a_universe: ET_UNIVERSE)
			-- First phase of Tuple-type-unfolding in actual parameters of current class type.
			-- Perform syntactical transformations only:
			-- * Resolve cases where the number of actual and formal generic parameters
			--   are different.
			-- * Also resolve the use of obsolete routine types (with an extra
			--   first generic parameter).
		require
			a_universe_not_void: a_universe /= Void
		local
			l_base_class: ET_CLASS
			l_tuple_type: ET_TUPLE_TYPE
			l_actual_sublist: ET_ACTUAL_PARAMETER_SUBLIST
			l_unfolded_tuple_actuals: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS
			l_tuple_constraint_position: INTEGER
			l_tuple_keyword: ET_IDENTIFIER
			l_position: ET_POSITION
		do
			if not tuple_actual_parameters_unfolded_1 then
				tuple_actual_parameters_unfolded_1 := True
					-- Not unfolded yet.
				l_base_class := base_class
					-- Obsolete routine types.
				if not attached actual_parameters as l_actual_parameters or else l_actual_parameters.count < 2 then
					-- Do nothing.
				elseif not attached l_base_class.formal_parameters as l_formal_parameters then
					-- Do nothing.
				elseif a_universe.obsolete_routine_type_mode then
					if
						(l_base_class.is_routine_class and then l_formal_parameters.count = 1) or
						(l_base_class.is_procedure_class and then l_formal_parameters.count = 1) or
						(l_base_class.is_predicate_class and then l_formal_parameters.count = 1) or
						(l_base_class.is_function_class and then l_formal_parameters.count = 2)
					then
						create l_actual_sublist.make (l_actual_parameters, 2, l_actual_parameters.count)
						actual_parameters := l_actual_sublist
					end
				end
					-- Tuple-type-unfolding.
				l_tuple_constraint_position := l_base_class.tuple_constraint_position
				if l_tuple_constraint_position = 0 then
						-- Do nothing: not a single-tuple class.
						-- No need to perform the second phase.
					tuple_actual_parameters_unfolded_2 := True
				elseif not attached l_base_class.formal_parameters as l_formal_parameters then
						-- Should never happen.
						-- No need to perform the second phase.
					tuple_actual_parameters_unfolded_2 := True
				elseif attached actual_parameters as l_actual_parameters then
					if l_actual_parameters.count = l_formal_parameters.count - 1 then
						l_tuple_type := a_universe.tuple_type
						create l_unfolded_tuple_actuals.make (l_actual_parameters, l_tuple_type, l_tuple_constraint_position)
						actual_parameters := l_unfolded_tuple_actuals
							-- No need to perform the second phase.
						tuple_actual_parameters_unfolded_2 := True
					elseif l_actual_parameters.count > l_formal_parameters.count then
						create l_actual_sublist.make (l_actual_parameters, l_tuple_constraint_position, l_tuple_constraint_position + l_actual_parameters.count - l_formal_parameters.count)
						create l_tuple_type.make (tokens.implicit_attached_type_mark, l_actual_sublist, a_universe.tuple_type.named_base_class)
						create l_tuple_keyword.make (tokens.tuple_keyword.name)
						l_position := l_actual_sublist.position
						l_tuple_keyword.set_position (l_position.line, l_position.column)
						l_tuple_type.set_tuple_keyword (l_tuple_keyword)
						create l_unfolded_tuple_actuals.make (l_actual_parameters, l_tuple_type, l_tuple_constraint_position)
						actual_parameters := l_unfolded_tuple_actuals
							-- No need to perform the second phase.
						tuple_actual_parameters_unfolded_2 := True
					elseif l_actual_parameters.count /= l_formal_parameters.count then
							-- No need to perform the second phase.
						tuple_actual_parameters_unfolded_2 := True
					end
				elseif l_formal_parameters.count = 1 then
					actual_parameters := a_universe.unfolded_empty_tuple_actual_parameters
						-- No need to perform the second phase.
					tuple_actual_parameters_unfolded_2 := True
				else
						-- No need to perform the second phase.
					tuple_actual_parameters_unfolded_2 := True
				end
			end
		end

	resolve_unfolded_tuple_actual_parameters_2 (a_context, a_constraint_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Second phase of Tuple-type-unfolding in actual parameters of current class type.
			-- Perform transformations which require conformance checking:
			-- * Resolve the case: "FOO [A, B, C]" -> "FOO [A, TUPLE [B], C]".
			-- `a_context' and `a_constraint_context' are the contexts from which
			-- the current actual parameter at the tuple constraint position
			-- and its associated constraint are viewed respectively when
			-- performing conformance checking.
		require
			a_context_not_void: a_context /= Void
			a_contrainst_context_not_void: a_constraint_context /= Void
			single_tuple_class: base_class.tuple_constraint_position /= 0
			same_parameter_count: base_class.formal_parameter_count = actual_parameter_count
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_base_class: ET_CLASS
			l_unfolded_tuple_actuals: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS
			l_tuple_constraint_position: INTEGER
			l_tuple_type: ET_TUPLE_TYPE
			l_actual_sublist: ET_ACTUAL_PARAMETER_SUBLIST
			l_actual: ET_TYPE
			l_tuple_keyword: ET_IDENTIFIER
			l_position: ET_POSITION
		do
			if not tuple_actual_parameters_unfolded_2 then
				tuple_actual_parameters_unfolded_2 := True
					-- Not unfolded yet.
				l_base_class := base_class
				l_tuple_constraint_position := l_base_class.tuple_constraint_position
				if not attached l_base_class.formal_parameters as l_formal_parameters then
					-- Should never happen.
				elseif attached actual_parameters as l_actual_parameters then
					if attached l_formal_parameters.formal_parameter (l_tuple_constraint_position).constraint as l_tuple_constraint then
						l_actual := l_actual_parameters.type (l_tuple_constraint_position)
						if not l_actual.conforms_to_constraint (l_tuple_constraint, a_constraint_context, a_context, a_system_processor) then
							create l_actual_sublist.make (l_actual_parameters, l_tuple_constraint_position, l_tuple_constraint_position)
							create l_tuple_type.make (tokens.implicit_attached_type_mark, l_actual_sublist, a_context.root_context.base_class.universe.tuple_type.named_base_class)
							create l_tuple_keyword.make (tokens.tuple_keyword.name)
							l_position := l_actual.position
							l_tuple_keyword.set_position (l_position.line, l_position.column)
							l_tuple_type.set_tuple_keyword (l_tuple_keyword)
							create l_unfolded_tuple_actuals.make (l_actual_parameters, l_tuple_type, l_tuple_constraint_position)
							actual_parameters := l_unfolded_tuple_actuals
						end
					end
				end
			end
		ensure
			same_parameter_count: actual_parameter_count = old actual_parameter_count
		end

	resolved_formal_parameters_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETERS): ET_CLASS_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_actual_parameters: like actual_parameters
			l_resolved_parameters: detachable ET_ACTUAL_PARAMETERS
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_actual_parameters := actual_parameters
			if l_actual_parameters /= Void then
				l_resolved_parameters := l_actual_parameters.resolved_formal_parameters (a_parameters)
			end
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark or l_resolved_parameters /= l_actual_parameters then
				if l_resolved_parameters /= Void then
					create {ET_CLASS_TYPE} Result.make_generic (l_type_mark, name, l_resolved_parameters, named_base_class)
				else
					create {ET_CLASS_TYPE} Result.make (l_type_mark, name, named_base_class)
				end
			else
				Result := Current
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
			a_string.append_string (name.upper_name)
			if attached actual_parameters as l_parameters and then not l_parameters.is_empty then
				a_string.append_character (' ')
				l_parameters.append_to_string (a_string)
			end
		end

	append_unaliased_to_string (a_string: STRING)
			-- Append textual representation of unaliased
			-- version of current type to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		do
			if attached type_mark as l_type_mark then
				l_type_mark.append_to_string_with_space (a_string)
			end
			a_string.append_string (base_class.upper_name)
			if attached actual_parameters as l_parameters and then not l_parameters.is_empty then
				a_string.append_character (' ')
				l_parameters.append_unaliased_to_string (a_string)
			end
		end

	append_runtime_name_to_string (a_string: STRING)
			-- Append to `a_string' textual representation of unaliased
			-- version of current type as returned by 'TYPE.runtime_name'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		local
			l_base_class: ET_CLASS
		do
			l_base_class := base_class
			if l_base_class.current_system.attachment_type_conformance_mode then
					-- Void-safe mode.
				if is_attached and then not is_expanded then
					a_string.append_character ('!')
				end
			end
			a_string.append_string (base_class.upper_name)
			if attached actual_parameters as l_parameters and then not l_parameters.is_empty then
				a_string.append_character (' ')
				l_parameters.append_runtime_name_to_string (a_string)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_class_type (Current)
		end

end
