once class BB

create

	make

feature

	make
		once ("PROCESS")
			attr := "gobo"
			print ("BB.make%N")
		end

	attr: detachable STRING

end
