indexing
	description: "[
		Objects representing delayed calls to a boolean function,
		with some arguments possibly still open.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	PREDICATE [BASE_TYPE, OPEN_ARGS -> TUPLE create default_create end]

inherit
	FUNCTION [BASE_TYPE, OPEN_ARGS, BOOLEAN]

end
