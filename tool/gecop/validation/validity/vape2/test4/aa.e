class AA

create

	make

feature

	make
		do
			f
		end

feature {ANY}

	f
		require
			(agent: BOOLEAN
				local
					b: BB
				do
					create b.make
					Result := True
				end).item ([])
		do
			print ("Failed")
		end

end
