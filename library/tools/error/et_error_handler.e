indexing

	description:

		"Error handlers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER

creation

	make_standard, make_null

feature -- Syntax errors

	report_syntax_error (p: ET_POSITION) is
			-- Report a syntax error.
		require
			p_not_void: p /= Void
		local
			an_error: ET_SYNTAX_ERROR
		do
			!! an_error.make (p)
			report_error (an_error)
		end

	report_SCAC_error (p: ET_POSITION) is
			-- Missing ASCII code in special character
			-- specification %/code/ in character constant.
			-- (SCAC: Syntax Character Ascii Code)
		require
			p_not_void: p /= Void
		do
		end

	report_SCAS_error (p: ET_POSITION) is
			-- Missing character / at end of special character
			-- specification %/code/ in character constant.
			-- (SCAS: Syntax Character Ascii-code Slash)
		require
			p_not_void: p /= Void
		do
		end

	report_SCCU_error (p: ET_POSITION) is
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in character constant.
			-- (SSCU: Syntax Character special-Character Upper-case)
		require
			p_not_void: p /= Void
		do
		end

	report_SCEQ_error (p: ET_POSITION) is
			-- Missing quote at end of character constant.
			-- (SCEQ: Syntax Character End Quote)
		require
			p_not_void: p /= Void
		do
		end

	report_SCQQ_error (p: ET_POSITION) is
			-- Missing character between quotes in character constant.
			-- (SCQQ: Syntax Character Quote Quote)
		require
			p_not_void: p /= Void
		do
		end

	report_SCSC_error (p: ET_POSITION) is
			-- Invalid special character %l in character constant.
			-- (SCSC: Syntax Character Special Character)
		require
			p_not_void: p /= Void
		do
		end

	report_SCTQ_error (p: ET_POSITION) is
			-- Character quote should be declared as '%''
			-- and not as ''' in character constant.
			-- (SCTQ: Syntax Character Triple-Quote)
		require
			p_not_void: p /= Void
		do
		end

	report_SIFU_error (p: ET_POSITION) is
			-- An underscore may not be the first character
			-- of an integer constant. (ETL2 p.420)
			-- (SIFU: Syntax Integer First Underscore)
		require
			p_not_void: p /= Void
		do
		end

	report_SITD_error (p: ET_POSITION) is
			-- An underscore must be followed by three digits
			-- and there must not be any consecutive group of
			-- four digits in integer constant. (ETL2 p.420)
			-- (SITD: Syntax Integer Three Digits)
		require
			p_not_void: p /= Void
		do
		end

	report_SSAC_error (p: ET_POSITION) is
			-- Missing ASCII code in special character
			-- specification %/code/ in manifest string.
			-- (SSAC: Syntax String Ascii Code)
		require
			p_not_void: p /= Void
		do
		end

	report_SSAS_error (p: ET_POSITION) is
			-- Missing character / at end of special character
			-- specification %/code/ in manifest string.
			-- (SSAS: Syntax String Ascii-code Slash)
		require
			p_not_void: p /= Void
		do
		end

	report_SSCU_error (p: ET_POSITION) is
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in manifest strings.
			-- (SSCU: Syntax String special-Character Upper-case)
		require
			p_not_void: p /= Void
		do
		end

	report_SSEL_error (p: ET_POSITION) is
			-- Empty line in middle of multi-line manifest string.
			-- (SSEL: Syntax String Empty Line)
		require
			p_not_void: p /= Void
		local
			an_error: ET_SSEL_ERROR
		do
			!! an_error.make (p)
--			report_error (an_error)
		end

	report_SSEQ_error (p: ET_POSITION) is
			-- Missing double quote at end of manifest string.
			-- (SSEQ: Syntax String End double-Quote)
		require
			p_not_void: p /= Void
		do
		end

	report_SSNL_error (p: ET_POSITION) is
			-- Invalid new-line in middle of manifest string.
			-- (SSNL: Syntax String New-Line)
		require
			p_not_void: p /= Void
		do
		end

	report_SSNP_error (p: ET_POSITION) is
			-- Missing character % at beginning of
			-- line in multi-line manifest string.
			-- (SSNP: Syntax String New-line Percent)
		require
			p_not_void: p /= Void
		do
		end

	report_SSNS_error (p: ET_POSITION) is
			-- No space allowed after character % at end
			-- of line in multi-line manifest strings.
			-- (SSNS: Syntax String New-line Space)
		require
			p_not_void: p /= Void
		do
		end

	report_SSSC_error (p: ET_POSITION) is
			-- Invalid special character %l in manifest strings.
			-- (SSSC: Syntax String Special Character)
		require
			p_not_void: p /= Void
		do
		end

end -- class ET_ERROR_HANDLER
