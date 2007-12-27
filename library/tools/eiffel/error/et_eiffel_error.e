indexing

	description:

		"Eiffel errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EIFFEL_ERROR

inherit

	ET_ERROR

feature -- Access

	current_class: ET_CLASS
			-- Class where current error occurred

	class_impl: ET_CLASS is
			-- Class where current error was written
		do
			Result := current_class
		end

	position: ET_POSITION
			-- Position of current error in `class_impl'

	filename: STRING is
			-- Name of file where current error occurred
		deferred
		ensure
			filename_not_void: Result /= Void
		end

feature -- Setting

	set_position (a_position: like position) is
			-- Set `position' to `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature -- Status report

	ise_reported: BOOLEAN
			-- Is current error reported by ISE Eiffel?

	ise_fatal: BOOLEAN
			-- Is current error considered as fatal by ISE Eiffel,
			-- or is it not reported but produces flawed behaviors
			-- instead (e.g. compiler or runtime crash, incorrect
			-- execution behavior, etc.)?

	se_reported: BOOLEAN
			-- Is current error reported by SmartEiffel?

	se_fatal: BOOLEAN
			-- Is current error considered as fatal by ISE Eiffel,
			-- or is it not reported but produces flawed behaviors
			-- instead (e.g. compiler or runtime crash, incorrect
			-- execution behavior, etc.)?

	ve_reported: BOOLEAN
			-- Is current error reported by Visual Eiffel?

	ve_fatal: BOOLEAN
			-- Is current error considered as fatal by ISE Eiffel,
			-- or is it not reported but produces flawed behaviors
			-- instead (e.g. compiler or runtime crash, incorrect
			-- execution behavior, etc.)?

	ge_reported: BOOLEAN
			-- Is current error reported by Gobo Eiffel?

	ge_fatal: BOOLEAN
			-- Is current error considered as fatal by Gobo Eiffel,
			-- or is it not reported but produces flawed behaviors
			-- instead (e.g. compiler or runtime crash, incorrect
			-- execution behavior, etc.)?

	all_reported: BOOLEAN is
			-- Is current error reported by all Eiffel compilers?
		do
			Result := ise_reported and se_reported and ve_reported and ge_reported
		ensure
			definition: Result = (ise_reported and se_reported and ve_reported and ge_reported)
		end

	all_fatal: BOOLEAN is
			-- Is current error considered as fatal by all Eiffel compilers?
		do
			Result := ise_fatal and se_fatal and ve_fatal and ge_fatal
		ensure
			definition: Result = (ise_fatal and se_fatal and ve_fatal and ge_fatal)
		end

feature -- Status setting

	set_ise_reported (b: BOOLEAN) is
			-- Set `ise_reported' to `b'.
		do
			ise_reported := b
		ensure
			ise_reported: ise_reported = b
		end

	set_ise_fatal (b: BOOLEAN) is
			-- Set `ise_fatal' to `b'.
		do
			ise_fatal := b
		ensure
			ise_fatal: ise_fatal = b
		end

	set_se_reported (b: BOOLEAN) is
			-- Set `se_reported' to `b'.
		do
			se_reported := b
		ensure
			se_reported: se_reported = b
		end

	set_se_fatal (b: BOOLEAN) is
			-- Set `se_fatal' to `b'.
		do
			se_fatal := b
		ensure
			se_fatal: se_fatal = b
		end

	set_ve_reported (b: BOOLEAN) is
			-- Set `ve_reported' to `b'.
		do
			ve_reported := b
		ensure
			ve_reported: ve_reported = b
		end

	set_ve_fatal (b: BOOLEAN) is
			-- Set `ve_fatal' to `b'.
		do
			ve_fatal := b
		ensure
			ve_fatal: ve_fatal = b
		end

	set_ge_reported (b: BOOLEAN) is
			-- Set `ge_reported' to `b'.
		do
			ge_reported := b
		ensure
			ge_reported: ge_reported = b
		end

	set_ge_fatal (b: BOOLEAN) is
			-- Set `ge_fatal' to `b'.
		do
			ge_fatal := b
		ensure
			ge_fatal: ge_fatal = b
		end

	set_compilers (b: BOOLEAN) is
			-- Set all Eiffel compilers status to `b'.
		do
			ise_reported := b
			ise_fatal := b
			se_reported := b
			se_fatal := b
			ve_reported := b
			ve_fatal := b
			ge_reported := b
			ge_fatal := b
		ensure
			ise_reported: ise_reported = b
			ise_fatal: ise_fatal = b
			se_reported: se_reported = b
			se_fatal: se_fatal = b
			ve_reported: ve_reported = b
			ve_fatal: ve_fatal = b
			ge_reported: ge_reported = b
			ge_fatal: ge_fatal = b
		end

feature {NONE} -- Implementation

	null_position: ET_POSITION is
			-- Null position
		once
			create {ET_COMPRESSED_POSITION} Result.make_default
		ensure
			position_not_void: Result /= Void
			null_position: Result.is_null
		end

invariant

	position_not_void: position /= Void
	etl_code_not_void: etl_code /= Void

end
