note

	description:

		"Eiffel NONE types used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_NONE_TYPE

inherit

	SB_TYPE
		redefine
			is_none,
			is_attached,
			is_detachable
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new NONE type.
		do
		end

feature -- Access

	name: STRING
			-- Type name
		once
			Result := storable_constants.none_class_name
		end

feature -- Status report

	is_none: BOOLEAN = True
			-- Is current type a NONE type?

	is_attached: BOOLEAN
			-- Is current type attached?

	is_detachable: BOOLEAN
			-- Is current type detachable?

feature -- Status setting

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
			else
				Result := other.is_none and not other.is_expanded and then (other.is_attached = is_attached and other.is_detachable = is_detachable)
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
			else
				Result := other.is_none and not other.is_expanded and then (other.is_attached = is_attached and other.is_detachable = is_detachable)
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
				Result := l_other_resolved_type.is_none and not l_other_resolved_type.is_expanded and then (l_other_resolved_type.is_attached implies is_attached)
			end
		end

feature -- Output

	print_type (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current type to `a_file' in
			-- a human readable format.
		do
			a_file.put_string (storable_constants.none_class_name)
		end

end
