note

	description:

		"Eiffel class names in precursor calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"

deferred class ET_PRECURSOR_CLASS_NAME

inherit

	ET_AST_NODE

feature -- Access

	class_name: ET_CLASS_NAME
			-- Class name
		deferred
		ensure
			class_name_not_void: Result /= Void
		end

end
