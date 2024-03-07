note

	description:

		"Execution environment facilities"

	usage:

		"This class should not be used directly through %
		%inheritance and client/supplier relationship. %
		%Inherit from KL_SHARED_EXECUTION_ENVIRONMENT instead."

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"

class KL_EXECUTION_ENVIRONMENT

inherit

	KL_STRING_VALUES
		rename
			value as variable_value
		end

	KL_STRING_8_VALUES
		rename
			value as string_8_variable_value,
			interpreted_string as interpreted_string_8,
			expanded_string as expanded_string_8
		end

feature -- Access

	variable_value (a_variable: STRING): detachable STRING
			-- Value of environment variable `a_variable',
			-- Void if `a_variable' has not been set;
			-- Note: If `a_variable' is a UC_STRING or descendant, then
			-- the bytes of its associated UTF unicode encoding will
			-- be used to query its value to the environment.
		do
			if attached environment_impl.item (STRING_.as_string_no_uc_string (a_variable)) as l_item then
				if attached {STRING} l_item as l_string then
					Result := l_string
				elseif l_item.is_valid_as_string_8 then
					Result := l_item.to_string_8
				else
					Result := {UC_UTF8_ROUTINES}.string_to_utf8 (l_item)
				end
			end
		ensure then
			instance_free: class
		end

	string_8_variable_value (a_variable: STRING_8): detachable STRING_8
			-- Value of environment variable `a_variable',
			-- Void if `a_variable' has not been set;
			-- Note: If `a_variable' is a UC_STRING or descendant, then
			-- the bytes of its associated UTF unicode encoding will
			-- be used to query its value to the environment.
		do
			if attached environment_impl.item (STRING_.as_string_8_no_uc_string (a_variable)) as l_item then
				if l_item.is_valid_as_string_8 then
					Result := l_item.to_string_8
				else
					Result := {UC_UTF8_ROUTINES}.string_to_utf8 (l_item)
				end
			end
		ensure then
			instance_free: class
		end

	current_executable_pathname: STRING
			-- Pathname of current executable
		local
			l_count, l_nbytes: INTEGER
			l_managed: MANAGED_POINTER
		once
			l_count := 250
			create l_managed.make (l_count)
			l_nbytes := eif_current_executable_pathname_ptr (l_managed.item, l_count)
			if l_nbytes > l_count then
				l_count := l_nbytes
				l_managed.resize (l_count)
				l_nbytes := eif_current_executable_pathname_ptr (l_managed.item, l_count)
			end
			if l_nbytes > 0 and l_nbytes <= l_count then
				create Result.make_from_c (l_managed.item)
			else
				Result := ""
			end
		ensure
			instance_free: class
			result_not_void: Result /= Void
		end

feature -- Setting

	set_variable_value (a_variable, a_value: READABLE_STRING_GENERAL)
			-- Set environment variable `a_variable' to `a_value'.
			-- (This setting may fail on certain platforms.)
			-- Note: If `a_variable' or `a_value' are UC_STRING or
			-- descendant, then the bytes of their associated UTF
			-- unicode encoding will be passed to the environment.
		require
			a_variable_not_void: a_variable /= Void
			a_variable_not_empty: a_variable.count > 0
			a_value_not_void: a_value /= Void
		do
			environment_impl.put (STRING_.as_readable_string_general_no_uc_string (a_value), STRING_.as_readable_string_general_no_uc_string (a_variable))
		ensure
			instance_free: class
			-- This setting may fail on certain platforms, hence the
			-- following commented postcondition:
			-- variable_set: equal (variable_value (a_variable), STRING_.as_readable_string_general_no_uc_string (a_value))
		end

feature -- Basic operations

	sleep (a_nanoseconds: INTEGER_64)
			-- Suspend thread execution for interval specified in
			-- `a_nanoseconds' (1 nanosecond = 10^(-9) second).
		require
			a_nanoseconds_not_negative: a_nanoseconds >= 0
		do
			environment_impl.sleep (a_nanoseconds)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	environment_impl: EXECUTION_ENVIRONMENT
			-- Execution environment impl
		once
			create Result
		ensure
			instance_free: class
			environment_impl_not_void: Result /= Void
		end

	eif_current_executable_pathname_ptr (a_ptr: POINTER; a_count: INTEGER): INTEGER
			-- Store directory name corresponding to the pathname of current executable in `a_ptr' with `a_count' bytes.
			-- If there is a need for more bytes than `a_count', or if `a_ptr' is the default_pointer,
			-- nothing is done with `a_ptr'.
			-- We always return the number of bytes required including the null-terminating character.
			-- (See https://stackoverflow.com/questions/1023306/finding-current-executables-path-without-proc-self-exe)
		external
			"C inline use <eif_system.h>, <string.h>"
		alias
			"[
				#ifdef EIF_WINDOWS
					char *exePath;
					if (_get_pgmptr(&exePath) != 0)
						exePath = "";
				#elif defined(EIF_MACOSX)
						/* MacOS X < 10.4 */
					char exePath[PATH_MAX];
					uint32_t len = sizeof(exePath);
					if (_NSGetExecutablePath(exePath, &len) != 0) {
						exePath[0] = '\0'; // buffer too small (!)
					} else {
						// resolve symlinks, ., .. if possible
						char *canonicalPath = realpath(exePath, NULL);
						if (canonicalPath != NULL) {
							strncpy(exePath,canonicalPath,len);
							free(canonicalPath);
						}
					}
				#elif defined(__FreeBSD__)
					char exePath[2048];
					int mib[4];  mib[0] = CTL_KERN;  mib[1] = KERN_PROC;  mib[2] = KERN_PROC_PATHNAME;  mib[3] = -1;
					size_t len = sizeof(exePath);
					if (sysctl(mib, 4, exePath, &len, NULL, 0) != 0)
						exePath[0] = '\0';
				#elif defined(EIF_SOLARIS)
					char exePath[PATH_MAX];
					if (realpath(getexecname(), exePath) == NULL)
						exePath[0] = '\0';
				#else
						/* Linux */
					char exePath[PATH_MAX];
					size_t len = readlink("/proc/self/exe", exePath, sizeof(exePath));
					if (len == -1 || len == sizeof(exePath))
						len = 0;
					exePath[len] = '\0';
				#endif
				EIF_INTEGER l_result = strlen(exePath) + 1;
				if (l_result <= $a_count)
					strcpy($a_ptr, exePath);
				return l_result;
			]"
		ensure
			instance_free: class
		end
		
end
