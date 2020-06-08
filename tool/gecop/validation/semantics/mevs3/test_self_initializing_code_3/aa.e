class AA

create

	make

feature

	make
		do
			print (f)
		end

	f: STRING
		attribute
			print ("Self-initialization of f%N")
			if counter > 0 then
				Result := "foo"
			else
				Result := "bar"
				counter := counter + 1
				print (f)
			end
		end

	counter: INTEGER
	
end
