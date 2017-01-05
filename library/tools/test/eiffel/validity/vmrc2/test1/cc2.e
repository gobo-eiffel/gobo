class CC2

inherit

	CC
		rename
			f as f2
		redefine
			f2
		end

feature

	f2
		do
			print ("CC2%N")
		end

end -- class CC2
