indexing

	description:

		"Eiffel formal generic parameter types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_GENERIC_TYPE

inherit

	ET_TYPE
		redefine
			has_formal_parameters,
			resolved_formal_parameters,
			syntactically_conforms_to
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

	name: ET_IDENTIFIER
			-- Name of type

	index: INTEGER
			-- Position in list of generic parameters

	position: ET_POSITION is
			-- Position of current type in source code
		do
			Result := name.position
		end

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
						a_formal := formal_parameters.item (index)
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

	check_parent_validity1 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Do not check conformance to generic
			-- constraints. Report errors if not valid.
		do
			Result := True
		end

	check_constraint_validity (a_class: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of a formal generic
			-- parameter of class `a_class'. Report errors
			-- if not valid.
		do
			Result := True
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): BOOLEAN is
			-- Does current type contain formal generic parameter
			-- types of index 'i' such that 'actual_parameters.item (i)'
			-- is not void?
		local
			a_type: ET_TYPE
		do
			if actual_parameters.valid_index (index) then
				a_type := actual_parameters.item (index)
				if a_type /= Void then
					Result := True
				end
			end
		end

	resolved_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): ET_TYPE is
			-- Replace in current type the formal generic parameter
			-- types of index 'i' by 'actual_parameters.item (i)'
			-- when these new parameters are not void.
			-- (Warning: this is a side-effect function.)
		local
			a_type: ET_TYPE
		do
			Result := Current
			if actual_parameters.valid_index (index) then
				a_type := actual_parameters.item (index)
				if a_type /= Void then
					Result := a_type
				end
			end
		end

feature -- Conversion

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		local
			parameters: ET_ACTUAL_GENERIC_PARAMETERS
			a_formal: ET_FORMAL_GENERIC_TYPE
		do
			parameters := a_base_type.generic_parameters
			if parameters = Void or else index > parameters.count then
-- Error already reported elsewhere.
print (a_base_type.base_class.name.name)
print (": unknown formal type #")
print (index)
print ("'%N")
				Result := Current
			else
				Result := parameters.item (index)
				a_formal ?= Result
				if a_formal /= Void and then a_formal.index = index then
					Result := Current
				else
						-- `a_base_type' has been flattened and no
						-- error occurred, so there is no loop in
						-- anchored types.
					Result := Result.actual_type (a_feature, a_base_type)
				end
			end
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (name.name)
		end

invariant

	name_not_void: name /= Void
	index_positive: index >= 1

end -- class ET_FORMAL_GENERIC_TYPE
