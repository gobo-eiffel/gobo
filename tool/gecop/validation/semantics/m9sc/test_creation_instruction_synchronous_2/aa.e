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
			s: STRING
			b: separate BB
		do
			create s.make (0)
			print ("A: before creation of b%N")
			create b.make (s)
			print ("A: after creation of b%N")
			if b /= Void then
				print ("A: checking that b is not Void%N")
			end
		end

end
