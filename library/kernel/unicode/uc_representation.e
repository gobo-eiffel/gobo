indexing

   description:
   
   "abstract string representation";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

deferred class UC_REPRESENTATION

feature

   type: INTEGER
	 -- type of this representation
   
feature  

   count: INTEGER
	 -- number of ucchars

   valid_index (pos: INTEGER): BOOLEAN is
	 -- is `pos' a valid index into ucstring?
      do
	 Result := (1 <= pos) and then (pos <= count)
      end
   
   valid_code (code: INTEGER): BOOLEAN is
         -- is `code' a valid unicode code?
      require
         non_negative: 0 <= code;
      local
         ucc: UC_CHARACTER
      do
         Result := ucc.valid_code(code)
      end
   
   item_code (i: INTEGER): INTEGER is
	 -- code of item at position `i'
      require
	 good_key: valid_index(i)
      deferred
      end

   put_code (c: INTEGER; i: INTEGER) is
	 -- put code `c' at index `i'
      require
	 good_key: valid_index(i);
         -- valid_code
      deferred
      end

   remove (start, c: INTEGER) is
	 -- remove `c' characters from representation, starting at 
	 -- index `start'.
      require
	 valid_index: valid_index(start);
	 non_negative_count: c >= 0;
	 vali_index_of_last: valid_index(start+c-1);
      deferred
      ensure
	 count = (old count) - c;
      end

   insert_code (code, idx: INTEGER) is
	 -- insert character with `code' at position `idx'. if you 
	 -- want to append the code, use `idx' = `count' + 1.
      require
	 valid_idx: valid_index(idx) or else idx = count + 1;
	 valid_code: valid_code(code);
      deferred
      ensure
	 count = (old count) + 1
      end

   insert (idx: INTEGER; other: UC_REPRESENTATION; ostart, ocount: INTEGER) is
	 -- insert, starting at position `idx', characters from the
	 -- representation given in `other'. the slice starts at
	 -- `ostart' in `other' and has `ocount' characters.  if you
	 -- want to append the code, use `idx' = `count' + 1.
      require
	 valid_idx: valid_index(idx) or else idx = count + 1;
	 non_negative_count_of_other: ocount >= 0;
	 other_not_void: other /= void;
	 valid_start_index_of_other: other.valid_index(ostart);
	 valid_end_index_of_other: other.valid_index(ostart+ocount-1);
      local
	 i: INTEGER
      do
	 --! could be optimized in subclasses
	 from
	    i := 1
	 until
	    i > ocount
	 loop
	    insert_code(other.item_code(ostart+i-1), idx+i-1)
	    i := i + 1
	 end
      ensure
	 count = (old count) + ocount;
      end

end -- class UC_REPRESENTATION
