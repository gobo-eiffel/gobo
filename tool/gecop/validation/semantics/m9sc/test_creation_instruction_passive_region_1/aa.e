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
			print ("AA: before creation of b%N")
			create <NONE> b.make
			print ("AA: after creation of b%N")
			if b /= Void then
				print ("AA: checking that b is not Void%N")
			end
		end

end
