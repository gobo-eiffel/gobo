class AA

create

	make

feature

	make
		local
			b: BB
		do
			if b /= Void then
				print (b.generator)
			end
		end

end -- class AA
