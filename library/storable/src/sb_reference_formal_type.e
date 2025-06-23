note

	description:

		"Reference formal generic parameters used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_REFERENCE_FORMAL_TYPE

inherit

	SB_TYPE
		redefine
			is_reference_formal
		end

create

	make

feature {NONE} -- Initialization

	make (i: like index)
			-- Create a new reference formal generic parameter
			-- with index `i'.
		require
			i_positive: i >= 1
		do
			index := i
		ensure
			index_set: index = i
		end

feature -- Access

	index: INTEGER
			-- Index of current reference formal parameter
			-- in list of formal parameters of the
			-- enclosing class

	name: STRING
			-- Type name
		do
			create Result.make (3)
			Result.append_character ('R')
			Result.append_character ('E')
			Result.append_character ('F')
			Result.append_character ('#')
			Result.append_integer (index)
		end

feature -- Setting

	set_index (i: like index)
			-- Set `index' to `i'.
		require
			i_positive: i >= 1
		do
			index := i
		ensure
			index_set: index = i
		end

feature -- Status report

	is_reference_formal: BOOLEAN = True
			-- Is current type a reference formal type?

feature -- Comparison

	same_storable_type (other: SB_TYPE): BOOLEAN
			-- Are current type and `other' the same type?
		do
			if other = Current then
				Result := True
			elseif attached {SB_REFERENCE_FORMAL_TYPE} other as l_formal then
				Result := l_formal.index = index
			end
		end

	same_storable_full_type (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- appearing in `other_context' the same type?
		do
			if other = Current then
				Result := True
			elseif other.is_formal then
				Result := other.same_storable_full_type (Current, a_context, other_context)
			elseif attached {SB_REFERENCE_FORMAL_TYPE} other as l_formal then
				Result := l_formal.index = index
			end
		end

	is_storable_full_type_compatible (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Is current type appearing in `a_context' compatible with `other'
			-- appearing in `other_context'? Compatible means that they either
			-- are the same type or they only differ by their attached status.
			-- In the latter case, if `other' is an attached type then `Current'
			-- has to be an attached type as well.
		local
			l_other_resolved_type: SB_TYPE
			l_actuals: SB_TYPE_LIST
		do
			if other = Current then
				Result := True
			else
				l_other_resolved_type := other
				if attached {SB_FORMAL_TYPE} other as l_formal_type then
					l_actuals := other_context.formal_parameters
					if l_actuals /= Void and then l_formal_type.index <= l_actuals.count then
						l_other_resolved_type := l_actuals.item (l_formal_type.index)
					end
				end
				if attached {SB_REFERENCE_FORMAL_TYPE} l_other_resolved_type as l_reference_formal then
					Result := l_reference_formal.index = index
				end
			end
		end

feature -- Output

	print_type (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current type to `a_file' in
			-- a human readable format.
		do
			a_file.put_character ('R')
			a_file.put_character ('E')
			a_file.put_character ('F')
			a_file.put_character ('#')
			a_file.put_integer (index)
		end

invariant

	index_positive: index >= 1

end
