class BB

inherit

	CC
		redefine
			h
		end

feature

	h is
		do
			print ("h%N")
		end

end -- class BB
