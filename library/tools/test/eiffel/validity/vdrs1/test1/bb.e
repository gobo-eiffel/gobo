class BB

inherit

	CC
		redefine
			h
		end

feature

	h
		do
			print ("h%N")
		end

end -- class BB
