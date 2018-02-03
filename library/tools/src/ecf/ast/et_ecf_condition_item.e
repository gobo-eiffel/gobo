note

	description:

		"ECF individual conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_CONDITION_ITEM

inherit

	ET_ECF_CONDITION

feature -- Status report

	is_capability_aware (a_capability_name: STRING): BOOLEAN
			-- Can this individual condition have an influence on capability `a_capability_name'?
		require
			a_capability_name_not_void: a_capability_name /= Void
		do
			-- Result := False
		end

end
