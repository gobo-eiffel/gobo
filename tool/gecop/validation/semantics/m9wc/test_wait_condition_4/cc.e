class CC

create

	make

feature

	make (a: separate BB)
		do
			b := a
		end

	b: separate BB

	f
		do
			{EXECUTION_ENVIRONMENT}.sleep (500_000_000)
			separate b as bb do
				bb.set_value (10)
			end
		end

end