indexing

   description:
   
   "string representation as array of integer codes";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_REPRESENTATION_UTF32

inherit
   UC_REPRESENTATION
      end
   
creation
   make

feature {NONE} -- Creation

   make is
      do
	 !!storage.make(1,0)
      end

feature -- Inherited from UC_REPRESENTATION

   item_code (i: INTEGER): INTEGER is
      do
	 Result := storage.item(i)
      end

   put_code (c: INTEGER; i: INTEGER) is
      do
	 storage.put(c, i)
      end

   remove (start, c: INTEGER) is
      do
	 if c > 0 then
	    move(start+c, start, count - start -c + 1)
	    set_count(count-c)
	 end
      end

   insert_code (code, idx: INTEGER) is
      local
	 cnt: INTEGER
      do
	 if idx = count + 1 then
	    -- append
	    storage_ensure_capacity(count + 1)
	    set_count(count + 1)
	    put_code(code, count)
	 else
	    cnt := count - idx + 1
	    storage_ensure_capacity(count + 1)
	    move(idx, idx + 1, cnt)
	    set_count(count + 1)
	    put_code(code, idx)
	 end
      end

feature {NONE}

   set_count (c: INTEGER) is
      do
	 count := c
      end

feature {NONE} -- managing storage

   storage: ARRAY[INTEGER]
	 -- string's storage

   move (src_offset, target_offset, ct: INTEGER) is
	 -- move `ct' characters from `src_offset' to `target_offset'
      local
	 i: INTEGER
      do
	 if src_offset < target_offset then
	    -- move right
	    from
	       i := ct-1
	    until
	       i < 0
	    loop
	       storage.put(storage.item(src_offset+i), target_offset+i)
	       i := i - 1
	    end
	 elseif src_offset > target_offset then
	    -- move left
	    from
	       i := 0
	    until
	       i >= ct
	    loop
	       storage.put(storage.item(src_offset+i), target_offset+i)
	       i := i + 1
	    end
	 end
      end

   storage_ensure_capacity (cap: INTEGER) is
      do
	 if cap > storage.count then
	    storage.resize(1,cap)
	 end
      end

end -- class UC_REPRESENTATION_UTF32
