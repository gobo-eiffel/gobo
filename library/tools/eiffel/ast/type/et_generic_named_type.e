indexing

	description:

		"Named Eiffel types (either the name of a class or the name %
		%of a formal generic parameter) with generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_GENERIC_NAMED_TYPE

inherit

	ET_NAMED_TYPE
		rename
			make as make_named_type
		redefine
			resolved_named_types,
			deep_cloned_type,
			append_to_string,
			break, process
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name; a_parameters: like generic_parameters) is
			-- Create a new generic named type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
		do
			type_mark := a_type_mark
			name := a_name
			generic_parameters := a_parameters
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			generic_parameters_set: generic_parameters = a_parameters
		end

feature -- Access

	generic_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Generic parameters

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := generic_parameters.break
		end

feature -- Type processing

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		local
			a_parameter: ET_FORMAL_PARAMETER
			a_base_class: ET_CLASS
		do
			a_parameter := a_class.generic_parameter (name)
			if a_parameter /= Void then
					-- TODO: Syntax Error
				Result := ast_factory.new_formal_parameter_type (name, a_parameter.index)
			else
				a_base_class := a_class.universe.eiffel_class (name)
				generic_parameters.resolve_named_types (a_class, ast_factory)
				Result := ast_factory.new_generic_class_type (type_mark, name, generic_parameters, a_base_class)
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			create Result.make (type_mark, name, generic_parameters.deep_cloned_actuals)
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
			a_string.append_string (name.name)
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
			a_processor.process_generic_named_type (Current)
		end

invariant

	generic_parameters_not_void: generic_parameters /= Void

end
