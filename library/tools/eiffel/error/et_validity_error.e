indexing

	description:

		"Eiffel validity errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_VALIDITY_ERROR

inherit

	ET_EIFFEL_ERROR

creation

	make,
	make_vcch1a,
	make_vcch1b,
	make_vcch2a,
	make_vcfg1a,
	make_vcfg2a,
	make_vcfg3a,
	make_vcfg3b,
	make_vcfg3c,
	make_vcfg3d,
	make_vcfg3e,
	make_vcfg3g,
	make_vcfg3h,
	make_vcfg3j,
	make_vdjr0a,
	make_vdjr0b,
	make_vdjr0c,
	make_vdrd2a,
	make_vdrd2b,
	make_vdrd3a,
	make_vdrd3b,
	make_vdrd4a,
	make_vdrd4b,
	make_vdrd4c,
	make_vdrd5a,
	make_vdrs1a,
	make_vdrs2a,
	make_vdrs2b,
	make_vdrs3a,
	make_vdrs4a,
	make_vdrs4b,
	make_vdus1a,
	make_vdus2a,
	make_vdus2b,
	make_vdus3a,
	make_vdus4a,
	make_vgcc6a,
	make_vgcp1a,
	make_vgcp2a,
	make_vgcp2b,
	make_vgcp3a,
	make_vgcp3b,
	make_vgcp3c,
	make_vhpr1a,
	make_vhpr3a,
	make_vhpr3b,
	make_vhpr3c,
	make_vhrc1a,
	make_vhrc2a,
	make_vhrc4a,
	make_vhrc5a,
	make_vmfn0a,
	make_vmfn0b,
	make_vmfn0c,
	make_vmrc2a,
	make_vmrc2b,
	make_vmss1a,
	make_vmss2a,
	make_vmss3a,
	make_vreg0a,
	make_vrfa0a,
	make_vscn0a,
	make_vtat1a,
	make_vtat1b,
	make_vtat1c,
	make_vtat1d,
	make_vtat2a,
	make_vtbt0a,
	make_vtbt0b,
	make_vtbt0c,
	make_vtbt0d,
	make_vtcg0a,
	make_vtct0a,
	make_vtct0b,
	make_vtct0c,
	make_vtgc0a,
	make_vtgc0b,
	make_vtug1a,
	make_vtug2a,
	make_gvagp0a,
	make_gvhpr4a,
	make_gvhpr5a

feature {NONE} -- Initialization
	
	make (a_class: like current_class; a_position: like position) is
			-- Create a new Eiffel validity error in `a_class' at `a_position'.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
		do
			code := gvzzz0a_template_code
			etl_code := gvzzz_etl_code
			default_template := gvzzz0a_default_template
			current_class := a_class
			position := a_position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			position_set: position = a_position
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vcch1a (a_class: like current_class; f: ET_FLATTENED_FEATURE) is
			-- Create a new VCCH-1 error: `a_class' has deferred features
			-- but is not declared as deferred. `f' is one of these deferred
			-- feature, written in `a_class'.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_not_deferred: not a_class.has_deferred_mark
			f_not_void: f /= Void
			f_deferred: f.is_deferred
		do
			code := vcch1a_template_code
			etl_code := vcch1_etl_code
			default_template := vcch1a_default_template
			current_class := a_class
			position := f.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vcch1b (a_class: like current_class; f: ET_INHERITED_FEATURE) is
			-- Create a new VCCH-1 error: `a_class' has deferred features
			-- but is not declared as deferred. `f' is one of these deferred
			-- feature, inherited from a parent of `a_class'.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_not_deferred: not a_class.has_deferred_mark
			f_not_void: f /= Void
			f_deferred: f.flattened_feature.is_deferred
		do
			code := vcch1a_template_code
			etl_code := vcch1_etl_code
			default_template := vcch1a_default_template
			current_class := a_class
			if f.has_undefine then
				position := f.undefine_name.position
			else
				position := f.parent.type.name.position
			end
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			parameters.put (f.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vcch2a (a_class: like current_class) is
			-- Create a new VCCH-2 error: `a_class' is marked as deferred
			-- but has no deferred feature.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_deferred: a_class.has_deferred_mark
		do
			code := vcch2a_template_code
			etl_code := vcch2_etl_code
			default_template := vcch2a_default_template
			current_class := a_class
			position := a_class.class_mark.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vcfg1a (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; other_class: ET_CLASS) is
			-- Create a new VCFG-1 error: the formal generic parameter `a_formal'
			-- in `a_class' has the same name as class `other_class' in the
			-- surrounding universe.
			--
			-- ETL2: p.52
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			other_class_not_void: other_class /= Void
			other_class_in_universe: other_class.is_preparsed
		do
			code := vcfg1a_template_code
			etl_code := vcfg1_etl_code
			default_template := vcfg1a_default_template
			current_class := a_class
			position := a_formal.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
		end

	make_vcfg2a (a_class: like current_class; a_formal1, a_formal2: ET_FORMAL_PARAMETER) is
			-- Create a new VCFG-2 error: a formal generic name is
			-- declared twice in generic class `a_class'.
			--
			-- ETL2: p.52
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal1_not_void: a_formal1 /= Void
			a_formal2_not_void: a_formal2 /= Void
		do
			code := vcfg2a_template_code
			etl_code := vcfg2_etl_code
			default_template := vcfg2a_default_template
			current_class := a_class
			position := a_formal1.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal1.name.name, 6)
			parameters.put (a_formal1.index.out, 7)
			parameters.put (a_formal2.index.out, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first formal name
			-- dollar7: $7 = first formal index
			-- dollar8: $8 = second formal index
		end

	make_vcfg3a (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vcfg3a_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3a_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vcfg3b (a_class: like current_class; a_type: ET_BIT_N) is
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vcfg3b_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3b_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vcfg3c (a_class: like current_class; a_type: ET_LIKE_TYPE) is
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vcfg3c_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3c_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vcfg3d (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' is the formal generic parameter itself.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		do
			code := vcfg3d_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3d_default_template
			current_class := a_class
			position := a_constraint.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			parameters.put (a_constraint.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
			-- dollar7: $7 = constraint
		end

	make_vcfg3e (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' is another formal generic parameter
			-- appearing before `a_formal' in the list of formal
			-- generic parameters.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		do
			code := vcfg3e_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3e_default_template
			current_class := a_class
			position := a_constraint.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			parameters.put (a_constraint.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
			-- dollar7: $7 = constraint
		end

	make_vcfg3g (a_class: like current_class; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
			-- Create a new VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are involved
			-- in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
			a_string: STRING
		do
			code := vcfg3g_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3g_default_template
			current_class := a_class
			position := a_cycle.first.name.position
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vcfg3h (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' contains the formal generic parameter
			-- itself.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_type_not_void: a_type /= Void
		do
			code := vcfg3h_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3h_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			parameters.put (a_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
			-- dollar7: $7 = formal type in constraint
		end

	make_vcfg3j (a_class: like current_class; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
			-- Create a new VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are involved
			-- in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
			a_string: STRING
		do
			code := vcfg3j_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3j_default_template
			current_class := a_class
			position := a_cycle.first.name.position
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vdjr0a (a_class: like current_class; f1, f2: ET_INHERITED_FEATURE) is
			-- Create a new VDJR error: Features `f1' and `f2'
			-- don't have the same number of arguments when
			-- joining these two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdjr0a_template_code
			etl_code := vdjr_etl_code
			default_template := vdjr0a_default_template
			current_class := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second parent base class
		end

	make_vdjr0b (a_class: like current_class; f1, f2: ET_INHERITED_FEATURE; arg: INTEGER) is
			-- Create a new VDJR error: the type of the `arg'-th
			-- argument is not identical in `f1' and `f2' when
			-- joining these two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdjr0b_template_code
			etl_code := vdjr_etl_code
			default_template := vdjr0b_default_template
			current_class := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			parameters.put (arg.out, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second parent base class
			-- dollar9: $9 = argument index
		end

	make_vdjr0c (a_class: like current_class; f1, f2: ET_INHERITED_FEATURE) is
			-- Create a new VDJR error: the type of the result is
			-- not identical in `f1' and `f2' when joining these
			-- two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdjr0c_template_code
			etl_code := vdjr_etl_code
			default_template := vdjr0c_default_template
			current_class := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second parent base class
		end

	make_vdrd2a (a_class: like current_class; f1: ET_FLATTENED_FEATURE; f2: ET_INHERITED_FEATURE) is
			-- Create a new VDRD-2 error: the feature `f2' is redeclared
			-- as `f1' in `a_class', but the signature of `f1' in `a_class'
			-- does not conform to the signature of `f2' in its parent class.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrd2a_template_code
			etl_code := vdrd2_etl_code
			default_template := vdrd2a_default_template
			current_class := a_class
			position := f1.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f2.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = precursor feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrd2b (a_class: like current_class; f1, f2: ET_INHERITED_FEATURE) is
			-- Create a new VDRD-2 error: the feature `f2' is redeclared
			-- by being merged to `f1' in `a_class', but the signature of
			-- `f1' in `a_class' does not conform to the signature of
			-- `f2' in its parent class.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrd2b_template_code
			etl_code := vdrd2_etl_code
			default_template := vdrd2b_default_template
			current_class := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.name.name, 8)
			parameters.put (f2.parent.type.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class of feature
			-- dollar8: $8 = redeclared feature name
			-- dollar9: $9 = parent base class of redeclared feature
		end

	make_vdrd3a (a_class: like current_class; p: ET_PRECONDITIONS; f: ET_FLATTENED_FEATURE) is
			-- Create a new VDRD-3 error: the feature `f' is redeclared
			-- in `a_class', but its preconditions do not begin with
			-- 'require else'.
			--
			-- ETL2: p.163
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			p_not_void: p /= Void
			p_not_valid: not p.is_require_else
			f_not_void: f /= Void
		do
			code := vdrd3a_template_code
			etl_code := vdrd3_etl_code
			default_template := vdrd3a_default_template
			current_class := a_class
			position := p.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vdrd3b (a_class: like current_class; p: ET_POSTCONDITIONS; f: ET_FLATTENED_FEATURE) is
			-- Create a new VDRD-3 error: the feature `f' is redeclared
			-- in `a_class', but its postconditions do not begin with
			-- 'ensure then'.
			--
			-- ETL2: p.163
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			p_not_void: p /= Void
			p_not_valid: not p.is_ensure_then
			f_not_void: f /= Void
		do
			code := vdrd3b_template_code
			etl_code := vdrd3_etl_code
			default_template := vdrd3b_default_template
			current_class := a_class
			position := p.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vdrd4a (a_class: like current_class; f1: ET_INHERITED_FEATURE; f2: ET_FLATTENED_FEATURE) is
			-- Create a new VDRD-4 error: the deferred feature `f1'
			-- is redefined into the deferred feature `f2' in `a_class'
			-- but is not listed in the Redefine subclause.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_deferred: f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_deferred: f2.is_deferred
		do
			code := vdrd4a_template_code
			etl_code := vdrd4_etl_code
			default_template := vdrd4a_default_template
			current_class := a_class
			position := f2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd4b (a_class: like current_class; f1: ET_INHERITED_FEATURE; f2: ET_FLATTENED_FEATURE) is
			-- Create a new VDRD-4 error: the effective feature `f1'
			-- is redefined into the effective feature `f2' in `a_class'
			-- but is not listed in the Redefine subclause.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_not_deferred: not f2.is_deferred
		do
			code := vdrd4b_template_code
			etl_code := vdrd4_etl_code
			default_template := vdrd4b_default_template
			current_class := a_class
			position := f2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd4c (a_class: like current_class; f1: ET_INHERITED_FEATURE; f2: ET_FLATTENED_FEATURE) is
			-- Create a new VDRD-4 error: the effective feature `f1'
			-- is redefined into the deferred feature `f2' in `a_class'
			-- but is not listed in the Undefine and Redefine subclauses.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_deferred: f2.is_deferred
		do
			code := vdrd4c_template_code
			etl_code := vdrd4_etl_code
			default_template := vdrd4c_default_template
			current_class := a_class
			position := f2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd5a (a_class: like current_class; f1: ET_INHERITED_FEATURE; f2: ET_FLATTENED_FEATURE) is
			-- Create a new VDRD-5 error: the effective feature
			-- `f1' is redefined into the deferred feature `f2'
			-- in `a_class'.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_redefined: f1.has_redefine
			f2_not_void: f2 /= Void
			f2_deferred: f2.is_deferred
		do
			code := vdrd5a_template_code
			etl_code := vdrd5_etl_code
			default_template := vdrd5a_default_template
			current_class := a_class
			position := f1.redefine_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs1a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDRS-1 error: the Redefine subclause of
			-- `a_parent' in `a_class' lists `f' which is not the final
			-- name in `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdrs1a_template_code
			etl_code := vdrs1_etl_code
			default_template := vdrs1a_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs2a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDRS-2 error: the Redefine subclause of
			-- `a_parent' in `a_class' lists `f' which is the final
			-- name of a frozen feature.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdrs2a_template_code
			etl_code := vdrs2_etl_code
			default_template := vdrs2a_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs2b (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDRS-2 error: the Redefine subclause of
			-- `a_parent' in `a_class' lists `f' which is the final
			-- name of a constant attribute.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdrs2b_template_code
			etl_code := vdrs2_etl_code
			default_template := vdrs2b_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs3a (a_class: like current_class; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VDRS-3 error: feature name `f2' appears twice
			-- in the Redefine subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrs3a_template_code
			etl_code := vdrs3_etl_code
			default_template := vdrs3a_default_template
			current_class := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs4a (a_class: like current_class; a_feature: ET_INHERITED_FEATURE) is
			-- Create a new VDRS-4 error: `a_feature' is not redefined
			-- in `a_class' and therefore should not be listed in the
			-- Redefine subclause.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_redefined: a_feature.has_redefine
		do
			code := vdrs4a_template_code
			etl_code := vdrs4_etl_code
			default_template := vdrs4a_default_template
			current_class := a_class
			position := a_feature.redefine_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.redefine_name.name, 6)
			parameters.put (a_feature.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs4b (a_class: like current_class; a_deferred: ET_INHERITED_FEATURE; an_effective: ET_FLATTENED_FEATURE) is
			-- Create a new VDRS-4 error: deferred feature `a_deferred' should
			-- not be listed in the Redefine subclause when being effected
			-- to `an_effective' in `a_class'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_deferred_not_void: a_deferred /= Void
			a_deferred_deferred: a_deferred.is_deferred
			a_deferred_redefined: a_deferred.has_redefine
			an_effective_not_void: an_effective /= Void
			an_effective_not_deferred: not an_effective.is_deferred
		do
			code := vdrs4b_template_code
			etl_code := vdrs4_etl_code
			default_template := vdrs4b_default_template
			current_class := a_class
			position := a_deferred.redefine_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_deferred.redefine_name.name, 6)
			parameters.put (a_deferred.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus1a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-1 error: the Undefine subclause
			-- of `a_parent' in `a_class' lists `f' which is not
			-- the final name in `a_class' of a feature inherited
			-- from `a_parent'.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus1a_template_code
			etl_code := vdus1_etl_code
			default_template := vdus1a_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus2a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-2 error: the Undefine subclause
			-- of `a_parent' in `a_class' lists `f' which is the
			-- final name of a frozen feature.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus2a_template_code
			etl_code := vdus2_etl_code
			default_template := vdus2a_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus2b (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-2 error: the Undefine subclause of
			-- `a_parent' in `a_class' lists `f' which is the final
			-- name of an attribute.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus2b_template_code
			etl_code := vdus2_etl_code
			default_template := vdus2b_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus3a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-3 error: the Undefine subclause
			-- of `a_parent' in `a_class' lists `f' which is not
			-- the final name of an effective feature in `a_parent'.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus3a_template_code
			etl_code := vdus3_etl_code
			default_template := vdus3a_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus4a (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VDUS-4 error: feature name `f2' appears
			-- twice in the Undefine subclause of parent `a_parent'
			-- in `a_class'.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdus4a_template_code
			etl_code := vdus4_etl_code
			default_template := vdus4a_default_template
			current_class := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vgcc6a (a_class: like current_class; cp: ET_FEATURE_NAME; f: ET_FLATTENED_FEATURE) is
			-- Create a new VGCC-6 error: creation procedure name
			-- `cp' is the final name of a once-procedure in `a_class'.
			--
			-- ETL2: p.286
			-- ETL3 (4.82-00-00): p.432 (VGCC-4)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_name: f.name.same_feature_name (cp)
			f_procedure: f.is_procedure
			f_once: f.is_once
		do
			code := vgcc6a_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6a_default_template
			current_class := a_class
			position := cp.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
		end

	make_vgcp1a (a_class: like current_class; a_creator: ET_CREATOR) is
			-- Create a new VGCP-1 error: `a_class' is deferred
			-- but has a Creation clause.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creator_not_void: a_creator /= Void
		do
			code := vgcp1a_template_code
			etl_code := vgcp1_etl_code
			default_template := vgcp1a_default_template
			current_class := a_class
			position := a_creator.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vgcp2a (a_class: like current_class; cp: ET_FEATURE_NAME) is
			-- Create a new VGCP-2 error: creation procedure name
			-- `cp' is not the final name of a feature in `a_class'.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
		do
			code := vgcp2a_template_code
			etl_code := vgcp2_etl_code
			default_template := vgcp2a_default_template
			current_class := a_class
			position := cp.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
		end

	make_vgcp2b (a_class: like current_class; cp: ET_FEATURE_NAME; f: ET_FLATTENED_FEATURE) is
			-- Create a new VGCP-2 error: creation procedure name
			-- `cp' is not the final name of a procedure in `a_class'.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_name: f.name.same_feature_name (cp)
			f_not_procedure: not f.is_procedure
		do
			code := vgcp2b_template_code
			etl_code := vgcp2_etl_code
			default_template := vgcp2b_default_template
			current_class := a_class
			position := cp.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
		end

	make_vgcp3a (a_class: like current_class; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VGCP-3 error: procedure name
			-- appears twice in creation Feature_list.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vgcp3a_template_code
			etl_code := vgcp3_etl_code
			default_template := vgcp3a_default_template
			current_class := a_class
			position := f2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = procedure name
		end

	make_vgcp3b (a_class: like current_class; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VGCP-3 error: procedure name
			-- appears in two different Creation clauses.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vgcp3b_template_code
			etl_code := vgcp3_etl_code
			default_template := vgcp3b_default_template
			current_class := a_class
			position := f2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = procedure name
		end

	make_vgcp3c (a_class: like current_class; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VGCP-3 error: procedure name
			-- appears twice in creation Feature_list of
			-- a generic constraint.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vgcp3c_template_code
			etl_code := vgcp3_etl_code
			default_template := vgcp3c_default_template
			current_class := a_class
			position := f2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = procedure name
		end

	make_vhpr1a (a_class: like current_class; a_cycle: DS_LIST [ET_CLASS]) is
			-- Create a new VHPR-1 error: `a_class' is 
			-- involved in the inheritance cycle `a_cycle'.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cycle_not_void: a_cycle /= Void
			no_void_class: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_CLASS]
			a_string: STRING
		do
			code := vhpr1a_template_code
			etl_code := vhpr1_etl_code
			default_template := vhpr1a_default_template
			current_class := a_class
			position := null_position
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vhpr3a (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vhpr3a_template_code
			etl_code := vhpr3_etl_code
			default_template := vhpr3a_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vhpr3b (a_class: like current_class; a_type: ET_BIT_N) is
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vhpr3b_template_code
			etl_code := vhpr3_etl_code
			default_template := vhpr3b_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vhpr3c (a_class: like current_class; a_type: ET_LIKE_TYPE) is
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vhpr3c_template_code
			etl_code := vhpr3_etl_code
			default_template := vhpr3c_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vhrc1a (a_class: like current_class; a_parent: ET_PARENT; a_rename: ET_RENAME) is
			-- Create a new VHRC-1 error: the feature name appearing as first
			-- element of the Rename_pair `a_rename' in Parent clause
			-- `a_parent' in `a_class' is not the final name of a feature
			-- in `a_parent'.
			--
			-- ETL2: p.81
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
		do
			code := vhrc1a_template_code
			etl_code := vhrc1_etl_code
			default_template := vhrc1a_default_template
			current_class := a_class
			position := a_rename.old_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename.old_name.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vhrc2a (a_class: like current_class; a_parent: ET_PARENT; a_rename1, a_rename2: ET_RENAME) is
			-- Create a new VHRC-2 error: a feature name appears more
			-- than once (e.g. also in `a_rename1') as first element
			-- of the Rename_pair `a_rename2' in Parent clause
			-- `a_parent' in `a_class'.
			--
			-- ETL2: p.81
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
		do
			code := vhrc2a_template_code
			etl_code := vhrc2_etl_code
			default_template := vhrc2a_default_template
			current_class := a_class
			position := a_rename2.old_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename2.old_name.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vhrc4a (a_class: like current_class; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FLATTENED_FEATURE) is
			-- Create a new VHRC-4 error: the Rename_pair
			-- `a_rename' has a new_name of the Prefix form,
			-- but the corresponding feature `f' is not an
			-- attibute nor a function with no argument.
			--
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			f_not_void: f /= Void
		do
			code := vhrc4a_template_code
			etl_code := vhrc4_etl_code
			default_template := vhrc4a_default_template
			current_class := a_class
			position := a_rename.new_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename.new_name.name, 6)
			parameters.put (f.name.name, 7)
			parameters.put (a_parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = new prefix name
			-- dollar7: $7 = old feature name
			-- dollar8: $8 = parent base class
		end

	make_vhrc5a (a_class: like current_class; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FLATTENED_FEATURE) is
			-- Create a new VHRC-5 error: the Rename_pair `a_rename' has
			-- a new_name of the Infix form, but the corresponding feature
			-- `f' is not a function with one argument.
			--
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			f_not_void: f /= Void
		do
			code := vhrc5a_template_code
			etl_code := vhrc5_etl_code
			default_template := vhrc5a_default_template
			current_class := a_class
			position := a_rename.new_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename.new_name.name, 6)
			parameters.put (f.name.name, 7)
			parameters.put (a_parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = new infix name
			-- dollar7: $7 = old feature name
			-- dollar8: $8 = parent base class
		end

	make_vmfn0a (a_class: like current_class; f1, f2: ET_FEATURE) is
			-- Create a new VMFN error: `a_class' introduced two features
			-- `f1' and `f2' with the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vmfn0a_template_code
			etl_code := vmfn_etl_code
			default_template := vmfn0a_default_template
			current_class := a_class
			position := f2.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vmfn0b (a_class: like current_class; f1: ET_INHERITED_FEATURE; f2: ET_FLATTENED_FEATURE) is
			-- Create a new VMFN error: `a_class' introduces feature `f2'
			-- but `f1' has the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
		do
			code := vmfn0b_template_code
			etl_code := vmfn_etl_code
			default_template := vmfn0b_default_template
			current_class := a_class
			position := f2.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name.name, 6)
			parameters.put (f1.precursor_feature.name.name, 7)
			parameters.put (f1.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first feature name (in current class)
			-- dollar7: $7 = second feature name (in parent)
			-- dollar8: $8 = parent base class
		end

	make_vmfn0c (a_class: like current_class; f1, f2: ET_INHERITED_FEATURE) is
			-- Create a new VMFN error: `a_class' inherits two effective
			-- features `f1' and `f2' with the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_not_deferred: not f2.is_deferred
			f2_not_redefined: not f2.has_redefine
		do
			code := vmfn0c_template_code
			etl_code := vmfn_etl_code
			default_template := vmfn0c_default_template
			current_class := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.precursor_feature.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.precursor_feature.name.name, 8)
			parameters.put (f2.parent.type.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second feature name
			-- dollar9: $9 = second parent base class
		end

	make_vmrc2a (a_class: like current_class; replicated_features: DS_LIST [ET_INHERITED_FEATURE]) is
			-- Create a new VMRC-2 error: the replicated features in
			-- `replicated_features' have not been selected in one of
			-- the Parent clauses of `a_class'.
			--
			-- ETL2: p.191
			-- ETR: p.43
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			replicated_features_not_void: replicated_features /= Void
			no_void_feature: not replicated_features.has (Void)
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
			a_string: STRING
		do
			code := vmrc2a_template_code
			etl_code := vmrc2_etl_code
			default_template := vmrc2a_default_template
			current_class := a_class
			a_feature := replicated_features.first
			position := a_feature.parent.type.name.position
			a_cursor := replicated_features.new_cursor
			from
				create a_string.make (20)
				a_cursor.start
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", ")
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = replicated features
		end

	make_vmrc2b (a_class: like current_class; replicated_features: DS_LIST [ET_INHERITED_FEATURE]) is
			-- Create a new VMRC-2 error: the replicated features in
			-- `replicated_features' have been selected in more than
			-- one of the Parent clauses of `a_class'.
			--
			-- ETL2: p.191
			-- ETR: p.43
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			replicated_features_not_void: replicated_features /= Void
			no_void_feature: not replicated_features.has (Void)
			-- all_selected: forall f in replicated_features, f.has_select
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
			a_string: STRING
		do
			code := vmrc2a_template_code
			etl_code := vmrc2_etl_code
			default_template := vmrc2a_default_template
			current_class := a_class
			a_feature := replicated_features.first
			position := a_feature.select_name.position
			a_cursor := replicated_features.new_cursor
			from
				create a_string.make (20)
				a_cursor.start
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", ")
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = replicated features
		end

	make_vmss1a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VMSS-1 error: the Select subclause of `a_parent'
			-- in `a_class' lists `f' which is not the final name in
			-- `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.192
			-- ETR: p.44
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vmss1a_template_code
			etl_code := vmss1_etl_code
			default_template := vmss1a_default_template
			current_class := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vmss2a (a_class: like current_class; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VMSS-2 error: feature name `f2' appears twice
			-- in the Select subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.192
			-- ETR: p.44
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vmss2a_template_code
			etl_code := vmss2_etl_code
			default_template := vmss2a_default_template
			current_class := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vmss3a (a_class: like current_class; a_feature: ET_INHERITED_FEATURE) is
			-- Create a new VMSS-3 error: the Select subclause
			-- of a parent of `a_class' lists `a_feature' which
			-- is not replicated.
			--
			-- ETL2: p.192
			-- ETR: p.44
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_selected: a_feature.has_select
		do
			code := vmss3a_template_code
			etl_code := vmss3_etl_code
			default_template := vmss3a_default_template
			current_class := a_class
			position := a_feature.select_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.select_name.name, 6)
			parameters.put (a_feature.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vreg0a (a_class: like current_class; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FLATTENED_FEATURE) is
			-- Create a new VREG error: `arg1' and `arg2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			arg2_not_void: arg2 /= Void
			f_not_void: f /= Void
		do
			code := vreg0a_template_code
			etl_code := vreg_etl_code
			default_template := vreg0a_default_template
			current_class := a_class
			position := arg2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (arg2.name.name, 6)
			parameters.put (f.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = argument name
			-- dollar7: $7 = feature name
		end

	make_vrfa0a (a_class: like current_class; arg: ET_FORMAL_ARGUMENT; f1, f2: ET_FLATTENED_FEATURE) is
			-- Create a new VRFA error: `arg' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vrfa0a_template_code
			etl_code := vrfa_etl_code
			default_template := vrfa0a_default_template
			current_class := a_class
			position := arg.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (arg.name.name, 6)
			parameters.put (f1.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = argument name
			-- dollar7: $7 = feature name (where argument appears)
		end

	make_vscn0a (a_class: like current_class; other_cluster: ET_CLUSTER; other_filename: STRING) is
			-- Create a new VSCN error: `a_class' also appears in
			-- `other_cluster'.
			--
			-- ETL2: p.38
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			other_cluster_not_void: other_cluster /= Void
			other_filename_not_void: other_filename /= Void
		do
			code := vscn0a_template_code
			etl_code := vscn_etl_code
			default_template := vscn0a_default_template
			current_class := a_class
			position := null_position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class.cluster.full_pathname, 6)
			parameters.put (a_class.filename, 7)
			parameters.put (other_cluster.full_pathname, 8)
			parameters.put (other_filename, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first cluster pathname
			-- dollar7: $7 = first class filename
			-- dollar8: $8 = second cluster pathname
			-- dollar9: $9 = second class filename
		end

	make_vtat1a (a_class: like current_class; a_type: ET_LIKE_FEATURE) is
			-- Create a new VTAT error: the anchor in the Anchored_type
			-- must be the final name of a query in `a_class'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtat1a_template_code
			etl_code := vtat1_etl_code
			default_template := vtat1a_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = anchor name
		end

	make_vtat1b (a_class: like current_class; a_feature: ET_FEATURE; a_type: ET_LIKE_FEATURE) is
			-- Create a new VTAT error: the anchor in the
			-- Anchored_type must be the final name of a query
			-- in `a_class' or an argument of `a_feature'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
		do
			code := vtat1b_template_code
			etl_code := vtat1_etl_code
			default_template := vtat1b_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			parameters.put (a_feature.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = anchor name
			-- dollar8: $8 = feature name
		end

	make_vtat1c (a_class: like current_class; a_type: ET_QUALIFIED_LIKE_CURRENT) is
			-- Create a new VTAT error: the anchor in the
			-- Anchored_type must be the final name of a query
			-- in `a_class'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtat1c_template_code
			etl_code := vtat1_etl_code
			default_template := vtat1c_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = anchor name
		end

	make_vtat1d (a_class: like current_class; a_type: ET_QUALIFIED_TYPE; other_class: ET_CLASS) is
			-- Create a new VTAT error: the anchor in the Anchored_type
			-- must be the final name of a query in `other_class'.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			other_class_not_void: other_class /= Void
		do
			code := vtat1d_template_code
			etl_code := vtat1_etl_code
			default_template := vtat1d_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			parameters.put (other_class.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = anchor name
			-- dollar8: $8 = remote class name
		end

	make_vtat2a (a_class: like current_class; a_cycle: DS_LIST [ET_LIKE_IDENTIFIER]) is
			-- Create a new VTAT error: the anchors in `a_cycle'
			-- are cyclic anchors in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_anchor: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_LIKE_IDENTIFIER]
			a_like: ET_LIKE_IDENTIFIER
			a_feature: ET_FEATURE
			a_string: STRING
		do
			code := vtat2a_template_code
			etl_code := vtat2_etl_code
			default_template := vtat2a_default_template
			current_class := a_class
				-- Look for an anchor that has been written
				-- in `current_class'. Even though we consider
				-- that there was no cycles in the parents of
				-- `current_class', it is possible that no anchor
				-- have been written in `current_class' but get
				-- a cycle anyway. For example:
				--
				--   deferred class A
				--   feature
				--      f: like g is do ... end
				--      g: ANY is deferred end
				--   end
				--
				--   deferred class B
				--   feature
				--      f: ANY is deferred end
				--      g: like f is do ... end
				--   end
				--
				--   class C
				--   inherit
				--        A
				--        B
				--   end
				--
				-- The flat-short of class C will have something
				-- like that:
				--
				--   f: like g is do ... end
				--   g: like f is do ... end
				--
				-- `position' is set to null in that case.
			position := null_position
			a_cursor := a_cycle.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_like := a_cursor.item
				a_feature := current_class.seeded_feature (a_like.seed)
				if a_feature /= Void and then a_feature.implementation_class = current_class then
					if a_like.is_like_argument then
						position := a_like.name.position
						a_cursor.go_after
					else
						a_cursor.forth
						if not a_cursor.after then
							position := a_cursor.item.name.position
							a_cursor.go_after
						end
					end
				else
					a_cursor.forth
				end
			end
			from
				create a_string.make (20)
				a_cursor.start
				a_like := a_cursor.item
				if a_like.is_like_argument then
					a_string.append_string (a_like.name.name)
				else
						-- Take care of possible renaming.
					a_feature := current_class.seeded_feature (a_like.seed)
					if a_feature /= Void then
						a_string.append_string (a_feature.name.name)
					else
						a_string.append_string (a_like.name.name)
					end
				end
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_like := a_cursor.item
				if a_like.is_like_argument then
					a_string.append_string (a_like.name.name)
				else
						-- Take care of possible renaming.
					a_feature := current_class.seeded_feature (a_like.seed)
					if a_feature /= Void then
						a_string.append_string (a_feature.name.name)
					else
						a_string.append_string (a_like.name.name)
					end
				end
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vtbt0a (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VTBT error: the identifier in Bit_type
			-- must be the final name of a constant attribute of
			-- type INTEGER.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0a_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0a_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = constant feature name
		end

	make_vtbt0b (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VTBT error: the identifier in
			-- Bit_type must be the final name of a feature.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0b_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0b_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = constant feature name
		end

	make_vtbt0c (a_class: like current_class; a_type: ET_BIT_TYPE) is
			-- Create a new VTBT error: size for Bit_type must
			-- be a positive integer constant.
			--
			-- ETL2: p.210
			-- ETR: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0c_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0c_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vtbt0d (a_class: like current_class; a_type: ET_BIT_TYPE) is
			-- Create a new VTBT error: size for Bit_type must
			-- be a positive integer constant but it is actually
			-- equal to -0.
			--
			-- ETL2: p.210
			-- ETR: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0d_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0d_default_template
			current_class := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vtcg0a (a_class: like current_class; an_actual, a_constraint: ET_TYPE) is
			-- Create a new VTCG error: actual generic paramater
			-- `an_actual' in class `where' does not conform to
			-- constraint `a_constraint'.
			--
			-- ETL2: p.203
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_actual_not_void: an_actual /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			code := vtcg0a_template_code
			etl_code := vtcg_etl_code
			default_template := vtcg0a_default_template
			current_class := a_class
			position := an_actual.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_actual.to_text, 6)
			parameters.put (a_constraint.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = actual generic parameter
			-- dollar7: $7 = generic constraint
		end

	make_vtct0a (a_class: like current_class; a_type: ET_BASE_TYPE) is
			-- Create a new VTCT error: `a_type' based on unknown
			-- class in class `a_class'.
			--
			-- ETL2: p.199
			-- ETR: p.45
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtct0a_template_code
			etl_code := vtct_etl_code
			default_template := vtct0a_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = type base class
		end

	make_vtct0b (a_class: like current_class; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VTCT error: `a_type' based on unknown
			-- class in class `a_class'.
			--
			-- ETL2: p.199
			-- ETR: p.45
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtct0b_template_code
			etl_code := vtct_etl_code
			default_template := vtct0b_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = type base class
		end

	make_vtct0c (a_class: like current_class) is
			-- Create a new VTCT error: `a_class' implicitly inherits
			-- from unknown class ANY.
			--
			-- ETL2: p.199
			-- ETR: p.45
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			code := vtct0c_template_code
			etl_code := vtct_etl_code
			default_template := vtct0c_default_template
			current_class := a_class
			position := null_position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vtgc0a (a_class: like current_class; cp: ET_FEATURE_NAME; a_constraint: ET_CLASS) is
			-- Create a new VTGC error: creation procedure name `cp'
			-- is not the final name of a feature in the base class
			-- `a_constraint' of a generic constraint of `a_class'.
			--
			-- ETL3 (4.82-00-00): p.261 (CTGC)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			code := vtgc0a_template_code
			etl_code := vtgc_etl_code
			default_template := vtgc0a_default_template
			current_class := a_class
			position := cp.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			parameters.put (a_constraint.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
			-- dollar7: $7 = constraint base class name
		end

	make_vtgc0b (a_class: like current_class; cp: ET_FEATURE_NAME; f: ET_FLATTENED_FEATURE; a_constraint: ET_CLASS) is
			-- Create a new VTGC error: creation procedure name `cp'
			-- is not the final name of a procedure in the base class
			-- `a_constraint' of a generic constraint of `a_class'.
			--
			-- ETL3 (4.82-00-00): p.261 (CTGC)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_name: f.name.same_feature_name (cp)
			f_not_procedure: not f.is_procedure
			a_constraint_not_void: a_constraint /= Void
		do
			code := vtgc0b_template_code
			etl_code := vtgc_etl_code
			default_template := vtgc0b_default_template
			current_class := a_class
			position := cp.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			parameters.put (a_constraint.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
			-- dollar7: $7 = constraint base class name
		end

	make_vtug1a (a_class: like current_class; a_type: ET_CLASS_TYPE) is
			-- Create a new VTUG-1 error: `a_type', which appears in
			-- source code of `a_class', has actual generic parameters
			-- but its base class is not generic.
			--
			-- ETL2: p.201
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtug1a_template_code
			etl_code := vtug1_etl_code
			default_template := vtug1a_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = invalid type's base class
		end

	make_vtug2a (a_class: like current_class; a_type: ET_CLASS_TYPE) is
			-- Create a new VTUG-2 error: `a_type', which appears
			-- in source code of `a_class', has the wrong number
			-- of actual generic parameters.
			--
			-- ETL2: p.201
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtug2a_template_code
			etl_code := vtug2_etl_code
			default_template := vtug2a_default_template
			current_class := a_class
			position := a_type.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_gvagp0a (a_class: like current_class; anc1, anc2: ET_BASE_TYPE) is
			-- Create a new GVAGP error: `anc1' and `anc2' are two ancestors
			-- of `a_class' with the same base class but different generic
			-- parameters.
			--
			-- Not in ETL
			-- GVAGP: Gobo Validity Ancestor Generic Parameter mismatch
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			anc1_not_void: anc1 /= Void
			anc2_not_void: anc2 /= Void
		do
			code := gvagp0a_template_code
			etl_code := gvagp_etl_code
			default_template := gvagp0a_default_template
			current_class := a_class
			position := null_position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (anc1.to_text, 6)
			parameters.put (anc2.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = ancestor1
			-- dollar7: $7 = ancestor2
		end

	make_gvhpr4a (a_class: like current_class; a_parent: ET_BIT_N) is
			-- Create a new GVHPR-4 error: cannot inherit from Bit_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-4: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		do
			code := gvhpr4a_template_code
			etl_code := gvhpr4_etl_code
			default_template := gvhpr4a_default_template
			current_class := a_class
			position := a_parent.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_parent.position.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = parent
		end

	make_gvhpr5a (a_class: like current_class; a_parent: ET_TUPLE_TYPE) is
			-- Create a new GVHPR-5 error: cannot inherit from Tuple_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-5: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		do
			code := gvhpr5a_template_code
			etl_code := gvhpr5_etl_code
			default_template := gvhpr5a_default_template
			current_class := a_class
			position := a_parent.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_parent.position.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = parent
		end

feature -- Access

	filename: STRING is
			-- Name of file where current error occurred
		do
			Result := current_class.filename
		end

feature -- Setting

	set_current_class (a_class: like current_class) is
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
		ensure
			current_class_set: current_class = a_class
		end

feature {NONE} -- Implementation

	vcch1a_default_template: STRING is "[$1] Class $5 ($3,$4): class is not marked as deferred but has deferred feature `$6'."
	vcch1b_default_template: STRING is "[$1] Class $5 ($3,$4): class is not marked as deferred but has deferred feature `$6' inherited from $7."
	vcch2a_default_template: STRING is "[$1] Class $5 ($3,$4): class is marked as deferred but has no deferred feature."
	vcfg1a_default_template: STRING is "[$1] Class $5 ($3,$4): formal generic parameter '$6' has the same name as a class in the surrounding universe."
	vcfg2a_default_template: STRING is "[$1] Class $5 ($3,$4): '$6' is the name of formal generic parameters #$7 and #$8."
	vcfg3a_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6' in constraint of formal generic parameter."
	vcfg3b_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6' in constraint of formal generic parameter."
	vcfg3c_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6' in constraint of formal generic parameter."
	vcfg3d_default_template: STRING is "[$1] Class $5 ($3,$4): constraint of formal generic parameter '$6' is '$7' itself."
	vcfg3e_default_template: STRING is "[$1] Class $5 ($3,$4): constraint of formal generic parameter '$6' is another formal generic parameter '$7'."
	vcfg3g_default_template: STRING is "[$1] Class $5 ($3,$4): formal generic constraint cycle $6."
	vcfg3h_default_template: STRING is "[$1] Class $5 ($3,$4): constraint of formal generic parameter '$6' contains '$7' itself."
	vcfg3j_default_template: STRING is "[$1] Class $5 ($3,$4): formal generic constraint cycle $6."
	vdjr0a_default_template: STRING is "[$1] Class $5 ($3,$4): joined deferred features `$6' inherited from $7 and $8 don't have the same signature. Different number of arguments."
	vdjr0b_default_template: STRING is "[$1] Class $5 ($3,$4): joined deferred features `$6' inherited from $7 and $8 don't have the same signature. Type of argument number $9 differs."
	vdjr0c_default_template: STRING is "[$1] Class $5 ($3,$4): joined deferred features `$6' inherited from $7 and $8 don't have the same signature. Type of result differs."
	vdrd2a_default_template: STRING is "[$1] Class $5 ($3,$4): signature of feature `$6' does not conform to the signature of redeclared feature `$7' in parent $8."
	vdrd2b_default_template: STRING is "[$1] Class $5 ($3,$4): signature of feature `$6' inherited from $7 does not conform to the signature of redeclared feature `$8' in parent $9."
	vdrd3a_default_template: STRING is "[$1] Class $5 ($3,$4): feature `$6' is redeclared but its preconditions do not begin with 'require else'."
	vdrd3b_default_template: STRING is "[$1] Class $5 ($3,$4): feature `$6' is redeclared but its postconditions do not begin with 'ensure then'."
	vdrd4a_default_template: STRING is "[$1] Class $5 ($3,$4): deferred feature `$6' inherited from $7 is redefined but is not listed in the Redefine subclause."
	vdrd4b_default_template: STRING is "[$1] Class $5 ($3,$4): effective feature `$6' inherited from $7 is redefined but is not listed in the Redefine subclause."
	vdrd4c_default_template: STRING is "[$1] Class $5 ($3,$4): effective feature `$6' inherited from $7 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses."
	vdrd5a_default_template: STRING is "[$1] Class $5 ($3,$4): effective feature `$6' inherited from $7 is redefined into a deferred one."
	vdrs1a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vdrs2a_default_template: STRING is "[$1] Class $5 ($3,$4): cannot redefine the frozen feature `$6'."
	vdrs2b_default_template: STRING is "[$1] Class $5 ($3,$4): cannot redefine the constant attribute `$6'."
	vdrs3a_default_template: STRING is "[$1] Class $5 ($3,$4): feature name `$6' appears twice in the Redefine subclause of parent $7."
	vdrs4a_default_template: STRING is "[$1] Class $5 ($3,$4): Redefine subclause of $7 lists feature `$6' but it is not redefined."
	vdrs4b_default_template: STRING is "[$1] Class $5 ($3,$4): redeclaration of feature `$6' from $7 is an effecting and should not appear in the Redefine subclause."
	vdus1a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vdus2a_default_template: STRING is "[$1] Class $5 ($3,$4): cannot undefine the frozen feature `$6'."
	vdus2b_default_template: STRING is "[$1] Class $5 ($3,$4): cannot undefine the attribute `$6'."
	vdus3a_default_template: STRING is "[$1] Class $5 ($3,$4): cannot undefine the deferred feature `$6'."
	vdus4a_default_template: STRING is "[$1] Class $5 ($3,$4): feature name `$6' appears twice in the Undefine subclause of parent $7."
	vgcc6a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is the final name of a once-procedure."
	vgcp1a_default_template: STRING is "[$1] Class $5 ($3,$4): deferred class has a creation clause."
	vgcp2a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a procedure."
	vgcp2b_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a procedure."
	vgcp3a_default_template: STRING is "[$1] Class $5 ($3,$4): procedure name `$6' appears twice in creation clause."
	vgcp3b_default_template: STRING is "[$1] Class $5 ($3,$4): procedure name `$6' appears in two different creation clauses."
	vgcp3c_default_template: STRING is "[$1] Class $5 ($3,$4): procedure name `$6' appears twice in creation clause of constraint."
	vhpr1a_default_template: STRING is "[$1] Class $5: inheritance cycle $6."
	vhpr3a_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6' in parent clause."
	vhpr3b_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6' in parent clause."
	vhpr3c_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6' in parent clause."
	vhrc1a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vhrc2a_default_template: STRING is "[$1] Class $5 ($3,$4): feature name `$6' appears as first element of two Rename_pairs."
	vhrc4a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is of the Prefix form but `$7' in $8 is not an attribute nor a function with no argument."
	vhrc5a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is of the Infix form but `$7' in $8 is not a function with one argument."
	vmfn0a_default_template: STRING is "[$1] Class $5 ($3,$4): two features with the same name `$6'."
	vmfn0b_default_template: STRING is "[$1] Class $5 ($3,$4): two features with the same name `$6' in current class and `$7' inherited from $8."
	vmfn0c_default_template: STRING is "[$1] Class $5 ($3,$4): two features with the same name `$6' inherited from $7 and `$8' inherited from $9."
	vmrc2a_default_template: STRING is "[$1] Class $5 ($3,$4): replicated features $6 have not been selected."
	vmrc2b_default_template: STRING is "[$1] Class $5 ($3,$4): replicated features $6 have been selected more than once."
	vmss1a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vmss2a_default_template: STRING is "[$1] Class $5 ($3,$4): feature name `$6' appears twice in the Select subclause of parent $7."
	vmss3a_default_template: STRING is "[$1] Class $5 ($3,$4): class name clash: first file '$7', second file '$9'."
	vreg0a_default_template: STRING is "[$1] Class $5 ($3,$4): argument name '$6' appear twice in feature `$7'."
	vrfa0a_default_template: STRING is "[$1] Class $5 ($3,$4): argument name '$6' in feature `$7' is also the final name of feature."
	vscn0a_default_template: STRING is "[$1] Class $5: class appears in files '$7' and '$9'."
	vtat1a_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': the anchor `$7' must be the final name of a query."
	vtat1b_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': the anchor `$7' must be the final name of a query, or an argument of routine `$8'."
	vtat1c_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': the anchor `$7' must be the final name of a query."
	vtat1d_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': the anchor `$7' must be the final name of a query in class $8."
	vtat2a_default_template: STRING is "[$1] Class $5 ($3,$4): anchor cycle $6."
	vtbt0a_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': `$7' is not the final name of a constant attribute of type INTEGER."
	vtbt0b_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': `$7' is not the final name of a feature."
	vtbt0c_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': bit size must be a positive integer constant."
	vtbt0d_default_template: STRING is "[$1] Class $5 ($3,$4): invalid type '$6': bit size must be a positive integer constant."
	vtcg0a_default_template: STRING is "[$1] Class $5 ($3,$4): actual generic parameter '$6' does not conform to constraint '$7'."
	vtct0a_default_template: STRING is "[$1] Class $5 ($3,$4): type based on unknown class $6."
	vtct0b_default_template: STRING is "[$1] Class $5 ($3,$4): type based on unknown class $6."
	vtct0c_default_template: STRING is "[$1] Class $5: implicitly inherits from unknown class ANY."
	vtgc0a_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a procedure in constraint's base class $7."
	vtgc0b_default_template: STRING is "[$1] Class $5 ($3,$4): `$6' is not the final name of a procedure in constraint's base class $7."
	vtug1a_default_template: STRING is "[$1] Class $5 ($3,$4): type '$6' has actual generic parameters but class $7 is not generic."
	vtug2a_default_template: STRING is "[$1] Class $5 ($3,$4): type '$6' has wrong number of actual generic parameters."
	gvagp0a_default_template: STRING is "[$1] Class $5: ancestors with generic parameter mismatch: '$6' and '$7'."
	gvhpr4a_default_template: STRING is "[$1] Class $5: cannot inherit from Bit_type '$6'."
	gvhpr5a_default_template: STRING is "[$1] Class $5: cannot inherit from Tuple_type '$6'."
	gvzzz0a_default_template: STRING is "[$1] Class $5 ($3,$4): validity error"
			-- Default templates

	vcch1_etl_code: STRING is "VCCH-1"
	vcch2_etl_code: STRING is "VCCH-2"
	vcfg1_etl_code: STRING is "VCFG-1"
	vcfg2_etl_code: STRING is "VCFG-2"
	vcfg3_etl_code: STRING is "VCFG-3"
	vdjr_etl_code: STRING is "VDJR"
	vdrd2_etl_code: STRING is "VDRD-2"
	vdrd3_etl_code: STRING is "VDRD-3"
	vdrd4_etl_code: STRING is "VDRD-4"
	vdrd5_etl_code: STRING is "VDRD-5"
	vdrs1_etl_code: STRING is "VDRS-1"
	vdrs2_etl_code: STRING is "VDRS-2"
	vdrs3_etl_code: STRING is "VDRS-3"
	vdrs4_etl_code: STRING is "VDRS-4"
	vdus1_etl_code: STRING is "VDUS-1"
	vdus2_etl_code: STRING is "VDUS-2"
	vdus3_etl_code: STRING is "VDUS-3"
	vdus4_etl_code: STRING is "VDUS-4"
	vhpr1_etl_code: STRING is "VHPR-1"
	vgcc6_etl_code: STRING is "VGCC-6"
	vgcp1_etl_code: STRING is "VGCP-1"
	vgcp2_etl_code: STRING is "VGCP-2"
	vgcp3_etl_code: STRING is "VGCP-3"
	vhpr3_etl_code: STRING is "VHPR-3"
	vhrc1_etl_code: STRING is "VHRC-1"
	vhrc2_etl_code: STRING is "VHRC-2"
	vhrc4_etl_code: STRING is "VHRC-4"
	vhrc5_etl_code: STRING is "VHRC-5"
	vmfn_etl_code: STRING is "VMFN"
	vmrc2_etl_code: STRING is "VMRC-2"
	vmss1_etl_code: STRING is "VMSS-1"
	vmss2_etl_code: STRING is "VMSS-2"
	vmss3_etl_code: STRING is "VMSS-3"
	vreg_etl_code: STRING is "VREG"
	vrfa_etl_code: STRING is "VRFA"
	vscn_etl_code: STRING is "VSCN"
	vtat1_etl_code: STRING is "VTAT-1"
	vtat2_etl_code: STRING is "VTAT-2"
	vtbt_etl_code: STRING is "VTBT"
	vtcg_etl_code: STRING is "VTCG"
	vtct_etl_code: STRING is "VTCT"
	vtgc_etl_code: STRING is "VTGC"
	vtug1_etl_code: STRING is "VTUG-1"
	vtug2_etl_code: STRING is "VTUG-2"
	gvagp_etl_code: STRING is "GVAGP"
	gvhpr4_etl_code: STRING is "GVHPR-4"
	gvhpr5_etl_code: STRING is "GVHPR-5"
	gvzzz_etl_code: STRING is "GVZZZ"
			-- ETL validity codes

	vcch1a_template_code: STRING is "vcch1a"
	vcch1b_template_code: STRING is "vcch1b"
	vcch2a_template_code: STRING is "vcch2a"
	vcfg1a_template_code: STRING is "vcfg1a"
	vcfg2a_template_code: STRING is "vcfg2a"
	vcfg3a_template_code: STRING is "vcfg3a"
	vcfg3b_template_code: STRING is "vcfg3b"
	vcfg3c_template_code: STRING is "vcfg3c"
	vcfg3d_template_code: STRING is "vcfg3d"
	vcfg3e_template_code: STRING is "vcfg3e"
	vcfg3g_template_code: STRING is "vcfg3g"
	vcfg3h_template_code: STRING is "vcfg3h"
	vcfg3j_template_code: STRING is "vcfg3j"
	vdjr0a_template_code: STRING is "vdjr0a"
	vdjr0b_template_code: STRING is "vdjr0b"
	vdjr0c_template_code: STRING is "vdjr0c"
	vdrd2a_template_code: STRING is "vdrd2a"
	vdrd2b_template_code: STRING is "vdrd2b"
	vdrd3a_template_code: STRING is "vdrd3a"
	vdrd3b_template_code: STRING is "vdrd3b"
	vdrd4a_template_code: STRING is "vdrd4a"
	vdrd4b_template_code: STRING is "vdrd4b"
	vdrd4c_template_code: STRING is "vdrd4c"
	vdrd5a_template_code: STRING is "vdrd5a"
	vdrs1a_template_code: STRING is "vdrs1a"
	vdrs2a_template_code: STRING is "vdrs2a"
	vdrs2b_template_code: STRING is "vdrs2b"
	vdrs3a_template_code: STRING is "vdrs3a"
	vdrs4a_template_code: STRING is "vdrs4a"
	vdrs4b_template_code: STRING is "vdrs4b"
	vdus1a_template_code: STRING is "vdus1a"
	vdus2a_template_code: STRING is "vdus2a"
	vdus2b_template_code: STRING is "vdus2b"
	vdus3a_template_code: STRING is "vdus3a"
	vdus4a_template_code: STRING is "vdus4a"
	vgcc6a_template_code: STRING is "vgcc6a"
	vgcp1a_template_code: STRING is "vgcp1a"
	vgcp2a_template_code: STRING is "vgcp2a"
	vgcp2b_template_code: STRING is "vgcp2b"
	vgcp3a_template_code: STRING is "vgcp3a"
	vgcp3b_template_code: STRING is "vgcp3b"
	vgcp3c_template_code: STRING is "vgcp3c"
	vhpr1a_template_code: STRING is "vhpr1a"
	vhpr3a_template_code: STRING is "vhpr3a"
	vhpr3b_template_code: STRING is "vhpr3b"
	vhpr3c_template_code: STRING is "vhpr3c"
	vhrc1a_template_code: STRING is "vhrc1a"
	vhrc2a_template_code: STRING is "vhrc2a"
	vhrc4a_template_code: STRING is "vhrc4a"
	vhrc5a_template_code: STRING is "vhrc5a"
	vmfn0a_template_code: STRING is "vmfn0a"
	vmfn0b_template_code: STRING is "vmfn0b"
	vmfn0c_template_code: STRING is "vmfn0c"
	vmrc2a_template_code: STRING is "vmrc2a"
	vmrc2b_template_code: STRING is "vmrc2b"
	vmss1a_template_code: STRING is "vmss1a"
	vmss2a_template_code: STRING is "vmss2a"
	vmss3a_template_code: STRING is "vmss3a"
	vreg0a_template_code: STRING is "vreg0a"
	vrfa0a_template_code: STRING is "vrfa0a"
	vscn0a_template_code: STRING is "vscn0a"
	vtat1a_template_code: STRING is "vtat1a"
	vtat1b_template_code: STRING is "vtat1b"
	vtat1c_template_code: STRING is "vtat1c"
	vtat1d_template_code: STRING is "vtat1d"
	vtat2a_template_code: STRING is "vtat2a"
	vtbt0a_template_code: STRING is "vtbt0a"
	vtbt0b_template_code: STRING is "vtbt0b"
	vtbt0c_template_code: STRING is "vtbt0c"
	vtbt0d_template_code: STRING is "vtbt0d"
	vtcg0a_template_code: STRING is "vtcg0a"
	vtct0a_template_code: STRING is "vtct0a"
	vtct0b_template_code: STRING is "vtct0b"
	vtct0c_template_code: STRING is "vtct0c"
	vtgc0a_template_code: STRING is "vtgc0a"
	vtgc0b_template_code: STRING is "vtgc0b"
	vtug1a_template_code: STRING is "vtug1a"
	vtug2a_template_code: STRING is "vtug2a"
	gvagp0a_template_code: STRING is "gvagp0a"
	gvhpr4a_template_code: STRING is "gvhpr4a"
	gvhpr5a_template_code: STRING is "gvhpr5a"
	gvzzz0a_template_code: STRING is "gvzzz0a"
			-- Template error codes

invariant

	current_class_not_void: current_class /= Void

end
