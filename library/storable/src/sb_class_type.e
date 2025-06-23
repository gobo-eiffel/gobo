note

	description:

		"Eiffel class types used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_CLASS_TYPE

inherit

	SB_TYPE
		redefine
			has_unknown,
			is_boolean,
			is_character_8,
			is_character_32,
			is_integer_32,
			is_integer_8,
			is_integer_16,
			is_integer_64,
			is_natural_8,
			is_natural_16,
			is_natural_32,
			is_natural_64,
			is_real_32,
			is_real_64,
			is_pointer,
			is_none,
			is_expanded,
			is_frozen,
			is_attached,
			is_detachable
		end

create

	make

feature {NONE} -- Initialization

	make (a_class: like storable_class)
			-- Create a new class type.
		require
			a_class_not_void: a_class /= Void
		do
			storable_class := a_class
			actual_parameters := storable_constants.empty_type_list
		ensure
			storable_class_set: storable_class = a_class
		end

feature -- Status report

	has_unknown: BOOLEAN
			-- Is there some classes describing the current
			-- type which are not known by the schema?
		local
			l_actual_parameters: like actual_parameters
		do
			if storable_class.is_unknown then
				if is_expanded then
					if is_boolean then
						Result := False
					elseif is_character_8 then
						Result := False
					elseif is_character_32 then
						Result := False
					elseif is_integer_32 then
						Result := False
					elseif is_integer_8 then
						Result := False
					elseif is_integer_16 then
						Result := False
					elseif is_integer_64 then
						Result := False
					elseif is_natural_8 then
						Result := False
					elseif is_natural_16 then
						Result := False
					elseif is_natural_32 then
						Result := False
					elseif is_natural_64 then
						Result := False
					elseif is_real_32 then
						Result := False
					elseif is_real_64 then
						Result := False
					elseif is_pointer then
						Result := False
					else
						Result := True
					end
				elseif is_none then
					Result := False
				else
					Result := True
				end
			end
			if not Result then
					-- First, make sure that we will not enter into an infinite recursion.
				l_actual_parameters := actual_parameters
				actual_parameters := storable_constants.empty_type_list
				Result := l_actual_parameters.has_unknown
				actual_parameters := l_actual_parameters
			end
		end

	is_boolean: BOOLEAN
			-- Is current type a BOOLEAN type?
		do
			Result := storable_class.is_boolean
		end

	is_character_8: BOOLEAN
			-- Is current type a CHARACTER_8 type?
		do
			Result := storable_class.is_character_8
		end

	is_character_32: BOOLEAN
			-- Is current type a CHARACTER_32 type?
		do
			Result := storable_class.is_character_32
		end

	is_integer_32: BOOLEAN
			-- Is current type an INTEGER_32 type?
		do
			Result := storable_class.is_integer_32
		end

	is_integer_8: BOOLEAN
			-- Is current type an INTEGER_8 type?
		do
			Result := storable_class.is_integer_8
		end

	is_integer_16: BOOLEAN
			-- Is current type an INTEGER_16 type?
		do
			Result := storable_class.is_integer_16
		end

	is_integer_64: BOOLEAN
			-- Is current type an INTEGER_64 type?
		do
			Result := storable_class.is_integer_64
		end

	is_natural_8: BOOLEAN
			-- Is current type a NATURAL_8 type?
		do
			Result := storable_class.is_natural_8
		end

	is_natural_16: BOOLEAN
			-- Is current type a NATURAL_16 type?
		do
			Result := storable_class.is_natural_16
		end

	is_natural_32: BOOLEAN
			-- Is current type a NATURAL_32 type?
		do
			Result := storable_class.is_natural_32
		end

	is_natural_64: BOOLEAN
			-- Is current type a NATURAL_64 type?
		do
			Result := storable_class.is_natural_64
		end

	is_real_32: BOOLEAN
			-- Is current type a REAL_32 type?
		do
			Result := storable_class.is_real_32
		end

	is_real_64: BOOLEAN
			-- Is current type a REAL_64 type?
		do
			Result := storable_class.is_real_64
		end

	is_pointer: BOOLEAN
			-- Is current type a POINTER type?
		do
			Result := storable_class.is_pointer
		end

	is_none: BOOLEAN
			-- Is current type a NONE type?
		do
			Result := storable_class.is_none
		end

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			Result := storable_class.is_expanded
		end

	is_frozen: BOOLEAN
			-- Is current type frozen?
		do
			Result := storable_class.is_frozen
		end

	is_attached: BOOLEAN
			-- Is current type attached?

	is_detachable: BOOLEAN
			-- Is current type detachable?

feature -- Access

	storable_class: SB_CLASS
			-- Base class of current type

	actual_parameters: SB_TYPE_LIST
			-- Actual generic parameters

	name: STRING
			-- Type name
		local
			i, nb: INTEGER
			l_actual_parameters: like actual_parameters
		do
				-- First, make sure that we will not enter into an infinite recursion.
			l_actual_parameters := actual_parameters
			actual_parameters := storable_constants.empty_type_list
			create Result.make (20)
			if is_attached then
				Result.append_string ("attached ")
			elseif is_detachable then
				Result.append_string ("detachable ")
			end
			if is_expanded then
				Result.append_string ("expanded ")
			end
			Result.append_string (storable_class.name)
			if not l_actual_parameters.is_empty then
				Result.append_character (' ')
				Result.append_character ('[')
				Result.append_string (l_actual_parameters.item (1).name)
				nb := l_actual_parameters.count
				from i := 2 until i > nb loop
					Result.append_character (',')
					Result.append_character (' ')
					Result.append_string (l_actual_parameters.item (i).name)
					i := i + 1
				end
				Result.append_character (']')
			end
			actual_parameters := l_actual_parameters
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

	set_storable_class (a_class: like storable_class)
			-- 	Set `storable_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			storable_class := a_class
		ensure
			storable_class_set: storable_class = a_class
		end

feature -- Comparison

	same_storable_type (other: SB_TYPE): BOOLEAN
			-- Are current type and `other' the same type?
		local
			i, nb: INTEGER
			l_actual_parameters: like actual_parameters
			other_parameters: like actual_parameters
			done: BOOLEAN
		do
			done := True
			if other = Current then
				Result := True
			elseif is_expanded then
				if not other.is_expanded then
					Result := False
				elseif is_boolean then
					Result := other.is_boolean
				elseif is_character_8 then
					Result := other.is_character_8
				elseif is_character_32 then
					Result := other.is_character_32
				elseif is_integer_32 then
					Result := other.is_integer_32
				elseif is_integer_8 then
					Result := other.is_integer_8
				elseif is_integer_16 then
					Result := other.is_integer_16
				elseif is_integer_64 then
					Result := other.is_integer_64
				elseif is_natural_8 then
					Result := other.is_natural_8
				elseif is_natural_16 then
					Result := other.is_natural_16
				elseif is_natural_32 then
					Result := other.is_natural_32
				elseif is_natural_64 then
					Result := other.is_natural_64
				elseif is_real_32 then
					Result := other.is_real_32
				elseif is_real_64 then
					Result := other.is_real_64
				elseif is_pointer then
					Result := other.is_pointer
				else
					done := False
				end
			elseif is_none then
				Result := other.is_none and not other.is_expanded and then (other.is_attached = is_attached and other.is_detachable = is_detachable)
			else
				done := False
			end
			if not done then
				if not attached {SB_CLASS_TYPE} other as l_class_type then
					Result := False
				elseif storable_class /= l_class_type.storable_class then
					Result := False
				elseif is_attached /= l_class_type.is_attached then
					Result := False
				elseif is_detachable /= l_class_type.is_detachable then
					Result := False
				else
						-- First, make sure that we will not enter into an infinite recursion.
					l_actual_parameters := actual_parameters
					actual_parameters := storable_constants.empty_type_list
					other_parameters := l_class_type.actual_parameters
					nb := other_parameters.count
					if l_actual_parameters.count = nb then
						Result := True
						from i := 1 until i > nb loop
							if not l_actual_parameters.item (i).same_storable_type (other_parameters.item (i)) then
								Result := False
								i := nb + 1 -- Jump out of the loop.
							else
								i := i + 1
							end
						end
					end
					actual_parameters := l_actual_parameters
				end
			end
		end

	same_storable_full_type (other: SB_TYPE; other_context: SB_CLASS; a_context: SB_CLASS): BOOLEAN
			-- Are current type appearing in `a_context' and `other'
			-- appearing in `other_context' the same type?
		local
			i, nb: INTEGER
			l_actual_parameters: like actual_parameters
			other_parameters: like actual_parameters
			done: BOOLEAN
		do
			if other = Current then
				Result := True
			elseif other.is_formal then
				Result := other.same_storable_full_type (Current, a_context, other_context)
			else
				done := True
				if is_expanded then
					if not other.is_expanded then
						Result := False
					elseif is_boolean then
						Result := other.is_boolean
					elseif is_character_8 then
						Result := other.is_character_8
					elseif is_character_32 then
						Result := other.is_character_32
					elseif is_integer_32 then
						Result := other.is_integer_32
					elseif is_integer_8 then
						Result := other.is_integer_8
					elseif is_integer_16 then
						Result := other.is_integer_16
					elseif is_integer_64 then
						Result := other.is_integer_64
					elseif is_natural_8 then
						Result := other.is_natural_8
					elseif is_natural_16 then
						Result := other.is_natural_16
					elseif is_natural_32 then
						Result := other.is_natural_32
					elseif is_natural_64 then
						Result := other.is_natural_64
					elseif is_real_32 then
						Result := other.is_real_32
					elseif is_real_64 then
						Result := other.is_real_64
					elseif is_pointer then
						Result := other.is_pointer
					else
						done := False
					end
				elseif is_none then
					Result := other.is_none and not other.is_expanded and then (other.is_attached = is_attached and other.is_detachable = is_detachable)
				else
					done := False
				end
				if not done then
					if not attached {SB_CLASS_TYPE} other as l_class_type then
						Result := False
					elseif is_attached /= l_class_type.is_attached then
						Result := False
					elseif is_detachable /= l_class_type.is_detachable then
						Result := False
					else
							-- First, make sure that we will not enter into an infinite recursion.
						l_actual_parameters := actual_parameters
						actual_parameters := storable_constants.empty_type_list
						other_parameters := l_class_type.actual_parameters
						nb := other_parameters.count
						if l_actual_parameters.count = nb then
							Result := True
							from i := 1 until i > nb loop
								if not l_actual_parameters.item (i).same_storable_full_type (other_parameters.item (i), other_context, a_context) then
									Result := False
									i := nb + 1 -- Jump out of the loop.
								else
									i := i + 1
								end
							end
						end
						actual_parameters := l_actual_parameters
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
			l_other_resolved_type: SB_TYPE
			l_actuals: SB_TYPE_LIST
			i, nb: INTEGER
			l_actual_parameters: like actual_parameters
			other_parameters: like actual_parameters
			done: BOOLEAN
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
				done := True
				if is_expanded then
					if not l_other_resolved_type.is_expanded then
						Result := False
					elseif is_boolean then
						Result := l_other_resolved_type.is_boolean
					elseif is_character_8 then
						Result := l_other_resolved_type.is_character_8
					elseif is_character_32 then
						Result := l_other_resolved_type.is_character_32
					elseif is_integer_32 then
						Result := l_other_resolved_type.is_integer_32
					elseif is_integer_8 then
						Result := l_other_resolved_type.is_integer_8
					elseif is_integer_16 then
						Result := l_other_resolved_type.is_integer_16
					elseif is_integer_64 then
						Result := l_other_resolved_type.is_integer_64
					elseif is_natural_8 then
						Result := l_other_resolved_type.is_natural_8
					elseif is_natural_16 then
						Result := l_other_resolved_type.is_natural_16
					elseif is_natural_32 then
						Result := l_other_resolved_type.is_natural_32
					elseif is_natural_64 then
						Result := l_other_resolved_type.is_natural_64
					elseif is_real_32 then
						Result := l_other_resolved_type.is_real_32
					elseif is_real_64 then
						Result := l_other_resolved_type.is_real_64
					elseif is_pointer then
						Result := l_other_resolved_type.is_pointer
					else
						done := False
					end
				elseif is_none then
					Result := l_other_resolved_type.is_none and not l_other_resolved_type.is_expanded and then (l_other_resolved_type.is_attached implies is_attached)
				else
					done := False
				end
				if not done then
					if not attached {SB_CLASS_TYPE} l_other_resolved_type as l_class_type then
						Result := False
					elseif not (l_class_type.is_attached implies is_attached) then
						Result := False
					else
							-- First, make sure that we will not enter into an infinite recursion.
						l_actual_parameters := actual_parameters
						actual_parameters := storable_constants.empty_type_list
						other_parameters := l_class_type.actual_parameters
						nb := other_parameters.count
						if l_actual_parameters.count = nb then
							Result := True
							from i := 1 until i > nb loop
								if not l_actual_parameters.item (i).is_storable_full_type_compatible (other_parameters.item (i), other_context, a_context) then
									Result := False
									i := nb + 1 -- Jump out of the loop.
								else
									i := i + 1
								end
							end
						end
						actual_parameters := l_actual_parameters
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
			l_actual_parameters: like actual_parameters
		do
				-- First, make sure that we will not enter into an infinite recursion.
			l_actual_parameters := actual_parameters
			actual_parameters := storable_constants.empty_type_list
			if is_attached then
				a_file.put_string ("attached ")
			elseif is_detachable then
				a_file.put_string ("detachable ")
			end
			if is_expanded then
				a_file.put_string ("expanded ")
			end
			a_file.put_string (storable_class.name)
			if not l_actual_parameters.is_empty then
				a_file.put_character (' ')
				a_file.put_character ('[')
				l_actual_parameters.item (1).print_type (a_file)
				nb := l_actual_parameters.count
				from i := 2 until i > nb loop
					a_file.put_character (',')
					a_file.put_character (' ')
					l_actual_parameters.item (i).print_type (a_file)
					i := i + 1
				end
				a_file.put_character (']')
			end
			actual_parameters := l_actual_parameters
		end

invariant

	storable_class_not_void: storable_class /= Void
	actual_parameters_not_void: actual_parameters /= Void

end
