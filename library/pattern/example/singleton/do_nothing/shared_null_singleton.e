note

	description:

		"Shared singleton which does nothing"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SHARED_NULL_SINGLETON

feature -- Access

	singleton: NULL_SINGLETON
			-- Singleton object
		do
			Result := singleton_cell.item
			if Result = Void then
				create Result.make
			end
		ensure
			singleton_created: singleton_created
			singleton_not_void: Result /= Void
		end

feature -- Status report

	singleton_created: BOOLEAN
			-- Has singleton already been created?
		do
			Result := singleton_cell.item /= Void
		end

feature {NONE} -- Implementation

	singleton_cell: DS_CELL [NULL_SINGLETON]
			-- Cell containing the singleton if already created
		once
			create Result.make (Void)
		ensure
			cell_not_void: Result /= Void
		end

end
