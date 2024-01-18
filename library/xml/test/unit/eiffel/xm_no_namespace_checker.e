note

	description:

		"Test no namespace parsing event tester"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"

class XM_NO_NAMESPACE_CHECKER

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
			on_start,
			on_start_tag,
			on_attribute
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_null,
	make_next

feature {NONE} -- Initialization

	initialize
			-- Initialize current callbacks.
		do
			create actual.make
		end

feature -- Document

	on_start
			-- Initialize.
		do
			initialize
			next.on_start
		end

	on_start_tag (a_ns, a_pre: detachable STRING; a_local: STRING)
			-- Start of start tag.
			-- Warning: strings may be polymorphic, see XM_STRING_MODE.
		do
			actual.force_last (a_local)
			next.on_start_tag (a_ns, a_pre, a_local)
		end

	on_attribute (a_ns, a_pre: detachable STRING; a_local: STRING; a_value: STRING)
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

	set (a: like expected)
			-- Set expected URI list.
		do
			expected := a

		ensure
			expected_set: expected = a
		end

	expected: detachable ARRAY [STRING]
			-- Array of expected URIs

feature -- Status

	has_failed: BOOLEAN
			-- Is there a failed index?
		local
			i: INTEGER
			it: DS_LINEAR_CURSOR [STRING]
		do
			if not attached expected as l_expected or else actual.count /= l_expected.count then
				Result := True
			else
				from
					i := l_expected.lower
					it := actual.new_cursor
					it.start
				until
					i > l_expected.upper
				loop
					if not Result then
						Result := not STRING_.same_string (it.item, l_expected.item (i))
					end
					it.forth
					i := i + 1
				end
			end
		end

invariant

	actual_not_void: actual /= Void
	no_void_actual: not actual.has_void

end
