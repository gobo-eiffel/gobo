indexing

	description:

		"Eiffel 'BIT N' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_BIT_TYPE

inherit

	ET_TYPE
		redefine
			syntactically_conforms_to
		end

creation

	make

feature {NONE} -- Initialization

	make (a_constant: like constant; p: like position) is
			-- Create a new 'BIT N' type.
		require
			a_constant_not_void: a_constant /= Void
			p_not_void: p /= Void
		do
			constant := a_constant
			position := p
			size := No_size
		ensure
			constant_set: constant = a_constant
			position_set: position = p
		end

feature -- Access

	constant: ET_INTEGER_CONSTANT
			-- Integer constant

	size: INTEGER
			-- Size of current bit type

	position: ET_POSITION
			-- Position of current type in source code

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_bit: ET_BIT_TYPE
			other_constant: like constant
			s1, s2: INTEGER
			has_s1: BOOLEAN
		do
			a_bit ?= other
			if a_bit /= Void then
				other_constant := a_bit.constant
				if other_constant.literal.is_equal (constant.literal) then
					Result := (other_constant.is_negative = constant.is_negative)
				else
						-- Compare directly their sizes.
					s1 := size
					if s1 /= No_size then
						has_s1 := True
					else
						constant.compute_value
						if not constant.has_value_error then
							size := constant.value
							s1 := size
							has_s1 := True
						end
					end
					if has_s1 then
						s2 := a_bit.size
						if s2 /= No_size then
							Result := (s1 = s2)
						else
							other_constant.compute_value
							if not other_constant.has_value_error then
								s2 := other_constant.value
								Result := (s1 = s2)
							end
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
			a_bit: ET_BIT_TYPE
			any_type: ET_CLASS_TYPE
			s1, s2: INTEGER
			has_s1: BOOLEAN
			other_constant: like constant
		do
			a_bit ?= other
			if a_bit /= Void then
					-- See VNCB-2 (ETL2 p.229).
				s1 := size
				if s1 /= No_size then
					has_s1 := (s1 >= 0)
				else
					constant.compute_value
					if not constant.has_value_error then
						size := constant.value
						s1 := size
						has_s1 := (s1 >= 0)
					end
				end
				if has_s1 then
					s2 := a_bit.size
					if s2 /= No_size then
						Result := (s1 <= s2)
					else
						other_constant := a_bit.constant
						other_constant.compute_value
						if not other_constant.has_value_error then
							s2 := other_constant.value
							Result := (s1 <= s2)
						end
					end
				end
			else
					-- See VNCB-1 (ETL2 p.229).
				any_type := a_class.universe.any_type
				Result := any_type.syntactically_conforms_to (other, a_class)
			end
		end

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		do
			Result := True
			if size = No_size then
				constant.compute_value
				if constant.has_value_error then
					Result := False
					an_heir.error_handler.report_vtbt_error (an_heir, Current)
				else
					size := constant.value
				end
			end
			if Result then
				if size < 0 then
					Result := False
					an_heir.error_handler.report_vtbt_error (an_heir, Current)
				elseif size = 0 and constant.is_negative then
					Result := True
					an_heir.error_handler.report_vtbt_minus_zero_error (an_heir, Current)
				else
					Result := True
					an_heir.error_handler.report_vhpr3_bitn_error (an_heir, Current)
				end
			end
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
			Result := True
			if size = No_size then
				constant.compute_value
				if constant.has_value_error then
					Result := False
					a_class.error_handler.report_vtbt_error (a_class, Current)
				else
					size := constant.value
				end
			end
			if Result then
				if size < 0 then
					Result := False
					a_class.error_handler.report_vtbt_error (a_class, Current)
				elseif size = 0 and constant.is_negative then
					Result := True
					a_class.error_handler.report_vtbt_minus_zero_error (a_class, Current)
				else
					Result := True
					a_class.error_handler.report_vcfg3_bitn_error (a_class, Current)
				end
			end
		end

feature -- Conversion

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		do
			Result := Current
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (constant, position)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (bit_keyword)
			a_string.append_character (' ')
			if constant.is_negative then
				a_string.append_character ('-')
			end
			a_string.append_string (constant.literal)
		end

feature {NONE} -- Constants

	bit_keyword: STRING is "BIT"
			-- Eiffel keywords

	No_size: INTEGER is -1
			-- Marker which says that `size' has not
			-- been computed yet, or has the invalid
			-- value -1
invariant

	constant_not_void: constant /= Void

end -- class ET_BIT_TYPE
