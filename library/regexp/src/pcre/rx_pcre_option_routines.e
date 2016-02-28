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

	null_option: INTEGER = 0
			-- Null option

feature -- Status report

	is_option_caseless (an_option: INTEGER): BOOLEAN
			-- Is 'caseless' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // caseless_mask) \\ 2) = 1)
		end

	is_option_multiline (an_option: INTEGER): BOOLEAN
			-- Is 'multiline' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // multiline_mask) \\ 2) = 1)
		end

	is_option_dotall (an_option: INTEGER): BOOLEAN
			-- Is 'dotall' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // dotall_mask) \\ 2) = 1)
		end

	is_option_greedy (an_option: INTEGER): BOOLEAN
			-- Is 'greedy' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // greedy_mask) \\ 2) = 1)
		end

	is_option_extended (an_option: INTEGER): BOOLEAN
			-- Is 'extended' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // extended_mask) \\ 2) = 1)
		end

	is_option_undef (an_option: INTEGER): BOOLEAN
			-- Is 'undef' set in `an_option'?
		require
			valid_option: an_option >= null_option
		do
			Result := (((an_option // undef_mask) \\ 2) = 1)
		end

	is_option_ims (an_option: INTEGER): BOOLEAN
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

	set_option_caseless (an_option: INTEGER): INTEGER
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

	unset_option_caseless (an_option: INTEGER): INTEGER
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

	set_option_multiline (an_option: INTEGER): INTEGER
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

	unset_option_multiline (an_option: INTEGER): INTEGER
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

	set_option_dotall (an_option: INTEGER): INTEGER
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

	unset_option_dotall (an_option: INTEGER): INTEGER
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

	set_option_greedy (an_option: INTEGER): INTEGER
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

	unset_option_greedy (an_option: INTEGER): INTEGER
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

	set_option_extended (an_option: INTEGER): INTEGER
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

	unset_option_extended (an_option: INTEGER): INTEGER
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

	set_option_undef (an_option: INTEGER): INTEGER
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

	unset_option_undef (an_option: INTEGER): INTEGER
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

	to_option_ims (an_option: INTEGER): INTEGER
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

	caseless_mask: INTEGER = 1

	multiline_mask: INTEGER = 2

	dotall_mask: INTEGER = 4

	greedy_mask: INTEGER = 8

	extended_mask: INTEGER = 16

	undef_mask: INTEGER = 32

end
