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
			check_parent_validity2,
			has_formal_parameters,
			resolved_formal_parameters,
			resolved_identifier_types
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like class_name; a_parameters: like generic_parameters; a_class: like base_class) is
			-- Create a new class type.
		require
			a_name_not_void: a_name /= Void
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

feature -- Access

	class_name: ET_IDENTIFIER
			-- Name of base class

	base_class: ET_CLASS
			-- Base class

	generic_parameters: ET_ACTUAL_GENERIC_PARAMETERS
			-- Generic parameters

	position: ET_POSITION is
			-- Position of current type in source code
		do
			Result := class_name.position
		end

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_class_type: ET_CLASS_TYPE
			other_parameters: like generic_parameters
		do
			if other = Current then
				Result := True
			else
				a_class_type ?= other
				if a_class_type /= Void then
					if base_class = a_class_type.base_class then
						other_parameters := a_class_type.generic_parameters
						if generic_parameters = Void then
							Result := (other_parameters = Void)
						elseif other_parameters /= Void then
							Result := generic_parameters.same_syntactical_types (other_parameters)
						end
					end
				end
			end
		end

	syntactically_conforms_to (other: ET_TYPE; a_class: ET_CLASS): BOOLEAN is
			-- Does current type syntactically conforms
			-- to `other' when it appears in `a_class'
			-- (e.g. do not try to resolve anchored types)?
		local
			a_class_type: ET_CLASS_TYPE
			other_parameters: like generic_parameters
			ancestor_parameters: like generic_parameters
		do
			if other = Current then
				Result := True
			else
				a_class_type ?= other
				if a_class_type /= Void then
					if base_class.has_ancestor (a_class_type.base_class) then
						ancestor_parameters := base_class.ancestor (a_class_type).generic_parameters
						other_parameters := a_class_type.generic_parameters
						if other_parameters = Void then
							Result := (ancestor_parameters = Void)
						elseif ancestor_parameters /= Void then
							if generic_parameters /= Void and then generic_parameters.has_derived_parameters then
								if ancestor_parameters.has_formal_parameters (generic_parameters) then
									ancestor_parameters := ancestor_parameters.deep_cloned_actuals
									ancestor_parameters.resolve_formal_parameters (generic_parameters)
								end
							end
							Result := ancestor_parameters.syntactically_conforms_to (other_parameters, a_class)
						end
					end
				end
			end
		end

feature -- Validity

	check_parent_validity1 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Do not check conformance to generic constraints.
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
				if actuals = Void then
					if formals = Void then
						Result := True
					else
						Result := False
						an_heir.error_handler.report_vtug2_error (an_heir, Current)
					end
				elseif formals = Void then
					Result := False
					an_heir.error_handler.report_vtug1_error (an_heir, Current)
				elseif actuals.count /= formals.count then
					Result := False
					an_heir.error_handler.report_vtug2_error (an_heir, Current)
				else
					Result := actuals.check_parent_validity1 (an_heir)
				end
			end
		end

	check_parent_validity2 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Check conformance to generic constraints.
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
				if actuals = Void then
					if formals = Void then
						Result := True
					else
						Result := False
						an_heir.error_handler.report_vtug2_error (an_heir, Current)
					end
				elseif formals = Void then
					Result := False
					an_heir.error_handler.report_vtug1_error (an_heir, Current)
				elseif actuals.count /= formals.count then
					Result := False
					an_heir.error_handler.report_vtug2_error (an_heir, Current)
				else
					Result := actuals.check_parent_validity2 (formals, base_class, an_heir)
				end
			end
		end

	check_constraint_validity (a_class: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of a formal generic
			-- parameter of class `a_class'. Report errors
			-- if not valid.
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
				if actuals = Void then
					if formals = Void then
						Result := True
					else
						Result := False
						a_class.error_handler.report_vtug2_error (a_class, Current)
					end
				elseif formals = Void then
					Result := False
					a_class.error_handler.report_vtug1_error (a_class, Current)
				elseif actuals.count /= formals.count then
					Result := False
					a_class.error_handler.report_vtug2_error (a_class, Current)
				else
					Result := actuals.check_constraint_validity (formals, base_class, a_class)
				end
			end
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current type.
		do
			base_class.add_to_system
			if generic_parameters /= Void then
				generic_parameters.add_to_system
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
		do
			if generic_parameters /= Void then
				Result := generic_parameters.has_formal_parameters (actual_parameters)
			end
		end

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): ET_CLASS_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		do
			if generic_parameters /= Void then
				generic_parameters.resolve_formal_parameters (actual_parameters)
			end
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
			if generic_parameters /= Void then
				generic_parameters.resolve_identifier_types (a_feature, args, a_flattener)
			end
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
			if generic_parameters = Void then
				Result := Current
			else
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
					!ET_CLASS_TYPE! Result.make (class_name, parameters, base_class)
				else
					Result := Current
				end
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		local
			generics: like generic_parameters
		do
			if generic_parameters /= Void then
				generics := generic_parameters.deep_cloned_actuals
			end
			!! Result.make (class_name, generics, base_class)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			a_string.append_string (class_name.name)
			if generic_parameters /= Void then
				a_string.append_string (" [")
				a_type := generic_parameters.item (1)
				a_type.append_to_string (a_string)
				nb := generic_parameters.count
				from i := 2 until i > nb loop
					a_string.append_string (", ")
					a_type := generic_parameters.item (i)
					a_type.append_to_string (a_string)
					i := i + 1
				end
				a_string.append_character (']')
			end
		end

invariant

	class_name_not_void: class_name /= Void
	base_class_not_void: base_class /= Void

end -- class ET_CLASS_TYPE
