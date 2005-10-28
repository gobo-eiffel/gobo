class ARGUMENTS

feature

	argument (i: INTEGER): STRING is
		do
			Result := ""
			Result := c_argv (i)
		end

	argument_count: INTEGER is
		external
			"C inline"
		alias
			"R = geargc - 1;"
		end

	c_argv (i: INTEGER): STRING is
		external
			"C inline"
		alias
			"char* s = geargv[$i]; R = gems(s, strlen(s));"
		end

end
