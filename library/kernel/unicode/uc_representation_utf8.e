indexing

   description:
   
   "string representation as UTF8 string";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_REPRESENTATION_UTF8

inherit
   UC_REPRESENTATION
      redefine
         insert
      end
   
creation
   make

feature {NONE} -- Creation
   
   make is
      do
	 !!storage.make(0)
	 storage_count := 0
         last_index := 0
      end
   
feature -- Inherited from UC_REPRESENTATION

   item_code (i: INTEGER): INTEGER is
      do
         Result := -1
         find_position(i)
	 utils.read_code(storage, storage_slice_start)
	 Result := utils.last_code
      ensure then
         valid_utf8
      end
   
   put_code (c: INTEGER; i: INTEGER) is
      local
	 diff: INTEGER
	 octets_needed, octets_given: INTEGER
         octets_to_be_moved: INTEGER
      do
	 find_position(i)
	 octets_given := 1 + 
	    utils.nr_of_following_octets(storage.item(storage_slice_start))
	 octets_needed := utils.octet_size(c)
	 diff := octets_needed - octets_given
         octets_to_be_moved := storage_count - storage_slice_end
            
	 -- make place if necessary
	 if diff > 0 then
	    -- insert place for some octets
	    add_to_storage_count(diff)
	    storage_move(storage_slice_start, storage_slice_start + diff, 
			 octets_to_be_moved)
            invalidate_optimized_access

	 elseif diff < 0 then
	    -- remove some octets
	    storage_move(storage_slice_start-diff, storage_slice_start, 
			 octets_to_be_moved)
	    add_to_storage_count(diff)
            
            invalidate_optimized_access
	 end

	 -- now set the octets
	 utils.put_code(c, storage, storage_slice_start)
      ensure then
         valid_utf8
      end

   remove (start, c: INTEGER) is
      do
         if last_index >= start then
	    invalidate_optimized_access
         end
         
	 if c > 0 then
	    find_slice_position(start, start+c-1)
	    if storage_count - storage_slice_end > 0 then
	       storage_move(storage_slice_end+1, storage_slice_start, 
			    storage_count-storage_slice_end)
	    end
	    add_to_storage_count(-storage_slice_count)
	    set_count(count-c)
	 end
      ensure then
         valid_utf8
      end

   insert_code (code, idx: INTEGER) is
      local
	 o_size, cnt: INTEGER
         pos: INTEGER
      do
         if last_index >= idx then
            invalidate_optimized_access
         end
         
         if idx = count + 1 then
            -- append the code
            o_size := utils.octet_size(code)
            pos := storage_count
            add_to_storage_count(o_size)
            set_count(count + 1)
            utils.put_code(code, storage, pos + 1)
         else
            -- really insert
	    find_position(idx)
            cnt := storage_count - storage_slice_start + 1
            o_size := utils.octet_size(code)
            add_to_storage_count(o_size)
            storage_move(storage_slice_start, 
			 storage_slice_start + o_size, cnt)
            set_count(count + 1)
            utils.put_code(code, storage, storage_slice_start)
         end
      ensure then
         -- valid_utf8
      end
   
   insert (idx: INTEGER; other: UC_REPRESENTATION; ostart, ocount: INTEGER) is
      local
         i: INTEGER
         octets_required: INTEGER
         code,pos: INTEGER
	 cnt: INTEGER
      do
         if last_index >= idx then
            invalidate_optimized_access
         end
         
         if ocount > 0 then
            if idx = count + 1 then
               -- we append, no precalculation required
               from
                  i := 1
               until
                  i > ocount
               loop
                  insert_code(other.item_code(ostart+i-1), idx+i-1)
                  i := i + 1
               end
            
            else
               -- find out how many octets are required.
               from
                  i := 1
               until
                  i > ocount
               loop
                  code := other.item_code(ostart+i-1)
                  octets_required := octets_required 
		     + utils.octet_size(code)
                  i := i + 1
               end
               
	       find_position(idx)
               cnt := storage_count - storage_slice_start + 1
               -- make place
               add_to_storage_count(octets_required)
               storage_move(storage_slice_start, 
                            storage_slice_start+octets_required,cnt)
               -- insert contents
               from
                  i := 1
                  pos := storage_slice_start
               until
                  i > ocount
               loop
                  code := other.item_code(ostart+i-1)
                  utils.put_code(code, storage, pos)
                  
                  pos := pos + utils.octet_size(code)
                  i := i + 1
               end
               
               -- adjust size
               set_count(count + ocount)
            end
         end
      ensure then
         valid_utf8
      end

feature {NONE} -- managing storage

   storage: STRING
	 -- string's storage

   storage_move (src_offset, target_offset, ct: INTEGER) is
	 -- move `ct' characters from `src_offset' to `target_offset'
      require
	 valid_storage_index(src_offset);
	 valid_storage_index(src_offset+ct-1);
	 valid_storage_index(target_offset);
	 valid_storage_index(target_offset+ct-1);
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

   valid_storage_index (i: INTEGER): BOOLEAN is
         -- is `i' a valid index into `storage'?
      do
	 Result := (1 <= i) and then (i <= storage_count)
      end

   storage_count: INTEGER
         -- last used position in `storage'.

   add_to_storage_count (o: INTEGER) is
	 -- shrink or enlarge storage by `o' octets.
      do
	 if o > 0 then
	    if storage_count + o > storage.count then
	       storage.resize(storage_count + o)
	    end
	 end
	 storage_count := storage_count + o
      ensure
         storage_count = (old storage_count) + o;
         non_negative_size: storage_count >= 0;
      end

feature {NONE} -- mapping to storage indices

   optimize_access: BOOLEAN is
	 -- is faster access for iterative access enabled?
      once
	 Result := true
      end

   last_index: INTEGER
         -- last position of access with `item_code'. will be `0` if 
         -- the position is dirty
   
   last_storage_slice_start: INTEGER
         -- corresponding position in `storage'

   invalidate_optimized_access is
         -- mark optimizing information as invalid.
      do
	 last_index := 0
      end

   find_position (idx: INTEGER) is
	 -- map index `idx' to position in `storage'. make result 
	 -- available in `storage_slice_start'.
      require
	 valid_index(idx);
      local
	 i: INTEGER
	 pos: INTEGER
	 f_octets: INTEGER
	 opt_success: BOOLEAN
      do
	 if optimize_access and then last_index /= 0 then
            if last_index = idx - 1 then
               -- we want to access the next item
	       f_octets := utils.nr_of_following_octets(storage.item(last_storage_slice_start))
               pos := last_storage_slice_start + f_octets + 1
	       opt_success := true
	       
            elseif last_index = idx + 1 then
               -- we want to access the previous item
	       from
		  pos := last_storage_slice_start - 1
	       until
		  utils.is_leading_octet(storage.item(pos))
	       loop
		  pos := pos - 1
	       end

	       opt_success := true
            end
	 end

	 if not opt_success then
	    from
	       i := 1
	       pos := 1
	    until
	       i >= idx
	    loop
	       pos := pos + utils.nr_of_following_octets(storage.item(pos)) + 1
	       i := i + 1
	    end
	 end

	 last_index := idx
	 storage_slice_start := pos
	 last_storage_slice_start := pos
      end

   find_slice_position (start, p_end: INTEGER) is
	 -- map string indices to storage indices. the slice to be
	 -- mapped starts at `start' and ends at `p_end'. the resulting
	 -- storage indices are stored in `storage_slice_start' and
	 -- `storage_slice_end'.
      require
	 valid_index(start);
	 valid_index(p_end);
	 start <= p_end;
      local
	 i: INTEGER
	 pos: INTEGER
      do
	 find_position(start)
	 -- find last position
	 from
	    i := start
	    pos := storage_slice_start
	 until
	    i > p_end
	 loop
	    pos := pos + utils.nr_of_following_octets(storage.item(pos)) 
	       + 1
	    i := i + 1
	 end

	 storage_slice_end := pos - 1
      end

   storage_slice_start: INTEGER
	 -- storage index start. set by `map_to_storage_position'

   storage_slice_end: INTEGER
	 -- storage index end. set by `map_to_storage_position'

   storage_slice_count: INTEGER is
	 -- number of storage octets in mapped storage slice
      require
	 valid_storage_index(storage_slice_start);
	 valid_storage_index(storage_slice_end);
	 storage_slice_start <= storage_slice_end;
      do
	 Result := storage_slice_end - storage_slice_start + 1
      ensure
	 positive: Result > 0;
      end

feature {NONE}
   
   set_count (i: INTEGER) is
         -- set `count' to `i'
      require
         non_negative: i >= 0
      do
         count := i
      ensure
         count = i
      end

feature -- UTF8 Validation

   valid_utf8: BOOLEAN is
	 -- is the utf8-representation an valid one?
      do
	 if storage_count > 0 then
	    Result := utils.valid_utf8(storage, 1, storage_count)
	 else
	    Result := true
	 end
      end

feature {NONE}

   utils: UC_UTF8_UTILS is
         -- utf8 utilities
      once
	 !!Result
      end

end
