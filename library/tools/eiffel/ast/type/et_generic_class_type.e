indexing

	description:

		"Eiffel generic class types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_GENERIC_CLASS_TYPE

inherit

	ET_CLASS_TYPE
		rename
			make as make_class_type
		redefine
			append_to_string, break,
			is_generic, add_to_system,
			same_syntactical_type,
			syntactically_conforms_to,
			check_parent_validity,
			check_constraint_validity,
			has_formal_parameters,
			resolved_formal_parameters,
			resolved_identifier_types,
			resolved_named_types,
			base_type, deep_cloned_type,
			process
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like class_name;
		a_parameters: like generic_parameters; a_class: like base_class) is
			-- Create a new generic class type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
			a_class_not_void: a_class /= Void
		do
			type_mark := a_type_mark
			class_name := a_name
			generic_parameters := a_parameters
			base_class := a_class
		ensure
			type_mark_set: type_mark = a_type_mark
			class_name_set: class_name = a_name
			generic_parameters_set: generic_parameters = a_parameters
			base_class_set: base_class = a_class
		end

feature -- Access

	generic_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Generic parameters

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := generic_parameters.break
		end

feature -- Status report

	is_generic: BOOLEAN is
			-- Is current class type generic?
		do
			Result := generic_parameters.count > 0
		end

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
					if
						base_class = a_generic_class_type.base_class and
						is_expanded = a_generic_class_type.is_expanded and
						is_separate = a_generic_class_type.is_separate
					then
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
		do
			if other = Current then
				Result := True
			else
				a_class_type ?= other
				if a_class_type /= Void then
					if a_class_type.is_expanded then
						if base_class = a_class_type.base_class then
							a_generic_class_type ?= other
							if a_generic_class_type /= Void then
								other_parameters := a_generic_class_type.generic_parameters
								Result := generic_parameters.syntactically_conforms_to (other_parameters, a_class)
							end
						end
					elseif base_class = a_class_type.base_class then
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
			formals: ET_FORMAL_PARAMETER_LIST
			actuals: ET_ACTUAL_PARAMETER_LIST
		do
			if not base_class.is_preparsed then
				base_class.universe.preparse
			end
			if not base_class.is_preparsed then
				Result := False
				an_heir.error_handler.report_vtct_error (an_heir, Current)
			else
				if not base_class.is_parsed then
					base_class.parse
				end
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
					if formals = Void or else formals.is_empty then
						if is_generic then
							Result := False
							an_heir.error_handler.report_vtug1_error (an_heir, Current)
						else
							Result := True
						end
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
		end
		
	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER]): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of the formal generic
			-- parameter `a_formal' in class `a_class'.
			-- `a_sorter' is used to find possible cycle in
			-- formal generic parameter declaration.
			-- Report errors if not valid.
		local
			formals: ET_FORMAL_PARAMETER_LIST
			actuals: ET_ACTUAL_PARAMETER_LIST
		do
			if not base_class.is_preparsed then
				base_class.universe.preparse
			end
			if not base_class.is_preparsed then
				Result := False
				a_class.error_handler.report_vtct_error (a_class, Current)
			else
				if not base_class.is_parsed then
					base_class.parse
				end
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
					if formals = Void or else formals.is_empty then
						if is_generic then
							Result := False
							a_class.error_handler.report_vtug1_error (a_class, Current)
						else
							Result := True
						end
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

	has_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
		do
			Result := generic_parameters.has_formal_parameters (actual_parameters)
		end

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): ET_CLASS_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		do
			generic_parameters.resolve_formal_parameters (actual_parameters)
			Result := Current
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENT_LIST; a_class: ET_CLASS): ET_TYPE is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types. Set
			-- `a_class.has_flatten_error' to true if an error occurs.
			-- (Warning: this is a side-effect function.)
		do
			generic_parameters.resolve_identifier_types (a_feature, args, a_class)
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

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p.198)
		local
			a_parameters: like generic_parameters
			a_parameter, an_actual: ET_TYPE_ITEM
			duplication_needed: BOOLEAN
			i, j, nb: INTEGER
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_parameter := generic_parameters.item (i)
					-- `a_base_type' has been flattened and no
					-- error occurred, so there is no loop in
					-- anchored types.
				an_actual := a_parameter.base_type (a_feature, a_type)
				if a_parameter /= an_actual then
					if not duplication_needed then
						create a_parameters.make_with_capacity (nb)
						a_parameters.set_left_bracket (generic_parameters.left_bracket)
						a_parameters.set_right_bracket (generic_parameters.right_bracket)
						from j := i - 1 until j < 1 loop
							a_parameters.put_first (generic_parameters.item (j))
							j := j - 1
						end
						duplication_needed := True
					end
				end
				if duplication_needed then
					a_parameters.put_first (an_actual)
				end
				i := i + 1
			end
			if duplication_needed then
				create {ET_GENERIC_CLASS_TYPE} Result.make (type_mark, class_name, a_parameters, base_class)
			else
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		local
			a_generics: like generic_parameters
		do
			a_generics := generic_parameters.deep_cloned_actuals
			if a_generics /= generic_parameters then
				create Result.make (type_mark, class_name, a_generics, base_class)
			else
				Result := Current
			end
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			if type_mark /= Void then
				a_string.append_string (type_mark.text)
				a_string.append_character (' ')
			end
			a_string.append_string (class_name.name)
			nb := generic_parameters.count
			if nb > 0 then
				a_string.append_string (" [")
				a_type := generic_parameters.type (1)
				a_type.append_to_string (a_string)
					from i := 2 until i > nb loop
					a_string.append_string (", ")
					a_type := generic_parameters.type (i)
					a_type.append_to_string (a_string)
					i := i + 1
				end
				a_string.append_character (']')
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_generic_class_type (Current)
		end

invariant

	generic_parameters_not_void: generic_parameters /= Void

end
