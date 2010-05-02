class CC1

inherit

	CC
		redefine
			f
		end

feature

	f
		do
			print ("CC1%N")
		end

end -- class CC1
