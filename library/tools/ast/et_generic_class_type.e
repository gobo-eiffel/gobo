indexing

	description:

		"Eiffel generic class types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_GENERIC_CLASS_TYPE

inherit

	ET_CLASS_TYPE
		rename
			make as make_class_type
		undefine
			append_to_string
		redefine
			is_generic, add_to_system,
			same_syntactical_type,
			syntactically_conforms_to,
			check_parent_validity,
			check_constraint_validity,
			has_formal_parameters,
			resolved_formal_parameters,
			resolved_identifier_types,
			resolved_named_types,
			actual_type, deep_cloned_type
		end

	ET_GENERIC_NAMED_TYPE
		rename
			make as make_generic_named_type,
			name as class_name
		undefine
			add_to_system,
			same_syntactical_type,
			syntactically_conforms_to,
			check_parent_validity,
			check_constraint_validity,
			has_formal_parameters,
			resolved_formal_parameters,
			resolved_identifier_types,
			resolved_named_types,
			actual_type, deep_cloned_type
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like class_name; a_parameters: like generic_parameters; a_class: like base_class) is
			-- Create a new generic class type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
			a_class_not_void: a_class /= Void
		do
			class_name := a_name
			generic_parameters := a_parameters
			base_class := a_class
		ensure
			class_name_set: class_name = a_name
			generic_parameters_set: generic_parameters = a_parameters
			base_class_set: base_class = a_class
		end

feature -- Status report

	is_generic: BOOLEAN is True
			-- Is current class type generic?

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			other_parameters: like generic_parameters
		do
			if other = Current then
				Result := True
			else
				a_generic_class_type ?= other
				if a_generic_class_type /= Void then
					if base_class = a_generic_class_type.base_class then
						other_parameters := a_generic_class_type.generic_parameters
						Result := generic_parameters.same_syntactical_types (other_parameters)
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
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			other_parameters: like generic_parameters
			ancestor_parameters: like generic_parameters
		do
			if other = Current then
				Result := True
			else
				a_class_type ?= other
				if a_class_type /= Void then
					if base_class = a_class_type.base_class then
						a_generic_class_type ?= other
						if a_generic_class_type /= Void then
							other_parameters := a_generic_class_type.generic_parameters
							Result := generic_parameters.syntactically_conforms_to (other_parameters, a_class)
						end
					elseif base_class.has_ancestor (a_class_type.base_class) then
						an_ancestor := base_class.ancestor (a_class_type)
						if generic_parameters.has_derived_parameters then
							if an_ancestor.has_formal_parameters (generic_parameters) then
								an_ancestor := an_ancestor.deep_cloned_type
								an_ancestor := an_ancestor.resolved_formal_parameters (generic_parameters)
							end
						end
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
			actuals: ET_ACTUAL_GENERIC_PARAMETERS
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
				actuals := generic_parameters
				if formals = Void then
					Result := False
					an_heir.error_handler.report_vtug1_error (an_heir, Current)
				elseif actuals.count /= formals.count then
					Result := False
					an_heir.error_handler.report_vtug2_error (an_heir, Current)
				else
						-- Call `seach_ancestors' to check whether the
						-- formal generic parameters `formals' are valid.
					base_class.search_ancestors
					if base_class.has_ancestors_error then
							-- Error already reported in `search_ancestors'.
						Result := False
					else
						Result := actuals.check_parent_validity (formals, base_class, an_heir)
					end
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
			actuals: ET_ACTUAL_GENERIC_PARAMETERS
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
				actuals := generic_parameters
				if formals = Void then
					Result := False
					a_class.error_handler.report_vtug1_error (a_class, Current)
				elseif actuals.count /= formals.count then
					Result := False
					a_class.error_handler.report_vtug2_error (a_class, Current)
				else
						-- Call `seach_ancestors' to check whether the
						-- formal generic parameters `formals' are valid.
					base_class.search_ancestors
					if base_class.has_ancestors_error then
							-- Error already reported in `search_ancestors'.
						Result := False
					else
						Result := actuals.check_constraint_validity (formals, base_class, a_formal, a_class, a_sorter)
					end
				end
			end
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current type.
		do
			base_class.add_to_system
			generic_parameters.add_to_system
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
		do
			Result := generic_parameters.has_formal_parameters (actual_parameters)
		end

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): ET_CLASS_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		do
			generic_parameters.resolve_formal_parameters (actual_parameters)
			Result := Current
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS;
		a_flattener: ET_FEATURE_FLATTENER): ET_TYPE is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of `a_feature' by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types.
			-- (Warning: this is a side-effect function.)
		do
			generic_parameters.resolve_identifier_types (a_feature, args, a_flattener)
			Result := Current
		end

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		do
			generic_parameters.resolve_named_types (a_class, ast_factory)
			Result := Current
		end

feature -- Conversion

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		local
			parameters: like generic_parameters
			a_parameter, an_actual: ET_TYPE
			duplication_needed: BOOLEAN
			i, nb: INTEGER
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_parameter := generic_parameters.item (i)
					-- `a_base_type' has been flattened and no
					-- error occurred, so there is no loop in
					-- anchored types.
				an_actual := a_parameter.actual_type (a_feature, a_base_type)
				if a_parameter /= an_actual then
					duplication_needed := True
				end
				if i = 1 then
					!! parameters.make_with_capacity (an_actual, nb)
				else
					parameters.put (an_actual)
				end
				i := i + 1
			end
			if duplication_needed then
				!ET_GENERIC_CLASS_TYPE! Result.make (class_name, parameters, base_class)
			else
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		local
			generics: like generic_parameters
		do
			generics := generic_parameters.deep_cloned_actuals
			!! Result.make (class_name, generics, base_class)
		end

invariant

	is_generic: is_generic

end -- class ET_CLASS_TYPE
