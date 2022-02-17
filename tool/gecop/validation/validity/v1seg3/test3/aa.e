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
			
	f: separate INTEGER
		do
			Result := 1
		end

end
