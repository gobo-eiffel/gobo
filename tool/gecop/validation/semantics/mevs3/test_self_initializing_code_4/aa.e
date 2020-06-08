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
			Result := "bar"
			f := "foo"
			print (f)
		end
	
end
