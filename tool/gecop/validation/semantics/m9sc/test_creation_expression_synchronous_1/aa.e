class AA

create

	make

feature

	make
		do
			f
		end

	f
		local
			b: separate BB
		do
			print ("A: before creation of b%N")
			b := create {separate BB}.make (Current)
			print ("A: after creation of b%N")
			if b /= Void then
				print ("A: checking that b is not Void%N")
			end
		end

end
