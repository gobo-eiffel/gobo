indexing

	description:

		"Symbol types"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_TYPE

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	UT_IMPORTED_FORMATTERS

creation

	make, make_generic, make_anchored

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_name: like name) is
			-- Create a new type named `a_name'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
		do
			id := an_id
			name := a_name
		ensure
			id_set: id = an_id
			name_set: name = a_name
		end

	make_generic (an_id: INTEGER; a_name: like name; generics: DS_ARRAYED_LIST [PR_TYPE]) is
			-- Create a new generic type named `a_name' and generic
			-- parameters `generics'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			generics_not_void: generics /= Void
			no_void_generic_parameter: not generics.has (Void)
		local
			i, nb: INTEGER
		do
			id := an_id
			if generics.is_empty then
				name := a_name
			else
				name := STRING_.make (50)
				name.append_string (a_name)
				name.append_string (" [")
				name.append_string (generics.item (1).name)
				nb := generics.count
				from i := 2 until i > nb loop
					name.append_string (", ")
					name.append_string (generics.item (i).name)
					i := i + 1
				end
				name.append_character (']')
			end
		ensure
			id_set: id = an_id
		end

	make_anchored (an_id: INTEGER; a_name: like name) is
			-- Create a new anchored type
			-- of the form "like `a_name'".
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
		do
			id := an_id
			name := STRING_.make (a_name.count + 5)
			name.append_string ("like ")
			name.append_string (a_name)
		ensure
			id_set: id = an_id
		end

feature -- Access

	name: STRING
			-- Type name

	id: INTEGER
			-- Internal type id

feature -- Output

	append_dollar_n_to_string (n: INTEGER; nb_rhs: INTEGER; a_string: STRING) is
			-- Append typed version of $`n' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_string ("yytype")
			INTEGER_FORMATTER_.append_decimal_integer (a_string, id)
			a_string.append_string (" (")
			append_untyped_dollar_n_to_string (n, nb_rhs, a_string)
			a_string.append_character (')')
		end

	append_dollar_dollar_to_string (a_string: STRING) is
			-- Append typed version of $$ to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			append_untyped_dollar_dollar_to_string (a_string)
			INTEGER_FORMATTER_.append_decimal_integer (a_string, id)
		end

	print_conversion_routine (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print conversion routine ANY->`name' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("%Tyytype")
			a_file.put_integer (id)
			a_file.put_string (" (v: ANY): ")
			a_file.put_string (name)
			a_file.put_string (" is%N%
				%%T%Trequire%N%
				%%T%T%Tvalid_type: yyis_type")
			a_file.put_integer (id)
			a_file.put_string (" (v)%N%
				%%T%Tdo%N%
				%%T%T%TResult ?= v%N%
				%%T%Tensure%N%
				%%T%T%Tdefinition: Result = v%N%
				%%T%Tend%N")

			a_file.put_string ("%N%Tyyis_type")
			a_file.put_integer (id)
			a_file.put_string (" (v: ANY): BOOLEAN is%N%
				%%T%Tlocal%N%T%T%Tu: ")
			a_file.put_string (name)
			a_file.put_string ("%N%T%Tdo%N%
				%%T%T%Tu ?= v%N%
				%%T%T%TResult := (u = v)%N%
				%%T%Tend%N")
		

--			a_file.put_string ("%Tyytype")
--			a_file.put_integer (id)
--			a_file.put_string (" (v: ANY): ")
--			a_file.put_string (name)
--			a_file.put_string (" is%N%
--				%%T%Tdo%N%T%T%TResult := yyrtid")
--			a_file.put_integer (id)
--			a_file.put_string (" ($v)%N%T%Tend%N")
--			a_file.put_string ("%N%Tyyrtid")
--			a_file.put_integer (id)
--			a_file.put_string (" (v: POINTER): ")
--			a_file.put_string (name)
--			a_file.put_string (" is%N%T%Texternal%N%
--				%%T%T%T%"C [macro <eif_macros.h>]%"%N%T%Talias%N%
--				%%T%T%T%"RTID%"%N%T%Tend%N")
		end

	print_dollar_dollar_declaration (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print $$ declaration to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("%T%T%Tyyval")
			a_file.put_integer (id)
			a_file.put_string (": ")
			a_file.put_string (name)
		end

	print_dollar_dollar_initialization (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print $$ initialization to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
		end

	print_dollar_dollar_finalization (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print $$ finalization to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("%T%T%Tyyval := yyval")
			a_file.put_integer (id)
		end

feature {NONE} -- Implementation

	append_untyped_dollar_n_to_string (n: INTEGER; nb_rhs: INTEGER; a_string: STRING) is
			-- Append untyped version of $`n' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			offset: INTEGER
		do
			offset := nb_rhs - n
			if offset = 0 then
				a_string.append_string ("yyvs.item (yyvsp)")
			else
				a_string.append_string ("yyvs.item (yyvsp - ")
				INTEGER_FORMATTER_.append_decimal_integer (a_string, offset)
				a_string.append_character (')')
			end
		end

	append_untyped_dollar_dollar_to_string (a_string: STRING) is
			-- Append untyped version of $$ to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_string ("yyval")
		end

invariant

	valid_id: id >= 0
	name_not_void: name /= Void
	name_long_enough: name.count > 0

end -- class PR_TYPE
