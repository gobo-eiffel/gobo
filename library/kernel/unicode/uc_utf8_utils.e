indexing

   description:
   
   "utilities for dealing with UTF8";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_UTF8_UTILS

feature

   is_leading_octet (octet: CHARACTER): BOOLEAN is
	 -- is `octet' a leading octet?
      local
	 code: INTEGER
      do
	 code := octet.code
	 -- all but 10xx.xxxx
	 Result := (0 <= code and code < 128) or else (192 <= code)
      end

   is_following_octet (octet: CHARACTER): BOOLEAN is
	 -- is `octet' a following octet?
      local
	 code: INTEGER
      do
	 code := octet.code
	 -- 10xx.xxxx
	 Result := (128 <= code) and (code < 192)
      end

   nr_of_following_octets (octet: CHARACTER): INTEGER is
	 -- number of following octets to given `octet'
      require
	 is_leading_octet: is_leading_octet(octet)
      local
	 code: INTEGER
      do
	 code := octet.code

	 if (code < 128) then
	    -- 0xxx.xxxx
	    Result := 0

	 elseif (code >= 192) then
	    if (code <= 223) then
	       -- 110x.xxxx
	       Result := 1

	    elseif (code <= 239) then
	       -- 1110.xxxx
	       Result := 2

	    elseif (code <= 247) then
	       -- 1111.0xxx
	       Result := 3

	    elseif (code <= 251) then
	       -- 1111.10xx
	       Result := 4

	    elseif (code <= 253) then
	       -- 1111.110x
	       Result := 5

	    end
	 end
      ensure
	 not_negative: Result >= 0
      end

feature

   octet_size (code: INTEGER): INTEGER is
	 -- how many octets are required for representing `code'?
      require
	 is_valid_code: valid_code(code);
      do
	 if code < 128 then
	    -- 0x0000.0000-0x0000.007f
	    Result := 1
	 elseif code < 2048 then
	    -- 0x0000.0080-0x0000.07ff
	    Result := 2
	 elseif code < 65536 then
	    -- 0x0000.0800-0x0000.ffff
	    Result := 3
	 elseif code < 2097152 then
	    -- 0x0001.0000-0x001f.ffff
	    Result := 4
	 elseif code < 67108864 then
	    -- 0x0020.0000-0x03ff.ffff
	    Result := 5
	 else
	    -- 0x0400.0000-0x7fff.ffff
	    Result := 6
	 end
      end

feature

   put_code (code: INTEGER; buffer: STRING; pos: INTEGER) is
	 -- put unicode `code' to `buffer' beginning at position 
	 -- `pos'. the resulting octets will be written to given 
	 -- position; if there is no more space left in buffer, it 
	 -- will be resized.
      require
	 valid_code(code);
	 buffer_not_void: buffer /= void;
	 non_negative_position: pos >= 0;
	 valid_buffer_index: pos > 1 implies buffer.valid_index(pos-1);
      local
	 size, c, v, i: INTEGER
      do
	 -- enlarge buffer if necessary
	 size := octet_size(code)

	 if not buffer.valid_index(pos+size-1) then
	    --! this could be better programmed ...
	    from
	       i := 1
	    until
	       i > size
	    loop
	       if not buffer.valid_index(pos+i-1) then
		  buffer.append_character(' ')
	       end
	       i := i + 1
	    end
	 end

	 -- writing following bytes
	 from
	    c := code
	 until
	    size <= 1
	 loop
	    v := (c \\ 64) + 128
	    buffer.put(code_to_character(v), pos+size-1)

	    c := c // 64
	    size := size - 1
	 end

	 -- write leading byte
	 v := c
	 inspect octet_size(code)
	 when 1 then
	    v := v + 0
	 when 2 then
	    v := v + 192
	 when 3 then
	    v := v + 224
	 when 4 then
	    v := v + 240
	 when 5 then
	    v := v + 248
	 when 6 then
	    v := v + 252
	 end

	 buffer.put(code_to_character(v), pos)
      end

   last_code: INTEGER
	 -- last code read by `read_code'

   next_pos: INTEGER
	 -- next position

   read_code (buffer: STRING; pos: INTEGER) is
	 -- read next unicode from `buffer', starting at position 
	 -- `pos'. make the result available in `last_code'. The 
	 -- position immediately following this code is stored in 
	 -- `next_pos'. 
      require
	 buffer_not_void: buffer /= void;
	 valid_buffer_index: buffer.valid_index(pos);
	 first_is_leading_octet: is_leading_octet(buffer.item(pos));
	 valid_buffer_index_of_last_octet: 
           buffer.valid_index(pos+nr_of_following_octets(buffer.item(pos)));
      local
         cnt: INTEGER
      do
         cnt := read_leading_octet(buffer, pos)
         -- get following octets
         from
         until
            cnt <= 0
         loop
            read_following_octet(buffer)
            cnt := cnt - 1
         end
      end

feature {NONE} -- Supporting read_code

   read_leading_octet (buffer: STRING; pos: INTEGER): INTEGER is
	 -- read leading octet from `buffer'. return the number of
	 -- following octets.  the contained code is stored in
	 -- `last_code'.
      require
	 buffer_not_void: buffer /= void;
	 valid_index: buffer.valid_index(pos);
	 is_leading_octet: is_leading_octet(buffer.item(pos));
      local 
	 code: INTEGER
	 xcp: EXCEPTIONS
      do
	 Result := -2
	 last_code := 0

	 code := buffer.item(pos).code

	 if (code < 128) then
	    -- 0xxx.xxxx
	    last_code := code
	    Result := 0

	 elseif (code >= 192) then
	    if (code <= 223) then
	       -- 110x.xxxx
	       last_code := code \\ 32
	       Result := 1

	    elseif (code <= 239) then
	       -- 1110.xxxx
	       last_code := code \\ 16
	       Result := 2

	    elseif (code <= 247) then
	       -- 1111.0xxx
	       last_code := code \\ 8
	       Result := 3

	    elseif (code <= 251) then
	       -- 1111.10xx
	       last_code := code \\ 4
	       Result := 4

	    elseif (code <= 253) then
	       -- 1111.110x
	       last_code := code \\ 2
	       Result := 5

	    end
	 end

	 if Result = -2 then
	    !!xcp
	    xcp.raise("Malformed UTF8 " + code.out)
	 else
	    next_pos := pos + 1
	 end
      end

   read_following_octet (buffer: STRING) is
	 -- read following octet and update `last_code'. 
      require
	 buffer_not_void: buffer /= void;
	 valid_index: buffer.valid_index(next_pos);
	 is_following_octet: is_following_octet(buffer.item(next_pos));
      local
	 xcp: EXCEPTIONS
	 code: INTEGER
      do
	 code := buffer.item(next_pos).code
	 if (code >= 128) and (code <= 191) then
	    last_code := last_code * 64 + code \\ 64
	 else
	    !!xcp
	    xcp.raise("Malformed UTF8")
	 end
	 next_pos := next_pos + 1
      end

feature

   valid_utf8 (buffer: STRING; start, cnt: INTEGER): BOOLEAN is
	 -- is the utf8-representation in `buffer', starting at `start' 
	 -- and having a length of `cnt', an valid one?
      require
	 buffer_not_void: buffer /= void;
	 valid_index: buffer.count = 0 or else buffer.valid_index(start);
	 valid_cnt: cnt >= 0;
	 valid_cnt_1: cnt > 0 implies buffer.valid_index(start+cnt-1);
      local
	 i,j: INTEGER
	 octet: CHARACTER
      do
	 from
	    Result := true
	    i := 1
	 until
	    not Result or else i > cnt
	 loop
	    octet := buffer.item(start+i-1)
	    if is_leading_octet(octet) then
	       i := i + 1

	       from
		  j := nr_of_following_octets(octet)
	       until
		  not Result or else j <= 0
	       loop
		  if i > start+cnt-1 then
		     -- out of range
		     Result := false
		  else
		     octet := buffer.item(start+i-1)
		     if is_following_octet(octet) then
			i := i + 1
		     else
			-- invalid following octet
			Result := false
		     end
		  end

		  j := j - 1
	       end
	    else
	       -- invalid leading octet
	       Result := false
	    end
	 end
      end

   valid_code (code: INTEGER): BOOLEAN is
	 -- is `code' a valid one?
      local
	 ucc: UC_CHARACTER
      do
	 Result := ucc.valid_code(code)
      end

feature {NONE} -- Compiler specific methods

   code_to_character (i: INTEGER): CHARACTER is
         -- convert code position `i' to `CHARACTER'
      do
	 Result := specific.to_character(i)
      end

   specific: KL_INTEGER_ROUTINES is
         -- specific routines are now provided by GOBO.
      once
	 !!Result
      end

end -- class UC_UTF8_UTILS


