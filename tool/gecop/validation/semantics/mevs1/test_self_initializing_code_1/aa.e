class AA

create

	make

feature

	make
		do
			f := "bar"
			print (f)
		end

	f: STRING
		attribute
			print ("Self-initialization of f%N")
			Result := "foo"
		end

end
