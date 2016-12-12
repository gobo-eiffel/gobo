class BB

inherit

	CC
		redefine
			f
		end

feature

	f
		do
			print ("BB%N")
		end

end -- class BB
