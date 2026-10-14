once class BB

create

	make

feature

	make
		once ("THREAD")
			attr := "gobo"
			print ("BB.make%N")
		end

	attr: detachable STRING

end
