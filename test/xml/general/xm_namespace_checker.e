note

	description:

		"Test namespace resolution, event tester"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_CHECKER

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

feature -- Element change

	set (a: like expected)
			-- Set expected URI list.
		do
			expected := a
		end

	expected: ARRAY [STRING]
			-- Array of expected URIs

feature -- Events

	on_start
			-- Initialize.
		do
			create actual.make
		end

	on_start_tag (a_ns, a_pre, a_local: STRING)
			-- Check namespace.
		do
			check_namespace (a_ns)
			next.on_start_tag (a_ns, a_pre, a_local)
		end

	on_attribute (a_ns, a_pre, a_local: STRING; a_value: STRING)
			-- Check namespace.
		do
			check_namespace (a_ns)
			next.on_attribute (a_ns, a_pre, a_local, a_value)
		end

feature {NONE} -- Implementation

	actual: DS_LINKED_LIST [STRING]
			-- Actual namespaces

	check_namespace (a_ns: STRING)
			-- Build namespace event sequence for later checking.
		do
			if a_ns = Void then
				actual.force_last ("")
			else
				actual.force_last (a_ns)
			end
		end

feature -- Status report

	has_failed: BOOLEAN
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

	failed: STRING
			-- Failed message.
		require
			has: has_failed
		local
			it: DS_LINEAR_CURSOR[STRING]
		do
			from
				Result := ""
				it := actual.new_cursor
				it.start
			until
				it.after
			loop
				if it.item.count = 0 then
					Result := STRING_.appended_string (Result, "0")
				else
					Result := STRING_.appended_string (Result, it.item)
				end
				Result := STRING_.appended_string (Result, " ")
				it.forth
			end
		end

end
