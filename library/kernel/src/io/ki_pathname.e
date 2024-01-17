note

	description:

		"Interface for pathnames"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2011, Eric Bezault and others"
	license: "MIT License"

deferred class KI_PATHNAME

inherit

	ANY
		redefine
			is_equal
		end

	KL_CLONABLE
		undefine
			is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			is_equal
		end

	KL_IMPORTED_ARRAY_ROUTINES
		undefine
			is_equal
		end

	KL_SHARED_STRING_EQUALITY_TESTER
		rename
			string_equality_tester as other_string_equality_tester
		export
			{NONE} all
		undefine
			is_equal
		end

	UC_SHARED_STRING_EQUALITY_TESTER
		export
			{NONE} all
		undefine
			is_equal
		end

feature -- Status report

	is_relative: BOOLEAN
			-- Is pathname a relative pathname?
		deferred
		end

	is_current (i: INTEGER): BOOLEAN
			-- Is component at `i'-th position the
			-- relative current directory name?
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		end

	is_parent (i: INTEGER): BOOLEAN
			-- Is component at `i'-th position the
			-- relative parent directory name?
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		end

	is_canonical: BOOLEAN
			-- Is pathname canonical?
			-- (A pathname is canonical if it has no parent directory
			-- component except at leading positions, and no current
			-- directory component except when it is the only component
			-- and the pathname is relative.)
		local
			i, nb: INTEGER
		do
			nb := count
			if nb = 1 and then is_current (1) and is_relative then
				Result := True
			else
				Result := True
				from
					i := 1
				until
					i > nb
				loop
					if is_current (i) then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					elseif is_parent (i) then
						if i > 1 and then not is_parent (i - 1) then
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
					end
					i := i + 1
				end
			end
		end

feature -- Access

	item (i: INTEGER): STRING
			-- Pathname component at `i'-th position
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			item_not_void: Result /= Void
			item_not_empty: not Result.is_empty
		end

	drive: detachable STRING
			-- Drive of pathname if present,
			-- Void otherwise
		deferred
		end

	hostname: detachable STRING
			-- Hostname of pathname if present,
			-- Void otherwise
			-- (for example, with UNC we can have: \\hostname\sharename)
		deferred
		end

	sharename: detachable STRING
			-- Sharename of pathname if present,
			-- Void otherwise
			-- (for example, with UNC we can have: \\hostname\sharename)
		deferred
		end

	trailing_items (a_pathname: KI_PATHNAME): ARRAY [STRING]
			-- Items in `a_pathname' that are past the last item in `Current'
			--
			-- Useful when `Current' is a subpathname of `a_pathname'.
		require
			a_pathname_not_void: a_pathname /= Void
		local
			i, j, nb: INTEGER
		do
			i := count + 1
			nb := a_pathname.count
			j := nb - i + 1
			if j <= 0 then
				create Result.make_filled ("", 1, 0)
			else
				create Result.make_filled ("", 1, j)
				from
					j := 1
				until
					i > nb
				loop
					Result.put (a_pathname.item (i), j)
					j := j + 1
					i := i + 1
				end
			end
		ensure
			trailing_items_not_void: Result /= Void
			no_void_item: not STRING_ARRAY_.has_void (Result)
			no_empty_item: not Result.there_exists (agent {STRING}.is_empty)
			count: Result.count = (a_pathname.count - count).max (0)
		end

feature -- Measurement

	count: INTEGER
			-- Number of components in pathname
		deferred
		ensure
			count_positive: Result >= 0
		end

feature -- Element change

	set_canonical
			-- Make pathname canonical.
		deferred
		ensure
			is_canonical: is_canonical
		end

feature -- Comparison

	same_pathname (a_pathname: KI_PATHNAME): BOOLEAN
			-- Is current pathname considered equal to `other'?
			-- Use case-sensitive comparison.
		require
			a_pathname_not_void: a_pathname /= Void
		do
			if a_pathname = Current then
				Result := True
			elseif count = a_pathname.count then
				Result := is_subpathname (a_pathname)
			end
		end

	same_case_insensitive (a_pathname: KI_PATHNAME): BOOLEAN
			-- Is current pathname considered equal to `other'?
			-- Use case-insensitive comparison.
		require
			a_pathname_not_void: a_pathname /= Void
		do
			if a_pathname = Current then
				Result := True
			elseif count = a_pathname.count then
				Result := is_case_insensitive_subpathname (a_pathname)
			end
		end

	is_subpathname (a_pathname: KI_PATHNAME): BOOLEAN
			-- Is current pathname a subpathname of `other'?
			-- Use case-sensitive comparison.
		require
			a_pathname_not_void: a_pathname /= Void
		local
			i, nb: INTEGER
		do
			if a_pathname = Current then
				Result := True
			else
				nb := count
				if
					nb <= a_pathname.count and
					is_relative = a_pathname.is_relative and
					string_equality_tester.test (drive, a_pathname.drive) and
					string_equality_tester.test (hostname, a_pathname.hostname) and
					string_equality_tester.test (sharename, a_pathname.sharename)
				then
					Result := True
					from
						i := 1
					until
						i > nb
					loop
						if not STRING_.same_string (item (i), a_pathname.item (i)) then
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
						i := i + 1
					end
				end
			end
		end

	is_case_insensitive_subpathname (a_pathname: KI_PATHNAME): BOOLEAN
			-- Is current pathname a subpathname of `other'?
			-- Use case-insensitive comparison.
		require
			a_pathname_not_void: a_pathname /= Void
		local
			i, nb: INTEGER
		do
			if a_pathname = Current then
				Result := True
			else
				nb := count
				if
					nb <= a_pathname.count and
					is_relative = a_pathname.is_relative and
					case_insensitive_string_equality_tester.test (drive, a_pathname.drive) and
					case_insensitive_string_equality_tester.test (hostname, a_pathname.hostname) and
					case_insensitive_string_equality_tester.test (sharename, a_pathname.sharename)
				then
					Result := True
					from
						i := 1
					until
						i > nb
					loop
						if not STRING_.same_case_insensitive (item (i), a_pathname.item (i)) then
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
						i := i + 1
					end
				end
			end
		end

	is_equal (other: like Current): BOOLEAN
			-- Is current pathname considered equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_pathname (other)
			end
		end

end
