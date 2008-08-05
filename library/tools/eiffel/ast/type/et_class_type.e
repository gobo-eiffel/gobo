indexing

	description:

		"Eiffel class types"

	library: "Gobo Eiffel Tools Library"
	copyright:  "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_TYPE

inherit

	ET_BASE_TYPE
		redefine
			same_syntactical_class_type,
			same_named_class_type,
			same_base_class_type,
			same_as_base_class,
			conforms_from_class_type,
			resolved_formal_parameters,
			append_unaliased_to_string
		end

	ET_SHARED_FEATURE_NAME_TESTER

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name; a_base_class: ET_CLASS) is
			-- Create a new class type.
		require
			a_name_not_void: a_name /= Void
			a_base_class_not_void: a_base_class /= Void
		do
			type_mark := a_type_mark
			name := a_name
			base_class := a_base_class
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			base_class_set: base_class = a_base_class
		end

feature -- Access

	type_mark: ET_TYPE_MARK
			-- 'expanded', 'reference' or 'separate' keyword,
			-- or '!' or '?' symbol

	base_type (a_context: ET_TYPE_CONTEXT): ET_CLASS_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- only made up of class names and generic formal parameters
			-- when the root type of `a_context' is a generic type not
			-- fully derived (Definition of base type in ETL2 p.198).
			-- Replace by "*UNKNOWN*" any unresolved identifier type, or
			-- unmatched formal generic parameter if this parameter
			-- is current type.
		local
			an_actual_parameters: like actual_parameters
			a_named_parameters: ET_ACTUAL_PARAMETER_LIST
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
		do
			if a_context = Current then
					-- The current type is its own context,
					-- therefore it is its own a base type.
				Result := Current
			else
				Result := Current
				an_actual_parameters := actual_parameters
				if an_actual_parameters /= Void then
					a_named_parameters := an_actual_parameters.named_types (a_context)
					if a_named_parameters /= an_actual_parameters then
						create a_generic_class_type.make (type_mark, name, a_named_parameters, base_class)
						a_generic_class_type.set_unresolved_type (Current)
						Result := a_generic_class_type
					end
				end
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if type_mark /= Void then
				Result := type_mark.position
			else
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if type_mark /= Void then
				Result := type_mark
			else
				Result := name.last_leaf
			end
		end

	last_leaf: ET_AST_LEAF is
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

	break: ET_BREAK is
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

	is_separate: BOOLEAN is
			-- Is current type separate?
		do
			if type_mark /= Void then
				Result := type_mark.is_separate
			else
				Result := base_class.is_separate
			end
		end

	is_expanded: BOOLEAN is
			-- Is current type expanded?
		do
			if type_mark /= Void then
				Result := type_mark.is_expanded
			else
				Result := base_class.is_expanded
			end
		end

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type expanded when viewed from `a_context'?
		do
			Result := is_expanded
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
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

	same_syntactical_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_syntactical_class_type (Current, a_context, other_context)
			end
		end

	same_named_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_named_class_type (Current, a_context, other_context)
			end
		end

	same_base_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.same_base_class_type (Current, a_context, other_context)
			end
		end

	same_as_base_class: BOOLEAN is
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

	same_syntactical_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif
				base_class = other.base_class and
				is_expanded = other.is_expanded and
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

	same_named_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif
				base_class = other.base_class and
				is_expanded = other.is_expanded and
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

	same_base_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		local
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			elseif
				base_class = other.base_class and
				is_expanded = other.is_expanded and
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

	conforms_to_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then (other_context = a_context or else not is_generic) then
				Result := True
			else
				Result := other.conforms_from_class_type (Current, a_context, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_class_type (other: ET_CLASS_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		local
			other_base_class: ET_CLASS
			an_ancestor: ET_BASE_TYPE
			other_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			other_base_class := other.base_class
			if base_class.is_unknown then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and (other_context = a_context or else not is_generic) then
				Result := True
			elseif base_class = other_base_class then
				if not other.is_generic then
					Result := not is_generic
				elseif not is_generic then
					Result := False
				else
					other_parameters := other.actual_parameters
					check
						is_generic: actual_parameters /= Void
						other_is_generic: other_parameters /= Void
					end
-- DISABLED: Use SmartEiffel agent type conformance semantics, where the conformance
-- of the second actual generic parameter is checked in the reverse order.
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
---						-- Use SmartEiffel agent type conformance semantics, where the conformance
--						-- of the second actual generic parameter is checked in the reverse order.
--						Result := other_parameters.agent_conforms_to_types (actual_parameters, a_context, other_context)
--					else
						Result := other_parameters.conforms_to_types (actual_parameters, a_context, other_context)
--					end
				end
			elseif not is_expanded then
				if other_base_class.is_none then
						-- "NONE" conforms to any class type that is not expanded.
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
						other_parameters := other.actual_parameters
						if other_parameters /= Void then
							an_ancestor := an_ancestor.resolved_formal_parameters (other_parameters)
						end
						Result := an_ancestor.conforms_to_type (Current, a_context, other_context)
					end
				end
			end
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_CLASS_TYPE is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		local
			an_actual_parameters: like actual_parameters
			a_resolved_parameters: ET_ACTUAL_PARAMETER_LIST
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
		do
			Result := Current
			an_actual_parameters := actual_parameters
			if an_actual_parameters /= Void then
				a_resolved_parameters := an_actual_parameters.resolved_formal_parameters (a_parameters)
				if a_resolved_parameters /= an_actual_parameters then
					create a_generic_class_type.make (type_mark, name, a_resolved_parameters, base_class)
					a_generic_class_type.set_unresolved_type (Current)
					Result := a_generic_class_type
				end
			end
		end

	unresolved_type: ET_CLASS_TYPE is
			-- Type from which current type is a resolved version
		do
			-- Result := Void
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		local
			a_parameters: like actual_parameters
		do
			if type_mark /= Void then
				a_string.append_string (type_mark.text)
				a_string.append_character (' ')
			end
			a_string.append_string (name.upper_name)
			a_parameters := actual_parameters
			if a_parameters /= Void and then not a_parameters.is_empty then
				a_string.append_character (' ')
				a_parameters.append_to_string (a_string)
			end
		end

	append_unaliased_to_string (a_string: STRING) is
			-- Append textual representation of unaliased
			-- version of current type to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		local
			a_parameters: like actual_parameters
		do
			if type_mark /= Void then
				a_string.append_string (type_mark.text)
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

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_class_type (Current)
		end

end
