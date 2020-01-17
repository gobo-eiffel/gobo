class AA

create

	make

feature

	make
		local
			i: INTEGER
			a: AA
		do
			a := Current
			i := a (3)
			print ("Failed")
		end

	f alias "()" alias "()" (i: INTEGER): INTEGER
		do
			Result := i
		end

end
