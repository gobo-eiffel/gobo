class AA

create

	make

feature

	make
		local
			t: TUPLE [
				a: INTEGER;
				b: INTEGER
				c: INTEGER
			]
		do
			t := [1, 2, 3]
			print ("Passed")
		end

end
