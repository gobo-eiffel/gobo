class CC1

inherit

	CC
		rename
			f as f1
		redefine
			f1
		end

feature

	f1
		do
			print ("CC1%N")
		end

end -- class CC1
