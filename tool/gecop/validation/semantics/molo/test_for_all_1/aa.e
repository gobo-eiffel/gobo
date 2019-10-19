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
			l_result := ∀ c: b ¦ c.value > 0
			print (l_result)
			print ("%N")
				-- Unfolded form:
			create b.make (2)
			from
				ic := b.new_cursor
				l_result := True
			until
				ic.after or not l_result
			loop
				l_result := ic.item.value > 0
				ic.forth
			end
			print (l_result)
			print ("%N")
		end

end
