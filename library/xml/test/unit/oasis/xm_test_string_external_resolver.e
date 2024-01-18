note

	description:

		"External resolver testing that resolve/resolve_finish are balanced"

	library: "Gobo Eiffel XML Library test"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class XM_TEST_STRING_EXTERNAL_RESOLVER

inherit

	XM_STRING_EXTERNAL_RESOLVER
		redefine
			resolve,
			resolve_finish
		end

create

	make

feature -- Operations

	initialize
			-- Reset depth.
		do
			depth := 0
		end

	resolve (a_string: STRING)
			-- Increement depth..
		do
			Precursor (a_string)
			if not has_error then
				depth := depth + 1
			end
		ensure then
			depth_increased: not has_error implies depth = old depth + 1
		end

	resolve_finish
			-- Decrement depth..
		do
			Precursor
			depth := depth - 1
		ensure then
			depth_decreased: depth = old depth - 1
		end

feature -- Access

	depth: INTEGER
			-- Current depth of resolved entities

end
