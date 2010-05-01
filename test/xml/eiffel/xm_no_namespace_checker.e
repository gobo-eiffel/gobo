note

	description:

		"Test no namespace parsing event tester"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_NO_NAMESPACE_CHECKER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_start_tag,
			on_attribute
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_null, set_next

feature -- Document

	on_start is
			-- Initialize.
		do
			create actual.make
			next.on_start
		end

	on_start_tag (a_ns, a_pre, a_local: STRING) is
			-- Start of start tag.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		do
			actual.force_last (a_local)
			next.on_start_tag (a_ns, a_pre, a_local)
		end

	on_attribute (a_ns, a_pre, a_local: STRING; a_value: STRING) is
			-- Start of attribute.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		do
			actual.force_last (a_local)
			next.on_attribute (a_ns, a_pre, a_local, a_value)
		end

feature {NONE} -- Implemenation

	actual: DS_LINKED_LIST [STRING]
			-- Array of actual URIs

feature -- Element change

	set (a: like expected) is
			-- Set expected URI list.
		do
			expected := a
		end

	expected: ARRAY [STRING]
			-- Array of expected URIs

feature -- Status

	has_failed: BOOLEAN is
			-- Is there a failed index?
		local
			i: INTEGER
			it: DS_LINEAR_CURSOR[STRING]
		do
			Result := (expected = Void or actual = Void) or else actual.count /= expected.count
			if not Result then
				from
					i := expected.lower
					it := actual.new_cursor
					it.start
				until
					i > expected.upper
				loop
					if not Result then
						Result := not STRING_.same_string (it.item, expected.item (i))
					end
					it.forth
					i := i + 1
				end
			end
		end

end
