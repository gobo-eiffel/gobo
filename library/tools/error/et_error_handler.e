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
--			report_error (an_error)
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

feature -- Validity errors

	report_gagp_error (where: ET_CLASS; anc1, anc2: ET_CLASS_TYPE) is
			-- Report GAGP error (Ancestor Generic Parameter mismatch):
			-- `anc1' and `anc2' are two ancestors of `where' with
			-- different generic parameters.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			anc1_not_void: anc1 /= Void
			anc2_not_void: anc2 /= Void
			same_base: anc1.base_class = anc2.base_class
		do
			if reportable_gagp_error (where) then
				print ("[GAGP] Class ")
				print (where.name.name)
				print (": ancestors with generic parameter mismatch: ")
				print (anc1.to_string)
				print (" and ")
				print (anc2.to_string)
				print (".%N")
			end
		end
			
	report_vcfg3_error (where: ET_CLASS; a_type: ET_TYPE) is
			-- Report VCFG-3 error (ETR p.16): invalid
			-- type `a_type' in constraint of formal
			-- generic parameter of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			print ("[VCFG-3] Class ")
			print (where.name.name)
			print (" (")
			print (a_type.position.line)
			print (",")
			print (a_type.position.column)
			print ("): invalid type '")
			print (a_type.to_string)
			print ("' in constraint of formal generic parameter.%N")
		end

	report_vcfg3_bitn_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VCFG-3 error (ETR p.16): invalid
			-- type `a_type' in constraint of formal
			-- generic parameter of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if False then
				print ("[VCFG-3] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_string)
				print ("' in constraint of formal generic parameter.%N")
			end
		end

	report_vhpr1_error (where: ET_CLASS; cycle: DS_LIST [ET_CLASS]) is
			-- Report VHPR-1 error (ETL2 p.79): `where' is 
			-- involved in the inheritance cycle `cycle'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			cycle_not_void: cycle /= Void
			no_void_class: not cycle.has (Void)
			cycle_not_empty: not cycle.is_empty
		local
			a_cursor: DS_LIST_CURSOR [ET_CLASS]
		do
			print ("[VHPR-1] Class ")
			print (where.name.name)
			print (": inheritance cycle ")
			a_cursor := cycle.new_cursor
			a_cursor.start
			print (a_cursor.item.name.name)
			a_cursor.forth
			from until a_cursor.after loop
				print (" -> ")
				print (a_cursor.item.name.name)
				a_cursor.forth
			end
			print (".%N")
		end

	report_vhpr3_error (where: ET_CLASS; a_type: ET_TYPE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			print ("[VHPR-3] Class ")
			print (where.name.name)
			print (" (")
			print (a_type.position.line)
			print (",")
			print (a_type.position.column)
			print ("): invalid type '")
			print (a_type.to_string)
			print ("' in parent clause.%N")
		end

	report_vhpr3_bitn_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if False then
				print ("[VHPR-3] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_string)
				print ("' in parent clause.%N")
			end
		end

	report_vtbt_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VTBT error (ETL2 p.210, ETR p.47): size
			-- for Bit_type must be a positive integer constant
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			print ("[VTBT] Class ")
			print (where.name.name)
			print (" (")
			print (a_type.position.line)
			print (",")
			print (a_type.position.column)
			print ("): invalid type '")
			print (a_type.to_string)
			print ("': bit size must be a positive integer constant.%N")
		end

	report_vtct_error (where: ET_CLASS; a_type: ET_CLASS_TYPE) is
			-- Report VTCT error (ETL2 p.199): `a_type' based
			-- on unknown class in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtct_error (where) then
				print ("[VTCT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): type based on unknown class ")
				print (a_type.class_name.name)
				print (".%N")
			end
		end

	report_vtct_any_error (where: ET_CLASS) is
			-- Report VTCT error (ETL2 p.199): class `where'
			-- implicitly inherit from unknown class ANY.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			if reportable_vtct_error (where) then
				print ("[VTCT] Class ")
				print (where.name.name)
				print (": implicitly inherit from unknown class ANY.%N")
			end
		end

	report_vtcg_error (where: ET_CLASS; an_actual, a_constraint: ET_TYPE) is
			-- Report VTCG error (ETL2 p.203, ETR p.46): actual
			-- generic paramater `an_actual' in class `where'
			-- does not conform to constraint `a_constraint'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_actual_not_void: an_actual /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			if reportable_vtcg_error (where) then
				print ("[VTCG] Class ")
				print (where.name.name)
				print (" (")
				print (an_actual.position.line)
				print (",")
				print (an_actual.position.column)
				print ("): actual generic parameter ")
				print (an_actual.to_string)
				print (" does not conform to constraint ")
				print (a_constraint.to_string)
				print (".%N")
			end
		end

	report_vtug1_error (where: ET_CLASS; a_type: ET_CLASS_TYPE) is
			-- Report VTUG-1 error (ETL2 p.201, ETR p.46): `a_type',
			-- which appears in source code of class `where', has
			-- actual generic parameters but its base class is not
			-- generic.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtug1_error (where) then
				print ("[VTUG-1] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): type ")
				print (a_type.to_string)
				print (" has actual generic parameters but class ")
				print (a_type.class_name.name)
				print (" is not generic.%N")
			end
		end

	report_vtug2_error (where: ET_CLASS; a_type: ET_CLASS_TYPE) is
			-- Report VTUG-2 error (ETL2 p.201, ETR p.46): `a_type',
			-- which appears in source code of class `where', has
			-- the wrong number of actual generic parameters.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtug2_error (where) then
				print ("[VTUG-2] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): type ")
				print (a_type.to_string)
				print (" has wrong number of actual generic parameters.%N")
			end
		end

feature -- Status report

	reportable_gagp_error (where: ET_CLASS): BOOLEAN is
			-- Can a GAGP error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vtcg_error (where: ET_CLASS): BOOLEAN is
			-- Can a VTCG error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vtct_error (where: ET_CLASS): BOOLEAN is
			-- Can a VTCT error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vtug1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VTUG-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vtug2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VTUG-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

feature {NONE}

	in_system (a_class: STRING): BOOLEAN is
		do
			Result := classes_in_system.has (a_class)
		end

	classes_in_system: HASH_TABLE [ANY, STRING] is
		local
			a_file: PLAIN_TEXT_FILE
		once
			!! Result.make (6000)
			!! a_file.make ("system.txt")
			a_file.open_read
			from
			until
				a_file.end_of_file
			loop
				a_file.read_line
				Result.put (Void, clone (a_file.last_string))
			end
			a_file.close
		end

end -- class ET_ERROR_HANDLER
