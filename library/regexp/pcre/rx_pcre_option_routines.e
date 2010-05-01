note

	description:

		"PCRE option routines"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_OPTION_ROUTINES

feature -- Access

	null_option: INTEGER is 0
			-- Null option

feature -- Status report

	is_option_caseless (an_option: INTEGER): BOOLEAN is
			-- Is 'caseless' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // caseless_mask) \\ 2) = 1)
		end

	is_option_multiline (an_option: INTEGER): BOOLEAN is
			-- Is 'multiline' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // multiline_mask) \\ 2) = 1)
		end

	is_option_dotall (an_option: INTEGER): BOOLEAN is
			-- Is 'dotall' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // dotall_mask) \\ 2) = 1)
		end

	is_option_greedy (an_option: INTEGER): BOOLEAN is
			-- Is 'greedy' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // greedy_mask) \\ 2) = 1)
		end

	is_option_extended (an_option: INTEGER): BOOLEAN is
			-- Is 'extended' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // extended_mask) \\ 2) = 1)
		end

	is_option_undef (an_option: INTEGER): BOOLEAN is
			-- Is 'undef' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // undef_mask) \\ 2) = 1)
		end

	is_option_ims (an_option: INTEGER): BOOLEAN is
			-- Is there no other flags than `caseless',
			-- `multiline' and `dotall' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // greedy_mask) \\ 2) = 0) and
				(((an_option // extended_mask) \\ 2) = 0) and
				(((an_option // undef_mask) \\ 2) = 0)
		ensure
			not_greedy: Result implies not is_option_greedy (an_option)
			not_extended: Result implies not is_option_extended (an_option)
			not_undef: Result implies not is_option_undef (an_option)
		end

feature -- Status setting

	set_option_caseless (an_option: INTEGER): INTEGER is
			-- Set 'caseless' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // caseless_mask) \\ 2) = 0) then
				Result := an_option + caseless_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			caseless_set: is_option_caseless (Result)
		end

	unset_option_caseless (an_option: INTEGER): INTEGER is
			-- Unset 'caseless' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // caseless_mask) \\ 2) = 1) then
				Result := an_option - caseless_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			caseless_unset: not is_option_caseless (Result)
		end

	set_option_multiline (an_option: INTEGER): INTEGER is
			-- Set 'multiline' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // multiline_mask) \\ 2) = 0) then
				Result := an_option + multiline_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			multiline_set: is_option_multiline (Result)
		end

	unset_option_multiline (an_option: INTEGER): INTEGER is
			-- Unset 'multiline' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // multiline_mask) \\ 2) = 1) then
				Result := an_option - multiline_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			multiline_unset: not is_option_multiline (Result)
		end

	set_option_dotall (an_option: INTEGER): INTEGER is
			-- Set 'dotall' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // dotall_mask) \\ 2) = 0) then
				Result := an_option + dotall_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			dotall_set: is_option_dotall (Result)
		end

	unset_option_dotall (an_option: INTEGER): INTEGER is
			-- Unset 'dotall' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // dotall_mask) \\ 2) = 1) then
				Result := an_option - dotall_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			dotall_unset: not is_option_dotall (Result)
		end

	set_option_greedy (an_option: INTEGER): INTEGER is
			-- Set 'greedy' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // greedy_mask) \\ 2) = 0) then
				Result := an_option + greedy_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			greedy_set: is_option_greedy (Result)
		end

	unset_option_greedy (an_option: INTEGER): INTEGER is
			-- Unset 'greedy' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // greedy_mask) \\ 2) = 1) then
				Result := an_option - greedy_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			greedy_unset: not is_option_greedy (Result)
		end

	set_option_extended (an_option: INTEGER): INTEGER is
			-- Set 'extended' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // extended_mask) \\ 2) = 0) then
				Result := an_option + extended_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			extended_set: is_option_extended (Result)
		end

	unset_option_extended (an_option: INTEGER): INTEGER is
			-- Unset 'extended' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // extended_mask) \\ 2) = 1) then
				Result := an_option - extended_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			extended_unset: not is_option_extended (Result)
		end

	set_option_undef (an_option: INTEGER): INTEGER is
			-- Set 'undef' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // undef_mask) \\ 2) = 0) then
				Result := an_option + undef_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			undef_set: is_option_undef (Result)
		end

	unset_option_undef (an_option: INTEGER): INTEGER is
			-- Unset 'undef' in `an_option'.
		require
			valid_option: an_option >= null_option
		do
			if (((an_option // undef_mask) \\ 2) = 1) then
				Result := an_option - undef_mask
			else
				Result := an_option
			end
		ensure
			valid_option: Result >= null_option
			undef_unset: not is_option_undef (Result)
		end

feature -- Conversion

	to_option_ims (an_option: INTEGER): INTEGER is
			-- Keep only `caseless', `multiline' and `dotall' flags.
		require
			valid_option: an_option >= null_option
		do
			Result := null_option
			if (((an_option // caseless_mask) \\ 2) = 1) then
				Result := Result + caseless_mask
			end
			if (((an_option // multiline_mask) \\ 2) = 1) then
				Result := Result + multiline_mask
			end
			if (((an_option // dotall_mask) \\ 2) = 1) then
				Result := Result + dotall_mask
			end
		ensure
			valid_option: Result >= null_option
			ims: is_option_ims (Result)
		end

feature {NONE} -- Constants

	caseless_mask: INTEGER is 1

	multiline_mask: INTEGER is 2

	dotall_mask: INTEGER is 4

	greedy_mask: INTEGER is 8

	extended_mask: INTEGER is 16

	undef_mask: INTEGER is 32

end
