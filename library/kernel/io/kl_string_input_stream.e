indexing

	description:

		"Character input streams based on strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_STRING_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
		redefine
			valid_unread_character
		end
	
	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		end
		
creation

	make
	
feature {NONE} -- Creation

	make (a: like string) is
			-- Make.
		require
			not_void: a /= Void
		do
			string := a
			location := 0
			last_string := STRING_.make (0)
		end
		
	string: STRING
			-- Storage.
			
	location: INTEGER
			-- Location of last character read.
		
feature -- Status report

	is_open_read: BOOLEAN is
			-- Can items be read from input stream?
		do
			Result := True
		end

	end_of_input: BOOLEAN is
			-- Has the end of input stream been reached?
		do
			Result := location > string.count
		end

	valid_unread_character (a_character: CHARACTER): BOOLEAN is
			-- Can `a_character' be put back in input stream?
		do
			Result := (string.count > 0 and location > 0 and (not end_of_input))
						and then (a_character = last_character)
		end
		
feature -- Access

	name: STRING is
			-- Name of input stream
		once
			Result := "STRING"
		end

	last_character: CHARACTER is
			-- Last item read
		do
			Result := string.item (location)
		end

feature -- Input

	read_character is
			-- Read the next item in input stream.
			-- Make the result available in `last_item'.
		do
			location := location + 1
		end

	unread_character (an_item: CHARACTER) is
			-- Put `an_item' back in input stream.
			-- This item will be read first by the next
			-- call to a read routine.
		do
			location := location - 1
		end

feature -- Input

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
		local
			i: INTEGER
		do
			-- naive implementation, substring 
			-- would do a copy and create a new object, 
			-- so it is not much better.
			from
				last_string.wipe_out
				i := nb
				read_character
			until	
				i = 0 or end_of_input
			loop
				last_string.append_character (last_character)
				read_character
				i := i - 1
			end
		end
		
	last_string: STRING
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)

invariant

	string_not_void: string /= Void
	location_positive: location >= 0
	location_max: location <= string.count + 1
	last_string_not_void: last_string /= Void
	
end
