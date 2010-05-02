note

	description:

		"Shared singleton1"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SHARED_SINGLETON1

feature -- Access

	singleton1: SINGLETON1
			-- Singleton object
		do
			Result := singleton1_cell.item
			if Result = Void then
				create Result.make
			end
		ensure
			singleton1_created: singleton1_created
			singleton1_not_void: Result /= Void
		end

feature -- Status report

	singleton1_created: BOOLEAN
			-- Has singleton already been created?
		do
			Result := singleton1_cell.item /= Void
		end

feature {NONE} -- Implementation

	singleton1_cell: DS_CELL [SINGLETON1]
			-- Cell containing the singleton if already created
		once
			create Result.make (Void)
		ensure
			cell_not_void: Result /= Void
		end

end
