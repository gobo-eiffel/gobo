class AA

create

	make

feature

	make
		do
			f
			print ("Failed")
		end

	f
		do
			print ("In f%N")
		ensure
			post_1: g
			post_2: old h
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
