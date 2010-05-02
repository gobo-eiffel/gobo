note

	description:

		"Underlying operating systems"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_OPERATING_SYSTEM

feature -- Status report

	is_windows: BOOLEAN
			-- Is underlying operating system Windows-like?
		local
			cwd: STRING
			gobo_os, os: detachable STRING
		once
			gobo_os := variable_value ("GOBO_OS")
			if gobo_os /= Void and then gobo_os.count > 0 then
				if gobo_os.is_equal ("windows") then
					Result := True
				end
			else
				os := variable_value ("OS")
				if os /= Void and then os.is_equal ("Windows_NT") then
					Result := True
				else
					cwd := current_working_directory
					if cwd.count >= 3 then
						if (cwd.item (2) = ':' and cwd.item (3) = '\') then
							Result := True
						elseif (cwd.item (1) = '\' and cwd.item (2) = '\') then
							Result := True
						end
					end
				end
			end
		end

	is_unix: BOOLEAN
			-- Is underlying operating system Unix-like?
		local
			cwd: STRING
			gobo_os: detachable STRING
		once
			gobo_os := variable_value ("GOBO_OS")
			if gobo_os /= Void and then gobo_os.count > 0 then
				if gobo_os.is_equal ("unix") then
					Result := True
				end
			else
				cwd := current_working_directory
				if cwd.count > 0 then
					Result := cwd.item (1) = '/'
				end
			end
		end

	is_dotnet: BOOLEAN
			-- Has this application been compiled with Eiffel for .NET?
		local
			p: PLATFORM
		once
			create p
			Result := p.is_dotnet
		end

feature {NONE} -- Implementation

	current_working_directory: STRING
			-- Name of current working directory;
			-- Return absolute pathname with the naming
			-- convention of the underlying file system
			-- (Return a new object at each call.)
		do
			Result := execution_environment.current_working_directory
		ensure
			current_working_directory_not_void: Result /= Void
		end

	variable_value (a_variable: STRING): detachable STRING
			-- Value of environment variable `a_variable',
			-- Void if `a_variable' has not been set
		require
			a_variable_not_void: a_variable /= Void
		do
			Result := execution_environment.get (a_variable)
		end

	execution_environment: EXECUTION_ENVIRONMENT
			-- Execution environment implementation
		once
			create Result
		ensure
			execution_environment_not_void: Result /= Void
		end

end
