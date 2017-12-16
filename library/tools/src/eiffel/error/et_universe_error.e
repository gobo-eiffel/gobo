note

	description:

		"Eiffel universe errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: 5877 $"

class ET_UNIVERSE_ERROR

inherit

	ET_ERROR

create

	make_vscn0a,
	make_vscn0b,
	make_vscn0c,
	make_vscn0d

feature {NONE} -- Initialization

	make_vscn0a (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_class1, a_class2: ET_NAMED_CLASS)
			-- Create a new VSCN error: two different classes `a_class1'
			-- and `a_class2' with the same name corresponding to `a_current_class'
			-- in `a_universe'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_class1_not_void: a_class1 /= Void
			a_class2_not_void: a_class2 /= Void
		local
			l_actual_class: ET_CLASS
			l_filename: detachable STRING
		do
			code := vscn0a_template_code
			etl_code := vscn_etl_code
			default_template := vscn0a_default_template
			universe := a_universe
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (universe.kind_name, 2)
			parameters.put (universe.full_lower_name ('/'), 3)
			parameters.put (a_current_class.upper_name, 4)
			l_actual_class := a_class1.actual_intrinsic_class
			parameters.put (l_actual_class.upper_name, 5)
			parameters.put (l_actual_class.group.kind_name, 6)
			parameters.put (l_actual_class.group.relative_lower_name (universe, '/'), 7)
			l_filename := l_actual_class.filename
			if l_filename /= Void then
				parameters.put (" (in file '" + l_filename + "')", 8)
			else
				parameters.put ("", 8)
			end
			l_actual_class := a_class2.actual_intrinsic_class
			parameters.put (l_actual_class.upper_name, 9)
			parameters.put (l_actual_class.group.kind_name, 10)
			parameters.put (l_actual_class.group.relative_lower_name (universe, '/'), 11)
			l_filename := l_actual_class.filename
			if l_filename /= Void then
				parameters.put (" (in file '" + l_filename + "')", 12)
			else
				parameters.put ("", 12)
			end
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = universe kind name (e.g. "library", "assembly", etc.)
			-- dollar3: $3 = universe full name
			-- dollar4: $4 = class name
			-- dollar5: $5 = first class name
			-- dollar6: $6 = first group kind name (e.g. "cluster", "assembly", etc.)
			-- dollar7: $7 = first group name
			-- dollar8: $8 = first class filename if any
			-- dollar9: $9 = second class name
			-- dollar10: $10 = second group kind name (e.g. "cluster", "assembly", etc.)
			-- dollar11: $11 = second group name
			-- dollar12: $12 = second class filename if any
		end

	make_vscn0b (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_override_class: ET_NAMED_CLASS)
			-- Create a new VSCN error: built-in class "NONE" cannot be overridden
			-- but `a_override_class' corresponding to `a_current_class' in `a_universe'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_override_class_not_void: a_override_class /= Void
		local
			l_actual_class: ET_CLASS
			l_filename: detachable STRING
		do
			code := vscn0b_template_code
			etl_code := vscn_etl_code
			default_template := vscn0b_default_template
			universe := a_universe
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (universe.kind_name, 2)
			parameters.put (universe.full_lower_name ('/'), 3)
			parameters.put (a_current_class.upper_name, 4)
			l_actual_class := a_override_class.actual_intrinsic_class
			parameters.put (l_actual_class.upper_name, 5)
			parameters.put (l_actual_class.group.kind_name, 6)
			parameters.put (l_actual_class.group.relative_lower_name (universe, '/'), 7)
			l_filename := l_actual_class.filename
			if l_filename /= Void then
				parameters.put (" (in file '" + l_filename + "')", 8)
			else
				parameters.put ("", 8)
			end
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = universe kind name (e.g. "library", "assembly", etc.)
			-- dollar3: $3 = universe full name
			-- dollar4: $4 = class name
			-- dollar5: $5 = override class name
			-- dollar6: $6 = override group kind name (e.g. "cluster", "assembly", etc.)
			-- dollar7: $7 = override group name
			-- dollar8: $8 = override class filename if any
		end

	make_vscn0c (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_class1, a_class2: ET_NAMED_CLASS)
			-- Create a new VSCN error:  class `a_class1' appearing in a .NET assembly
			-- cannot be overridden by `a_class2' corresponding to `a_current_class'
			-- in `a_universe'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_class1_not_void: a_class1 /= Void
			a_class2_not_void: a_class2 /= Void
		local
			l_actual_class: ET_CLASS
			l_filename: detachable STRING
		do
			code := vscn0c_template_code
			etl_code := vscn_etl_code
			default_template := vscn0c_default_template
			universe := a_universe
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (universe.kind_name, 2)
			parameters.put (universe.full_lower_name ('/'), 3)
			parameters.put (a_current_class.upper_name, 4)
			l_actual_class := a_class1.actual_intrinsic_class
			parameters.put (l_actual_class.upper_name, 5)
			parameters.put (l_actual_class.group.relative_lower_name (universe, '/'), 6)
			l_filename := l_actual_class.filename
			if l_filename /= Void then
				parameters.put (" (in file '" + l_filename + "')", 7)
			else
				parameters.put ("", 7)
			end
			l_actual_class := a_class2.actual_intrinsic_class
			parameters.put (l_actual_class.upper_name, 8)
			parameters.put (l_actual_class.group.kind_name, 9)
			parameters.put (l_actual_class.group.relative_lower_name (universe, '/'), 10)
			l_filename := l_actual_class.filename
			if l_filename /= Void then
				parameters.put (" (in file '" + l_filename + "')", 11)
			else
				parameters.put ("", 11)
			end
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = universe kind name (e.g. "library", "assembly", etc.)
			-- dollar3: $3 = universe full name
			-- dollar4: $4 = class name
			-- dollar5: $5 = first class name
			-- dollar6: $6 = first group name
			-- dollar7: $7 = first class filename if any
			-- dollar8: $8 = second class name
			-- dollar9: $9 = second group kind name (e.g. "cluster", "assembly", etc.)
			-- dollar10: $10 = second group name
			-- dollar11: $11 = second class filename if any
		end

	make_vscn0d (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_class1, a_class2: ET_MASTER_CLASS)
			-- Create a new VSCN error: class `a_current_class' in `a_universe' cannot
			-- be overridden both by class `a_class1' and by class `a_class2'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_class1_not_void: a_class1 /= Void
			a_class2_not_void: a_class2 /= Void
		do
			code := vscn0d_template_code
			etl_code := vscn_etl_code
			default_template := vscn0d_default_template
			universe := a_universe
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (universe.kind_name, 2)
			parameters.put (universe.full_lower_name ('/'), 3)
			parameters.put (a_current_class.upper_name, 4)
			parameters.put (a_class1.upper_name, 5)
			parameters.put (a_class1.universe.kind_name, 6)
			parameters.put (a_class1.universe.full_lower_name ('/'), 7)
			parameters.put (a_class2.upper_name, 8)
			parameters.put (a_class2.universe.kind_name, 9)
			parameters.put (a_class2.universe.full_lower_name ('/'), 10)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = universe kind name (e.g. "library", "assembly", etc.)
			-- dollar3: $3 = universe full name
			-- dollar4: $4 = class name
			-- dollar5: $5 = first class name
			-- dollar6: $6 = first universe kind name (e.g. "library", "assembly", etc.)
			-- dollar7: $7 = first universe name
			-- dollar8: $8 = second class name
			-- dollar9: $9 = second universe kind name (e.g. "library", "assembly", etc.)
			-- dollar10: $10 = second universe name
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Universe where current error occurred

feature -- Setting

	set_universe (a_universe: like universe)
			-- Set `universe' to `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature {NONE} -- Implementation

	vscn0a_default_template: STRING = "[$1] $2 $3: class $4 name clash between class $5 in $6 '$7'$8 and class $9 in $10 '$11'$12."
	vscn0b_default_template: STRING = "[$1] $2 $3: built-in class NONE cannot be overridden by class $5 in $6 '$7'$8."
	vscn0c_default_template: STRING = "[$1] $2 $3: assembly class $4 appearing as class $5 in assembly '$6' cannot be overridden by class $8 in $9 '$10'$11."
	vscn0d_default_template: STRING = "[$1] $2 $3: class $4 cannot be overridden both by class $5 in $6 '$7' and by class $8 in $9 '$10'."
			-- Default templates

	vscn_etl_code: STRING = "VSCN"
			-- ETL validity codes

	vscn0a_template_code: STRING = "vscn0a"
	vscn0b_template_code: STRING = "vscn0b"
	vscn0c_template_code: STRING = "vscn0c"
	vscn0d_template_code: STRING = "vscn0d"
			-- Template error codes

invariant

	universe_not_void: universe /= Void

end
