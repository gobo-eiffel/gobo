indexing

	description:

		"Error handlers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER

creation

	make_standard, make_null

feature -- Status report

	is_ise: BOOLEAN

	is_hact: BOOLEAN

	is_se: BOOLEAN

	is_ve: BOOLEAN

	is_gelint: BOOLEAN

	is_pedantic: BOOLEAN

	set_compilers is
		do
			is_ise := True
			is_hact := True
			is_se := True
			is_gelint := True
		end

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
			
	report_vcfg1_error (where: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER; a_class: ET_CLASS) is
			-- Report VCFG-1 error (ETL2 p.52, ETR p.16): the formal
			-- generic parameter `a_formal' in class `where' has the
			-- same name as class `a_class' in the surrounding universe.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_formal_not_void: a_formal /= Void
			a_class_not_void: a_class /= Void
			a_class_in_universe: a_class.is_parsed
		do
			print ("[VCFG-1] Class ")
			print (where.name.name)
			print (" (")
			print (a_formal.name.position.line)
			print (",")
			print (a_formal.name.position.column)
			print ("): formal generic parameter '")
			print (a_formal.name.name)
			print ("' has the same name as a class in the surrounding universe.%N")
		end

	report_vcfg2_error (where: ET_CLASS; formal1, formal2: ET_FORMAL_GENERIC_PARAMETER) is
			-- Report VCFG-2 error (ETL2 p.52, ETR p.16): a formal
			-- generic name is declared twice in generic class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			formal1_not_void: formal1 /= Void
			formal2_not_void: formal2 /= Void
		do
			print ("[VCFG-2] Class ")
			print (where.name.name)
			print (" (")
			print (formal1.name.position.line)
			print (",")
			print (formal1.name.position.column)
			print ("): '")
			print (formal1.name.name)
			print ("' is the name of formal generic parameters #")
			print (formal1.index)
			print (" and #")
			print (formal2.index)
			print (".%N")
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

	report_vcfg3a_error (where: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER;
		a_constraint: ET_FORMAL_GENERIC_TYPE) is
			-- Report VCFG-3 error (ETR p.16): the constraint of
			-- `a_formal' in class `where' is the formal generic
			-- parameter itself.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		local
			old_ise, old_ve: BOOLEAN
		do
			if is_hact or is_se then
				old_ise := is_ise
				old_ve := is_ve
				is_ise := False
				is_ve := False
				report_vtct_error (where, a_constraint)
				is_ise := old_ise
				is_ve := old_ve
			end
			if reportable_vcfg3_error (where) then
				if is_ise or is_gelint then
					print_compiler (is_ise, Question_tag, False, No_tag,
						False, No_tag, False, No_tag)
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_constraint.position.line)
					print (",")
					print (a_constraint.position.column)
					print ("): constraint of formal generic parameter '")
					print (a_formal.name.name)
					print ("' is '")
					print (a_formal.name.name)
					print ("' itself.%N")
				end
			end
		end

	report_vcfg3b_error (where: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER;
		a_constraint: ET_FORMAL_GENERIC_TYPE) is
			-- Report VCFG-3 error (ETR p.16): the constraint of
			-- `a_formal' in class `where' is another formal generic
			-- parameter appearing before `a_formal' in the list
			-- of formal generic parameters.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		do
			if reportable_vcfg3_error (where) then
				if is_ise or is_hact then
					print_compiler (is_ise, Question_tag,
						is_hact, Question_tag,
						False, No_tag, False, No_tag)
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_constraint.position.line)
					print (",")
					print (a_constraint.position.column)
					print ("): constraint of formal generic parameter '")
					print (a_formal.name.name)
					print ("' is another formal generic parameter '")
					print (a_constraint.to_string)
					print ("'.%N")
				end
			end
		end

	report_vcfg3c_error (where: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER;
		a_constraint: ET_FORMAL_GENERIC_TYPE) is
			-- Report VCFG-3 error (ETR p.16): the constraint of
			-- `a_formal' in class `where' is another formal generic
			-- parameter appearing after `a_formal' in the list
			-- of formal generic parameters.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		local
			old_se, old_ve: BOOLEAN
		do
			if is_ise or is_hact then
				old_se := is_se
				old_ve := is_ve
				is_se := False
				is_ve := False
				report_vtct_error (where, a_constraint)
				is_se := old_se
				is_ve := old_ve
			end
		end

	report_vcfg3d_error (where: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_GENERIC_PARAMETER]) is
			-- Report VCFG-3 error (ETR p.16): the constraints of
			-- the formal generic parameters `a_cycle' of class
			-- `where' are involved in a cycle.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			a_cycle_not_empty: not a_cycle.is_empty
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_GENERIC_PARAMETER]
		do
			if reportable_vcfg3_error (where) then
				print_compiler (False, No_tag, False, No_tag,
					is_se, Question_tag, False, No_tag)
				if is_se or is_gelint then
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (": formal generic constraint cycle ")
					a_cursor := a_cycle.new_cursor
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
			end
		end

	report_vcfg3e_error (where: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER;
		a_type: ET_FORMAL_GENERIC_TYPE) is
			-- Report VCFG-3 error (ETR p.16): the constraint of
			-- `a_formal' in class `where' contains the formal
			-- generic parameter itself.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_formal_not_void: a_formal /= Void
			a_type_not_void: a_type /= Void
		local
			old_ise, old_ve: BOOLEAN
		do
			if is_hact or is_se then
				old_ise := is_ise
				old_ve := is_ve
				is_ise := False
				is_ve := False
				report_vtct_error (where, a_type)
				is_ise := old_ise
				is_ve := old_ve
			end
			if reportable_vcfg3_error (where) then
				if
					not (is_ise or is_hact or is_se or is_ve) and
					not is_gelint and is_pedantic
				then
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_type.position.line)
					print (",")
					print (a_type.position.column)
					print ("): constraint of formal generic parameter '")
					print (a_formal.name.name)
					print ("' contains '")
					print (a_type.to_string)
					print ("' itself.%N")
				end
			end
		end

	report_vcfg3f_error (where: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER;
		a_type: ET_FORMAL_GENERIC_TYPE) is
			-- Report VCFG-3 error (ETR p.16): the constraint of
			-- `a_formal' in class `where' contains another formal
			-- generic parameter appearing after `a_formal' in the
			-- list of formal generic parameters.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_formal_not_void: a_formal /= Void
			a_type_not_void: a_type /= Void
		local
			old_se, old_ve: BOOLEAN
		do
			if is_ise or is_hact then
				old_se := is_se
				old_ve := is_ve
				is_se := False
				is_ve := False
				report_vtct_error (where, a_type)
				is_se := old_se
				is_ve := old_ve
			end
		end

	report_vcfg3g_error (where: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_GENERIC_PARAMETER]) is
			-- Report VCFG-3 error (ETR p.16): the constraints of
			-- the formal generic parameters `a_cycle' of class
			-- `where' are involved in a cycle.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			a_cycle_not_empty: not a_cycle.is_empty
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_GENERIC_PARAMETER]
		do
			if reportable_vcfg3_error (where) then
				print_compiler (False, No_tag, False, No_tag,
					is_se, Question_tag, False, No_tag)
				if is_se then
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (": formal generic constraint cycle ")
					a_cursor := a_cycle.new_cursor
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
				-- No compiler so far.
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

	report_vtbt_minus_zero_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VTBT error (ETL2 p.210, ETR p.47): size
			-- for Bit_type must be a positive integer constant
			-- but it is actually equal to -0.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
				-- Only SmallEiffel.
			if False then
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

	report_vtct_error (where: ET_CLASS; a_type: ET_NAMED_TYPE) is
			-- Report VTCT error (ETL2 p.199, ETR p.45): `a_type'
			-- based on unknown class in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtct_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTCT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): type based on unknown class ")
				print (a_type.name.name)
				print (".%N")
			end
		end

	report_vtct_any_error (where: ET_CLASS) is
			-- Report VTCT error (ETL2 p.199, ETR p.45): class
			-- `where' implicitly inherit from unknown class ANY.
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

feature -- Validity status report

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

	reportable_vcfg3_error (where: ET_CLASS): BOOLEAN is
			-- Can a VCFG-3 error be reported when it
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

	print_compiler (ise: BOOLEAN; ise_tag: INTEGER;
		hact: BOOLEAN; hact_tag: INTEGER;
		se: BOOLEAN; se_tag: INTEGER;
		ve: BOOLEAN; ve_tag: INTEGER) is
		local
			not_first: BOOLEAN
		do
			if ise or hact or se or ve then
				print ("[")
				if ise then
					inspect ise_tag
					when No_tag then
					when Question_tag then
						print ("?")
					when Bang_tag then
						print ("!")
					end
					print ("ISE")
					not_first := True
				end
				if hact then
					if not_first then
						print (",")
					end
					inspect hact_tag
					when No_tag then
					when Question_tag then
						print ("?")
					when Bang_tag then
						print ("!")
					end
					print ("HACT")
					not_first := True
				end
				if se then
					if not_first then
						print (",")
					end
					inspect se_tag
					when No_tag then
					when Question_tag then
						print ("?")
					when Bang_tag then
						print ("!")
					end
					print ("SE")
					not_first := True
				end
				if ve then
					if not_first then
						print (",")
					end
					inspect ve_tag
					when No_tag then
					when Question_tag then
						print ("?")
					when Bang_tag then
						print ("!")
					end
					print ("VE")
				end
				print ("]")
			end
		end

	No_tag, Question_tag, Bang_tag: INTEGER is unique

	in_system (a_class: STRING): BOOLEAN is
		do
			Result := True
			--Result := classes_in_system.has (a_class)
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
