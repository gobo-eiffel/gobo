indexing

	description:

		"Eiffel class types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLASS_TYPE

inherit

	ET_TYPE
		redefine
			add_to_system,
			syntactically_conforms_to,
			resolved_formal_parameters,
			resolved_named_types
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like class_name; a_class: like base_class) is
			-- Create a new class type.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			type_mark := a_type_mark
			class_name := a_name
			base_class := a_class
		ensure
			type_mark_set: type_mark = a_type_mark
			class_name_set: class_name = a_name
			base_class_set: base_class = a_class
		end

feature -- Access

	class_name: ET_CLASS_NAME
			-- Name of type

	base_class: ET_CLASS
			-- Base class

	type_mark: ET_TYPE_MARK
			-- 'expanded', 'reference' or 'separate' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if type_mark /= Void then
				Result := type_mark.position
			else
				Result := class_name.position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := class_name.break
		end

feature -- Status report

	is_generic: BOOLEAN is
			-- Is current class type generic?
		do
			Result := False
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

	is_separate: BOOLEAN is
			-- Is current type separate?
		do
			if type_mark /= Void then
				Result := type_mark.is_separate
			else
				Result := base_class.is_separate
			end
		end

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_class_type: ET_CLASS_TYPE
		do
			if other = Current then
				Result := True
			else
				a_class_type ?= other
				if a_class_type /= Void then
					if base_class = a_class_type.base_class then
						Result := not a_class_type.is_generic and
							is_expanded = a_class_type.is_expanded and
							is_separate = a_class_type.is_separate
					end
				end
			end
		end

	syntactically_conforms_to (other: ET_TYPE; a_class: ET_CLASS): BOOLEAN is
			-- Does current type syntactically conforms
			-- to `other' when it appears in `a_class'
			-- (e.g. do not try to resolve anchored types)?
		local
			a_class_type, an_ancestor: ET_CLASS_TYPE
		do
			if other = Current then
				Result := True
			else
				a_class_type ?= other
				if a_class_type /= Void then
					if a_class_type.is_expanded then
						Result := base_class = a_class_type.base_class and not a_class_type.is_generic
					elseif base_class = a_class_type.base_class then
						Result := not a_class_type.is_generic
					elseif base_class.has_ancestor (a_class_type.base_class) then
						an_ancestor := base_class.ancestor (a_class_type)
						Result := an_ancestor.syntactically_conforms_to (other, a_class)
					end
				end
			end
		end

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		local
			formals: ET_FORMAL_GENERIC_PARAMETERS
		do
			if not base_class.is_parsed then
				Result := False
				an_heir.error_handler.report_vtct_error (an_heir, Current)
			elseif base_class.has_syntax_error then
					-- Error should already have been
					-- reported somewhere else.
				Result := False
			else
				formals := base_class.generic_parameters
				if formals = Void then
					Result := True
				else
					Result := False
					an_heir.error_handler.report_vtug2_error (an_heir, Current)
				end
			end
		end

	check_constraint_validity (a_formal: ET_FORMAL_GENERIC_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of the formal generic
			-- parameter `a_formal' in class `a_class'.
			-- `a_sorter' is used to find possible cycle in
			-- formal generic parameter declaration.
			-- Report errors if not valid.
		local
			formals: ET_FORMAL_GENERIC_PARAMETERS
		do
			if not base_class.is_parsed then
				Result := False
				a_class.error_handler.report_vtct_error (a_class, Current)
			elseif base_class.has_syntax_error then
					-- Error should already have been
					-- reported somewhere else.
				Result := False
			else
				formals := base_class.generic_parameters
				if formals = Void then
					Result := True
				else
					Result := False
					a_class.error_handler.report_vtug2_error (a_class, Current)
				end
			end
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current type.
		do
			base_class.add_to_system
		end

feature -- Type processing

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): ET_CLASS_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		do
			Result := Current
		end

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		do
			Result := Current
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p.198)
		do
			Result := Current
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			Result := Current
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			if type_mark /= Void then
				a_string.append_string (type_mark.text)
				a_string.append_character (' ')
			end
			a_string.append_string (class_name.name)
		end

invariant

	class_name_not_void: class_name /= Void
	base_class_not_void: base_class /= Void

end -- class ET_CLASS_TYPE
