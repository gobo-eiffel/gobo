class AA

create

	make

feature

	make
		local
			b: detachable ANY
		do
			b := agent : attached STRING
				local
					a: detachable ANY
				do
					a := "gobo"
				rescue
					Result := "eiffel"
				end
		end

end
