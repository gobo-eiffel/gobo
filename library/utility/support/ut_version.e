indexing

	description:

		"Version numbers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_VERSION

inherit

	ANY
		redefine
			out
		end

	COMPARABLE
		undefine
			is_equal, out
		end

create

	make, make_major, make_major_minor, make_latest

feature {NONE} -- Initialization

	make (a_major: like major; a_minor: like minor; a_build: like build) is
			-- Make new version of the form "major.minor.build".
		require
			a_major_not_negative: a_major >= 0
			a_minor_not_negative: a_minor >= 0
			a_build_not_negative: a_build >= 0
		do
			internal_major := a_major
			internal_minor := a_minor
			internal_build := a_build
		ensure
			has_major: has_major
			major_set: major = a_major
			has_minor: has_minor
			minor_set: minor = a_minor
			has_build: has_build
			build_set: build = a_build
		end

	make_major (a_major: like major) is
			-- Make new version of the form "major".
			-- Note that this version is greater than any other
			-- version of the form "major.xxx" or "major.xxx.yyy".
		require
			a_major_not_negative: a_major >= 0
		do
			internal_major := a_major
			internal_minor := -1
			internal_build := -1
		ensure
			has_major: has_major
			major_set: major = a_major
			no_minor: not has_minor
			no_build: not has_build
		end

	make_major_minor (a_major: like major; a_minor: like minor) is
			-- Make new version of the form "major.minor".
			-- Note that this version is greater than any other
			-- version of the form "major.minor.xxx".
		require
			a_major_not_negative: a_major >= 0
			a_minor_not_negative: a_minor >= 0
		do
			internal_major := a_major
			internal_minor := a_minor
			internal_build := -1
		ensure
			has_major: has_major
			major_set: major = a_major
			has_minor: has_minor
			minor_set: minor = a_minor
			no_build: not has_build
		end

	make_latest is
			-- Make new version which is greater than any other
			-- version.
		do
			internal_major := -1
			internal_minor := -1
			internal_build := -1
		ensure
			no_major: not has_major
			no_minor: not has_minor
			no_build: not has_build
		end

feature -- Status report

	has_major: BOOLEAN is
			-- Does current version have a major version?
		do
			Result := (internal_major >= 0)
		end

	has_minor: BOOLEAN is
			-- Does current version have a minor version?
		do
			Result := (internal_minor >= 0)
		end

	has_build: BOOLEAN is
			-- Does current version have a build number?
		do
			Result := (internal_build >= 0)
		end

feature -- Access

	major: INTEGER is
			-- Major version
		require
			has_major: has_major
		do
			Result := internal_major
		ensure
			major_not_negative: Result >= 0
		end

	minor: INTEGER is
			-- Minor version
		require
			has_minor: has_minor
		do
			Result := internal_minor
		ensure
			minor_not_negative: Result >= 0
		end

	build: INTEGER is
			-- Release/build number
		require
			has_build: has_build
		do
			Result := internal_build
		ensure
			build_not_negative: Result >= 0
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current version less than `other'?
		do
			if other.has_major then
				if not has_major then
					Result := False
				elseif major < other.major then
					Result := True
				elseif major = other.major then
					if other.has_minor then
						if not has_minor then
							Result := False
						elseif minor < other.minor then
							Result := True
						elseif minor = other.minor then
							if other.has_build then
								if not has_build then
									Result := False
								else
									Result := (build < other.build)
								end
							else
								Result := has_build
							end
						end
					else
						Result := has_minor
					end
				end
			else
				Result := has_major
			end
		end

feature -- Output

	out: STRING is
			-- New string containing terse printable representation
			-- of current object
		do
			create Result.make (10)
			if has_major then
				Result.append_string (major.out)
				if has_minor then
					Result.append_character ('.')
					Result.append_string (minor.out)
					if has_build then
						Result.append_character ('.')
						Result.append_string (build.out)
					end
				end
			end
		end

feature {NONE} -- Implementation

	internal_major: INTEGER
			-- Major version

	internal_minor: INTEGER
			-- Minor version

	internal_build: INTEGER
			-- Release/build number

invariant

	no_minor: not has_major implies not has_minor
	no_build: not has_minor implies not has_build

end
