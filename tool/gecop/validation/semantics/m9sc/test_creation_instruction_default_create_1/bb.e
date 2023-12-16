class BB

inherit

	ANY
		redefine
			default_create
		end

create

	default_create

feature

	default_create
		do
			{EXECUTION_ENVIRONMENT}.sleep (1_000_000_000)
			print ("End of B.default_create%N")
		end

end
