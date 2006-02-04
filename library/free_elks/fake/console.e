class CONSOLE

inherit

	STRING_HANDLER

feature

	make_open_stdout (a_name: STRING) is
		do
			name := a_name
			file_pointer := c_stdout
		end

	make_open_stdin (a_name: STRING) is
		do
			name := a_name
			file_pointer := c_stdin
		end

	make_open_stderr (a_name: STRING) is
		do
			name := a_name
			file_pointer := c_stderr
		end

	name: STRING

	put_character (c: CHARACTER) is
		local
			s: STRING
		do
			s := "#"
			s.put (c, 1)
			put_string (s)
		end

	put_string (s: STRING) is
		do
			c_fwrite(s.area.base_address, s.count, file_pointer)
		end

	end_of_file: BOOLEAN is
		do
			Result := False
		end

	read_character is
		local
			s: STRING
			i: INTEGER
		do
			s := "#"
			i := read_to_string (s, 1, 1)
			last_character := s.item (1)
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER is
		do
			Result := c_fread (a_string.area.base_address, pos, nb, file_pointer)
		end

	last_character: CHARACTER

	file_pointer: POINTER

	c_stdout: POINTER is
		external
			"C inline"
		alias
			"R = stdout;"
		end

	c_stderr: POINTER is
		external
			"C inline"
		alias
			"R = stderr;"
		end

	c_stdin: POINTER is
		external
			"C inline"
		alias
			"R = stdin;"
		end

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

feature -- Not used

	exists: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	count: INTEGER is
		do
print ("TODO CONSOLE")
		end

	make (a_name: STRING) is
		do
print ("TODO CONSOLE")
		end

	is_readable: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	is_open_read: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	is_open_write: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	is_closed: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	open_read is
		do
print ("TODO CONSOLE")
		end

	open_write is
		do
print ("TODO CONSOLE")
		end

	open_append is
		do
print ("TODO CONSOLE")
		end

	put_integer (i: INTEGER) is
		do
print ("TODO CONSOLE")
		end

	put_boolean (b: BOOLEAN) is
		do
print ("TODO CONSOLE")
		end

	put_new_line is
		do
print ("TODO CONSOLE")
		end

	read_stream (nb: INTEGER) is
		do
print ("TODO CONSOLE")
		end

	read_line is
		do
print ("TODO CONSOLE")
		end

	change_name (a_new_name: STRING) is
		do
print ("TODO CONSOLE")
		end

	flush is
		do
print ("TODO CONSOLE")
		end

	close is
		do
print ("TODO CONSOLE")
		end

	delete is
		do
print ("TODO CONSOLE")
		end

	reset is
		do
print ("TODO CONSOLE")
		end

	append (other: like Current) is
		do
print ("TODO CONSOLE")
		end

	extendible: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	file_readable: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

	last_string: STRING is
		do
print ("TODO CONSOLE")
		end

	date: INTEGER is
		do
print ("TODO CONSOLE")
		end

	is_plain: BOOLEAN is
		do
print ("TODO CONSOLE")
		end

end
