class AA

create

	make

feature

	make
		local
			c: ANY
		do
			if attached a as b then
				c := b
			end
		end

end
