class BB

inherit

	CC [BIT name]

feature -- Access

	name: INTEGER is 32

	f is
		local
			b32: BIT name
		do
			item := b32
		end

end -- class BB
