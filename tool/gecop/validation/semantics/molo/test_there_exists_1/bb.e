class BB

inherit

	ITERABLE [CC]
	ITERATION_CURSOR [CC]

create

	make

feature

	make (i: INTEGER)
		do
			p := 1
			max := i
		end

	new_cursor: ITERATION_CURSOR [CC]
		do
			Result := Current
		end

	after: BOOLEAN
		do
			Result := p > max
		end

	forth
		do
			p := p + 1
		end

	item: CC
		do
			create Result.make (p)
		end

	p: INTEGER

	max: INTEGER

end
