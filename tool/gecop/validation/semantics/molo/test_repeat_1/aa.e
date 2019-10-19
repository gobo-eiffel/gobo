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
			⟳ c: b ¦ print (c.value.out + "%N") ⟲
				-- Unfolded form:
			create b.make (2)
			from
				ic := b.new_cursor
			until
				ic.after
			loop
				print (ic.item.value.out + "%N")
				ic.forth
			end
		end

end
