indexing

	description:

		"Eiffel formal generic parameter types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_GENERIC_TYPE

inherit

	ET_NAMED_TYPE
		rename
			make as make_named_type
		redefine
			same_syntactical_type,
			syntactically_conforms_to,
			check_parent_validity,
			check_constraint_validity,
			has_formal_parameters,
			resolved_formal_parameters,
			resolved_named_types,
			base_type, deep_cloned_type,
			process
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_index: INTEGER) is
			-- Create a new formal generic type.
		require
			a_name_not_void: a_name /= Void
			an_index_positive: an_index >= 1
		do
			name := a_name
			index := an_index
		ensure
			name_set: name = a_name
			index_set: index = an_index
		end

feature -- Access

	index: INTEGER
			-- Position in list of generic parameters

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_formal: ET_FORMAL_GENERIC_TYPE
		do
			a_formal ?= other
			if a_formal /= Void then
				Result := a_formal.index = index
			end
		end

	syntactically_conforms_to (other: ET_TYPE; a_class: ET_CLASS): BOOLEAN is
			-- Does current type syntactically conforms
			-- to `other' when it appears in `a_class'
			-- (e.g. do not try to resolve anchored types)?
		local
			a_formal_type: ET_FORMAL_GENERIC_TYPE
			formal_parameters: ET_FORMAL_GENERIC_PARAMETERS
			a_formal: ET_FORMAL_GENERIC_PARAMETER
			a_type, any_type: ET_TYPE
		do
			a_formal_type ?= other
			if a_formal_type /= Void then
				Result := a_formal_type.index = index
			end
			if not Result then
				formal_parameters := a_class.generic_parameters
				if formal_parameters /= Void then
					if index <= formal_parameters.count then
						a_formal := formal_parameters.formal_generic_parameter (index)
						a_type := a_formal.constraint
						if a_type = Void then
							any_type := a_class.universe.any_type
							a_type := any_type
						end
						Result := a_type.syntactically_conforms_to (other, a_class)
					end
				end
			end
		end

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		do
			Result := True
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
			an_index: INTEGER
			formals: ET_FORMAL_GENERIC_PARAMETERS
			other_formal: ET_FORMAL_GENERIC_PARAMETER
		do
			an_index := a_formal.index
			if an_index = index then
				a_class.error_handler.report_vcfg3e_error (a_class, a_formal, Current)
			else
				if index > an_index then
					a_class.error_handler.report_vcfg3f_error (a_class, a_formal, Current)
				end
				if a_class.error_handler.is_se then
					formals := a_class.generic_parameters
					if formals /= Void and then index <= formals.count then
						other_formal := formals.formal_generic_parameter (index)
						a_sorter.force_relation (other_formal, a_formal)
					end
				end
			end
			Result := True
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		local
			a_formal: ET_FORMAL_GENERIC_TYPE
		do
			if index <= actual_parameters.count then
				a_formal ?= actual_parameters.type (index)
				if a_formal = Void or else a_formal.index /= index then
					Result := True
				end
			end
		end

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): ET_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		local
			a_type: ET_TYPE
			a_formal: ET_FORMAL_GENERIC_TYPE
		do
			Result := Current
			if index <= actual_parameters.count then
				a_type := actual_parameters.type (index)
				a_formal ?= a_type
				if a_formal = Void or else a_formal.index /= index then
					Result := a_type
				end
			end
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
			-- (Definition of base type in ETL2 p. 198)
		local
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			parameters: ET_ACTUAL_GENERIC_PARAMETERS
			a_formal: ET_FORMAL_GENERIC_TYPE
		do
			a_generic_class_type ?= a_type
			if a_generic_class_type /= Void then
				parameters := a_generic_class_type.generic_parameters
			end
			if parameters = Void or else index > parameters.count then
-- TODO:
-- Error already reported elsewhere.
print (a_type.base_class.name.name)
print (": unknown formal type #")
print (index)
print ("'%N")
				Result := Current
			else
				Result := parameters.type (index)
				a_formal ?= Result
				if a_formal /= Void and then a_formal.index = index then
					Result := Current
				else
						-- `a_type' has been flattened and no
						-- error occurred, so there is no loop in
						-- anchored types.
					Result := Result.base_type (a_feature, a_type)
				end
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (name, index)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_generic_type (Current)
		end

invariant

	index_positive: index >= 1

end
