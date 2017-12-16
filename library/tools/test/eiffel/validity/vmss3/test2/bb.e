class BB

inherit

	CC

	DD
		rename
			f as g,
			g as f
		select
			f
		end

end -- class BB
