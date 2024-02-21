note

	description:

		"ECF lists of .Net namespaces"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_NAMESPACES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_namespace: like namespace)
			-- Create a new namespace list with initially one value `a_namespace'.
		require
			a_namespace_not_void: a_namespace /= Void
		do
			create namespaces.make (Initial_namespaces_capacity)
			namespaces.put_last (a_namespace)
		ensure
			one_namespace: namespaces.count = 1
			namespace_set: namespaces.last = a_namespace
		end

	make_empty
			-- Create a new empty namespace list.
		do
			create namespaces.make (Initial_namespaces_capacity)
		ensure
			is_empty: namespaces.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is the list of namespaces empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	namespace (i: INTEGER): ET_ECF_NAMESPACE
			-- `i'-th namespace
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := namespaces.item (i)
		ensure
			namespace_not_void: Result /= Void
		end

	namespaces: DS_ARRAYED_LIST [like namespace]
			-- Namespaces

feature -- Measurement

	count: INTEGER
			-- Number of namespaces
		do
			Result := namespaces.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = namespaces.count
		end

feature -- Element change

	put_last (a_namespace: like namespace)
			-- Add `a_namespace' to the list of namespaces.
		require
			a_namespace_not_void: a_namespace /= Void
		do
			namespaces.force_last (a_namespace)
		ensure
			one_more: namespaces.count = old namespaces.count + 1
			namespace_added: namespaces.last = a_namespace
		end

feature {NONE} -- Constants

	Initial_namespaces_capacity: INTEGER = 50
			-- Initial capacity for `namespaces'

invariant

	namespaces_not_void: namespaces /= Void
	no_void_namespace: not namespaces.has_void

end
