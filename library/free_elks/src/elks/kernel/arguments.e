note
	description: "[
			Access to command-line arguments. This class 
			may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ARGUMENTS

obsolete
	"Use `ARGUMENTS_32' to manipulate Unicode arguments."

inherit
	ITERABLE [STRING]

feature -- Access

	argument (i: INTEGER): STRING
			-- `i'-th argument of command that started system execution
			-- (the command name if `i' = 0)
		require
			index_large_enough: i >= 0
			index_small_enough: i <= argument_count
		do
			Result := internal_arguments.argument (i).as_string_8
		ensure
			instance_free: class
			argument_not_void: Result /= Void
		end

	argument_array: ARRAY [STRING]
			-- Array containing command name (position 0) and arguments
		once
			Result := internal_argument_array
		ensure
			instance_free: class
			argument_array_not_void: Result /= Void
			argument_array_compare_objects: Result.object_comparison
		end

	Command_line: STRING
			-- Total command line
		local
			i: INTEGER
		once
			Result := Command_name.twin
			from
				i := 1
			until
				i > argument_count
			loop
				Result.append (" ")
				Result.append (argument (i))
				i := i + 1
			end
		ensure
			instance_free: class
			Result.count >= command_name.count
		end

	Command_name: STRING
			-- Name of command that started system execution
		once
			Result := argument (0)
		ensure
			instance_free: class
			definition: Result ~ argument (0)
		end

feature -- Access: Cursor

	new_cursor: ITERATION_CURSOR [STRING]
			-- <Precursor>
		do
			Result := argument_array.new_cursor
		ensure then
			instance_free: class
		end

feature -- Status report

	has_word_option (opt: STRING): INTEGER
		obsolete "Use index_of_word_option instead. [2017-05-31]"
		do
			Result := index_of_word_option (opt)
		ensure
			instance_free: class
		end

	index_of_word_option (opt: STRING): INTEGER
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
				option_word_equal (argument_array.item (i), opt)
			loop
				i := i + 1
			end
			if i <= argument_count then
				Result := i
			end
		ensure
			instance_free: class
		end

	index_of_beginning_with_word_option (opt: STRING): INTEGER
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
				option_word_begins_with (argument_array.item (i), opt)
			loop
				i := i + 1
			end
			if i <= argument_count then
				Result := i
			end
		ensure
			instance_free: class
		end

	has_character_option (o: CHARACTER): INTEGER
		obsolete "Use index_of_character_option instead. [2017-05-31]"
		do
			Result := index_of_character_option (o)
		ensure
			instance_free: class
		end

	index_of_character_option (o: CHARACTER): INTEGER
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
				option_character_equal (argument_array.item (i), o)
			loop
				i := i + 1
			end
			if i <= argument_count then Result := i end
		ensure
			instance_free: class
		end

	separate_character_option_value (o: CHARACTER): detachable STRING
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
					argument_array.item (p + 1).item (1) = option_sign.item
				then
					Result := ""
				else
					Result := argument_array.item (p + 1)
				end
			end
		ensure
			instance_free: class
		end

	separate_word_option_value (opt: STRING): detachable STRING
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
					argument_array.item (p + 1).item (1) = option_sign.item
				then
					Result := ""
				else
					Result := argument_array.item (p + 1)
				end
			end
		ensure
			instance_free: class
		end

	coalesced_option_character_value (o: CHARACTER): detachable STRING
		obsolete "Use coalesced_character_option_value instead. [2017-05-31]"
		do
			Result := coalesced_character_option_value (o)
		ensure
			instance_free: class
		end

	coalesced_character_option_value (o: CHARACTER): detachable STRING
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
			l: STRING
		do
			p := index_of_character_option (o)
			if p /= 0 then
				l := argument_array.item (p).twin
				if option_sign.item /= '%U' then
					l.remove (1)
				end
				Result := l.substring (l.index_of (o, 1) + 1, l.count)
			end
		ensure
			instance_free: class
		end

	coalesced_option_word_value (opt: STRING): detachable STRING
		obsolete "Use coalesced_word_option_value instead. [2017-05-31]"
		do
			Result := coalesced_word_option_value (opt)
		ensure
			instance_free: class
		end

	coalesced_word_option_value (opt: STRING): detachable STRING
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
			l: STRING
		do
			p := index_of_beginning_with_word_option (opt)
			if p /= 0 then
				l := argument_array.item (p).twin
				if option_sign.item /= '%U' then
					l.remove (1)
				end
				Result := l.substring (opt.count + 1, l.count)
			end
		ensure
			instance_free: class
		end

	option_sign: CHARACTER_REF
			-- The character used to signal options on the command line.
			-- This can be '%U' if no sign is necessary for the argument
			-- to be an option
			-- Default is '-'
		once
			create Result
			Result.set_item ('-')
		ensure
			instance_free: class
		end

feature -- Status setting

	set_option_sign (c: CHARACTER)
			-- Make `c' the option sign.
			-- Use'%U' if no sign is necessary for the argument to
			-- be an option
		do
			option_sign.set_item (c)
		ensure
			instance_free: class
		end

feature -- Measurement

	argument_count: INTEGER
			-- Number of arguments given to command that started
			-- system execution (command name does not count)
		do
			Result := internal_arguments.argument_count
		ensure
			instance_free: class
			argument_count_positive: Result >= 0
		end

feature {NONE} -- Implementation

	option_word_equal (arg, w: STRING): BOOLEAN
			-- Is `arg' equal to the word option `w'?
		require
			arg_not_void: arg /= Void
			w_not_void: w /= Void
		do
			if option_sign.item = '%U' then
				Result := arg ~ w
			elseif not arg.is_empty and then arg.item (1) = option_sign.item then
				Result := arg.substring (2, arg.count) ~ w
			end
		ensure
			instance_free: class
		end

	option_word_begins_with (arg, w: STRING): BOOLEAN
			-- Does `arg' begin with the word option `w'?
		require
			arg_not_void: arg /= Void
			w_not_void: w /= Void
		do
			if option_sign.item = '%U' and then arg.count >= w.count then
				Result := arg.substring (1, w.count) ~ w
			elseif arg.item (1) = option_sign.item and then arg.count > w.count then
				Result := arg.substring (2, w.count + 1) ~ w
			end
		ensure
			instance_free: class
		end

	option_character_equal (arg: STRING; c: CHARACTER): BOOLEAN
			-- Does `arg' contain the character option `c'?
		require
			arg_not_void: arg /= Void
		do
			if option_sign.item = '%U' then
				Result := arg.has (c)
			elseif arg.item (1) = option_sign.item then
				Result := arg.substring (2, arg.count).has (c)
			end
		ensure
			instance_free: class
		end

	internal_argument_array: ARRAY [STRING]
			-- Array containing command name (position 0) and arguments
		local
			i: INTEGER
		do
			create Result.make_filled ("", 0, argument_count)
			Result.compare_objects
			from
			until
				i > argument_count
			loop
				Result.put (argument (i), i)
				i := i + 1
			end
		ensure
			instance_free: class
			internal_argument_array_not_void: Result /= Void
			internal_argument_array_compare_objects: Result.object_comparison
		end

	internal_arguments: ARGUMENTS_32
			-- Access to the Unicode arguments.
		once
			create Result
		ensure
			instance_free: class
		end

invariant
	argument_array_consistent: argument_array ~ internal_argument_array

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
