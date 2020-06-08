class AA

create

	make

feature

	make
		do
			print (f)
		end

	f: INTEGER
		attribute
			print ("Self-initialization of f%N")
			Result := 2
		end

end
