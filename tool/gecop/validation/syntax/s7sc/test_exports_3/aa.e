class AA

inherit

	BB
		export
			{ANY} f;
			{ANY} g
			{ANY} h
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
