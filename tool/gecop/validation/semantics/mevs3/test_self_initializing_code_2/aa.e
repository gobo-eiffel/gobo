class AA

create

	make

feature

	make
		do
			print (f)
			print (f)
		end

	f: STRING
		attribute
			print ("Self-initialization of f%N")
			Result := "foo"
		end

end
