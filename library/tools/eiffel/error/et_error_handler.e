indexing

	description:

		"Error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

feature -- Compilation report

	report_compilation_status (a_processor: ET_CLASS_PROCESSOR) is
			-- Report that `a_processor' is currently
			-- processing a class.
		require
			a_processor_not_void: a_processor /= Void
		do
--			if is_verbose then
--				print ("Degree ")
--				print (a_processor.degree)
--				print (" class ")
--				print (a_processor.current_class.name.name)
--				print ("%N")
--			end
		end

feature -- Syntax errors

	report_syntax_error (p: ET_POSITION) is
			-- Report a syntax error.
		require
			p_not_void: p /= Void
		local
			an_error: ET_SYNTAX_ERROR
		do
			create an_error.make (p)
			report_error (an_error)
		end

	report_SCAC_error (p: ET_POSITION) is
			-- Missing ASCII code in special character
			-- specification %/code/ in character constant.
			-- (SCAC: Syntax Character Ascii Code)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SCAS_error (p: ET_POSITION) is
			-- Missing character / at end of special character
			-- specification %/code/ in character constant.
			-- (SCAS: Syntax Character Ascii-code Slash)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SCCU_error (p: ET_POSITION) is
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in character constant.
			-- (SSCU: Syntax Character special-Character Upper-case)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SCEQ_error (p: ET_POSITION) is
			-- Missing quote at end of character constant.
			-- (SCEQ: Syntax Character End Quote)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SCQQ_error (p: ET_POSITION) is
			-- Missing character between quotes in character constant.
			-- (SCQQ: Syntax Character Quote Quote)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SCSC_error (p: ET_POSITION) is
			-- Invalid special character %l in character constant.
			-- (SCSC: Syntax Character Special Character)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SCTQ_error (p: ET_POSITION) is
			-- Character quote should be declared as '%''
			-- and not as ''' in character constant.
			-- (SCTQ: Syntax Character Triple-Quote)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SIFU_error (p: ET_POSITION) is
			-- An underscore may not be the first character
			-- of an integer constant. (ETL2 p.420)
			-- (SIFU: Syntax Integer First Underscore)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SITD_error (p: ET_POSITION) is
			-- An underscore must be followed by three digits
			-- and there must not be any consecutive group of
			-- four digits in integer constant. (ETL2 p.420)
			-- (SITD: Syntax Integer Three Digits)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSAC_error (p: ET_POSITION) is
			-- Missing ASCII code in special character
			-- specification %/code/ in manifest string.
			-- (SSAC: Syntax String Ascii Code)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSAS_error (p: ET_POSITION) is
			-- Missing character / at end of special character
			-- specification %/code/ in manifest string.
			-- (SSAS: Syntax String Ascii-code Slash)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSCU_error (p: ET_POSITION) is
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in manifest strings.
			-- (SSCU: Syntax String special-Character Upper-case)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSEL_error (p: ET_POSITION) is
			-- Empty line in middle of multi-line manifest string.
			-- (SSEL: Syntax String Empty Line)
		require
			p_not_void: p /= Void
		local
			an_error: ET_SSEL_ERROR
		do
			create an_error.make (p)
			report_error (an_error)
		end

	report_SSEQ_error (p: ET_POSITION) is
			-- Missing double quote at end of manifest string.
			-- (SSEQ: Syntax String End double-Quote)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSNL_error (p: ET_POSITION) is
			-- Invalid new-line in middle of manifest string.
			-- (SSNL: Syntax String New-Line)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSNP_error (p: ET_POSITION) is
			-- Missing character % at beginning of
			-- line in multi-line manifest string.
			-- (SSNP: Syntax String New-line Percent)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

	report_SSNS_error (p: ET_POSITION) is
			-- No space allowed after character % at end
			-- of line in multi-line manifest strings.
			-- (SSNS: Syntax String New-line Space)
		require
			p_not_void: p /= Void
		do
--Disabled for AXA.
--			report_syntax_error (p)
		end

	report_SSSC_error (p: ET_POSITION) is
			-- Invalid special character %l in manifest strings.
			-- (SSSC: Syntax String Special Character)
		require
			p_not_void: p /= Void
		do
			report_syntax_error (p)
		end

feature -- Validity errors

	report_gagp_error (where: ET_CLASS; anc1, anc2: ET_BASE_TYPE) is
			-- Report GAGP error (Ancestor Generic Parameter mismatch):
			-- `anc1' and `anc2' are two ancestors of `where' with
			-- different generic parameters.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			anc1_not_void: anc1 /= Void
			anc2_not_void: anc2 /= Void
			-- same_base: anc1.direct_base_class (universe) = anc2.direct_base_class (universe)
		do
			if reportable_gagp_error (where) then
				print ("[GAGP] Class ")
				print (where.name.name)
				print (": ancestors with generic parameter mismatch: ")
				print (anc1.to_text)
				print (" and ")
				print (anc2.to_text)
				print (".%N")
			end
		end
			
	report_vcfg1_error (where: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_class: ET_CLASS) is
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
			if reportable_vcfg1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
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
		end

	report_vcfg2_error (where: ET_CLASS; formal1, formal2: ET_FORMAL_PARAMETER) is
			-- Report VCFG-2 error (ETL2 p.52, ETR p.16): a formal
			-- generic name is declared twice in generic class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			formal1_not_void: formal1 /= Void
			formal2_not_void: formal2 /= Void
		do
			if reportable_vcfg2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
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
		end

	report_vcfg3_bit_name_error (where: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VCFG-3 error (ETR p.16): invalid
			-- type `a_type' in constraint of formal
			-- generic parameter of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vcfg3_error (where) then
				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
					is_se, Bang_tag, False, No_tag)
				print ("[VCFG-3] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("' in constraint of formal generic parameter.%N")
			end
		end

	report_vcfg3_bit_n_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VCFG-3 error (ETR p.16): invalid
			-- type `a_type' in constraint of formal
			-- generic parameter of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if is_pedantic then
				if reportable_vcfg3_error (where) then
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_type.position.line)
					print (",")
					print (a_type.position.column)
					print ("): invalid type '")
					print (a_type.to_text)
					print ("' in constraint of formal generic parameter.%N")
				end
			end
		end

	report_vcfg3_like_error (where: ET_CLASS; a_type: ET_LIKE_TYPE) is
			-- Report VCFG-3 error (ETR p.16): invalid
			-- type `a_type' in constraint of formal
			-- generic parameter of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vcfg3_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, Bang_tag, False, No_tag)
				print ("[VCFG-3] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("' in constraint of formal generic parameter.%N")
			end
		end

	report_vcfg3a_error (where: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
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
				report_vtct_constraint_error (where, a_constraint)
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

	report_vcfg3b_error (where: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
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
					print (a_constraint.to_text)
					print ("'.%N")
				end
			end
		end

	report_vcfg3c_error (where: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
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
				report_vtct_constraint_error (where, a_constraint)
				is_se := old_se
				is_ve := old_ve
			end
		end

	report_vcfg3d_error (where: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
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
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
		do
			if reportable_vcfg3_error (where) then
				print_compiler (False, No_tag, False, No_tag,
					is_se, Question_tag, False, No_tag)
				if is_se or is_gelint then
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_cycle.first.name.position.line)
					print (",")
					print (a_cycle.first.name.position.column)
					print ("): formal generic constraint cycle ")
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

	report_vcfg3e_error (where: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE) is
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
				report_vtct_constraint_error (where, a_type)
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
					print (a_type.to_text)
					print ("' itself.%N")
				end
			end
		end

	report_vcfg3f_error (where: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE) is
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
				report_vtct_constraint_error (where, a_type)
				is_se := old_se
				is_ve := old_ve
			end
		end

	report_vcfg3g_error (where: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
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
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
		do
			if reportable_vcfg3_error (where) then
				print_compiler (False, No_tag, False, No_tag,
					is_se, Question_tag, False, No_tag)
				if is_se then
					print ("[VCFG-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_cycle.first.name.position.line)
					print (",")
					print (a_cycle.first.name.position.column)
					print ("): formal generic constraint cycle ")
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

	report_vdjr0a_error (where: ET_CLASS; a_joined_feature, an_inherited_feature: ET_INHERITED_FEATURE) is
			-- Report VDJR error (ETL2 p.165): Features `a_joined_feature'
			-- and `an_inherited_feature' don't have the same number of
			-- arguments when joining these two deferred features in class
			-- `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_joined_feature_not_void: a_joined_feature /= Void
			an_inherited_feature_not_void: an_inherited_feature /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdjr_error (where) then
-- TODO: check compilers
--				print_compiler (is_ise, No_tag, is_hact, No_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VDJR] Class ")
				print (where.name.name)
				print (": Joined deferred features `")
				a_name := a_joined_feature.name
				print (a_name.name)
				print ("' inherited from ")
				-- print (a_joined_feature.parent.type.eiffel_class.name.name)
				print (a_joined_feature.parent.type.to_text)
				print (" and ")
				-- print (an_inherited_feature.parent.type.eiffel_class.name.name)
				print (an_inherited_feature.parent.type.to_text)
				print (" don't have the same signature. Different number of arguments.%N")
			end
		end

	report_vdjr0b_error (where: ET_CLASS; a_joined_feature, an_inherited_feature: ET_INHERITED_FEATURE; arg: INTEGER) is
			-- Report VDJR error (ETL2 p.165): the type of the `arg'-th
			-- argument is not identical in `a_joined_feature' and
			-- `an_inherited_feature' when joining these two deferred
			-- features in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_joined_feature_not_void: a_joined_feature /= Void
			an_inherited_feature_not_void: an_inherited_feature /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdjr_error (where) then
-- TODO: check compilers
--				print_compiler (is_ise, No_tag, is_hact, No_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VDJR] Class ")
				print (where.name.name)
				print (": Joined deferred features `")
				a_name := a_joined_feature.name
				print (a_name.name)
				print ("' inherited from ")
				-- print (a_joined_feature.parent.type.eiffel_class.name.name)
				print (a_joined_feature.parent.type.to_text)
				print (" and ")
				-- print (an_inherited_feature.parent.type.eiffel_class.name.name)
				print (an_inherited_feature.parent.type.to_text)
				print (" don't have the same signature. Type of argument number ")
				print (arg)
				print (" differs.%N")
			end
		end

	report_vdjr0c_error (where: ET_CLASS; a_joined_feature, an_inherited_feature: ET_INHERITED_FEATURE) is
			-- Report VDJR error (ETL2 p.165): the type of the result
			-- is not identical in `a_joined_feature' and `an_inherited_feature'
			-- when joining these two deferred features in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_joined_feature_not_void: a_joined_feature /= Void
			an_inherited_feature_not_void: an_inherited_feature /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdjr_error (where) then
-- TODO: check compilers
--				print_compiler (is_ise, No_tag, is_hact, No_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VDJR] Class ")
				print (where.name.name)
				print (": Joined deferred features `")
				a_name := a_joined_feature.name
				print (a_name.name)
				print ("' inherited from ")
				-- print (a_joined_feature.parent.type.eiffel_class.name.name)
				print (a_joined_feature.parent.type.to_text)
				print (" and ")
				-- print (an_inherited_feature.parent.type.eiffel_class.name.name)
				print (an_inherited_feature.parent.type.to_text)
				print (" don't have the same signature. Type of result differs.%N")
			end
		end

	report_vdrd2a_error (where: ET_CLASS; a_feature: ET_FEATURE;
		an_inherited_feature: ET_INHERITED_FEATURE; a_universe: ET_UNIVERSE) is
			-- Report VDRD-2 error (ETL2 p.163, ETR p.39): the feature
			-- `an_inherited_feature' is redeclared as `a_feature'
			-- in class `where', but the signature of `a_feature'
			-- in class `where' does not conform to the signature of
			-- `an_inherited_feature' in its parent class.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_feature_not_void: a_feature /= Void
			a_feature_flattened: a_feature.is_flattened
			an_inherited_feature_not_void: an_inherited_feature /= Void
		local
			a_name: ET_FEATURE_NAME
			args: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			a_type: ET_TYPE
a_context: ET_NESTED_TYPE_CONTEXT
		do
			if reportable_vdrd2_error (where) then
				print ("[VDRD-2] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_feature.name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): signature of feature `")
				print (a_name.name)
				print ("' does not conform to the signature of redeclared feature `")
				print (an_inherited_feature.precursor_feature.name.name)
				print ("' in parent ")
				print (an_inherited_feature.parent.type.to_text)
				print (".%N")

if a_universe /= Void then
				print ("%T[")
				args := a_feature.arguments
				if args /= Void then
					nb := args.count
					from i := 1 until i > nb loop
						a_type := args.formal_argument (i).type
						print (a_type.base_type (where, a_universe).to_text)
						if i /= nb then
							print (", ")
						end
						i := i + 1
					end
				end
				print ("], [")
				a_type := a_feature.type
				if a_type /= Void then
					print (a_type.base_type (where, a_universe).to_text)
				end
				print ("]%N")

				print ("%T[")
				create a_context.make (an_inherited_feature.parent.type, where)
				args := an_inherited_feature.precursor_feature.arguments
				if args /= Void then
					nb := args.count
					from i := 1 until i > nb loop
						a_type := args.formal_argument (i).type
						print (a_type.base_type (a_context, a_universe).to_text)
						if i /= nb then
							print (", ")
						end
						i := i + 1
					end
				end
				print ("], [")
				a_type := an_inherited_feature.precursor_feature.type
				if a_type /= Void then
					print (a_type.base_type (a_context, a_universe).to_text)
				end
				print ("]%N")
end
			end
		end

	report_vdrd2b_error (where: ET_CLASS; a_feature, an_inherited_feature: ET_INHERITED_FEATURE; a_universe: ET_UNIVERSE) is
			-- Report VDRD-2 error (ETL2 p.163, ETR p.39): the feature
			-- `an_inherited_feature' is redeclared by being merged to
			-- `a_feature' in class `where', but the signature of
			-- `a_feature' in class `where' does not conform to the
			-- signature of `an_inherited_feature' in its parent class.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_feature_not_void: a_feature /= Void
			an_inherited_feature_not_void: an_inherited_feature /= Void
		local
			a_parent: ET_PARENT
			args: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			a_type: ET_TYPE
a_context: ET_NESTED_TYPE_CONTEXT
		do
			if reportable_vdrd2_error (where) then
				print ("[VDRD-2] Class ")
				print (where.name.name)
				print (" (")
				a_parent := a_feature.parent
				print (a_parent.position.line)
				print (",")
				print (a_parent.position.column)
				print ("): signature of feature `")
				print (a_feature.name.name)
				print ("' inherited from ")
				print (a_parent.type.to_text)
				print (" does not conform to the signature of redeclared feature `")
				print (an_inherited_feature.precursor_feature.name.name)
				print ("' in parent ")
				print (an_inherited_feature.parent.type.to_text)
				print (".%N")

if a_universe /= Void then
				print ("%T[")
				args := a_feature.flattened_feature.arguments
				if args /= Void then
					nb := args.count
					from i := 1 until i > nb loop
						a_type := args.formal_argument (i).type
						print (a_type.base_type (where, a_universe).to_text)
						if i /= nb then
							print (", ")
						end
						i := i + 1
					end
				end
				print ("], [")
				a_type := a_feature.flattened_feature.type
				if a_type /= Void then
					print (a_type.base_type (where, a_universe).to_text)
				end
				print ("]%N")

				print ("%T[")
				create a_context.make (an_inherited_feature.parent.type, where)
				args := an_inherited_feature.precursor_feature.arguments
				if args /= Void then
					nb := args.count
					from i := 1 until i > nb loop
						a_type := args.formal_argument (i).type
						print (a_type.base_type (a_context, a_universe).to_text)
						if i /= nb then
							print (", ")
						end
						i := i + 1
					end
				end
				print ("], [")
				a_type := an_inherited_feature.precursor_feature.type
				if a_type /= Void then
					print (a_type.base_type (a_context, a_universe).to_text)
				end
				print ("]%N")
			end
end
		end

	report_vdrd4a_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE; a_redefined_feature: ET_FEATURE) is
			-- Report VDRD-4 error (ETL2 p.163, ETR p.39): the
			-- deferred feature `an_inherited_feature' is redefined
			-- into the deferred feature `a_redefined_feature' in
			-- class `where' but is not listed in the Redefine
			-- subclause.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_deferred: an_inherited_feature.is_deferred
			an_inherited_feature_not_redefined: not an_inherited_feature.has_redefine
			a_redefined_feature_not_void: a_redefined_feature /= Void
			a_redefined_feature_deferred: a_redefined_feature.is_deferred
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdrd4_error (where) then
				if is_gelint then
					print ("[VDRD-4] Class ")
					print (where.name.name)
					print (" (")
					a_name := a_redefined_feature.name
					print (a_name.position.line)
					print (",")
					print (a_name.position.column)
					print ("): deferred feature ")
					print (an_inherited_feature.parent.type.name.name)
					print (".")
					print (an_inherited_feature.precursor_feature.name.name)
					print (" is redefined but is not listed in the Redefine subclause.%N")
				end
			end
		end

	report_vdrd4b_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE; a_redefined_feature: ET_FEATURE) is
			-- Report VDRD-4 error (ETL2 p.163, ETR p.39): the
			-- effective feature `an_inherited_feature' is redefined
			-- into the effective feature `a_redefined_feature' in
			-- class `where' but is not listed in the Redefine
			-- subclause.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_effective: not an_inherited_feature.is_deferred
			an_inherited_feature_not_redefined: not an_inherited_feature.has_redefine
			a_redefined_feature_not_void: a_redefined_feature /= Void
			a_redefined_feature_effective: not a_redefined_feature.is_deferred
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdrd4_error (where) then
				if is_se or is_gelint then
					print_compiler (False, No_tag, False, No_tag,
						is_se, No_tag, False, No_tag)
					print ("[VDRD-4] Class ")
					print (where.name.name)
					print (" (")
					a_name := a_redefined_feature.name
					print (a_name.position.line)
					print (",")
					print (a_name.position.column)
					print ("): effective feature ")
					print (an_inherited_feature.parent.type.name.name)
					print (".")
					print (an_inherited_feature.precursor_feature.name.name)
					print (" is redefined but is not listed in the Redefine subclause.%N")
				end
			end
		end

	report_vdrd4c_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE; a_redefined_feature: ET_FEATURE) is
			-- Report VDRD-4 error (ETL2 p.163, ETR p.39): the
			-- effective feature `an_inherited_feature' is redefined
			-- into the deferred feature `a_redefined_feature' in
			-- class `where' but is not listed in the Undefine and
			-- Redefine subclauses.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_effective: not an_inherited_feature.is_deferred
			an_inherited_feature_not_redefined: not an_inherited_feature.has_redefine
			a_redefined_feature_not_void: a_redefined_feature /= Void
			a_redefined_feature_deferred: a_redefined_feature.is_deferred
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdrd4_error (where) then
				if is_se or is_gelint then
					print_compiler (False, No_tag, False, No_tag,
						is_se, No_tag, False, No_tag)
					print ("[VDRD-4] Class ")
					print (where.name.name)
					print (" (")
					a_name := a_redefined_feature.name
					print (a_name.position.line)
					print (",")
					print (a_name.position.column)
					print ("): effective feature ")
					print (an_inherited_feature.parent.type.name.name)
					print (".")
					print (an_inherited_feature.precursor_feature.name.name)
					print (" is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.%N")
				end
			end
		end

	report_vdrd5_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE; a_redefined_feature: ET_FEATURE) is
			-- Report VDRD-5 error (ETL2 p.163, ETR p.39): the
			-- effective feature `an_inherited_feature' is
			-- redefined into the deferred feature
			-- `a_redefined_feature' in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_effective: not an_inherited_feature.is_deferred
			an_inherited_feature_redefined: an_inherited_feature.has_redefine
			a_redefined_feature_not_void: a_redefined_feature /= Void
			a_redefined_feature_deferred: a_redefined_feature.is_deferred
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdrd5_error (where) then
				if is_ise or is_hact or is_gelint then
					print_compiler (is_ise, No_tag, is_hact, No_tag,
						False, No_tag, False, No_tag)
					print ("[VDRD-5] Class ")
					print (where.name.name)
					print (" (")
					a_name := an_inherited_feature.redefine_name
					print (a_name.position.line)
					print (",")
					print (a_name.position.column)
					print ("): effective feature ")
					print (an_inherited_feature.parent.type.name.name)
					print (".")
					print (an_inherited_feature.precursor_feature.name.name)
					print (" is redefined into a deferred one.%N")
				end
			end
		end

	report_vdrs1_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDRS-1 error (ETL2 p.159, ETR p.37): the
			-- Redefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is not the final name in
			-- class `where' of a feature inherited from `a_parent'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdrs1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDRS-1] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): `")
				print (f.name)
				print ("' is not the final name of a feature in ")
				print (a_parent.type.name.name)
				print (".%N")
			end
		end

	report_vdrs2a_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDRS-2 error (ETL2 p.159, ETR p.37): the
			-- Redefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is the final name of a
			-- frozen feature.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdrs2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDRS-2] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): cannot redefine the frozen feature `")
				print (f.name)
				print ("'.%N")
			end
		end

	report_vdrs2b_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDRS-2 error (ETL2 p.159, ETR p.37): the
			-- Redefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is the final name of a
			-- constant attribute.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdrs2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDRS-2] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): cannot redefine the constant attribute `")
				print (f.name)
				print ("'.%N")
			end
		end

	report_vdrs3_error (where: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VDRS-3 error (ETL2 p.159, ETR p.37): feature
			-- name `f2' appears twice in the Redefine subclause of
			-- parent `a_parent' in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			if reportable_vdrs3_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDRS-3] Class ")
				print (where.name.name)
				print (" (")
				print (f2.position.line)
				print (",")
				print (f2.position.column)
				print ("): feature name `")
				print (f2.name)
				print ("' appears twice in the Redefine subclause of parent ")
				print (a_parent.type.name.name)
				print (".%N")
			end
		end

	report_vdrs4a_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE) is
			-- Report VDRS-4 error (ETL2 p.159, ETR p.37): the
			-- feature `an_inherited_feature' is not redefined
			-- in class `where' and therefore should not be listed
			-- in the Redefine subclause.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_redefined: an_inherited_feature.has_redefine
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdrs4_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDRS-4] Class ")
				print (where.name.name)
				print (" (")
				a_name := an_inherited_feature.redefine_name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): Redefine subclause of ")
				print (an_inherited_feature.parent.type.name.name)
				print (" lists feature `")
				print (an_inherited_feature.precursor_feature.name.name)
				print ("' but it is not redefined.%N")
			end
		end

	report_vdrs4b_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE; a_redefined_feature: ET_FEATURE) is
			-- Report VDRS-4 error (ETL2 p.159, ETR p.37): the
			-- deferred feature `an_inherited_feature' should not
			-- be listed in the Redefine subclause when being
			-- effected to `a_redefined_feature' in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_deferred: an_inherited_feature.is_deferred
			an_inherited_feature_redefined: an_inherited_feature.has_redefine
			a_redefined_feature_not_void: a_redefined_feature /= Void
			a_redefined_feature_effective: not a_redefined_feature.is_deferred
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vdrs4_error (where) then
				if is_gelint then
					print ("[VDRS-4] Class ")
					print (where.name.name)
					print (" (")
					a_name := an_inherited_feature.redefine_name
					print (a_name.position.line)
					print (",")
					print (a_name.position.column)
					print ("): redeclaration of feature ")
					print (an_inherited_feature.parent.type.name.name)
					print (".")
					print (an_inherited_feature.precursor_feature.name.name)
					print (" is an effecting and should not appear in the Redefine subclause.%N")
				end
			end
		end

	report_vdus1_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-1 error (ETL2 p.160, ETR p.37): the
			-- Undefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is not the final name in
			-- class `where' of a feature inherited from `a_parent'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdus1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDUS-1] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): `")
				print (f.name)
				print ("' is not the final name of a feature in ")
				print (a_parent.type.name.name)
				print (".%N")
			end
		end

	report_vdus2a_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-2 error (ETL2 p.160, ETR p.37): the
			-- Undefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is the final name of a
			-- frozen feature.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdus2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDUS-2] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): cannot undefine the frozen feature `")
				print (f.name)
				print ("'.%N")
			end
		end

	report_vdus2b_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-2 error (ETL2 p.160, ETR p.37): the
			-- Undefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is the final name of
			-- an attribute.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdus2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDUS-2] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): cannot undefine the attribute `")
				print (f.name)
				print ("'.%N")
			end
		end

	report_vdus3_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-3 error (ETL2 p.160, ETR p.37): the
			-- Undefine subclause of parent `a_parent' in class
			-- `where' lists `f' which is not the final name of
			-- an effective feature in `a_parent'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vdus3_error (where) then
				if is_ise or is_hact or is_gelint then
					print_compiler (is_ise, No_tag, is_hact, No_tag,
						False, No_tag, False, No_tag)
					print ("[VDUS-3] Class ")
					print (where.name.name)
					print (" (")
					print (f.position.line)
					print (",")
					print (f.position.column)
					print ("): cannot undefine the deferred feature `")
					print (f.name)
					print ("'.%N")
				end
			end
		end

	report_vdus4_error (where: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VDUS-4 error (ETL2 p.160, ETR p.37): feature
			-- name `f2' appears twice in the Undefine subclause of
			-- parent `a_parent' in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			if reportable_vdus4_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VDUS-4] Class ")
				print (where.name.name)
				print (" (")
				print (f2.position.line)
				print (",")
				print (f2.position.column)
				print ("): feature name `")
				print (f2.name)
				print ("' appears twice in the Undefine subclause of parent ")
				print (a_parent.type.name.name)
				print (".%N")
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
			is_cycle: cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_CLASS]
		do
			if reportable_vhpr1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
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
		end

	report_vhpr3_bit_name_error (where: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vhpr3_error (where) then
				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
					is_se, Bang_tag, False, No_tag)
				print ("[VHPR-3] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("' in parent clause.%N")
			end
		end

	report_vhpr3_bit_n_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if is_pedantic then
				if reportable_vhpr3_error (where) then
					print ("[VHPR-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_type.position.line)
					print (",")
					print (a_type.position.column)
					print ("): invalid type '")
					print (a_type.to_text)
					print ("' in parent clause.%N")
				end
			end
		end

	report_vhpr3_like_error (where: ET_CLASS; a_type: ET_LIKE_TYPE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vhpr3_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, Bang_tag, False, No_tag)
				print ("[VHPR-3] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("' in parent clause.%N")
			end
		end

	report_vhrc1_error (where: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME) is
			-- Report VHRC-1 error (ETL2 p.81, ETR p.23): the feature
			-- name appearing as first element of the Rename_pair
			-- `a_rename' in Parent clause `a_parent' in class `where'
			-- is not the final name of a feature in `a_parent'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vhrc1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VHRC-1] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_rename.old_name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): `")
				print (a_name.name)
				print ("' is not the final name of a feature in ")
				print (a_parent.type.name.name)
				print (".%N")
			end
		end

	report_vhrc2_error (where: ET_CLASS; a_parent: ET_PARENT; a_rename1, a_rename2: ET_RENAME) is
			-- Report VHRC-2 error (ETL2 p.81, ETR p.23): a feature
			-- name appears more than once (e.g. also in `a_rename1')
			-- as first element of the Rename_pair `a_rename2' in
			-- Parent clause `a_parent' in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vhrc2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VHRC-2] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_rename2.old_name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): feature name `")
				print (a_name.name)
				print ("' appears as first element of two Rename_pairs.%N")
			end
		end

	report_vhrc4_error (where: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-4 error (ETR p.23): the Rename_pair
			-- `a_rename' has a new_name of the Prefix form,
			-- but the corresponding feature `f' is not an
			-- attibute nor a function with no argument.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			f_not_void: f /= Void
		do
			if reportable_vhrc4_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VHRC-4] Class ")
				print (where.name.name)
				print (" (")
				print (a_rename.new_name.position.line)
				print (",")
				print (a_rename.new_name.position.column)
				print ("): `")
				print (a_rename.new_name.name)
				print ("' is of the Prefix form but ")
				print (a_parent.type.name.name)
				print (".")
				print (f.name.name)
				print (" is not an attribute nor a function with no argument.%N")
			end
		end

	report_vhrc5_error (where: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-5 error (ETR p.23): the Rename_pair
			-- `a_rename' has a new_name of the Infix form,
			-- but the corresponding feature `f' is not a
			-- a function with one argument.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			f_not_void: f /= Void
		do
			if reportable_vhrc5_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VHRC-5] Class ")
				print (where.name.name)
				print (" (")
				print (a_rename.new_name.position.line)
				print (",")
				print (a_rename.new_name.position.column)
				print ("): `")
				print (a_rename.new_name.name)
				print ("' is of the Infix form but ")
				print (a_parent.type.name.name)
				print (".")
				print (f.name.name)
				print (" is not a function with one argument.%N")
			end
		end

	report_vmfna_error (where: ET_CLASS; f1, f2: ET_FEATURE) is
			-- Report VMFN error (ETL2 p.188, ETR p.42): class
			-- `where' introduced two features `f1' and `f2'
			-- with the same name.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			f2_name: ET_FEATURE_NAME
		do
			if reportable_vmfn_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VMFN] Class ")
				print (where.name.name)
				print (" (")
				f2_name := f2.name
				print (f2_name.position.line)
				print (",")
				print (f2_name.position.column)
				print ("): two features with the same name `")
				print (f2_name.name)
				print ("'.%N")
			end
		end

	report_vmfnb_error (where: ET_CLASS; an_inherited_feature: ET_INHERITED_FEATURE; a_feature: ET_FEATURE) is
			-- Report VMFN error (ETL2 p.188, ETR p.42): class `where'
			-- introduces feature `a_feature' but `an_inherited_feature'
			-- has the same name.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			an_inherited_feature_not_void: an_inherited_feature /= Void
			an_inherited_feature_effective: not an_inherited_feature.is_deferred
			an_inherited_feature_not_redefined: not an_inherited_feature.has_redefine
			a_feature_not_void: a_feature /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			if reportable_vmfn_error (where) then
				if is_ise or is_hact then
					print_compiler (is_ise, No_tag, is_hact, No_tag,
						False, No_tag, False, No_tag)
					print ("[VMFN] Class ")
					print (where.name.name)
					print (" (")
					a_name := a_feature.name
					print (a_name.position.line)
					print (",")
					print (a_name.position.column)
					print ("): two features with the same name `")
					print (a_name.name)
					print ("' and ")
					print (an_inherited_feature.parent.type.name.name)
					print (".")
					print (an_inherited_feature.precursor_feature.name.name)
					print (".%N")
				end
			end
		end

	report_vmfnc_error (where: ET_CLASS; f1, f2: ET_INHERITED_FEATURE) is
			-- Report VMFN error (ETL2 p.188, ETR p.42): class
			-- `where' inherits two effective features `f1' and `f2'
			-- with the same name.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			f1_not_void: f1 /= Void
			f1_effective: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_effective: not f2.is_deferred
			f2_not_redefined: not f2.has_redefine
		local
			a_parent: ET_PARENT
		do
			if reportable_vmfn_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VMFN] Class ")
				print (where.name.name)
				print (" (")
				a_parent := f1.parent
				print (a_parent.type.position.line)
				print (",")
				print (a_parent.type.position.column)
				print ("): two features with the same name ")
				print (f1.parent.type.name.name)
				print (".")
				print (f1.precursor_feature.name.name)
				print (" and ")
				print (f2.parent.type.name.name)
				print (".")
				print (f2.precursor_feature.name.name)
				print (".%N")
			end
		end

	report_vmrc2a_error (where: ET_CLASS; replicated_features: DS_LIST [ET_INHERITED_FEATURE]) is
			-- Report VMRC-2 error (ETL2 p.191, ETR p.43): the
			-- replicated features `replicated_features' have 
			-- not been selected in one of the Parent clauses
			-- of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			replicated_features_not_void: replicated_features /= Void
			no_void_feature: not replicated_features.has (Void)
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
		do
			if reportable_vmrc2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, Question_tag, False, No_tag)
				print ("[VMRC-2] Class ")
				print (where.name.name)
				print (" (")
				a_feature := replicated_features.first
				print (a_feature.parent.type.name.position.line)
				print (",")
				print (a_feature.parent.type.name.position.column)
				print ("): replicated features ")
				a_cursor := replicated_features.new_cursor
				from
					a_cursor.start
					a_feature := a_cursor.item
					print (a_feature.parent.type.name.name)
					print (".")
					print (a_feature.name.name)
					a_cursor.forth
				until
					a_cursor.after
				loop
					print (", ")
					a_feature := a_cursor.item
					print (a_feature.parent.type.name.name)
					print (".")
					print (a_feature.name.name)
					a_cursor.forth
				end
				print (" have not been selected.%N")
			end
		end

	report_vmrc2b_error (where: ET_CLASS; replicated_features: DS_LIST [ET_INHERITED_FEATURE]) is
			-- Report VMRC-2 error (ETL2 p.191, ETR p.43): the
			-- replicated features `replicated_features' have 
			-- been selected in more than one of the Parent clauses
			-- of class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			replicated_features_not_void: replicated_features /= Void
			no_void_feature: not replicated_features.has (Void)
			-- all_selected: forall f in replicated_features, f.has_select
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
		do
			if reportable_vmrc2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, Question_tag, False, No_tag)
				print ("[VMRC-2] Class ")
				print (where.name.name)
				print (" (")
				a_feature := replicated_features.first
				print (a_feature.select_name.position.line)
				print (",")
				print (a_feature.select_name.position.column)
				print ("): replicated features ")
				a_cursor := replicated_features.new_cursor
				from
					a_cursor.start
					a_feature := a_cursor.item
					print (a_feature.parent.type.name.name)
					print (".")
					print (a_feature.name.name)
					a_cursor.forth
				until
					a_cursor.after
				loop
					print (", ")
					a_feature := a_cursor.item
					print (a_feature.parent.type.name.name)
					print (".")
					print (a_feature.name.name)
					a_cursor.forth
				end
				print (" have been selected more than once.%N")
			end
		end

	report_vmss1_error (where: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VMSS-1 error (ETL2 p.192, ETR p.44): the
			-- Select subclause of parent `a_parent' in class
			-- `where' lists `f' which is not the final name in
			-- class `where' of a feature inherited from `a_parent'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			if reportable_vmss1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VMSS-1] Class ")
				print (where.name.name)
				print (" (")
				print (f.position.line)
				print (",")
				print (f.position.column)
				print ("): `")
				print (f.name)
				print ("' is not the final name of a feature in ")
				print (a_parent.type.name.name)
				print (".%N")
			end
		end

	report_vmss2_error (where: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VMSS-2 error (ETL2 p.192, ETR p.44): feature
			-- name `f2' appears twice in the Select subclause of
			-- parent `a_parent' in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			if reportable_vmss2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VMSS-2] Class ")
				print (where.name.name)
				print (" (")
				print (f2.position.line)
				print (",")
				print (f2.position.column)
				print ("): feature name `")
				print (f2.name)
				print ("' appears twice in the Select subclause of parent ")
				print (a_parent.type.name.name)
				print (".%N")
			end
		end

	report_vmss3_error (where: ET_CLASS; a_feature: ET_INHERITED_FEATURE) is
			-- Report VMSS-3 error (ETL2 p.192, ETR p.44): the
			-- Select subclause of a parent of class `where' lists
			-- `a_feature' which is not replicated.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_feature_not_void: a_feature /= Void
			a_feature_selected: a_feature.has_select
		do
			if reportable_vmss3_error (where) then
				if is_ise or is_hact or is_gelint then
					print_compiler (is_ise, No_tag, is_hact, No_tag,
						False, No_tag, False, No_tag)
					print ("[VMSS-3] Class ")
					print (where.name.name)
					print (" (")
					print (a_feature.select_name.position.line)
					print (",")
					print (a_feature.select_name.position.column)
					print ("): `")
					print (a_feature.select_name.name)
					print ("' is not a replicated feature.%N")
				end
			end
		end

	report_vtat0a_error (where: ET_CLASS; a_type: ET_LIKE_FEATURE) is
			-- Report VTAT error (ETL2 p.214): the anchor in the
			-- Anchored_type must be the final name of a query
			-- in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtat_error (where) then
--				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VTAT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("': the anchor `")
				print (a_type.name.name)
				print ("' must be the final name of a query.%N")
			end
		end

	report_vtat0b_error (where: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_LIKE_FEATURE) is
			-- Report VTAT error (ETL2 p.214): the anchor in the
			-- Anchored_type must be the final name of a query
			-- in class `where' or an argument of `a_feature'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
		do
			if reportable_vtat_error (where) then
--				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VTAT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("': the anchor `")
				print (a_type.name.name)
				print ("' must be the final name of a query, or an argument of routine `")
				print (a_feature.name.name)
				print ("'.%N")
			end
		end

	report_vtat0c_error (where: ET_CLASS; a_type: ET_QUALIFIED_LIKE_CURRENT) is
			-- Report VTAT error (ETL2 p.214): the anchor in the
			-- Anchored_type must be the final name of a query
			-- in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtat_error (where) then
--				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VTAT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("': the anchor `")
				print (a_type.name.name)
				print ("' must be the final name of a query.%N")
			end
		end

	report_vtbt0a_error (where: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VTBT error (ETL2 p.210): the identifier
			-- in Bit_type must be the final name of a constant
			-- attribute of type INTEGER.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtbt_error (where) then
--				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VTBT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("': `")
				print (a_type.name.name) 
				print ("' is not the final name of a constant attribute of type INTEGER.%N")
			end
		end

	report_vtbt0b_error (where: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VTBT error (ETL2 p.210): the identifier
			-- in Bit_type must be the final name of a feature.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtbt_error (where) then
--				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
--					is_se, No_tag, False, No_tag)
				print ("[VTBT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("': `")
				print (a_type.name.name) 
				print ("' is not the final name of a feature.%N")
			end
		end

	report_vtbt_error (where: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VTBT error (ETL2 p.210, ETR p.47): size
			-- for Bit_type must be a positive integer constant.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		do
			if reportable_vtbt_error (where) then
				print_compiler (is_ise, Question_tag, is_hact, Question_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTBT] Class ")
				print (where.name.name)
				print (" (")
				print (a_type.position.line)
				print (",")
				print (a_type.position.column)
				print ("): invalid type '")
				print (a_type.to_text)
				print ("': bit size must be a positive integer constant.%N")
			end
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
			if is_se or is_pedantic then
				if reportable_vtbt_error (where) then
					print_compiler (False, No_tag, False, No_tag,
						is_se, No_tag, False, No_tag)
					print ("[VTBT] Class ")
					print (where.name.name)
					print (" (")
					print (a_type.position.line)
					print (",")
					print (a_type.position.column)
					print ("): invalid type '")
					print (a_type.to_text)
					print ("': bit size must be a positive integer constant.%N")
				end
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
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTCG] Class ")
				print (where.name.name)
				print (" (")
				print (an_actual.position.line)
				print (",")
				print (an_actual.position.column)
				print ("): actual generic parameter ")
				print (an_actual.to_text)
				print (" does not conform to constraint ")
				print (a_constraint.to_text)
				print (".%N")
			end
		end

	report_vtct_error (where: ET_CLASS; a_type: ET_BASE_TYPE) is
			-- Report VTCT error (ETL2 p.199, ETR p.45): `a_type'
			-- based on unknown class in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		local
			a_name: ET_CLASS_NAME
		do
			if reportable_vtct_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTCT] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_type.name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): type based on unknown class ")
				print (a_name.name)
				print (".%N")
			end
		end

	report_vtct_constraint_error (where: ET_CLASS; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Report VTCT error (ETL2 p.199, ETR p.45): `a_type'
			-- based on unknown class in class `where'.
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
			a_type_not_void: a_type /= Void
		local
			a_name: ET_CLASS_NAME
		do
			if reportable_vtct_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTCT] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_type.name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): type based on unknown class ")
				print (a_name.name)
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
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
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
		local
			a_name: ET_CLASS_NAME
		do
			if reportable_vtug1_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTUG-1] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_type.name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): type ")
				print (a_type.to_text)
				print (" has actual generic parameters but class ")
				print (a_name.name)
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
		local
			a_name: ET_CLASS_NAME
		do
			if reportable_vtug2_error (where) then
				print_compiler (is_ise, No_tag, is_hact, No_tag,
					is_se, No_tag, False, No_tag)
				print ("[VTUG-2] Class ")
				print (where.name.name)
				print (" (")
				a_name := a_type.name
				print (a_name.position.line)
				print (",")
				print (a_name.position.column)
				print ("): type ")
				print (a_type.to_text)
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

	reportable_vcfg1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VCFG-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vcfg2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VCFG-2 error be reported when it
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

	reportable_vdjr_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDJR error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrd2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRD-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrd4_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRD-4 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrd5_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRD-5 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrs1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRS-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrs2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRS-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrs3_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRS-3 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdrs4_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDRS-4 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdus1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDUS-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdus2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDUS-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdus3_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDUS-3 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vdus4_error (where: ET_CLASS): BOOLEAN is
			-- Can a VDUS-4 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vhpr1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VHPR-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vhpr3_error (where: ET_CLASS): BOOLEAN is
			-- Can a VHPR-3 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vhrc1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VHRC-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vhrc2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VHRC-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vhrc4_error (where: ET_CLASS): BOOLEAN is
			-- Can a VHRC-4 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vhrc5_error (where: ET_CLASS): BOOLEAN is
			-- Can a VHRC-5 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vmfn_error (where: ET_CLASS): BOOLEAN is
			-- Can a VMFN error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vmrc2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VMRC-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vmss1_error (where: ET_CLASS): BOOLEAN is
			-- Can a VMSS-1 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vmss2_error (where: ET_CLASS): BOOLEAN is
			-- Can a VMSS-2 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vmss3_error (where: ET_CLASS): BOOLEAN is
			-- Can a VMSS-3 error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vtat_error (where: ET_CLASS): BOOLEAN is
			-- Can a VTAT error be reported when it
			-- appears in class `where'?
		require
			where_not_void: where /= Void
			where_parsed: where.is_parsed
			no_syntax_error: not where.has_syntax_error
		do
			Result := in_system (where.name.name)
		end

	reportable_vtbt_error (where: ET_CLASS): BOOLEAN is
			-- Can a VTBT error be reported when it
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
			if classes_in_system.is_empty then
				Result := True
			else
				Result := classes_in_system.has (a_class)
			end
		end

	classes_in_system: DS_HASH_TABLE [ANY, STRING] is
--		local
--			a_file: PLAIN_TEXT_FILE
		once
			create Result.make (6000)
--			create a_file.make ("system.txt")
--			if a_file.exists then
--				from
--					a_file.open_read
--				until
--					a_file.end_of_file
--				loop
--					a_file.read_line
--					Result.put (Void, clone (a_file.last_string))
--				end
--				a_file.close
--			end
		end

end
