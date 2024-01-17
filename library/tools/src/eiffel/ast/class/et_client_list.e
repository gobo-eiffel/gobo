note

	description:

		"Eiffel comma-separated lists of clients"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

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
			-- Is current client list empty, or does it only
			-- contain the class names "NONE"?
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			Result := True
			nb := count - 1
			from i := 0 until i > nb loop
				l_class := storage.item (i).base_class
				if l_class.is_none then
					i := i + 1
				else
					Result := False
					i := nb + 1 -- Jump out of the loop.
				end
			end
		end

	is_none_or_unknown: BOOLEAN
			-- Is current client list empty, or does it only
			-- contain class names "NONE" or names of classes
			-- not known in the current universe?
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			Result := True
			nb := count - 1
			from i := 0 until i > nb loop
				l_class := storage.item (i).base_class
				if l_class.is_none or l_class.is_unknown then
					i := i + 1
				else
					Result := False
					i := nb + 1 -- Jump out of the loop.
				end
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

	has_descendant (a_class: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Is `a_class' a descendant of any of classes in list?
			-- True if `a_class' is "NONE", even if current list is empty.
			-- (Note: Use `a_system_processor.ancestor_builder' on the classes
			-- whose ancestors need to be built in order to check for descendants.)
		require
			a_class_not_void: a_class /= Void
			a_system_processor_not_void: a_system_processor /= Void
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
				a_class.process (a_system_processor.ancestor_builder)
				if a_class.ancestors_built_successfully then
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
