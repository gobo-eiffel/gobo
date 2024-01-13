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
			s1: STRING
			s2: separate STRING
			b: separate BB
		do
			create s1.make (0)
			s2 := s1
			print ("A: before creation of b%N")
			create b.make (s2)
			print ("A: after creation of b%N")
			if b /= Void then
				print ("A: checking that b is not Void%N")
			end
		end

end
