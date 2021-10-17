class AA

create

	make

feature

	make
		do
			print (b)
			print ("%N")
			b.copy (6)
			print (b)
			print ("%N")
		end

	b: INTEGER
		once ("PROCESS")
			Result := 5
		end

end
