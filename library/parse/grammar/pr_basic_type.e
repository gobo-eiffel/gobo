indexing

	description:

		"Symbol basic expanded types (such as INTEGER, BOOLEAN, etc.)"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_BASIC_TYPE

inherit

	PR_TYPE
		redefine
			print_conversion_routine
		end

creation

	make

feature -- Output

	print_conversion_routine (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print conversion routine ANY->`name' to `a_file'.
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
				%%T%Tlocal%N%T%T%Tref: ")
			a_file.put_string (name)
			a_file.put_string ("_REF%N%
				%%T%Tdo%N%
				%%T%T%Tref ?= v%N%
				%%T%T%TResult := ref.item%N%
				%%T%Tend%N")

			a_file.put_string ("%N%Tyyis_type")
			a_file.put_integer (id)
			a_file.put_string (" (v: ANY): BOOLEAN is%N%
				%%T%Tlocal%N%T%T%Tu: ")
			a_file.put_string (name)
			a_file.put_string ("_REF%N%T%Tdo%N%
				%%T%T%Tu ?= v%N%
				%%T%T%TResult := (u = v)%N%
				%%T%Tend%N")
		end

end -- class PR_BASIC_TYPE
