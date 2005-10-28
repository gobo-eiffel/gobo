class PLAIN_TEXT_FILE

create

	make

feature

	make (a_name: STRING) is
		do
			name := a_name
			buffer_count := 0
		end

	name: STRING

	exists: BOOLEAN is
		do
			Result := is_readable
		end

	is_readable: BOOLEAN is
		local
			f: PLAIN_TEXT_FILE
		do
			create f.make (name)
			f.open_read
			if f.is_open_read then
				Result := True
				f.close
			end
		end

	open_read is
		local
			p: POINTER
		do
			file_pointer := c_fopen_read (name.area.base_address)
			if file_pointer /= p then
				is_open_read := True
				if buffer = Void then
					buffer := "#"
				end
			end
		end

	is_open_read: BOOLEAN

	is_closed: BOOLEAN is
		do
			Result := not is_open_write and not is_open_read
		end

	close is
		do
			if buffer_count > 0 then
				c_fwrite(buffer.area.base_address, buffer_count, file_pointer)
				buffer_count := 0
			end
			c_fclose (file_pointer)
			is_open_write := False
			is_open_read := False
		end

	end_of_file: BOOLEAN is
		do
			Result := c_feof (file_pointer)
		end

	read_character is
		local
			s: STRING
			i: INTEGER
		do
			s := buffer
			i := read_to_string (s, 1, 1)
			last_character := s.item (1)
		end

	last_character: CHARACTER

	date: INTEGER is
		do
			Result := -1
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER is
		do
			Result := c_fread (a_string.area.base_address, pos, nb, file_pointer)
		end

	count: INTEGER is
		do
print ("TODO PLAIN_TEXT_FILE.count%N")
		end

	open_write is
		local
			p: POINTER
		do
			file_pointer := c_fopen_write (name.area.base_address)
			if file_pointer /= p then
				is_open_write := True
				if buffer = Void then
					create buffer.make (4000)
					buffer.set_count (4000)
				end
			end
		end

	is_open_write: BOOLEAN

	put_character (c: CHARACTER) is
		local
			i, nb: INTEGER
		do
			nb := buffer_count
			if nb < 4000 then
				i := nb + 1
				buffer.put (c, i)
				buffer_count := i
			else
				c_fwrite(buffer.area.base_address, nb, file_pointer)
				buffer.put (c, 1)
				buffer_count := 1
			end
		end

	put_string (s: STRING) is
		local
			i, nb, j: INTEGER
		do
			nb := s.count
			j := buffer_count
			if j + nb <= 4000 then
				from i := 1 until i > nb loop
					j := j + 1
					buffer.put (s.item (i), j)
					i := i + 1
				end
				buffer_count := j
			else
				if j > 0 then
					c_fwrite(buffer.area.base_address, j, file_pointer)
					buffer_count := 0
				end
				c_fwrite(s.area.base_address, nb, file_pointer)
			end
		end

	file_pointer: POINTER

	c_fwrite (b: POINTER; n: INTEGER; f: POINTER) is
		external
			"C inline"
		alias
			"fwrite((void *)($b), (size_t)(1), (size_t)($n),(FILE*)($f));"
		end

	c_fread (b: POINTER; pos, n: INTEGER; f: POINTER): INTEGER is
		external
			"C inline"
		alias
			"R = fread((void *)(((char *)($b))+($pos-1)), (size_t)(1), (size_t)($n), (FILE*)($f));"
		end

	c_feof (f: POINTER): BOOLEAN is
		external
			"C inline"
		alias
			"R = feof((FILE*)($f));"
		end

	c_fclose (f: POINTER) is
		external
			"C inline"
		alias
			"fclose((FILE*)($f));"
		end

	c_fopen_read (n: POINTER): POINTER is
		external
			"C inline"
		alias
			"R = fopen((char *)($n), %"r%");"
		end

	c_fopen_write (n: POINTER): POINTER is
		external
			"C inline"
		alias
			"R = fopen((char *)($n), %"w%");"
		end

	buffer: STRING

	buffer_count: INTEGER

feature -- Not used

	is_open_append: BOOLEAN is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	open_append is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	put_integer (i: INTEGER) is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	put_boolean (b: BOOLEAN) is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	put_new_line is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	read_stream (nb: INTEGER) is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	read_line is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	change_name (a_new_name: STRING) is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	flush is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	delete is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	reset is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	append (other: like Current) is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	extendible: BOOLEAN is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	file_readable: BOOLEAN is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	last_string: STRING is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	is_plain: BOOLEAN is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

	inode: INTEGER is
		do
print ("TODO PLAIN_TEXT_FILE")
		end

end
