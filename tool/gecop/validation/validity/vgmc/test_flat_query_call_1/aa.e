class AA

create

	make

feature

	make
		local
			x: XX [EE]
			e: EE
		do
			create x
			create e
			x.f (e)
		end

end
