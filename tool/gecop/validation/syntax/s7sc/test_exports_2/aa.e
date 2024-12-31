class AA

inherit

	BB
		export
			{ANY} f
			{ANY} g
		end

create

	make

feature

	make
		do
			f
			g
			h
		end

end
