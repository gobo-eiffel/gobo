note

	description:

		"Eiffel comma-separated lists of clients"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLIENT_LIST

inherit

	ET_HEAD_LIST [ET_CLIENT_ITEM]
		export
			{ET_CLIENT_LIST} storage
		end

create

	make, make_with_capacity

feature -- Access

	client (i: INTEGER): ET_CLIENT
			-- Client at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).client
		ensure
			client_not_void: Result /= Void
		end

feature -- Status report

	is_none: BOOLEAN
			-- Does current client list only contain the
			-- class name "NONE" or is empty?
		do
			if count = 1 then
				Result := storage.item (0).base_class.is_none
			elseif count = 0 then
				Result := True
			end
		end

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Does the `a_class' appear in current list?
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if a_class = storage.item (i).base_class then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_descendant (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' a descendant of any of classes in list?
			-- True if `a_class' is "NONE", even if current list is empty.
			-- (Note: Use `current_system.ancestor_builder' on the classes
			-- whose ancestors need to be built in order to check for descendants.)
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
		do
			if a_class.is_none then
					-- "NONE" is a descendant of all classes.
				Result := True
			elseif has_class (a_class) then
					-- Before computing the ancestors of `a_class', we checked
					-- first whether it is explicitly listed in the current
					-- list of clients.
				Result := True
			elseif a_class.is_preparsed then
					-- If `a_class' is not preparsed, we know nothing about it,
					-- not even its filename.
					--
					-- Search ancestors of `a_class' first.
				a_class.process (a_class.current_system.ancestor_builder)
				if a_class.ancestors_built and then not a_class.has_ancestors_error then
					nb := count - 1
					from i := 0 until i > nb loop
						if a_class.has_ancestor (storage.item (i).base_class) then
							Result := True
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

feature -- Comparison

	same_clients (other: ET_CLIENT_LIST): BOOLEAN
			-- Do current list and `other' contain the same set of clients?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			other_storage: like storage
		do
			if other = Current then
				Result := True
			else
				Result := True
				nb := count - 1
				from i := 0 until i > nb loop
					if not other.has_class (storage.item (i).base_class) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result then
					other_storage := other.storage
					nb := other.count - 1
					from i := 0 until i > nb loop
						if not has_class (other_storage.item (i).base_class) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM]
			-- Fixed array routines
		once
			create Result
		end

end
