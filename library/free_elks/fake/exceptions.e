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

	raise_retrieval_exception (s: STRING) is
		do
			print ("EXCEPTIONS.raise_retrieval_exception called%N")
		end

end
