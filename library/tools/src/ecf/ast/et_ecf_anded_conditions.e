note

	description:

		"ECF condition lists where conditions will be and-ed when calling `is_enabled'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ANDED_CONDITIONS

inherit

	ET_ECF_CONDITIONS
		redefine
			condition
		end

create

	make,
	make_empty

feature -- Status report

	is_ored: BOOLEAN = False
			-- Should the conditions be or-ed when calling `is_enabled'?

feature -- Access

	condition (i: INTEGER): ET_ECF_CONDITION_ITEM
			-- `i'-th condition
		do
			Result := conditions.item (i)
		end

invariant

	is_anded: not is_ored

end
