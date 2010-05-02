class AA

create

	make

feature

	make
		local
			b: BB
		do
			if b /= Void then
				b.f
			end
		end

end -- class AA
