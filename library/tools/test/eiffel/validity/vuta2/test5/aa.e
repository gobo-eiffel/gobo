class AA

create

	make

feature

	make
		local
			bb: BB
			s: detachable STRING
		do
			create bb
			s := bb.f
		end

end
