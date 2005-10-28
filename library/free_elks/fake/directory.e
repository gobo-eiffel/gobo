class DIRECTORY

create

	make

feature

	is_closed: BOOLEAN

	make (a_name: STRING) is
		do
			name := a_name
			is_closed := True
		end

	name: STRING

	exists: BOOLEAN is
		do
			Result := is_readable
		end

	is_readable: BOOLEAN is
		local
			d: DIRECTORY
		do
			create d.make (name)
			d.open_read
			if not d.is_closed then
				Result := True
				d.close
			end
		end

	open_read is
		local
			p: POINTER
		do
			file_pointer := c_opendir (name.area.base_address)
			if file_pointer /= p then
				is_closed := False
			end
		end

	readentry is
		local
			p: POINTER
			null: POINTER
		do
			lastentry := ""
			p := c_readdir (file_pointer)
			if p /= null then
				lastentry := c_entryname (p)
			else
				lastentry := Void
			end
		end

	lastentry: STRING

	file_pointer: POINTER

	close is
		local
			p: POINTER
		do
			c_closedir (file_pointer)
			file_pointer := p
			is_closed := True
		end

	c_opendir (n: POINTER): POINTER is
		external
			"C inline"
		alias
			"R = ge_directory_open_read((char *)($n));"
		end

	c_closedir (p: POINTER) is
		external
			"C inline"
		alias
			"ge_directory_close(($p));"
		end

	c_readdir (p: POINTER): POINTER is
		external
			"C inline"
		alias
			"R = ge_directory_read_entry($p);"
		end

	c_entryname (p: POINTER): STRING is
		external
			"C inline"
		alias
			"char* s = ge_directory_last_entry($p); R = gems(s,strlen(s));"
		end

feature -- Not used

	recursive_delete is
		do
print ("TODO DIRECTORY")
		end

	delete is
		do
print ("TODO DIRECTORY")
		end


end
