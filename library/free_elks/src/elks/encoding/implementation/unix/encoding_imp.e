note
	description: "[
			Encoding conversion implementation on Unix. The cache is never freed in the library. 
			It relies on the normal termination of the client process.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ENCODING_IMP

inherit
	ENCODING_I

	CODE_SETS
		export
			{NONE} all
		end

	EXCEPTION_MANAGER_FACTORY
		export
			{NONE} all
		end

feature -- String encoding convertion

	convert_to (a_from_code_page: READABLE_STRING_8; a_from_string: READABLE_STRING_GENERAL; a_to_code_page: READABLE_STRING_8)
			-- Convert `a_from_string' of `a_from_code_page' to a string of `a_to_code_page'.
		local
			l_managed_pointer: MANAGED_POINTER
			l_count: INTEGER
			l_pointer: POINTER
			l_out_count: INTEGER
			l_string_32: STRING_32
			l_string_8: STRING_8
			l_big_endian: BOOLEAN
			l_error: INTEGER
			l_retried: BOOLEAN
			l_converted: READABLE_STRING_GENERAL
			l_exception: detachable EXCEPTION
		do
			if not l_retried then
				l_big_endian := is_big_endian_code_page (a_from_code_page) or else (not is_little_endian and not is_little_endian_code_page (a_from_code_page))
				if is_four_byte_code_page (a_from_code_page) then
					l_string_32 := a_from_string.as_string_32.twin
					if not descriptor_cache.converted (a_from_code_page, a_to_code_page) then
						l_string_32.precede
							(if l_big_endian xor is_little_endian then
								byte_order_mark
							else
								byte_order_mark_32_reverse
							end)
					end
					l_managed_pointer := string_32_to_pointer (l_string_32)
					l_count := l_string_32.count * 4
				elseif is_two_byte_code_page (a_from_code_page) then
					l_string_32 := a_from_string.as_string_32.twin
					if not descriptor_cache.converted (a_from_code_page, a_to_code_page) then
						l_string_32.precede
							(if l_big_endian xor is_little_endian then
								byte_order_mark
							else
								byte_order_mark_16_reverse
							end)
					end
					l_managed_pointer := wide_string_to_pointer (l_string_32)
					l_count := l_string_32.count * 2
				else
					if a_from_string.is_valid_as_string_8 then
						l_string_8 := a_from_string.to_string_8
					else
						l_string_8 := {UTF_CONVERTER}.utf_32_string_to_utf_8_string_8 (a_from_string)
					end
					l_managed_pointer := multi_byte_to_pointer (l_string_8)
					l_count := l_string_8.count
				end
				l_pointer := iconv_imp (a_from_code_page, a_to_code_page, l_managed_pointer.item, l_count, $l_out_count, $l_error)
				if l_error = 0 and l_pointer /= default_pointer then
					last_conversion_successful := True
					if is_four_byte_code_page (a_to_code_page) then
						l_string_32 := pointer_to_string_32 (l_pointer, l_out_count)
						if not l_string_32.is_empty then
							if same_endian (l_string_32.code (1)) then
								l_string_32 := l_string_32.substring (2, l_string_32.count)
								if (is_big_endian_code_page (a_to_code_page) and is_little_endian) or else
									(is_little_endian_code_page (a_to_code_page) and not is_little_endian)
								then
									l_string_32 := string_32_switch_endian (l_string_32)
								end
							elseif reverse_endian (l_string_32.code (1)) then
								l_string_32 := l_string_32.substring (2, l_string_32.count)
								if (is_little_endian_code_page (a_to_code_page) and is_little_endian) or else
									(is_big_endian_code_page (a_to_code_page) and not is_little_endian) or else
									not is_endianness_specified (a_to_code_page)
								then
									l_string_32 := string_32_switch_endian (l_string_32)
								end
							end
						end
						l_converted := l_string_32
					elseif is_two_byte_code_page (a_to_code_page) then
						l_string_32 := pointer_to_wide_string (l_pointer, l_out_count)
						if not l_string_32.is_empty then
							if same_endian (l_string_32.code (1)) then
								l_string_32 := l_string_32.substring (2, l_string_32.count)
								if (is_big_endian_code_page (a_to_code_page) and is_little_endian) or else
									(is_little_endian_code_page (a_to_code_page) and not is_little_endian)
								then
									l_string_32 := string_16_switch_endian (l_string_32)
								end
							elseif reverse_endian (l_string_32.code (1)) then
								l_string_32 := l_string_32.substring (2, l_string_32.count)
								if (is_little_endian_code_page (a_to_code_page) and is_little_endian) or else
									(is_big_endian_code_page (a_to_code_page) and not is_little_endian) or else
									not is_endianness_specified (a_to_code_page)
								then
									l_string_32 := string_16_switch_endian (l_string_32)
								end
							end
						end
						last_was_wide_string := True
						l_converted := l_string_32
					else
						l_converted := pointer_to_multi_byte (l_pointer, l_out_count)
					end
					last_converted_string := l_converted
				else
					last_conversion_successful := False
				end
					-- Even in the case of an error `l_pointer` might not be NULL.
				if l_pointer /= default_pointer then
					l_pointer.memory_free
				end
			end
		rescue
			l_retried := True
			if l_pointer /= default_pointer then
				l_pointer.memory_free
			end
			l_exception := exception_manager.last_exception
			if l_exception /= Void and then attached {CONVERSION_FAILURE} l_exception.original as l_failure then
					-- In the future, a proper mechanism should be worked out
					-- to reflect such internal errors. For now the rescue
					-- is mostly for debugging.
				retry
			end
		end

feature -- Status report

	is_code_page_valid (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' valid?
			-- We don't care this on Unix. What we are really interested is `is_code_page_convertible'.
		do
			if a_code_page /= Void and then not a_code_page.is_empty then
				Result := is_known_code_page (a_code_page)
			end
		end

	is_code_page_convertible (a_from_code_page, a_to_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_from_code_page' convertible to `a_to_code_page'.
		local
			l_error: INTEGER
			l_retried: BOOLEAN
		do
			if not l_retried then
				Result := is_codeset_convertible (a_from_code_page, a_to_code_page, $l_error)
				if l_error /= 0 then
					conversion_exception (l_error).raise
				end
			end
		rescue
				-- In the future, a proper mechanism should be worked out
				-- to reflect such internal errors. For now the rescue
				-- is mostly for debugging.
			Result := False
			l_retried := True
			retry
		end

	last_conversion_lost_data: BOOLEAN
			-- Did last conversion lose data?
			-- | When there is data lose, internal exception is raised
			-- | and handled. The conversion simply fails.
		do
			Result := not last_conversion_successful
		end

feature {NONE} -- Status report

	is_known_code_page (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' a known code page?
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		local
			l_error: INTEGER
			l_retried: BOOLEAN
		do
			if not l_retried then
				if not a_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf8) then
					Result := c_codeset_valid (a_code_page, $l_error)
					if l_error /= 0 then
						conversion_exception (l_error).raise
					end
				else
					Result := True
				end
			end
		rescue
				-- In the future, a proper mechanism should be worked out
				-- to reflect such internal errors. For now the rescue
				-- is mostly for debugging.
			Result := False
			l_retried := True
			retry
		end

	is_two_byte_code_page (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' a known code page?
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		do
			Result := two_byte_code_pages.has (a_code_page)
		end

	is_four_byte_code_page (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' a known code page?
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		do
			Result := four_byte_code_pages.has (a_code_page)
		end

	is_big_endian_code_page (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' a known code page?
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		do
			Result := big_endian_code_pages.has (a_code_page)
		end

	is_little_endian_code_page (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' a known code page?
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		do
			Result := little_endian_code_pages.has (a_code_page)
		end

	is_endianness_specified (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page' endianness specified?
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		do
			Result := is_big_endian_code_page (a_code_page) or else is_little_endian_code_page (a_code_page)
		end

feature {NONE} -- Cache

	descriptor_cache: DESCRIPTOR_CACHE
			-- Cache
		once
			create Result.make
		end

feature {NONE} -- Implementation

	iconv_imp (a_from_code_page, a_to_code_page: READABLE_STRING_8; a_str: POINTER; a_size: INTEGER; a_out_count, a_error_code: TYPED_POINTER [INTEGER]): POINTER
			-- `iconv' plus setup and caching.
		require
			a_from_code_page_valid: is_code_page_valid (a_from_code_page)
			a_to_code_page_valid: is_code_page_valid (a_to_code_page)
			code_page_convertible: is_code_page_convertible (a_from_code_page, a_to_code_page)
		do
			descriptor_cache.search (a_from_code_page + a_to_code_page)
			check found: descriptor_cache.found end
			Result := c_iconv (descriptor_cache.found_item, a_str, a_size, a_out_count, a_error_code)
			descriptor_cache.record_converted_pair (a_from_code_page, a_to_code_page)
		end

	is_codeset_convertible (a_from_code_page, a_to_code_page: READABLE_STRING_8; a_error: TYPED_POINTER [INTEGER]): BOOLEAN
			-- Is `a_from_codeset' and `a_to_codeset' convertible?
		local
			l_fp, l_tp: MANAGED_POINTER
			l_key: READABLE_STRING_8
			l_cd: POINTER
			l_succ: BOOLEAN
		do
			l_key := a_from_code_page + a_to_code_page
			descriptor_cache.search (l_key)
			if descriptor_cache.found then
				Result := True
			else
				l_fp := multi_byte_to_pointer (a_from_code_page)
				l_tp := multi_byte_to_pointer (a_to_code_page)
				l_cd := c_iconv_open (l_fp.item, l_tp.item, a_error, $l_succ)
				if l_succ then
					descriptor_cache.put (l_cd, l_key)
					Result := True
				end
			end
		end

	c_codeset_valid (a_code_set: READABLE_STRING_8; a_error: TYPED_POINTER [INTEGER]): BOOLEAN
			-- Check if `a_code_set' is convertible to utf-8 to see if it is valid.
			-- Some systems do not support utf-8 to utf-8 conversion, so checking utf-8
			-- should be avoided.
		do
			Result := is_codeset_convertible (a_code_set, "utf-8", a_error)
		end

	same_endian (code: NATURAL_32): BOOLEAN
			-- The same endianness with the sys?
		do
			Result := code = 0xFEFF
		end

	reverse_endian (code: NATURAL_32): BOOLEAN
			-- Reverse endianness with the sys?
		do
			Result := code = 0xFFFE or code = 0xFFFE0000
		end

	string_32_to_pointer (a_string: READABLE_STRING_32): MANAGED_POINTER
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			new_size: INTEGER
			l_end_pos, l_start_pos: INTEGER
		do
			l_start_pos := 1
			l_end_pos := a_string.count
			create Result.make ((l_end_pos + 1) * 4)
			nb := l_end_pos - l_start_pos + 1

			new_size := (nb + 1) * 4

			if Result.count < new_size  then
				Result.resize (new_size)
			end

			from
				i := 0
			until
				i = nb
			loop
				Result.put_natural_32 (a_string.code (i + l_start_pos), i * 4)
				i := i +  1
			end
			Result.put_natural_32 (0, i * 4)
		end

	byte_order_mark: CHARACTER_32
			-- Byte order mark (BOM)
		once
			Result := (0xFEFF).to_character_32
		end

	byte_order_mark_32_reverse: CHARACTER_32
			-- Byte order mark (BOM)
		once
			Result := (0xFFFE0000).to_character_32
		end

	byte_order_mark_16_reverse: CHARACTER_32
			-- Byte order mark (BOM)
		once
			Result := (0xFFFE).to_character_32
		end

	conversion_exception (a_error:INTEGER): CONVERSION_FAILURE
			-- Create exception by `a_error'
		do
			inspect a_error
			when 1 then
				create Result.make_message ("`malloc' error")
			when 2 then
				create Result.make_message ("`realloc' error")
			when 3 then
				create Result.make_message ("`iconv_open' error")
			when 4 then
				create Result.make_message ("EILSEQ error in `iconv'. Input conversion stopped due to an input byte that does not belong to the input codeset.")
			when 5 then
				create Result.make_message ("EINVAL error in `iconv'. Input conversion stopped due to an incomplete character or shift sequence at the end of the input buffer.")
			when 6 then
				create Result.make_message ("EBADF error in `iconv'. The cd argument is not a valid open conversion descriptor.")
			when 7 then
				create Result.make_message ("Unexpected error in `iconv'")
			when 8 then
				create Result.make_message ("`iconv_close' error")
			else
				create Result.make_message ("Unexpected error")
			end
		ensure
			conversion_exception_not_void: Result /= Void
		end

	c_iconv_open (a_from_codeset, a_to_codeset: POINTER; a_b: TYPED_POINTER [INTEGER]; a_succ: TYPED_POINTER [BOOLEAN]): POINTER
			-- Open a descriptor
		external
			"C inline use <iconv.h>"
		alias
			"[
				iconv_t cd;
				
				cd = iconv_open ($a_to_codeset, $a_from_codeset);
				if (cd == (iconv_t)(-1)) {
					*$a_b = 3;
					return NULL;
				}
				*$a_succ = EIF_TRUE;
				return cd;
			]"
		end

	c_iconv (a_cd: POINTER; a_str: POINTER; a_size: INTEGER; a_out_count, a_error_code: TYPED_POINTER [INTEGER]): POINTER
			-- Code `a_error_code' could be set when error occurs.
			-- See `conversion_exception' for the meaning.
		external
			"C inline use <iconv.h>"
		alias
			"[
				size_t insize = 0;
				iconv_t cd = (iconv_t) $a_cd;
				size_t nconv, avail, alloc;
				char *res, *tres, *wrptr, *inptr;
				char **l_inptr = &inptr;
				
				insize = (size_t)$a_size;
				alloc = avail = insize + insize/4;
				
				if (!(res = malloc(alloc))) {
					*$a_error_code = 1;
					return NULL;
				} else {
					*$a_error_code = 0;
					wrptr = res;   /* duplicate pointers because they */
					inptr = $a_str; /* get modified by iconv */
					
					/* Reset the descriptor to intial state. */
					iconv (cd, NULL, 0, NULL, 0);
					
					do {				
						nconv = iconv (cd, l_inptr, &insize, &wrptr, &avail); /*convertions */
						
						if (nconv == (size_t)(-1)) {
							if (errno == E2BIG) { /* need more room for result */							
								tres = realloc(res, alloc += 20);
								avail += 20;
								if (!tres) {
									*$a_error_code = 2;
									break;
								}
								wrptr = tres + (wrptr - res);
								res = tres;
							}
							else if (errno == EILSEQ) {
								*$a_error_code = 4;
								break;
							}
							else if (errno == EINVAL){
								*$a_error_code = 5;
								break;
							}
							else if (errno == EBADF){
								*$a_error_code = 6;
								break;
							}
							else{
								*$a_error_code = 7;
								break;
							}
						}
					} while (insize);
					
					*$a_out_count = alloc - avail;
					
					return res;
				}
			]"
		end

note
	ca_ignore: "CA011", "CA011: too many arguments"
	library:   "Encoding: Library of reusable components for Eiffel."
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
