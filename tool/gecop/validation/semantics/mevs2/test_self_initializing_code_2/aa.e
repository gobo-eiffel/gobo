class AA

create

	make

feature

	make
		local
			a: detachable ANY
		do
			a := f
			if a = Void then
				print ("Void")
			else
				print (a)
			end
		end

	f: detachable STRING
		attribute
			print ("Self-initialization of f%N")
			Result := "foo"
		end

end
