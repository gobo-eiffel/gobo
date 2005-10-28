class EXCEPTIONS

feature

	die (a_code: INTEGER) is
		external
			"C inline"
		alias
			"exit($a_code);"
		end

	raise (a_string: STRING) is
		do
			print ("EXCEPTIONS.raise called%N")
		end

end
