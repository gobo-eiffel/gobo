class AA

create

	make

feature

	make is
		local
			bb: BB
			s: ?STRING
			b: BOOLEAN
		do
			create bb
			b := bb and then {l: STRING} s and then l.is_empty
		end

end
