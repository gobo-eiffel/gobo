indexing

	description:

		"Eiffel types (with actual generic parameters) which %
		%appear in constraints of formal generic parameters. %
		%The names of the types have not been resolved yet, they %
		%may be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_GENERIC_NAMED_TYPE

inherit

	ET_CONSTRAINT_NAMED_TYPE
		rename
			make as make_constraint_named_type
		redefine
			resolved_syntactical_constraint
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name; a_parameters: like actual_parameters) is
			-- Create a new generic constraint type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
		do
			type_mark := a_type_mark
			name := a_name
			actual_parameters := a_parameters
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			actual_parameters_set: actual_parameters = a_parameters
		end

feature -- Access

	actual_parameters: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters

feature -- Conversion

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_TYPE is
			-- Version of current type, appearing in the constraint of
			-- one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		local
			a_formal: ET_FORMAL_PARAMETER
			a_base_class: ET_CLASS
			a_universe: ET_UNIVERSE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_formal := a_formals.formal_parameter_by_name (name)
			if a_formal /= Void then
				if type_mark /= Void then
						-- A formal parameter cannot be prefixed by
						-- 'expanded' or 'reference'.
					a_parser.report_syntax_error (type_mark.position)
				end
					-- A formal parameter cannot have actual generic parameters.
				a_parser.report_syntax_error (actual_parameters.position)
				Result := a_parser.ast_factory.new_formal_parameter_type (name, a_formal.index)
			else
				a_universe := a_parser.universe
				a_base_class := a_universe.eiffel_class (name)
				a_parameters := actual_parameters.resolved_syntactical_constraint (a_formals, a_parser)
				if a_parameters /= Void then
					if a_base_class = a_universe.tuple_class then
						if type_mark /= Void then
								-- A TUPLE type is not a class type. It cannot
								-- be prefixed by 'expanded' or 'reference'.
							a_parser.report_syntax_error (type_mark.position)
						end
						Result := a_parser.ast_factory.new_tuple_type (name, a_parameters)
					else
						a_base_class.set_in_system (True)
						Result := a_parser.ast_factory.new_generic_class_type (type_mark, name, a_parameters, a_base_class)
					end
				end
			end
		end

invariant

	actual_parameters_not_void: actual_parameters /= Void

end
