class AA

create

	make

feature

	make is
		local
			b: BB
		do
			if b /= Void then
				print (b.generator)
			end
		end

end -- class AA
