class DD

create

	make
	
convert

	to_b: {BB}
	
feature

	make (i: INTEGER)
		do
			create {CC} to_b
			to_b.set_value (i)
		end
		
	to_b: BB
	
end
