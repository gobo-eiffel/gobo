note
	description: "[
		Access to command-line arguments. This class 
		may be used as ancestor by classes needing its facilities.
		]"

	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-25 20:58:54 +0100 (Fri, 25 Jan 2013) $"
	revision: "$Revision: 713 $"

class
	ARGUMENTS_32

inherit
	ITERABLE [IMMUTABLE_STRING_32]

feature -- Access

	argument (i: INTEGER): IMMUTABLE_STRING_32
			-- `i'-th argument of command that started system execution
			-- (the command name if `i' = 0).
		require
			index_large_enough: i >= 0
			index_small_enough: i <= argument_count
		do
			Result := internal_argument_array.item (i)
		ensure
			argument_not_void: Result /= Void
		end

	argument_array: ARRAY [IMMUTABLE_STRING_32]
			-- Array containing command name (position 0) and arguments.
			-- A new instance at each query.
		do
			Result := internal_argument_array.twin
		ensure
			argument_array_not_void: Result /= Void
			argument_array_compare_objects: Result.object_comparison
		end

	Command_line: IMMUTABLE_STRING_32
			-- Full command line: `command_name' followed by arguments.
		local
			i: INTEGER
			l_result: STRING_32
		once
				-- Approximation of size, 10 characters per argument.
			create l_result.make (command_name.count + argument_count * 10)
			from
				i := 0
			until
				i > argument_count
			loop
				l_result.append_character (' ')
				l_result.append (argument (i))
				i := i + 1
			end
			create Result.make_from_string (l_result)
		ensure
			Result.count >= command_name.count
		end

	Command_name: IMMUTABLE_STRING_32
			-- Name of command that started system execution.
		once
			Result := argument (0)
		ensure
			definition: Result.same_string (argument (0))
		end

feature -- Access: Cursor

	new_cursor: ITERATION_CURSOR [IMMUTABLE_STRING_32]
			-- <Precursor>
		do
			Result := internal_argument_array.new_cursor
		end

feature -- Status report

	index_of_word_option (opt: READABLE_STRING_GENERAL): INTEGER
			-- Does command line specify word option `opt' and, if so,
			-- at what position?
			-- If one of the arguments in list of space-separated arguments
			-- is `Xopt', where `X' is the current `option_sign',
			-- then index of this argument in list;
			-- else 0.
		require
			opt_non_void: opt /= Void
			opt_meaningful: not opt.is_empty
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > argument_count or else
				option_word_equal (internal_argument_array.item (i), opt)
			loop
				i := i + 1
			end
			if i <= argument_count then
				Result := i
			end
		end

	index_of_beginning_with_word_option (opt: READABLE_STRING_GENERAL): INTEGER
			-- Does command line specify argument beginning with word
			-- option `opt' and, if so, at what position?
			-- If one of the arguments in list of space-separated arguments
			-- is `Xoptxx', where `X' is the current `option_sign', 'xx'
			-- is arbitrary, possibly empty sequence of characters,
			-- then index of this argument in list;
			-- else 0.
		require
			opt_non_void: opt /= Void
			opt_meaningful: not opt.is_empty
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > argument_count or else
				option_word_begins_with (internal_argument_array.item (i), opt)
			loop
				i := i + 1
			end
			if i <= argument_count then
				Result := i
			end
		end

	index_of_character_option (o: CHARACTER_32): INTEGER
			-- Does command line specify character option `o' and, if so,
			-- at what position?
			-- If one of the space-separated arguments is of the form `Xxxoyy',
			-- where `X' is the current `option_sign', `xx' and `yy'
			-- are arbitrary, possibly empty sequences of characters,
			-- then index of this argument in list of arguments;
			-- else 0.
		require
			o_non_null: o /= '%U'
		local
			i: INTEGER
 		do
			from
				i := 1
			until
				i > argument_count or else
				option_character_equal (internal_argument_array.item (i), o)
			loop
				i := i + 1
			end
			if i <= argument_count then Result := i end
		end

	separate_character_option_value (o: CHARACTER_32): detachable IMMUTABLE_STRING_32
			-- The value, if any, specified after character option `o' on
			-- the command line.
			-- This is one of the following (where `X' is the current
			-- `option_sign', `xx' and 'yy' are arbitrary, possibly empty
			-- sequences of characters):
			--   `val' if command line includes two consecutive arguments
			--	   of the form `Xxxoyy' and `val' respectively.
			--   Empty string if command line includes argument `Xxxoyy', which is
			--	   either last argument or followed by argument starting with `X'.
			--   Void if there is no argument of the form `Xxxoyy'.
		require
			o_non_null: o /= '%U'
		local
			p: INTEGER
		do
			p := index_of_character_option (o)
			if p /= 0 then
				if p = argument_count or else
					internal_argument_array.item (p + 1).item (1) = option_sign.item
				then
					create Result.make_empty
				else
					Result := internal_argument_array.item (p + 1)
				end
			end
		end

	separate_word_option_value (opt: READABLE_STRING_GENERAL): detachable IMMUTABLE_STRING_32
			-- The value, if any, specified after word option `opt' on the
			-- command line.
			-- This is one of the following (where `X' is the current `option_sign'):
			--   `val' if command line includes two consecutive arguments
			--	   of the form `Xopt' and `val' respectively.
			--   Empty string if command line includes argument `Xopt', which is
			--	   either last argument or followed by argument starting with `X'.
			--   Void if no `Xopt' argument.
		require
			opt_non_void: opt /= Void
			opt_meaningful: not opt.is_empty
		local
			p: INTEGER
		do
			p := index_of_word_option (opt)
			if p /= 0 then
				if p = argument_count or else
					internal_argument_array.item (p + 1).item (1) = option_sign.item
				then
					create Result.make_empty
				else
					Result := internal_argument_array.item (p + 1)
				end
			end
		end

	coalesced_character_option_value (o: CHARACTER_32): detachable IMMUTABLE_STRING_32
			-- The value, if any, specified for character option `o' on
			-- the command line.
			-- Defined as follows (where 'X' is the current 'option_sign' and
			-- 'xx' is an arbitrary, possibly empty sequence of characters):
			--   `val' if command line includes an argument of the form `Xxxoval'
			--	   (this may be an empty string if argument is just `Xxxo').
			--   Void otherwise.
		require
			o_non_null: o /= '%U'
		local
			p: INTEGER
		do
			p := index_of_character_option (o)
			if p /= 0 then
				Result := internal_argument_array.item (p)
				if option_sign.item /= '%U' then
					Result := Result.shared_substring (Result.index_of (o, 1) + 2, Result.count)
				else
					Result := Result.shared_substring (Result.index_of (o, 1) + 1, Result.count)
				end
			end
		end

	coalesced_word_option_value (opt: READABLE_STRING_GENERAL): detachable IMMUTABLE_STRING_32
			-- The value, if any, specified for word option `opt' on the
			-- command line.
			-- Defined as follows (where X is the current `option_sign'):
			--   `val' if command line includes an argument of the form `Xoptval'
			--	   (this may be an empty string if argument is just `Xopt').
			--   Void otherwise.
		require
			opt_non_void: opt /= Void
			opt_meaningful: not opt.is_empty
		local
			p: INTEGER
		do
			p := index_of_beginning_with_word_option (opt)
			if p /= 0 then
				Result := internal_argument_array.item (p)
				if option_sign.item /= '%U' then
					Result := Result.shared_substring (opt.count + 2, Result.count)
				else
					Result := Result.shared_substring (opt.count + 1, Result.count)
				end
			end
		end

	option_sign: CELL [CHARACTER_32]
			-- The character used to signal options on the command line.
			-- This can be '%U' if no sign is necessary for the argument
			-- to be an option
			-- Default is '-'
		once
			create Result.put ('-')
		end

feature -- Status setting

	set_option_sign (c: CHARACTER_32)
			-- Make `c' the option sign.
			-- Use'%U' if no sign is necessary for the argument to
			-- be an option.
		do
			option_sign.put (c)
		end

feature -- Measurement

	argument_count: INTEGER
			-- Number of arguments given to command that started
			-- system execution (command name does not count).
		external
			"built_in"
		ensure
			argument_count_positive: Result >= 0
		end

feature {NONE} -- Implementation

	option_word_equal (arg, w: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `arg' equal to the word option `w' in a case sensitive manner?
		require
			arg_not_void: arg /= Void
			w_not_void: w /= Void
		do
			if option_sign.item = '%U' then
				Result := arg.same_string (w)
			elseif not arg.is_empty and then arg.item (1) = option_sign.item then
				Result := arg.substring (2, arg.count).same_string (w)
			end
		end

	option_word_begins_with (arg, w: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `arg' begin with the word option `w' in a case sensitive manner?
		require
			arg_not_void: arg /= Void
			w_not_void: w /= Void
		do
			if option_sign.item = '%U' and then arg.count >= w.count then
				Result := arg.substring (1, w.count).same_string (w)
			elseif arg.item (1) = option_sign.item and then arg.count > w.count then
				Result := arg.substring (2, w.count + 1).same_string (w)
			end
		end

	option_character_equal (arg: READABLE_STRING_GENERAL; c: CHARACTER_32): BOOLEAN
			-- Does `arg' contain the character option `c'?
		require
			arg_not_void: arg /= Void
		do
			if option_sign.item = '%U' then
				Result := arg.has (c)
			elseif arg.item (1) = option_sign.item then
				Result := arg.substring (2, arg.count).has (c)
			end
		end

	internal_argument_array: ARRAY [IMMUTABLE_STRING_32]
			-- Array containing command name (position 0) and arguments.
		local
			i: INTEGER
		once
			from
				create Result.make_filled (create {IMMUTABLE_STRING_32}.make_empty, 0, argument_count)
				Result.compare_objects
			until
				i > argument_count
			loop
				Result.put (i_th_argument_string (i), i)
				i := i + 1
			end
		ensure
			internal_argument_array_not_void: Result /= Void
			internal_argument_array_compare_objects: Result.object_comparison
		end

	i_th_argument_string (i: INTEGER): IMMUTABLE_STRING_32
			-- Underlying string holding the argument at position `i'.
		require
			index_large_enough: i >= 0
			index_small_enough: i <= argument_count
--<		external
--<			"built_in"
		local
			l_str: NATIVE_STRING
			l_ptr: POINTER
		do
			create l_str.make_empty (0)
			l_ptr := i_th_argument_pointer (i)
			if l_ptr /= default_pointer then
				l_str.set_shared_from_pointer (l_ptr)
				create Result.make_from_string (l_str.string)
			else
				create Result.make_empty
			end
		end

	i_th_argument_pointer (i: INTEGER): POINTER
			-- Underlying pointer holding the argument at position `i'.
			--| For implementers, if `i_th_argument_string' is implemented you do not need 
			--| to implement this one.
		require
			index_large_enough: i >= 0
			index_small_enough: i <= argument_count
		external
			"built_in"
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
