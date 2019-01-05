class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			f (b)
		end

feature {ANY}

	f (b1: BB)
		require
			(agent (b: BB): BOOLEAN
				local
					c: BB
				do
						-- Unfolded form of 'across b as c all True end'.
					from
						c := b.new_cursor
						Result := True
					until
						c.after or not Result
					loop
						Result := True
						c.forth
					end
				end).item ([b1])
		do
			print ("Failed")
		end
		
end
