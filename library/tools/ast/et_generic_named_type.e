indexing

	description:

		"Named Eiffel types (either the name of a class or the name %
		%of a formal generic parameter) with generic parameters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_GENERIC_NAMED_TYPE

inherit

	ET_NAMED_TYPE
		rename
			make as make_named_type
		redefine
			resolved_named_types,
			deep_cloned_type,
			append_to_string
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_parameters: like generic_parameters) is
			-- Create a new generic named type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
		do
			name := a_name
			generic_parameters := a_parameters
		ensure
			name_set: name = a_name
			generic_parameters_set: generic_parameters = a_parameters
		end

feature -- Access

	generic_parameters: ET_ACTUAL_GENERIC_PARAMETERS
			-- Generic parameters

feature -- Type processing

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		local
			a_parameter: ET_FORMAL_GENERIC_PARAMETER
			a_base_class: ET_CLASS
		do
			a_parameter := a_class.generic_parameter (name)
			if a_parameter /= Void then
					-- TODO: Syntax Error
				Result := ast_factory.new_formal_generic_type (name, a_parameter.index)
			else
				a_base_class := a_class.universe.eiffel_class (name)
				generic_parameters.resolve_named_types (a_class, ast_factory)
				Result := ast_factory.new_generic_class_type (name, generic_parameters, a_base_class)
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (name, generic_parameters.deep_cloned_actuals)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			a_string.append_string (name.name)
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

invariant

	generic_parameters_not_void: generic_parameters /= Void

end -- class ET_GENERIC_NAMED_TYPE
