class AA

create

	make

feature

	make
		do
			f (0)
			print ("Passed")
		end

	f (x: INTEGER)
		do
			print ("In f%N")
		ensure
			post_1: g
			post_2: x /= 0 implies old h
		end

	g: BOOLEAN
		do
			print ("In g%N")
			Result := True
		end

	h: BOOLEAN
		local
			l_exception: DEVELOPER_EXCEPTION
		do
			print ("In h%N")
			create l_exception
			l_exception.set_description ("h")
			l_exception.raise
			Result := True
		end

end
