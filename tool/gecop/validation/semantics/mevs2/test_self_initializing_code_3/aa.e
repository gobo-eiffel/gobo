class AA

create

	make

feature

	make
		do
			print (f.value)
		end

	f: BB
		attribute
			print ("Self-initialization of f%N")
			create Result
			Result.set_value (2)
		end

end
