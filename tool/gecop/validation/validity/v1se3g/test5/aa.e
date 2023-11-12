class AA

create

	make

feature

	make
		do
			separate f as x do
				print ("Passed")
			end
		end

	f: detachable separate STRING_32
		do
			Result := Void
		end

end
