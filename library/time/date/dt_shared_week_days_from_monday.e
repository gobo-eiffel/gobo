indexing

	description:

		"Objects that provide access to shared days of the week"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_SHARED_WEEK_DAYS_FROM_MONDAY

feature -- Access

	monday: DT_WEEK_DAY_FROM_MONDAY is
          -- Monday
      once
			create Result.make_monday
      ensure
			monday_not_void: Result /= Void
			is_monday: Result.is_monday
      end

	tuesday: DT_WEEK_DAY_FROM_MONDAY is
          -- Tuesday
      once
			create Result.make_tuesday
      ensure
			tuesday_not_void: Result /= Void
			is_tuesday: Result.is_tuesday
      end

	wednesday: DT_WEEK_DAY_FROM_MONDAY is
          -- Wednesday
      once
			create Result.make_wednesday
      ensure
			wednesday_not_void: Result /= Void
			is_wednesday: Result.is_wednesday
      end

	thursday: DT_WEEK_DAY_FROM_MONDAY is
          -- Thursday
      once
			create Result.make_thursday
      ensure
			thursday_not_void: Result /= Void
			is_thursday: Result.is_thursday
      end

	friday: DT_WEEK_DAY_FROM_MONDAY is
          -- Friday
      once
			create Result.make_friday
      ensure
			friday_not_void: Result /= Void
			is_friday: Result.is_friday
      end

	saturday: DT_WEEK_DAY_FROM_MONDAY is
          -- Saturday
      once
			create Result.make_saturday
      ensure
			saturday_not_void: Result /= Void
			is_saturday: Result.is_saturday
      end

	sunday: DT_WEEK_DAY_FROM_MONDAY is
          -- Sunday
      once
			create Result.make_sunday
      ensure
			sunday_not_void: Result /= Void
			is_sunday: Result.is_sunday
      end

end
