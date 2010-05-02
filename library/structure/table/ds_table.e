note

	description:

		"Data structures whose items are accessible through keys"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_TABLE [G, K]

inherit

	DS_CONTAINER [G]

	KL_VALUES [G, K]
		undefine
			is_equal,
			copy
		end

feature -- Access

	at alias "@", item (k: K): G
			-- Item associated with `k'
		require
			has_k: has (k)
		deferred
		end

	value (k: K): G
			-- Item associated with `k';
			-- Return default value if no such item
		require else
			True
		do
			if has (k) then
				Result := item (k)
			end
		end

feature -- Status report

	valid_key (k: K): BOOLEAN
			-- Is `k' a valid key?
		deferred
		end

	valid_void_key: BOOLEAN
			-- Is Void a valid key?
		local
			k: detachable K
			l_current: detachable DS_TABLE [G, detachable K]
		do
			l_current ?= Current
			if l_current /= Void and k = Void then
				Result := l_current.valid_key (k)
			end
		end

	has (k: K): BOOLEAN
			-- Is there an item associated with `k'?
		deferred
		ensure
			valid_key: Result implies valid_key (k)
		end

	has_void: BOOLEAN
			-- Is there an item associated with Void?
		local
			k: detachable K
			l_current: detachable DS_TABLE [G, detachable K]
		do
			l_current ?= Current
			if l_current /= Void and k = Void then
				Result := l_current.has (k)
			end
		ensure
			valid_key: Result implies valid_void_key
		end

feature -- Element change

	replace (v: G; k: K)
			-- Replace item associated with `k' by `v'.
		require
			has_k: has (k)
		deferred
		ensure
			replaced: item (k) = v
			same_count: count = old count
		end

	put (v: G; k: K)
			-- Associate `v' with key `k'.
		require
			valid_key: valid_key (k)
		deferred
		ensure
			inserted: has (k) and then item (k) = v
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
		end

	put_new (v: G; k: K)
			-- Associate `v' with key `k'.
		require
			valid_key: valid_key (k)
			new_item: not has (k)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
		end

	swap (k, l: K)
			-- Exchange items associated with `k' and `l'.
		require
			valid_k: has (k)
			valid_l: has (l)
		local
			v: G
		do
			v := item (k)
			replace (item (l), k)
			replace (v, l)
		ensure
			same_count: count = old count
			new_k: item (k) = old item (l)
			new_l: item (l) = old item (k)
		end

feature -- Removal

	remove (k: K)
			-- Remove item associated with `k'.
		require
			valid_key: valid_key (k)
		deferred
		ensure
			same_count: (not old has (k)) implies (count = old count)
			one_less: (old has (k)) implies (count = old count - 1)
			removed: not has (k)
		end

feature -- Iteration

	do_all_with_key (an_action: PROCEDURE [ANY, TUPLE [G, K]])
			-- Apply `an_action' to every item.
			-- `an_action' receives the item and its key.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		require
			an_action_not_void: an_action /= Void
		deferred
		end

	do_if_with_key (an_action: PROCEDURE [ANY, TUPLE [G, K]]; a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test'.
			-- `an_action' and `a_test' receive the item and its key.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		deferred
		end

	there_exists_with_key (a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item and its key?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		deferred
		end

	for_all_with_key (a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items and their keys?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		deferred
		end

end
