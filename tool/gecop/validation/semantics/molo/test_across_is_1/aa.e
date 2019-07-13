class AA

create

	make

feature

	make
		local
			b: BB
			ic: ITERATION_CURSOR [CC]
		do
			create b.make (2)
			across b is c loop
				print (c.value)
				print ("%N")
				print (c.value = c.value)
				print ("%N")
				print (c /= c)
				print ("%N")
			end
				-- Unfolded form:
			create b.make (2)
			from
				ic := b.new_cursor
			until
				ic.after
			loop
				print (ic.item.value)
				print ("%N")
				print (ic.item.value = ic.item.value)
				print ("%N")
				print (ic.item /= ic.item)
				print ("%N")
				ic.forth
			end
		end

end
