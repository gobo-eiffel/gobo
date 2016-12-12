class CC

inherit

	ITERATION_CURSOR [STRING]

feature -- Access

	item: STRING
		do
			Result := "gobo"
		end

feature -- Status report	

	after: BOOLEAN
		do
			Result := True
		end

feature -- Cursor movement

	forth
		do
		end
		
end