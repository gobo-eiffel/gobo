class EXECUTION_ENVIRONMENT

feature

	system (s: STRING) is
		do
			return_code := c_system (s.area.base_address)
		end

	return_code: INTEGER

	get (s: STRING): STRING is
		do
			Result := ""
			Result := c_getenv (s.area.base_address)
		end

	current_working_directory: STRING is
		do
			Result := ""
			Result := c_getcwd
		end

feature

	c_system (p: POINTER): INTEGER is
		external
			"C inline"
		alias
			"R = system((char*)$p);"
		end

	c_getenv (p: POINTER): STRING is
		external
			"C inline"
		alias
			"char* s = getenv((char*)$p); if (s != (char *)0) R = gems(s,strlen(s));"
		end

	c_getcwd: STRING is
		external
			"C inline"
		alias
			"char* s = malloc(1024); getcwd(s, 1024); R = gems(s,strlen(s)); free(s);"
		end

end
