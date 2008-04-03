indexing

	description:

		"Eiffel 'BIT N' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BIT_TYPE

inherit

	ET_BASE_TYPE
		rename
			name as bit_keyword,
			upper_name as bit_keyword_upper_name,
			lower_name as bit_keyword_lower_name
		redefine
			bit_keyword,
			shallow_base_type,
			same_syntactical_bit_type,
			same_named_bit_type,
			same_base_bit_type,
			conforms_from_bit_type
		end

feature -- Status report

	is_expanded: BOOLEAN is True
			-- Is current type expanded?

	is_type_expanded (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is current type expanded when viewed from `a_context'?
		do
			Result := True
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the base type of current type contain `a_class'
			-- when it appears in `a_context'?
		do
			if constant /= Void then
				Result := (a_class = base_class)
			else
				Result := a_class.is_unknown
			end
		end

feature -- Access

	bit_keyword: ET_IDENTIFIER
			-- 'BIT' keyword

	constant: ET_INTEGER_CONSTANT
			-- Integer constant

	size: INTEGER
			-- Size of current bit type

	base_type (a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- only made up of class names and generic formal parameters
			-- when the root type of `a_context' is a generic type not
			-- fully derived (Definition of base type in ETL2 p.198).
			-- Replace by "*UNKNOWN*" any unresolved identifier type, or
			-- unmatched formal generic parameter if this parameter
			-- is current type.
		do
			if constant /= Void then
				Result := Current
			else
					-- Unresolved "BIT name".
				Result := tokens.unknown_class
			end
		end

	shallow_base_type (a_context: ET_BASE_TYPE): ET_BASE_TYPE is
			-- Base type of current type, when it appears in `a_context',
			-- but where the actual generic parameters are not replaced
			-- by their named version and should still be considered as
			-- viewed from `a_context'
		do
			Result := base_type (a_context)
		end

feature -- Setting

	set_bit_keyword (a_bit: like bit_keyword) is
			-- Set `bit_keyword' to `a_bit'.
		require
			a_bit_not_void: a_bit /= Void
		do
			bit_keyword := a_bit
		ensure
			bit_keyword_set: bit_keyword = a_bit
		end

feature -- Size

	size_computed: BOOLEAN is
			-- Has `size' already been computed?
		do
			Result := (size /= No_size)
		end

	has_size_error: BOOLEAN is
			-- Has an error occurred when computing `size'?
		do
			Result := (size = Invalid_size)
		end

	compute_size is
			-- Compute `size'.
		do
			if size = No_size then
				if constant /= Void then
					constant.compute_value
					if constant.has_value_error then
						size := Invalid_size
					else
						size := constant.value
						if size < 0 then
							size := Invalid_size
						end
					end
				else
					size := Invalid_size
				end
			end
		ensure
			size_computed: size_computed
		end

feature -- Comparison

	same_syntactical_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if base_class = tokens.unknown_class then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_syntactical_bit_type (Current, a_context, other_context)
			end
		end

	same_named_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			if base_class = tokens.unknown_class then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_named_bit_type (Current, a_context, other_context)
			end
		end

	same_base_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			if base_class = tokens.unknown_class then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_base_bit_type (Current, a_context, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		do
			if base_class = tokens.unknown_class then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				compute_size
				if not has_size_error then
					other.compute_size
					if not other.has_size_error then
						Result := (other.size = size)
					end
				end
			end
		end

	same_named_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
		do
			Result := same_syntactical_bit_type (other, other_context, a_context)
		end

	same_base_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
		do
			Result := same_syntactical_bit_type (other, other_context, a_context)
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does current type appearing in `a_context' conform
			-- to `other' type appearing in `other_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			if base_class = tokens.unknown_class then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.conforms_from_bit_type (Current, a_context, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type (other: ET_BIT_TYPE; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			if base_class = tokens.unknown_class then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
					-- See VNCB-2 (ETL2 p.229).
				compute_size
				if not has_size_error then
					other.compute_size
					if not other.has_size_error then
						Result := (other.size <= size)
					end
				end
			end
		end

feature {NONE} -- Constants

	bit_space: STRING is "BIT "
			-- Eiffel keywords

	No_size: INTEGER is -1
			-- Marker which says that `size' has not been computed yet

	Invalid_size: INTEGER is -2
			-- Marker which says that `size' has an invalid value

invariant

	named_type: is_named_type

end
