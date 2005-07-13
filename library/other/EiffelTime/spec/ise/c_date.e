indexing

	description:

		"Representation of a date at C level"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class C_DATE

inherit

	ANY
		redefine
			default_create
		end

create

	default_create,
	make_utc

feature {NONE} -- Initialization

	default_create is
			-- Create an instance of C_DATE using current local time.
		do
			is_utc := False
			update
		end

	make_utc is
			-- Create an instance of C_DATE holding UTC values.
		do
			is_utc := True
			update
		ensure
			is_utc: is_utc
		end

feature -- Access

	is_utc: BOOLEAN
			-- Is Current holding value in UTC format?

feature -- Update

	update is
			-- Pointer to `struct tm' area.
		local
			l_timeb, l_tm: POINTER
			l_time: INTEGER
		do
			l_timeb := l_timeb.memory_alloc (timeb_structure_size)
			ftime (l_timeb)
			l_time := get_time (l_timeb)
			if is_utc then
				l_tm := gmtime ($l_time)
			else
				l_tm := localtime ($l_time)
			end
			create internal_item.make_from_pointer (l_tm, tm_structure_size)
			
			l_time := get_millitm (l_timeb)
			if l_time < 0 or l_time > 999 then
				millisecond_now := 0
			else
				millisecond_now := l_time
			end
			
			l_timeb.memory_free
		end

feature -- Status

	year_now: INTEGER is
			-- Current year at creation time or after last call to `update'.
		do
			Result := 1900 + get_tm_year (internal_item.item)
		ensure
			year_valid: Result >= 1900
		end

	month_now: INTEGER is
			-- Current month at creation time or after last call to `update'.
		do
			Result := get_tm_mon (internal_item.item) + 1
		ensure
			month_valid: Result >= 1 and Result <= 12
		end

	day_now: INTEGER is
			-- Current day at creation time or after last call to `update'.
		do
			Result := get_tm_mday (internal_item.item)
		ensure
			day_valid: Result >= 1 and Result <= 31
		end

	hour_now: INTEGER is
			-- Current hour at creation time or after last call to `update'.
		do
			Result := get_tm_hour (internal_item.item)
		ensure
			hour_valid: Result >= 0 and Result <= 23
		end

	minute_now: INTEGER is
			-- Current minute at creation time or after last call to `update'.
		do
			Result := get_tm_min (internal_item.item)
		ensure
			minute_valid: Result >= 0 and Result <= 59
		end

	second_now: INTEGER is
			-- Current second at creation time or after last call to `update'.
		do
			Result := get_tm_sec (internal_item.item)
			if Result > 59 then
					-- Some platform returns up to 61 for leap seconds.
				Result := 59
			end
		ensure
			second_valid: Result >= 0 and Result <= 59
		end

	millisecond_now: INTEGER
			-- Current millisecond at creation time or after last call to `update'.

feature {NONE} -- Externals

	ftime (p: POINTER) is
			-- Set current date and time in `p', pointer to a `struct timeb' area.
		external
			"C macro signature (struct timeb*) use <sys/timeb.h>"
		end

feature {NONE} -- `struct timeb' encapsulation

	timeb_structure_size: INTEGER is
			-- Size of `struct timeb'.
		external
			"C macro use <sys/timeb.h>"
		alias
			"sizeof(struct timeb)"
		end

	tm_structure_size: INTEGER is
			-- Size of `struct tm'.
		external
			"C macro use <time.h>"
		alias
			"sizeof(struct tm)"
		end

	get_millitm (p: POINTER): INTEGER is
			-- Get `p->millitm'.
		external
			"C struct struct timeb access millitm use <sys/timeb.h>"
		end

	get_time (p: POINTER): INTEGER is
			-- Get `p->time'.
		external
			"C struct struct timeb access time use <sys/timeb.h>"
		end

feature {NONE} -- `struct tm' encapsulation

	internal_item: MANAGED_POINTER
			-- Pointer to `struct tm' area.

	localtime (i: TYPED_POINTER [INTEGER]): POINTER is
			-- Pointer to `struct tm' area.
		external
			"C macro signature (time_t *): struct tm * use <time.h>"
		alias
			"localtime"
		end

	gmtime (i: TYPED_POINTER [INTEGER]): POINTER is
			-- Pointer to `struct tm' area in UTC.
		external
			"C macro signature (time_t *): struct tm * use <time.h>"
		alias
			"gmtime"
		end

	get_tm_year (p: POINTER): INTEGER is
			-- Get `p->tm_year', number of years since 1900.
		external
			"C struct struct tm access tm_year use <time.h>"
		end

	get_tm_mon (p: POINTER): INTEGER is
			-- Get `p->tm_mon'.
		external
			"C struct struct tm access tm_mon use <time.h>"
		end

	get_tm_mday (p: POINTER): INTEGER is
			-- Get `p->tm_mday'.
		external
			"C struct struct tm access tm_mday use <time.h>"
		end

	get_tm_hour (p: POINTER): INTEGER is
			-- Get `p->tm_hour'.
		external
			"C struct struct tm access tm_hour use <time.h>"
		end

	get_tm_min (p: POINTER): INTEGER is
			-- Get `p->tm_min'.
		external
			"C struct struct tm access tm_min use <time.h>"
		end

	get_tm_sec (p: POINTER): INTEGER is
			-- Get `p->tm_sec'.
		external
			"C struct struct tm access tm_sec use <time.h>"
		end

end
