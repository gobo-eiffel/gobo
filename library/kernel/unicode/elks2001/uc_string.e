indexing



   description:

   

   "Sequence of UC_CHARACTERs, accessible through integer indices in a contigous range."; 



   library:    "Gobo Eiffel Unicode Library"

   author:     "michael kretschmar <majkel.kretschmar@epost.de>"

   copyright:  "Copyright (c) 2001, michael kretschmar and others"

   license:    "Eiffel Forum Freeware License v1 (see forum.txt)"

   date:       "$Date$"

   revision:   "$Revision$"

   

   note:       "This implementation will be as much close as possible %

               %to the upcoming ELKS 2001 STRING proposol. As long as %

               %it is not accepted by NICE, it is experimental."

               

class UC_STRING



inherit

   COMPARABLE

      redefine infix "<=", infix ">", infix ">=", is_equal, 

	 three_way_comparison, out, copy

      end

   HASHABLE

      redefine is_equal, out, copy

      end



creation 

   make_empty, make_filled, make, make_from_uc_string --, make_from_utf8

   

feature -- Initialization

   

   make (suggested_capacity: INTEGER) is

         -- Create empty string, or remove all characters from

         -- existing string.

      require

         non_negative_suggested_capacity: suggested_capacity >= 0

      do

         -- we will ignore the suggested capacity

         

         if i_representation = void then

            i_representation := i_settings.create_representation

         else

            wipe_out

         end

      ensure

         empty_string: count = 0

      end

   

   -- from_c

   -- not supported

   

   make_from_uc_string (s: UC_STRING) is

         -- Initialize from the character sequence of `s'.

      require

         s_not_void: s /= void

      do

         make(s.count)

	 append_uc_string(s)

      ensure

         initialized: same_string(s)

      end

   

feature {NONE} -- Initialization

   

   make_empty is

         -- Create empty string

      do

         make(0)

      ensure

         empty: count = 0

      end

   

   make_filled (uc: UC_CHARACTER; n: INTEGER) is

         -- Create string of length `n' filled with `c'.

      require

         valid_count: n >= 0

      do

         make(n);

         from

            i := 1

         until

            i > n

         loop

            append_uc_character(uc)

            i := i + 1

         end

      ensure

         count_set: count = n;

         filled: occurrences(c) = count

      end

   

feature -- Basic specifiers

   

   count: INTEGER is

	 -- Number of characters

      do

	 Result := i_representation.count

      end

   

   item, infix "@" (i: INTEGER): UC_CHARACTER is

	 -- Character at index `i'

      require

	 valid_index: valid_index (i)

      do

	 Result.make_from_integer(item_code(i))

      end



feature -- Access

   

feature -- Measurement

   

   occurrences (c: UC_CHARACTER): INTEGER is

         -- Number of times `c' appears in the string

      local

	 i: INTEGER

      do

	 from

	    i := 1

	 until

	    i > count

	 loop

	    if item_code(i) = c.code then

	       Result := Result + 1

	    end

	    i := i + 1

	 end

      ensure

         zero_if_empty: count = 0 implies Result = 0;

         recurse_if_not_found_at_first_position: (count > 0 and then item(1) /= c) implies Result = substring(2, count).occurrences(c);

         recurse_if_found_at_first_position: (count > 0 and then item(1) = c) implies Result = 1 + substring(2, count).occurrences(c)

      end

   

feature -- Comparison

   

feature -- Status report

   

feature -- Element change

   

feature -- Removal

   

feature -- Conversion

   

feature -- Duplication

   

feature -- Output

   

invariant

   

   non_negative_count: count >= 0;

   

end -- class UC_STRING   



