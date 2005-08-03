indexing

	description:

		"Interface for pathnames"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

feature -- Status report

	is_relative: BOOLEAN is
			-- Is pathname a relative pathname?
		deferred
		end

	is_current (i: INTEGER): BOOLEAN is
			-- Is component at `i'-th position the
			-- relative current directory name?
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		end

	is_parent (i: INTEGER): BOOLEAN is
			-- Is component at `i'-th position the
			-- relative parent directory name?
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		end

	is_canonical: BOOLEAN is
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
				from i := 1 until i > nb loop
					if is_current (i) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					elseif is_parent (i) then
						if i > 1 and then not is_parent (i - 1) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
		end

feature -- Access

	item (i: INTEGER): STRING is
			-- Pathname component at `i'-th position
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			item_not_void: Result /= Void
		end

	drive: STRING is
			-- Drive of pathname if present,
			-- Void otherwise
		deferred
		end

	hostname: STRING is
			-- Hostname of pathname if present,
			-- Void otherwise
			-- (for example, with UNC we can have: \\hostname\sharename)
		deferred
		end

	sharename: STRING is
			-- Sharename of pathname if present,
			-- Void otherwise
			-- (for example, with UNC we can have: \\hostname\sharename)
		deferred
		end

feature -- Measurement

	count: INTEGER is
			-- Number of components in pathname
		deferred
		ensure
			count_positive: Result >= 0
		end

feature -- Element change

	set_canonical is
			-- Make pathname canonical.
		deferred
		ensure
			is_canonical: is_canonical
		end

feature -- Comparison

	same_pathname (a_pathname: KI_PATHNAME): BOOLEAN is
			-- Is current pathname considered equal to `other'?
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
					nb = a_pathname.count and
					is_relative = a_pathname.is_relative and
					((drive = Void and a_pathname.drive = Void) or else
					((drive /= Void and a_pathname.drive /= Void) and then
					STRING_.same_string (drive, a_pathname.drive))) and
					((hostname = Void and a_pathname.hostname = Void) or else
					((hostname /= Void and a_pathname.hostname /= Void) and then
					STRING_.same_string (hostname, a_pathname.hostname))) and
					((sharename = Void and a_pathname.sharename = Void) or else
					((sharename /= Void and a_pathname.sharename /= Void) and then
					STRING_.same_string (sharename, a_pathname.sharename)))
				then
					Result := True
					from i := 1 until i > nb loop
						if not STRING_.same_string (item (i), a_pathname.item (i)) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						end
						i := i + 1
					end
				end
			end
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is current pathname considered equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_pathname (other)
			end
		end

end
