note

	description:

		"Eiffel class types"

	library: "Gobo Eiffel Tools Library"
	copyright:  "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_TYPE

inherit

	ET_BASE_TYPE
		redefine
			same_syntactical_class_type_with_type_marks,
			same_named_class_type_with_type_marks,
			same_base_class_type_with_type_marks,
			same_as_base_class,
			conforms_from_class_type_with_type_marks,
			resolved_formal_parameters_with_type_mark,
			append_unaliased_to_string,
			type_with_type_mark,
			type_mark,
			overridden_type_mark
		end

	ET_SHARED_FEATURE_NAME_TESTER

create

	make

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

feature -- Access

	type_mark: ET_TYPE_MARK
			-- 'attached', 'detachable', 'expanded', 'reference' or 'separate' keyword,
			-- or '!' or '?' symbol

	overridden_type_mark (a_override_type_mark: ET_TYPE_MARK): ET_TYPE_MARK
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
			elseif type_mark = Void then
				Result := a_override_type_mark
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
				elseif type_mark /= Void and then type_mark.is_expandedness_mark then
					if type_mark.is_expanded_mark then
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
				elseif type_mark /= Void and then type_mark.is_separateness_mark then
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
				elseif type_mark /= Void and then type_mark.is_attachment_mark then
					if type_mark.is_attached_mark then
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

	base_type_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_actual_parameters: like actual_parameters
			l_named_parameters: ET_ACTUAL_PARAMETER_LIST
			l_type_mark: ET_TYPE_MARK
		do
			l_actual_parameters := actual_parameters
			if a_context = Current then
					-- The current type is its own context, therefore it has the same
					-- actual parameters as its base type.
				l_named_parameters := l_actual_parameters
			elseif l_actual_parameters /= Void then
				l_named_parameters := l_actual_parameters.named_types (a_context)
			end
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark or l_named_parameters /= l_actual_parameters then
				if l_named_parameters /= Void then
					create {ET_GENERIC_CLASS_TYPE} Result.make (l_type_mark, name, l_named_parameters, named_base_class)
				else
					create {ET_CLASS_TYPE} Result.make (l_type_mark, name, named_base_class)
				end
			else
				Result := Current
			end
		end

	type_with_type_mark (a_type_mark: ET_TYPE_MARK): ET_CLASS_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_actual_parameters: like actual_parameters
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark then
				l_actual_parameters := actual_parameters
				if l_actual_parameters /= Void then
					create {ET_GENERIC_CLASS_TYPE} Result.make (l_type_mark, name, l_actual_parameters, named_base_class)
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
			if type_mark /= Void and then not type_mark.is_implicit_mark then
				Result := type_mark.position
			end
			if Result = Void or else Result.is_null then
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if type_mark /= Void and then not type_mark.is_implicit_mark then
				Result := type_mark.first_leaf
			end
			if Result = Void then
				Result := name.last_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.last_leaf
			else
				Result := name.last_leaf
			end
		end

	break: ET_BREAK
			-- Break which appears just after current node
		local
			a_parameters: like actual_parameters
		do
			a_parameters := actual_parameters
			if a_parameters /= Void then
				Result := a_parameters.break
			else
				Result := name.break
			end
		end

feature -- Status report

	is_separate: BOOLEAN
			-- Is current type separate?
		do
			if type_mark /= Void then
				Result := type_mark.is_separate_mark
			else
				Result := base_class.is_separate
			end
		end

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			if type_mark = Void then
				Result := base_class.is_expanded
			elseif type_mark.is_expanded_mark then
				Result := True
			elseif type_mark.is_reference_mark then
				Result := False
			else
				Result := base_class.is_expanded
			end
		end

	is_type_expanded_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			elseif base_class.is_none then
					-- Class type "NONE" is always detachable regardless of type marks.
				Result := False
			elseif type_mark = Void or else not type_mark.is_attachment_mark then
				Result := True
			else
				Result := type_mark.is_attached_mark
			end
		end

	is_type_attached_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_attached' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			if base_class.is_none then
					-- Class type "NONE" is always detachable regardless of type marks.
				Result := False
			elseif a_type_mark = Void then
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
		local
			an_actual_parameters: like actual_parameters
		do
			if a_class = base_class then
				Result := True
			else
				an_actual_parameters := actual_parameters
				if an_actual_parameters /= Void then
					Result := an_actual_parameters.named_types_have_class (a_class, a_context)
				end
			end
		end

feature -- Comparison

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			-- expandedness and separateness status as its base class,
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
					is_separate = base_class.is_separate)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
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
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif a_context.attachment_type_conformance_mode and then is_type_attached_with_type_mark (a_type_mark, a_context) /= other.is_type_attached_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif
				base_class = other.base_class and then
				is_type_expanded_with_type_mark (a_type_mark, a_context) = other.is_type_expanded_with_type_mark (other_type_mark, other_context) and then
				is_separate = other.is_separate
			then
				if not other.is_generic then
					Result := not is_generic
				elseif not is_generic then
					-- Result := False
				else
					other_parameters := other.actual_parameters
					check
						is_generic: actual_parameters /= Void
						other_is_generic: other_parameters /= Void
					end
					Result := actual_parameters.same_syntactical_types (other_parameters, other_context, a_context)
				end
			end
		end

	same_named_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif a_context.attachment_type_conformance_mode and then is_type_attached_with_type_mark (a_type_mark, a_context) /= other.is_type_attached_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif
				base_class = other.base_class and then
				is_type_expanded_with_type_mark (a_type_mark, a_context) = other.is_type_expanded_with_type_mark (other_type_mark, other_context) and then
				is_separate = other.is_separate
			then
				if not other.is_generic then
					Result := not is_generic
				elseif not is_generic then
					-- Result := False
				else
					other_parameters := other.actual_parameters
					check
						is_generic: actual_parameters /= Void
						other_is_generic: other_parameters /= Void
					end
					Result := actual_parameters.same_named_types (other_parameters, other_context, a_context)
				end
			end
		end

	same_base_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif a_context.attachment_type_conformance_mode and then is_type_attached_with_type_mark (a_type_mark, a_context) /= other.is_type_attached_with_type_mark (other_type_mark, other_context) then
				Result := False
			elseif
				base_class = other.base_class and then
				is_type_expanded_with_type_mark (a_type_mark, a_context) = other.is_type_expanded_with_type_mark (other_type_mark, other_context) and then
				is_separate = other.is_separate
			then
				if not other.is_generic then
					Result := not is_generic
				elseif not is_generic then
					-- Result := False
				else
					other_parameters := other.actual_parameters
					check
						is_generic: actual_parameters /= Void
						other_is_generic: other_parameters /= Void
					end
					Result := actual_parameters.same_named_types (other_parameters, other_context, a_context)
				end
			end
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then other_type_mark = a_type_mark and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.conforms_from_class_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_class_type_with_type_marks (other: ET_CLASS_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			other_base_class: ET_CLASS
			an_ancestor: ET_BASE_TYPE
			other_parameters: ET_ACTUAL_PARAMETER_LIST
			l_ancestor_context: ET_NESTED_TYPE_CONTEXT
			l_other_type_mark: ET_TYPE_MARK
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
				elseif not other.is_generic then
					Result := not is_generic
				elseif not is_generic then
					Result := False
				else
					other_parameters := other.actual_parameters
					check
						is_generic: actual_parameters /= Void
						other_is_generic: other_parameters /= Void
					end
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
--						Result := other_parameters.agent_conforms_to_types (actual_parameters, a_context, other_context)
--					else
						Result := other_parameters.conforms_to_types (actual_parameters, a_context, other_context)
--					end
				end
			elseif not is_type_expanded_with_type_mark (a_type_mark, a_context) then
				if other_base_class.is_none then
						-- Class type "NONE" is always detachable regardless of type marks.
						-- Therefore it conforms to any class type that is not expanded nor attached.
					Result := True
				elseif not other_base_class.is_preparsed then
						-- This class is not even preparsed (i.e. we know nothing about it,
						-- not even its filename). Therefore it is impossible to determine
						-- whether it conforms to current type.
					Result := False
				else
					other_base_class.process (other_base_class.current_system.ancestor_builder)
						-- If there was an error building the ancestors of
						-- `other_base_class', this error has already been
						-- reported, so we assume here that everything went
						-- fine in order to catch other possible errors. Of
						-- course we might catch errors which are not errors
						-- but just consequences of the error which occurred
						-- when building the ancestors, but this is OK.
					an_ancestor := other_base_class.ancestor (Current)
					if an_ancestor /= Void then
						l_other_type_mark := other.overridden_type_mark (other_type_mark)
						if (other.is_expanded and then not an_ancestor.is_expanded) and then (l_other_type_mark = Void or else not l_other_type_mark.is_attached_mark) then
								-- Make sure to cover the case where "INTEGER" conforms to "attached ANY",
								-- even though "INTEGER" has no explicit type mark (the expandedness is
								-- declared in class "INTEGER").
							l_other_type_mark := tokens.implicit_attached_type_mark
						end
						if not an_ancestor.is_generic then
							Result := an_ancestor.conforms_to_type_with_type_marks (Current, a_type_mark, a_context, l_other_type_mark, other_context)
						else
							if other_context /= a_context then
								l_ancestor_context := other_context.as_nested_type_context
							else
								l_ancestor_context := other_context.to_nested_type_context
							end
							l_ancestor_context.force_last (other)
							Result := an_ancestor.conforms_to_type_with_type_marks (Current, a_type_mark, a_context, l_other_type_mark, l_ancestor_context)
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

	resolved_formal_parameters_with_type_mark (a_type_mark: ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_CLASS_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_actual_parameters: like actual_parameters
			l_resolved_parameters: ET_ACTUAL_PARAMETER_LIST
			l_type_mark: ET_TYPE_MARK
		do
			l_actual_parameters := actual_parameters
			if l_actual_parameters /= Void then
				l_resolved_parameters := l_actual_parameters.resolved_formal_parameters (a_parameters)
			end
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark or l_resolved_parameters /= l_actual_parameters then
				if l_resolved_parameters /= Void then
					create {ET_GENERIC_CLASS_TYPE} Result.make (l_type_mark, name, l_resolved_parameters, named_base_class)
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
		local
			a_parameters: like actual_parameters
		do
			if type_mark /= Void then
				if type_mark.is_implicit_mark then
					a_string.append_character ('[')
				end
				a_string.append_string (type_mark.text)
				if type_mark.is_implicit_mark then
					a_string.append_character (']')
				end
				a_string.append_character (' ')
			end
			a_string.append_string (name.upper_name)
			a_parameters := actual_parameters
			if a_parameters /= Void and then not a_parameters.is_empty then
				a_string.append_character (' ')
				a_parameters.append_to_string (a_string)
			end
		end

	append_unaliased_to_string (a_string: STRING)
			-- Append textual representation of unaliased
			-- version of current type to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		local
			a_parameters: like actual_parameters
		do
			if type_mark /= Void then
				if type_mark.is_implicit_mark then
					a_string.append_character ('[')
				end
				a_string.append_string (type_mark.text)
				if type_mark.is_implicit_mark then
					a_string.append_character (']')
				end
				a_string.append_character (' ')
			end
			a_string.append_string (base_class.upper_name)
			a_parameters := actual_parameters
			if a_parameters /= Void and then not a_parameters.is_empty then
				a_string.append_character (' ')
				a_parameters.append_unaliased_to_string (a_string)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_class_type (Current)
		end

end
