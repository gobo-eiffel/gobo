class AA

create

	make

feature

	make
		local
			b: BB
			ic: ITERATION_CURSOR [CC]
			l_result: BOOLEAN
		do
			create b.make (2)
			l_result := ∃ c: b ¦ c.value = 1
			print (l_result)
			print ("%N")
				-- Unfolded form:
			create b.make (2)
			from
				ic := b.new_cursor
				l_result := False
			until
				ic.after or l_result
			loop
				l_result := ic.item.value = 1
				ic.forth
			end
			print (l_result)
			print ("%N")
		end

end
