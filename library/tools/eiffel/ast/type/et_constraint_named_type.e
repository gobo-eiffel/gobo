indexing

	description:

		"Eiffel types which appear in constraints of formal %
		%generic parameters. The names of the types have not %
		%been resolved yet, they may be names of classes or %
		%of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_NAMED_TYPE

inherit

	ET_CONSTRAINT_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name) is
			-- Create a new constraint named type.
		require
			a_name_not_void: a_name /= Void
		do
			type_mark := a_type_mark
			name := a_name
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name of type

	type_mark: ET_KEYWORD
			-- 'expanded', 'reference' or 'separate' keyword

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
		do
			a_formal := a_formals.formal_parameter_by_name (name)
			if a_formal /= Void then
				if type_mark /= Void then
						-- A formal parameter cannot be prefixed by
						-- 'expanded' or 'reference'.
					a_parser.report_syntax_error (type_mark.position)
				end
				Result := a_parser.ast_factory.new_formal_parameter_type (name, a_formal.index)
			else
				a_universe := a_parser.universe
				a_base_class := a_universe.eiffel_class (name)
				if a_base_class = a_universe.tuple_class then
					if type_mark /= Void then
							-- A TUPLE type is not a class type. It cannot
							-- be prefixed by 'expanded' or 'reference'.
						a_parser.report_syntax_error (type_mark.position)
					end
					Result := a_parser.ast_factory.new_tuple_type (name, Void)
				else
					a_base_class.set_in_system (True)
					Result := a_parser.ast_factory.new_class_type (type_mark, name, a_base_class)
				end
			end
		end

invariant

	name_not_void: name /= Void

end
