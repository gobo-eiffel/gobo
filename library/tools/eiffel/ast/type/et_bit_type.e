note

	description:

		"Eiffel 'BIT N' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2011, Eric Bezault and others"
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
			shallow_base_type_with_type_mark,
			same_syntactical_bit_type_with_type_marks,
			same_named_bit_type_with_type_marks,
			same_base_bit_type_with_type_marks,
			conforms_from_bit_type_with_type_marks
		end

feature -- Status report

	is_expanded: BOOLEAN = True
			-- Is current type expanded?

	is_type_expanded_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := True
		end

	is_attached: BOOLEAN = True
			-- Is current type attached?

	is_type_attached_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `is_type_expanded' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := True
		end

	base_type_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
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

	base_type_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): ET_BASE_TYPE
			-- Same as `base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			if constant /= Void then
				Result := Current
			else
					-- Unresolved "BIT name".
				Result := tokens.unknown_class
			end
		end

	shallow_base_type_with_type_mark (a_type_mark: ET_TYPE_MARK; a_context: ET_BASE_TYPE): ET_BASE_TYPE
			-- Same as `shallow_base_type' except that its type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := base_type_with_type_mark (a_type_mark, a_context)
		end

feature -- Setting

	set_bit_keyword (a_bit: like bit_keyword)
			-- Set `bit_keyword' to `a_bit'.
		require
			a_bit_not_void: a_bit /= Void
		do
			bit_keyword := a_bit
		ensure
			bit_keyword_set: bit_keyword = a_bit
		end

feature -- Size

	size_computed: BOOLEAN
			-- Has `size' already been computed?
		do
			Result := (size /= No_size)
		end

	has_size_error: BOOLEAN
			-- Has an error occurred when computing `size'?
		do
			Result := (size = Invalid_size)
		end

	compute_size
			-- Compute `size'.
		do
			if size = No_size then
				if constant /= Void then
					if not constant.is_integer_32 then
						size := Invalid_size
					else
						size := constant.to_integer_32
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

	same_syntactical_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_syntactical_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_syntactical_bit_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_named_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_named_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_named_bit_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

	same_base_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `same_base_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" is equal to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.same_base_bit_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Comparison

	same_syntactical_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- type appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the base types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
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

	same_named_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same named type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_syntactical_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
		end

	same_base_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current type appearing in `a_context' and `other' type
			-- appearing in `other_context' have the same base type?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			Result := same_syntactical_bit_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context)
		end

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of `Current'
			-- and `other' is overridden by `a_type_mark' and `other_type_mark', if not Void
		do
			if base_class.is_unknown then
					-- "*UNKNOWN*" conforms to no type, not even itself.
				Result := False
			elseif other = Current and then other_context = a_context then
				Result := True
			else
				Result := other.conforms_from_bit_type_with_type_marks (Current, a_type_mark, a_context, other_type_mark, other_context)
			end
		end

feature {ET_TYPE, ET_TYPE_CONTEXT} -- Conformance

	conforms_from_bit_type_with_type_marks (other: ET_BIT_TYPE; other_type_mark: ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does `other' type appearing in `other_context' conform
			-- to current type appearing in `a_context'?
			-- Note that the type mark status of `Current' and `other' is
			-- overridden by `a_type_mark' and `other_type_mark', if not Void
			-- (Note: 'current_system.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		do
			if base_class.is_unknown then
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

	bit_space: STRING = "BIT "
			-- Eiffel keywords

	No_size: INTEGER = -1
			-- Marker which says that `size' has not been computed yet

	Invalid_size: INTEGER = -2
			-- Marker which says that `size' has an invalid value

invariant

	named_type: is_named_type

end
