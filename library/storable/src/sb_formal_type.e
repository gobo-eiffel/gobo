note

	description:

		"Formal generic parameters used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_FORMAL_TYPE

inherit

	SB_TYPE
		redefine
			is_formal,
			is_expanded,
			is_attached,
			is_detachable
		end

create

	make

feature {NONE} -- Initialization

	make (i: like index)
			-- Create a new formal generic parameter with index `i'.
		require
			i_positive: i >= 1
		do
			index := i
		ensure
			index_set: index = i
		end

feature -- Access

	index: INTEGER
			-- Index of current formal parameter
			-- in list of formal parameters of the
			-- enclosing class

	name: STRING
			-- Type name
		do
			create Result.make (3)
			if is_expanded then
				Result.append_string ("expanded ")
			end
			if is_attached then
				Result.append_string ("attached ")
			elseif is_detachable then
				Result.append_string ("detachable ")
			end
			Result.append_character ('G')
			Result.append_character ('#')
			Result.append_integer (index)
		end

feature -- Status report

	is_formal: BOOLEAN = True
			-- Is current type a formal type?

	is_expanded: BOOLEAN
			-- Is current type expanded?

	is_attached: BOOLEAN
			-- Is current type attached?

	is_detachable: BOOLEAN
			-- Is current type detachable?

feature -- Status setting

	set_expanded (b: BOOLEAN)
			-- Set `is_expanded' to `b'.
		do
			is_expanded := b
		ensure
			expanded_set: is_expanded = b
		end

	set_attached (b: BOOLEAN)
			-- Set `is_attached' to `b'.
		do
			is_attached := b
			if is_attached then
				is_detachable := False
			end
		ensure
			attached_set: is_attached = b
		end

	set_detachable (b: BOOLEAN)
			-- Set `is_detachable' to `b'.
		do
			is_detachable := b
			if is_detachable then
				is_attached := False
			end
		ensure
			detachable_set: is_detachable = b
		end

feature -- Comparison

	same_storable_type (other: SB_TYPE): BOOLEAN
			-- Are current type and `other' the same type?
		do
			if other = Current then
				Result := True
			elseif not attached {SB_FORMAL_TYPE} other as l_formal_type then
				Result := False
			elseif l_formal_type.index /= index then
				Result := False
			elseif l_formal_type.is_expanded /= is_expanded then
				Result := False
			elseif l_formal_type.is_attached /= is_attached then
				Result := False
			elseif l_formal_type.is_detachable /= is_detachable then
				Result := False
			else
				Result := True
			end
		end

	same_storable_full_type (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- appearing in `other_context' the same type?
		local
			l_actuals: SB_TYPE_LIST
		do
			l_actuals := a_context.formal_parameters
			if l_actuals /= Void and then index <= l_actuals.count then
				Result := l_actuals.item (index).same_storable_full_type (other, other_context, a_context)
			end
		end

	is_storable_full_type_compatible (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Is current type appearing in `a_context' compatible with `other'
			-- appearing in `other_context'? Compatible means that they either
			-- are the same type or they only differ by their attached status.
			-- In the latter case, if `other' is an attached type then `Current'
			-- has to be an attached type as well.
		local
			l_actuals: SB_TYPE_LIST
		do
			l_actuals := a_context.formal_parameters
			if l_actuals /= Void and then index <= l_actuals.count then
				Result := l_actuals.item (index).is_storable_full_type_compatible (other, other_context, a_context)
			end
		end

feature -- Output

	print_type (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current type to `a_file' in
			-- a human readable format.
		do
			if is_expanded then
				a_file.put_string ("expanded ")
			end
			if is_attached then
				a_file.put_string ("attached ")
			elseif is_detachable then
				a_file.put_string ("detachable ")
			end
			a_file.put_character ('G')
			a_file.put_character ('#')
			a_file.put_integer (index)
		end

invariant

	index_positive: index >= 1

end
