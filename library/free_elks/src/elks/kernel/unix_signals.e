note
	description: "[
			Constants used for signal handling.
			This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	UNIX_SIGNALS

feature -- Access

	meaning (sig: INTEGER): detachable STRING
			-- A message in English describing what `sig' is
		do
			if is_defined (sig) then
				create Result.make_from_c (c_signal_name (sig))
			end
		ensure
			instance_free: class
		end

	is_defined (sig: INTEGER): BOOLEAN
			-- Is `sig' a signal defined for this platform?
		external
			"C use %"eif_sig.h%""
		alias
			"esigdefined"
		ensure
			instance_free: class
		end

	is_ignored (sig: INTEGER): BOOLEAN
			-- Is `sig' currently set to be ignored?
		do
			Result := not is_caught (sig)
		ensure
			instance_free: class
		end

	Sighup: INTEGER
			-- Code for `Hangup' signal
		once
			Result := c_signal_map (1)
		ensure
			instance_free: class
		end

	Sigint: INTEGER
			-- Code for `Interrupt' signal
		once
			Result := c_signal_map (2)
		ensure
			instance_free: class
		end

	Sigquit: INTEGER
			-- Code for `Quit' signal
		once
			Result := c_signal_map (3)
		ensure
			instance_free: class
		end

	Sigill: INTEGER
			-- Code for `Illegal instruction' signal
		once
			Result := c_signal_map (4)
		ensure
			instance_free: class
		end

	Sigtrap: INTEGER
			-- Code for `Trace trap' signal
		once
			Result := c_signal_map (5)
		ensure
			instance_free: class
		end

	Sigabrt: INTEGER
			-- Code for `Abort' signal
		once
			Result := c_signal_map (6)
		ensure
			instance_free: class
		end

	Sigiot: INTEGER
			-- Code for `IOT instruction' signal
		once
			Result := c_signal_map (7)
		ensure
			instance_free: class
		end

	Sigemt: INTEGER
			-- Code for `EMT instruction' signal
		once
			Result := c_signal_map (8)
		ensure
			instance_free: class
		end

	Sigfpe: INTEGER
			-- Code for `Floating point exception' signal
			--| (Already caught by Eiffel run-time)
		once
			Result := c_signal_map (9)
		ensure
			instance_free: class
		end

	Sigkill: INTEGER
			-- Code for `Terminator' signal
		once
			Result := c_signal_map (10)
		ensure
			instance_free: class
		end

	Sigbus: INTEGER
			-- Code for `Bus error' signal
		once
			Result := c_signal_map (11)
		ensure
			instance_free: class
		end

	Sigsegv: INTEGER
			-- Code for `Segmentation violation' signal
		once
			Result := c_signal_map (12)
		ensure
			instance_free: class
		end

	Sigsys: INTEGER
			-- Code for `Bad argument to system call' signal
		once
			Result := c_signal_map (13)
		ensure
			instance_free: class
		end

	Sigpipe: INTEGER
			-- Code for `Broken pipe' signal
		once
			Result := c_signal_map (14)
		ensure
			instance_free: class
		end

	Sigalrm: INTEGER
			-- Code for `Alarm clock' signal
		once
			Result := c_signal_map (15)
		ensure
			instance_free: class
		end

	Sigterm: INTEGER
			-- Code for `Software termination' signal
		once
			Result := c_signal_map (16)
		ensure
			instance_free: class
		end

	Sigusr1: INTEGER
			-- Code for `User-defined signal #1'
		once
			Result := c_signal_map (17)
		ensure
			instance_free: class
		end

	Sigusr2: INTEGER
			-- Code for `User-defined signal #2'
		once
			Result := c_signal_map (18)
		ensure
			instance_free: class
		end

	Sigchld: INTEGER
			-- Code for `Death of a child' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (19)
		ensure
			instance_free: class
		end

	Sigcld: INTEGER
			-- Code for `Death of a child' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (20)
		ensure
			instance_free: class
		end

	Sigio: INTEGER
			-- Code for `Pending I/O on a descriptor' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (21)
		ensure
			instance_free: class
		end

	Sigpoll: INTEGER
			-- Code for `Selectable event pending' signal
		once
			Result := c_signal_map (22)
		ensure
			instance_free: class
		end

	Sigttin: INTEGER
			-- Code for `Tty input from background' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (23)
		ensure
			instance_free: class
		end

	Sigttou: INTEGER
			-- Code for `Tty output from background' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (24)
		ensure
			instance_free: class
		end

	Sigstop: INTEGER
			-- Code for `Stop' signal
		once
			Result := c_signal_map (25)
		ensure
			instance_free: class
		end

	Sigtstp: INTEGER
			-- Code for `Stop from tty' signal
		once
			Result := c_signal_map (26)
		ensure
			instance_free: class
		end

	Sigxcpu: INTEGER
			-- Code for `Cpu time limit exceeded' signal
		once
			Result := c_signal_map (27)
		ensure
			instance_free: class
		end

	Sigxfsz: INTEGER
			-- Code for `File size limit exceeded' signal
		once
			Result := c_signal_map (28)
		ensure
			instance_free: class
		end

	Sigvtalarm: INTEGER
			-- Code for `Virtual time alarm' signal
		once
			Result := c_signal_map (29)
		ensure
			instance_free: class
		end

	Sigpwr: INTEGER
			-- Code for `Power-fail' signal
		once
			Result := c_signal_map (30)
		ensure
			instance_free: class
		end

	Sigprof: INTEGER
			-- Code for `Profiling timer alarm' signal
		once
			Result := c_signal_map (31)
		ensure
			instance_free: class
		end

	Sigwinch: INTEGER
			-- Code for `Window size changed' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (32)
		ensure
			instance_free: class
		end

	Sigwind: INTEGER
			-- Code for `Window change' signal
		once
			Result := c_signal_map (33)
		ensure
			instance_free: class
		end

	Sigphone: INTEGER
			-- Code for `Line status change' signal
		once
			Result := c_signal_map (34)
		ensure
			instance_free: class
		end

	Siglost: INTEGER
			-- Code for `Resource lost' signal
		once
			Result := c_signal_map (35)
		ensure
			instance_free: class
		end

	Sigurg: INTEGER
			-- Code for `Urgent condition on socket' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (36)
		ensure
			instance_free: class
		end

	Sigcont: INTEGER
			-- Code for `Continue after stop' signal.
			-- Signal ignored by default
		once
			Result := c_signal_map (37)
		ensure
			instance_free: class
		end

feature -- Status report

	signal: INTEGER
			-- Code of last signal
		external
			"C use %"eif_sig.h%""
		alias
			"esignum"
		ensure
			instance_free: class
		end

feature -- Status setting

	catch (sig: INTEGER)
			-- Make sure that future occurrences of `sig'
			-- will be treated as exceptions.
			-- (This is the default for all signals.)
			-- No effect if signal not defined.
		external
			"C use %"eif_sig.h%""
		alias
			"esigcatch"
		ensure
			instance_free: class
		end

	ignore (sig: INTEGER)
			-- Make sure that future occurrences of `sig'
			-- will be ignored. (This is not the default.)
			-- No effect if signal not defined.
		external
			"C use %"eif_sig.h%""
		alias
			"esigignore"
		ensure
			instance_free: class
		end

	reset_all_default
			-- Make sure that all exceptions will lead to their
			-- default handling.
		external
			"C use %"eif_sig.h%""
		alias
			"esigresall"
		ensure
			instance_free: class
		end

	reset_default (sig: INTEGER)
			-- Make sure that exception of code code will lead
			-- to its default action.
		require
			is_defined (sig)
		external
			"C use %"eif_sig.h%""
		alias
			"esigresdef"
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	is_caught (sig: INTEGER): BOOLEAN
			-- Is `sig' currently set to be caught?
		external
			"C use %"eif_sig.h%""
		alias
			"esigiscaught"
		ensure
			instance_free: class
		end

	c_signal_map (i: INTEGER): INTEGER
		external
			"C use %"eif_sig.h%""
		alias
			"esigmap"
		ensure
			instance_free: class
		end

	c_signal_name (i: INTEGER): POINTER
		external
			"C use %"eif_sig.h%""
		alias
			"esigname"
		ensure
			instance_free: class
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
