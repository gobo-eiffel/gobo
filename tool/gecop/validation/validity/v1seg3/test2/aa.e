class AA

create

	make

feature

	make
		do
			separate f as x do
				print ("Failed")
			end
		end
			
	f: INTEGER_32
		do
			Result := 1
		end

end
