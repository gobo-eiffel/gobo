indexing

	description:

		"Named Eiffel types (either the name of a class or %
		%the name of a formal generic parameter)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_NAMED_TYPE

inherit

	ET_TYPE
		redefine
			resolved_named_types
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name) is
			-- Create a new named type.
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

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		do
			-- Result := False
		end

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		do
			Result := False
			an_heir.error_handler.report_vhpr3_error (an_heir, Current)
		end

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER]): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of the formal generic
			-- parameter `a_formal' in class `a_class'.
			-- `a_sorter' is used to find possible cycle in
			-- formal generic parameter declaration.
			-- Report errors if not valid.
		do
			Result := False
			a_class.error_handler.report_vcfg3_error (a_class, Current)
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
				if type_mark /= Void then
					-- TODO:
					-- ERROR
				end
				Result := ast_factory.new_formal_parameter_type (name, a_parameter.index)
			else
				a_base_class := a_class.universe.eiffel_class (name)
				Result := ast_factory.new_class_type (type_mark, name, a_base_class)
			end
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p. 198)
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
			a_string.append_string (name.name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_named_type (Current)
		end

invariant

	name_not_void: name /= Void

end
