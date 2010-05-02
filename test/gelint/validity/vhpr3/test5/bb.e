class BB

inherit

	CC [BIT name]

feature -- Access

	name: INTEGER = 32

	f
		local
			b32: BIT name
		do
			item := b32
		end

end -- class BB
