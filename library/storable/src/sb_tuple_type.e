note

	description:

		"Eiffel TUPLE types used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TUPLE_TYPE

inherit

	SB_TYPE
		redefine
			has_unknown,
			is_tuple,
			is_attached,
			is_detachable
		end

create

	make

feature {NONE} -- Initialization

	make (a_class: like storable_class; an_actuals_count: like actual_parameters_count)
			-- Create a new TUPLE type.
		require
			a_class_not_void: a_class /= Void
			an_actuals_count_positive: an_actuals_count >= 0
		do
			storable_class := a_class
			actual_parameters_count := an_actuals_count
			actual_parameters := storable_constants.empty_type_list
		ensure
			storable_class_set: storable_class = a_class
			actual_parameters_count_set: actual_parameters_count = an_actuals_count
		end

feature -- Status report

	has_unknown: BOOLEAN
			-- Is there some classes describing the current
			-- type which are not known by the schema?
		do
			if storable_class.is_unknown then
				Result := True
			else
				Result := actual_parameters.has_unknown
			end
		end

	is_tuple: BOOLEAN = True
			-- Is current type a TUPLE type?

	is_attached: BOOLEAN
			-- Is current type attached?

	is_detachable: BOOLEAN
			-- Is current type detachable?

feature -- Access

	storable_class: SB_CLASS
			-- Base class of current type

	actual_parameters: SB_TYPE_LIST
			-- Actual generic parameters

	actual_parameters_count: INTEGER
			-- Number of actual generic parameters
			-- after they have been resolved

	name: STRING
			-- Type name
		local
			i, nb: INTEGER
		do
			create Result.make (20)
			if is_attached then
				Result.append_string ("attached ")
			elseif is_detachable then
				Result.append_string ("detachable ")
			end
			Result.append_string (storable_class.name)
			if not actual_parameters.is_empty then
				Result.append_character (' ')
				Result.append_character ('[')
				Result.append_string (actual_parameters.item (1).name)
				nb := actual_parameters.count
				from i := 2 until i > nb loop
					Result.append_character (',')
					Result.append_character (' ')
					Result.append_string (actual_parameters.item (i).name)
					i := i + 1
				end
				Result.append_character (']')
			end
		end

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

feature -- Setting

	set_actual_parameters (a_parameters: like actual_parameters)
			-- Set `actual_parameters' to `a_parameters'.
		require
			a_parameters_not_void: a_parameters /= Void
		do
			actual_parameters := a_parameters
		ensure
			actual_parameters_set: actual_parameters = a_parameters
		end

feature -- Comparison

	same_storable_type (other: SB_TYPE): BOOLEAN
			-- Are current type and `other' the same type?
		local
			i, nb: INTEGER
			other_parameters: like actual_parameters
		do
			if other = Current then
				Result := True
			elseif not attached {SB_TUPLE_TYPE} other as l_tuple_type then
				Result := False
			elseif storable_class /= l_tuple_type.storable_class then
				Result := False
			elseif is_attached /= l_tuple_type.is_attached then
				Result := False
			elseif is_detachable /= l_tuple_type.is_detachable then
				Result := False
			else
				other_parameters := l_tuple_type.actual_parameters
				nb := other_parameters.count
				if actual_parameters.count = nb then
					Result := True
					from i := 1 until i > nb loop
						if not actual_parameters.item (i).same_storable_type (other_parameters.item (i)) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	same_storable_full_type (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- appearing in `other_context' the same type?
		local
			i, nb: INTEGER
			other_parameters: like actual_parameters
		do
			if other = Current then
				Result := True
			elseif other.is_formal then
				Result := other.same_storable_full_type (Current, a_context, other_context)
			elseif not attached {SB_TUPLE_TYPE} other as l_tuple_type then
				Result := False
			elseif storable_class /= l_tuple_type.storable_class then
				Result := False
			elseif is_attached /= l_tuple_type.is_attached then
				Result := False
			elseif is_detachable /= l_tuple_type.is_detachable then
				Result := False
			else
				other_parameters := l_tuple_type.actual_parameters
				nb := other_parameters.count
				if actual_parameters.count = nb then
					Result := True
					from i := 1 until i > nb loop
						if not actual_parameters.item (i).same_storable_full_type (other_parameters.item (i), other_context, a_context) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	is_storable_full_type_compatible (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Is current type appearing in `a_context' compatible with `other'
			-- appearing in `other_context'? Compatible means that they either
			-- are the same type or they only differ by their attached status.
			-- In the latter case, if `other' is an attached type then `Current'
			-- has to be an attached type as well.
		local
			i, nb: INTEGER
			other_parameters: like actual_parameters
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
				if not attached {SB_TUPLE_TYPE} l_other_resolved_type as l_tuple_type then
					Result := False
				elseif storable_class /= l_tuple_type.storable_class then
					Result := False
				elseif not (l_tuple_type.is_attached implies is_attached) then
					Result := False
				else
					other_parameters := l_tuple_type.actual_parameters
					nb := other_parameters.count
					if actual_parameters.count = nb then
						Result := True
						from i := 1 until i > nb loop
							if not actual_parameters.item (i).is_storable_full_type_compatible (other_parameters.item (i), other_context, a_context) then
								Result := False
								i := nb + 1 -- Jump out of the loop.
							else
								i := i + 1
							end
						end
					end
				end
			end
		end

feature -- Output

	print_type (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current type to `a_file' in
			-- a human readable format.
		local
			i, nb: INTEGER
		do
			if is_attached then
				a_file.put_string ("attached ")
			elseif is_detachable then
				a_file.put_string ("detachable ")
			end
			a_file.put_string (storable_class.name)
			if not actual_parameters.is_empty then
				a_file.put_character (' ')
				a_file.put_character ('[')
				actual_parameters.item (1).print_type (a_file)
				nb := actual_parameters.count
				from i := 2 until i > nb loop
					a_file.put_character (',')
					a_file.put_character (' ')
					actual_parameters.item (i).print_type (a_file)
					i := i + 1
				end
				a_file.put_character (']')
			end
		end

invariant

	storable_class_not_void: storable_class /= Void
	actual_parameters_not_void: actual_parameters /= Void
	actual_parameters_count_positive: actual_parameters_count >= 0

end
