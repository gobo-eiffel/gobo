note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_13

create

	make

feature -- Initialization

	make (a2: separate SB_DATA_12)
		do
			attr1 := "gobo"
			attr2 := a2
		end

feature -- Basic operation

	run
		local
			l_done: BOOLEAN
			nb: INTEGER
		do
			from until l_done loop
				separate attr2 as l_attr2 do
					l_done := l_attr2.stopped
				end
				nb := nb + 1
				if nb > 2000 then
					l_done := True
				elseif not l_done then
						-- 1 millisecond.
					{EXECUTION_ENVIRONMENT}.sleep (1_000_000)
				end
			end
		end

feature -- Access

	attr1: STRING

	attr2: separate SB_DATA_12

end
