indexing

	description:

		"Eiffel 'like Identifier' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LIKE_IDENTIFIER

inherit

	ET_TYPE
		redefine
			resolved_identifier_types
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; p: like position) is
			-- Create a new 'like Identifier' type.
		require
			a_name_not_void: a_name /= Void
			p_not_void: p /= Void
		do
			name := a_name
			position := p
		ensure
			name_set: name = a_name
			position_set: position = p
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name of the feature or argument
			-- associated with current type

	position: ET_POSITION
			-- Position of current type in source code

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

	check_constraint_validity (a_formal: ET_FORMAL_GENERIC_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]): BOOLEAN is
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

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS;
		a_flattener: ET_FEATURE_FLATTENER): ET_TYPE is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of `a_feature' by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types.
			-- (Warning: this is a side-effect function.)
		local
			features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			other_feature: ET_FLATTENED_FEATURE
			an_index: INTEGER
		do
			features := a_flattener.features
			if features.has (name) then
				other_feature := features.item (name)
				!ET_LIKE_FEATURE! Result.make (name, other_feature.seeds.first, position)
			elseif args /= Void then
				an_index := args.index_of (name)
				if an_index /= 0 then
					!ET_LIKE_ARGUMENT! Result.make (name, an_index, position)
				end
			end
			if Result = Void then
print (a_flattener.current_class.name.name)
print (".")
print (a_feature.name.name)
print (": unknown identifier in 'like ")
print (name.name)
print ("'%N")
				Result := Current
			end
		end

feature -- Conversion

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		do
-- Error already reported by `resolved_identifier_types'.
print (a_base_type.base_class.name.name)
print (": unknown identifier in 'like ")
print (name.name)
print ("'%N")
			Result := Current
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (name, position)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_keyword)
			a_string.append_character (' ')
			a_string.append_string (name.name)
		end

feature {NONE} -- Constants

	like_keyword: STRING is "like"
			-- Eiffel keywords

invariant

	name_not_void: name /= Void

end -- class ET_LIKE_IDENTIFIER
