indexing

	description:

		"Pathnames"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_PATHNAME

inherit

	KI_PATHNAME
		redefine
			copy
		end

	KL_IMPORTED_ARRAY_ROUTINES
		export
			{NONE} all
		undefine
			is_equal,
			copy
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new empty pathname.
		do
			create components.make (1, Initial_components_capacity)
		ensure
			not_relative: not is_relative
		end

feature -- Status report

	is_relative: BOOLEAN
			-- Is pathname a relative pathname?

	is_current (i: INTEGER): BOOLEAN is
			-- Is component at `i'-th position the
			-- relative current directory name?
		do
			Result := (item (i) = Current_directory)
		end

	is_parent (i: INTEGER): BOOLEAN is
			-- Is component at `i'-th position the
			-- relative parent directory name?
		do
			Result := (item (i) = Parent_directory)
		end

feature -- Access

	item (i: INTEGER): STRING is
			-- Pathname component at `i'-th position
		do
			Result := components.item (i)
		end

	drive: STRING
			-- Drive of pathname if present,
			-- Void otherwise

	hostname: STRING
			-- Hostname of pathname if present,
			-- Void otherwise
			-- (for example, with UNC we can have: \\hostname\sharename)

	sharename: STRING
			-- Sharename of pathname if present,
			-- Void otherwise
			-- (for example, with UNC we can have: \\hostname\sharename)

feature -- Measurement

	count: INTEGER
			-- Number of components in pathname

feature -- Setting

	set_relative (b: BOOLEAN) is
			-- Set `is_relative' to `b'.
		do
			is_relative := b
		ensure
			is_relative: is_relative = b
		end

	set_drive (a_drive: like drive) is
			-- Set `drive' to `a_drive'.
		do
			drive := a_drive
		ensure
			drive_set: drive = a_drive
		end

	set_hostname (a_hostname: like hostname) is
			-- Set `hostname' to `a_hostname'.
		do
			hostname := a_hostname
		ensure
			hostname_set: hostname = a_hostname
		end

	set_sharename (a_sharename: like sharename) is
			-- Set `sharename' to `a_sharename'.
		do
			sharename := a_sharename
		ensure
			sharename_set: sharename = a_sharename
		end

feature -- Element change

	append_name (a_name: STRING) is
			-- Append component `a_name' to pathname.
		require
			a_name_not_void: a_name /= Void
		do
			count := count + 1
			components.force (a_name, count)
		ensure
			one_more: count = old count + 1
			appended: item (count) = a_name
		end

	append_names (a_names: ARRAY [STRING]) is
			-- Append components `a_names' to pathname.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
		local
			i, nb: INTEGER
		do
			i := a_names.lower
			nb := a_names.upper
			from
			until
				i > nb
			loop
				append_name (a_names.item (i))
				i := i + 1
			end
		ensure
			count_set: count = old count + a_names.count
		end

	append_current is
			-- Append current directory to pathname.
		do
			append_name (Current_directory)
		ensure
			one_more: count = old count + 1
			appended: is_current (count)
		end

	append_parent is
			-- Append parent directory to pathname.
		do
			append_name (Parent_directory)
		ensure
			one_more: count = old count + 1
			appended: is_parent (count)
		end

	set_canonical is
			-- Make pathname canonical.
		local
			i, j, nb: INTEGER
		do
			nb := count
			if nb = 1 and then is_current (1) and is_relative then
					-- Do nothing.
			else
				j := 1
				from
					i := 1
				until
					i > nb
				loop
					if is_current (i) then
							-- Ignore current directory components.
					elseif is_parent (i) then
						if j = 1 or else is_parent (j - 1) then
								-- Leading parent directory component.
								-- Ignore it in case of non-relative pathname:
								-- the canonical pathname of 'c:\..' is 'c:\'.
							if is_relative then
								components.put (item (i), j)
								j := j + 1
							end
						else
								-- Consume parent directory: go one
								-- level up in the directory tree
								-- represented by current pathname.
							j := j - 1
						end
					else
						components.put (item (i), j)
						j := j + 1
					end
					i := i + 1
				end
				count := (j - 1)
				from
				until
					j > nb
				loop
					components.put (Void, j)
					j := j + 1
				end
				if is_relative and count = 0 then
					append_current
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current pathname.
		do
			standard_copy (other)
			components := STRING_ARRAY_.cloned_array (components)
		end

feature {KL_PATHNAME} -- Implementation

	components: ARRAY [STRING]
			-- Components in pathname

feature {NONE} -- Constants

	Initial_components_capacity: INTEGER is 10
			-- Initial capacity for `components'

	Current_directory: STRING is "."
			-- Special pathname component representing the current directory

	Parent_directory: STRING is ".."
			-- Special pathname component representing the parent directory

invariant

	components_not_void: components /= Void
	components_lower: components.lower = 1
	components_count: components.count >= count

end
