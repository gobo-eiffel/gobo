note

	description:

		"ECF errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ERROR

inherit

	UT_ERROR

create

	make_syntax,
	make_internal,
	make_eabf,
	make_eabg,
	make_eabh,
	make_eabi,
	make_eabj,
	make_eabv,
	make_eabw,
	make_eabx,
	make_eadf,
	make_eadg,
	make_eadh,
	make_eadi,
	make_eadp,
	make_eadq,
	make_eatb,
	make_eatd,
	make_eate,
	make_eati,
	make_eatm,
	make_eatn,
	make_eats,
	make_eatx,
	make_eltm,
	make_epcd,
	make_epcl,
	make_epcr,
	make_epcy,
	make_epfe,
	make_epud,
	make_epul,
	make_epur,
	make_etam,
	make_etnu

feature {NONE} -- Initialization

	make_syntax (a_message: STRING; a_position: ET_POSITION; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new syntax error.
		require
			a_message_not_void: a_message /= Void
			a_position_not_void: a_position /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_position
			code := syntax_code
			default_template := default_message_template (syntax_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_message, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = message
		end

	make_internal (a_position: ET_POSITION; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new internal error.
		require
			a_position_not_void: a_position /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_position
			code := internal_code
			default_template := default_message_template (internal_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eabf (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABF error: wrong format for min attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_min_attribute_name.position
			code := eabf_code
			default_template := default_message_template (eabf_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_min_value, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = min value
		end

	make_eabg (a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABG error: wrong format for max attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_max_attribute_name.position
			code := eabg_code
			default_template := default_message_template (eabg_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_max_value, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = max value
		end

	make_eabh (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABH error: the max value should be greater than
			-- or equal to the min value in version condition.
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_max_attribute_name.position
			code := eabh_code
			default_template := default_message_template (eabh_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_min_value, 5)
			parameters.put (a_max_value, 6)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = min value
			-- dollar6: $6 = max value
		end

	make_eabi (a_version_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABI error: the type of the version condition is missing.
		require
			a_version_element_name_not_void: a_version_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_version_element_name.position
			code := eabi_code
			default_template := default_message_template (eabi_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eabj (a_type_attribute_name: ET_IDENTIFIER; a_type_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABJ error: the type of the version condition should be either "compiler" or "msil_clr".
		require
			a_type_attribute_name_not_void: a_type_attribute_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_type_attribute_name.position
			code := eabj_code
			default_template := default_message_template (eabj_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_type_value, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = type value
		end

	make_eabv (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABV error: cannot open library ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_location_value.position
			code := eabv_code
			default_template := default_message_template (eabv_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_filename, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = filename
		end

	make_eabw (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABW error: no library target specified in library ECF file.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_location_value.position
			code := eabw_code
			default_template := default_message_template (eabw_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_filename, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = filename
		end

	make_eabx (a_root_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EABX error: the root element of an ECF file should be <system>.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_root_element_name.position
			code := eabx_code
			default_template := default_message_template (eabx_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_root_element_name.name, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = root element name
		end

	make_eadf (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EADF error: cannot open redirected ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_location_value.position
			code := eadf_code
			default_template := default_message_template (eadf_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_filename, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = filename
		end

	make_eadg (a_redirection_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EADG error: the location of the redirected ECF is missing.
		require
			a_redirection_element_name_not_void: a_redirection_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_redirection_element_name.position
			code := eadg_code
			default_template := default_message_template (eadg_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadh (a_location_attribute_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EADH error: the filename of the redirected ECF is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_location_attribute_name.position
			code := eadh_code
			default_template := default_message_template (eadh_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadi (a_location_attribute_name: ET_IDENTIFIER; a_cycle: DS_HASH_SET [STRING]; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EADI error: cycle in ECF file redirections.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_cycle_not_void: a_cycle /= Void
			a_cycle_not_void: not a_cycle.is_empty
			no_void_filename: not a_cycle.has_void
			a_system_config_not_void: a_system_config /= Void
		local
			l_cursor: DS_HASH_SET_CURSOR [STRING]
			l_string: STRING
		do
			system_config := a_system_config
			position := a_location_attribute_name.position
			code := eadi_code
			default_template := default_message_template (eadi_default_template)
			from
				create l_string.make (20 * a_cycle.count)
				l_cursor := a_cycle.new_cursor
				l_cursor.start
				l_string.append_string (l_cursor.item)
				l_cursor.forth
			until
				l_cursor.after
			loop
				l_string.append_string ("%N%T")
				l_string.append_string (l_cursor.item)
				l_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (l_string, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = cycle
		end

	make_eadp (a_capability_name: STRING; a_capability_value: STRING; a_library_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EADP error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by `a_system_config.universe') is not supported by library `a_library_name'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_library_name_not_void: a_library_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_library_name.position
			code := eadp_code
			default_template := default_message_template (eadp_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_capability_name, 5)
			parameters.put (a_capability_value, 6)
			parameters.put (a_library_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
			-- dollar7: $7 = library name
		end

	make_eadq (a_capability_name: STRING; a_capability_value: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EADQ error: value `a_capability_value' for capability `a_capability_name'
			-- is not supported by current target in `a_system_config.universe'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_capability_value.position
			code := eadq_code
			default_template := default_message_template (eadq_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_capability_name, 5)
			parameters.put (a_capability_value.name, 6)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
		end

	make_eatb (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATB error: attribute `a_attribute_name' with value
			-- `a_attribute_value' in element `a_element_name' should be a boolean.
			--
			-- EATD: Ecf ATtribute Boolean
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_attribute_value.position
			code := eatb_code
			default_template := default_message_template (eatb_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name.name, 5)
			parameters.put (a_attribute_value.name, 6)
			parameters.put (a_element_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = attribute value
			-- dollar7: $7 = element name
		end

	make_eatd (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATD error: attribute `a_attribute_name' with value
			-- `a_attribute_value' already appears in another element `a_element_name'.
			--
			-- EATD: Ecf ATtribute Duplicated
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_attribute_value.position
			code := eatd_code
			default_template := default_message_template (eatd_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name.name, 5)
			parameters.put (a_attribute_value.name, 6)
			parameters.put (a_element_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = attribute value
			-- dollar7: $7 = element name
		end

	make_eate (a_attribute_name, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATE error: attribute `a_attribute_name' is empty in element `a_element_name'.
			--
			-- EATE: Ecf ATtribute Empty
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_attribute_name.position
			code := eate_code
			default_template := default_message_template (eate_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name.name, 5)
			parameters.put (a_element_name.name, 6)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = element name
		end

	make_eati (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATI error: attribute `a_attribute_name' with value
			-- `a_attribute_value' in element `a_element_name' should be an
			-- unsigned integer.
			--
			-- EATI: Ecf ATtribute unsigned Integer
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_attribute_value.position
			code := eati_code
			default_template := default_message_template (eati_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name.name, 5)
			parameters.put (a_attribute_value.name, 6)
			parameters.put (a_element_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = attribute value
			-- dollar7: $7 = element name
		end

	make_eatm (a_attribute_name: STRING; a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATM error: attribute `a_attribute_name' is missing in element `a_element_name'.
			--
			-- EATM: Ecf ATtribute Missing
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_element_name.position
			code := eatm_code
			default_template := default_message_template (eatm_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name, 5)
			parameters.put (a_element_name.name, 6)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = element name
		end

	make_eatn (a_attribute_name_1, a_attribute_name_2: STRING; a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATN error: attribute `a_attribute_name_1' or `a_attribute_name_2'
			-- is missing in element `a_element_name'.
			--
			-- EATM: Ecf ATtribute missiNg
		require
			a_attribute_name_1_not_void: a_attribute_name_1 /= Void
			a_attribute_name_2_not_void: a_attribute_name_2 /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_element_name.position
			code := eatn_code
			default_template := default_message_template (eatn_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name_1, 5)
			parameters.put (a_attribute_name_2, 6)
			parameters.put (a_element_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = first attribute name
			-- dollar6: $6 = second attribute name
			-- dollar7: $7 = element name
		end

	make_eats (a_attribute_name: STRING; a_other_attribute_name, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATS error: attribute `a_attribute_name' is missing
			-- in element `a_element_name' when `a_other_attribute_name' is specified.
			--
			-- EATS: Ecf ATtribute miSsing
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_other_attribute_name_not_void: a_other_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_other_attribute_name.position
			code := eats_code
			default_template := default_message_template (eats_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name, 5)
			parameters.put (a_other_attribute_name.name, 6)
			parameters.put (a_element_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = missing attribute name
			-- dollar6: $6 = other attribute name
			-- dollar7: $7 = element name
		end

	make_eatx (a_attribute_name_1, a_attribute_name_2, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EATX error: cannot have both attributes `a_attribute_name_1' and `a_attribute_name_2'
			-- in element `a_element_name'.
			--
			-- EATM: Ecf ATtributes mutually eXclusive
		require
			a_attribute_name_1_not_void: a_attribute_name_1 /= Void
			a_attribute_name_2_not_void: a_attribute_name_2 /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_attribute_name_1.position
			code := eatx_code
			default_template := default_message_template (eatx_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_attribute_name_1.name, 5)
			parameters.put (a_attribute_name_2.name, 6)
			parameters.put (a_element_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = first attribute name
			-- dollar6: $6 = second attribute name
			-- dollar7: $7 = element name
		end

	make_eltm (a_library_target_attribute_name, a_library_target_attribute_value: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new ELTM error: the name of library target is not the name of an existing target.
			--
			-- ELTM: Ecf Library Target Missing
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			a_library_target_attribute_value_not_void: a_library_target_attribute_value /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_library_target_attribute_value.position
			code := eltm_code
			default_template := default_message_template (eltm_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_library_target_attribute_value.name, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = library_target value
		end

	make_epcd (a_capability_name: STRING; a_capability_value: STRING; a_parent_location_value: ET_IDENTIFIER; a_library_target_name: STRING; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPCD error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by current target) is not supported by library target `a_library_target_name'
			-- of parent ECF file `a_filename'.
			--
			-- EPCD: Ecf Parent Capability Default
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_parent_location_value_not_void: a_parent_location_value /= Void
			a_library_target_name_not_void: a_library_target_name /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_parent_location_value.position
			code := epcd_code
			default_template := default_message_template (epcd_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_capability_name, 5)
			parameters.put (a_capability_value, 6)
			parameters.put (a_library_target_name, 7)
			parameters.put (a_filename, 8)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
			-- dollar7: $7 = library_target name
			-- dollar8: $8 = parent ECF filename
		end

	make_epcl (a_capability_name: STRING; a_capability_value: STRING; a_parent_target_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPCL error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by current target) is not supported by parent target `a_parent_target_name'.
			--
			-- EPCL: Ecf Parent Capability Local
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_parent_target_name_not_void: a_parent_target_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_parent_target_name.position
			code := epcl_code
			default_template := default_message_template (epcl_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_capability_name, 5)
			parameters.put (a_capability_value, 6)
			parameters.put (a_parent_target_name.name, 7)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
			-- dollar7: $7 = parent target name
		end

	make_epcr (a_capability_name: STRING; a_capability_value: STRING; a_parent_target_name: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPCR error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by current target) is not supported by parent target `a_parent_target_name'
			-- from parent ECF file `a_filename'.
			--
			-- EPCLR: Ecf Parent Capability Remote
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_parent_target_name_not_void: a_parent_target_name /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_parent_target_name.position
			code := epcr_code
			default_template := default_message_template (epcr_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_capability_name, 5)
			parameters.put (a_capability_value, 6)
			parameters.put (a_parent_target_name.name, 7)
			parameters.put (a_filename, 8)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
			-- dollar7: $7 = parent target name
			-- dollar8: $8 = parent ECF filename
		end

	make_epcy (a_position: ET_POSITION; a_cycle: DS_ARRAYED_LIST [STRING]; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPCY error: cycle in target parents.
			--
			-- EPCY: Ecf Parent CYcle
		require
			a_position_not_void: a_position /= Void
			a_cycle_not_void: a_cycle /= Void
			a_cycle_not_void: not a_cycle.is_empty
			no_void_filename: not a_cycle.has_void
			a_system_config_not_void: a_system_config /= Void
		local
			i, nb: INTEGER
			l_string: STRING
		do
			system_config := a_system_config
			position := a_position
			code := epcy_code
			default_template := default_message_template (epcy_default_template)
			from
				nb := a_cycle.count
				create l_string.make (20 * nb)
				l_string.append_string (a_cycle.item (1))
				i := 2
			until
				i > nb
			loop
				l_string.append_string ("%N%T")
				l_string.append_string (a_cycle.item (i))
				i := i + 1
			end
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (l_string, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = cycle
		end

	make_epfe (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPFE error: cannot open target parent ECF file `a_filename'.
			--
			-- EPFE: Ecf Parent File Error
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_location_value.position
			code := epfe_code
			default_template := default_message_template (epfe_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_filename, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = parent ECF filename
		end

	make_epud (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPUD error: no library target in parent ECF file `a_filename'.
			--
			-- EPUD: Ecf Parent Unknown Default
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_location_value.position
			code := epud_code
			default_template := default_message_template (epud_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_filename, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = parent ECF filename
		end

	make_epul (a_extends_value: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPUL error: parent target `a_extends_value' is
			-- not known in `a_system_config.universe'.
			--
			-- EPUL: Ecf Parent Unknown Local
		require
			a_extends_value_not_void: a_extends_value /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_extends_value.position
			code := epul_code
			default_template := default_message_template (epul_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_extends_value.name, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = parent target name
		end

	make_epur (a_extends_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new EPUR error: parent target `a_extends_value' is
			-- not known in parent ECF `a_filename'.
			--
			-- EPUR: Ecf Parent Unknown Remote
		require
			a_extends_value_not_void: a_extends_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_extends_value.position
			code := epur_code
			default_template := default_message_template (epur_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_extends_value.name, 5)
			parameters.put (a_filename, 6)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = parent target name
			-- dollar6: $6 = parent ECF filename
		end

	make_etam (a_system_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new ETAM error: no target found in ECF file.
			--
			-- ETAM: Ecf TArgets Missing
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_system_element_name.position
			code := etam_code
			default_template := default_message_template (etam_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_etnu (a_target_name: STRING; a_system_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new ETNU error: no target `a_target_name' found in ECF file.
			--
			-- ETNU: Ecf Target Name Unknown
		require
			a_target_name_not_void: a_target_name /= Void
			a_system_element_name_not_void: a_system_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			system_config := a_system_config
			position := a_system_element_name.position
			code := etam_code
			default_template := default_message_template (etam_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_target_name, 5)
		ensure
			system_config_set: system_config = a_system_config
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = target name
		end

feature -- Access

	default_template: STRING
			-- Default template used to built the error message

	code: STRING
			-- Error code

	position: ET_POSITION
			-- Position of current error in `filename'

	filename: STRING
			-- Name of file where current error occurred
		do
			Result := system_config.filename
		ensure
			filename_not_void: Result /= Void
		end

	system_config: ET_ECF_SYSTEM_CONFIG
			-- ECF system config whose file contains the current error

feature {NONE} -- Implementation

	default_message_template (a_template: STRING): STRING
			-- Default error message template of the form:
			--    [$1] ECF $2 ($3,$4): `a_template'
			-- where:
			--    $1 = code
			--    $2 = filename
			--    $3 = line
			--    $4 = column
		require
			a_template_not_void: a_template /= Void
		do
			Result := "[$1] ECF $2 ($3,$4): " + a_template
			add_dependent_universes (Result)
		ensure
			template_not_void: Result /= Void
		end

	add_dependent_universes (a_string: STRING)
			-- Add to `a_string' information about universes that depends (recursively) on `system_config.universe'.
			-- Note: only add one of the paths from the current system to `system_config.universe'.
		require
			a_string_not_void: a_string /= Void
		local
			l_universe: ET_ECF_INTERNAL_UNIVERSE
			l_shortest_path: DS_ARRAYED_LIST [ET_ADAPTED_UNIVERSE]
			l_adapted_universe: ET_ADAPTED_UNIVERSE
			i: INTEGER
			l_target: detachable ET_ECF_TARGET
			l_parent_path: DS_ARRAYED_LIST [ET_ECF_TARGET_PARENT]
			l_position: ET_POSITION
		do
			l_universe := system_config.universe
			if l_universe /= system_config and attached l_universe.selected_target as l_selected_target then
				create l_parent_path.make_default
				from
					l_target := l_selected_target
				until
					l_target = Void or else l_target.system_config = system_config or else not attached l_target.parent as l_target_parent
				loop
					l_parent_path.force_last (l_target_parent)
					l_target := l_target_parent.target
				end
				add_parent_path (a_string, l_parent_path, l_universe)
			end
			l_shortest_path := l_universe.current_system.shortest_path (l_universe)
			from
				i := l_shortest_path.count
			until
				i < 1
			loop
				l_adapted_universe := l_shortest_path.item (i)
				if attached {ET_ECF_ADAPTED_LIBRARY} l_adapted_universe as l_adapted_ecf_library then
					a_string.append_string ("%N%TUsed in ECF ")
					l_target := l_adapted_ecf_library.target
					a_string.append_string (l_target.system_config.filename)
					l_position := l_adapted_ecf_library.name_id.position
					a_string.append_string (" (")
					a_string.append_integer (l_position.line)
					a_string.append_character (',')
					a_string.append_integer (l_position.column)
					a_string.append_character (')')
					if attached l_adapted_ecf_library.universe.selected_target as l_selected_target then
						l_parent_path := l_selected_target.parent_path (l_target)
						add_parent_path (a_string, l_parent_path, l_adapted_ecf_library.universe)
					end
				else
					a_string.append_string ("%N%TUsed in universe ")
					if i > 1 then
						a_string.append_string (l_shortest_path.item (i - 1).name)
					else
						a_string.append_string (l_universe.current_system.name)
					end
				end
				i := i - 1
			end
		end

	add_parent_path (a_string: STRING; a_parent_path: DS_ARRAYED_LIST [ET_ECF_TARGET_PARENT]; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add to `a_string' information about parent targets (recursively) from `a_universe'.
		require
			a_string_not_void: a_string /= Void
			a_parent_path_not_void: a_parent_path /= Void
			no_void_parent: not a_parent_path.has_void
			a_universe_not_void: a_universe /= Void
		local
			i: INTEGER
			l_target_parent: ET_ECF_TARGET_PARENT
			l_position: ET_POSITION
		do
			from
				i := a_parent_path.count
			until
				i < 1
			loop
				if attached a_parent_path.item (i).location_id as l_location_id then
					a_string.append_string ("%N%TUsed in ECF ")
					if i > 1 then
						l_target_parent := a_parent_path.item (i - 1)
						if attached l_target_parent.target as l_parent_target then
							a_string.append_string (l_parent_target.system_config.filename)
						else
							a_string.append_string ("**unknown filename**")
						end
					else
						a_string.append_string (a_universe.filename)
					end
					l_position := l_location_id.position
					a_string.append_string (" (")
					a_string.append_integer (l_position.line)
					a_string.append_character (',')
					a_string.append_integer (l_position.column)
					a_string.append_character (')')
				end
				i := i - 1
			end
		end

	syntax_default_template: STRING = "$5"
	internal_default_template: STRING = "Internal error"
	eabf_default_template: STRING = "'min' attribute %"$5%" in 'version' condition should be of the form %"N.N.N.N%"."
	eabg_default_template: STRING = "'max' attribute %"$5%" in 'version' condition should be of the form %"N.N.N.N%"."
	eabh_default_template: STRING = "'max' attribute %"$6%" should be greater than or equal to 'min' attribute %"$5%" in 'version' condition."
	eabi_default_template: STRING = "'type' attribute is missing in 'version' condition."
	eabj_default_template: STRING = "'type' attribute %"$5%" in 'version' condition should be either %"compiler%" or %"msil_clr%"."
	eabv_default_template: STRING = "cannot open library ECF file %"$5%"."
	eabw_default_template: STRING = "no library target specified in library ECF file %"$5%"."
	eabx_default_template: STRING = "root element of ECF file should be 'system' and not '$5'."
	eadf_default_template: STRING = "cannot open redirected ECF file %"$5%"."
	eadg_default_template: STRING = "'location' attribute is missing in element 'redirection'."
	eadh_default_template: STRING = "'location' attribute in element 'redirection' is empty."
	eadi_default_template: STRING = "cycle in ECF file redirections:%N%T$5"
	eadp_default_template: STRING = "value '$6' for capability '$5' not supported by library '$7'."
	eadq_default_template: STRING = "value '$6' for capability '$5' not supported by current target."
	eatb_default_template: STRING = "attribute '$5' with value %"$6%" in element '$7' should be a boolean."
	eatd_default_template: STRING = "attribute '$5' with value %"$6%" already appears in another element '$7'."
	eate_default_template: STRING = "attribute '$5' is empty in element '$6'."
	eati_default_template: STRING = "attribute '$5' with value %"$6%" in element '$7' should be an unsigned integer."
	eatm_default_template: STRING = "attribute '$5' is missing in element '$6'."
	eatn_default_template: STRING = "attribute '$5' or '$6' is missing in element '$7'."
	eats_default_template: STRING = "attribute '$6' specified in element '$7' but '$5' is missing."
	eatx_default_template: STRING = "cannot have both attributes '$5' and '$6' in element '$7'."
	eltm_default_template: STRING = "attribute 'library_target' with value %"$5%" in element 'system' is not the name of an existing target."
	epcd_default_template: STRING = "value '$6' for capability '$5' not supported by library target '$7' from parent ECF file %"$8%"."
	epcl_default_template: STRING = "value '$6' for capability '$5' not supported by parent target '$7'."
	epcr_default_template: STRING = "value '$6' for capability '$5' not supported by target '$7' from parent ECF file %"$8%"."
	epcy_default_template: STRING = "cycle in target parents:%N%T$5"
	epfe_default_template: STRING = "cannot open target parent ECF file %"$5%"."
	epud_default_template: STRING = "no library target specified in parent ECF file %"$5%"."
	epul_default_template: STRING = "unknown target parent '$5'."
	epur_default_template: STRING = "no target '$5' found in parent ECF file %"$6%"."
	etam_default_template: STRING = "no 'target' element found in element 'system'."
	etnu_default_template: STRING = "no 'target' element named '$5' found in element 'system'."
			-- Default templates

	syntax_code: STRING = "ESYN"
	internal_code: STRING = "EINT"
	eabf_code: STRING = "EABF"
	eabg_code: STRING = "EABG"
	eabh_code: STRING = "EABH"
	eabi_code: STRING = "EABI"
	eabj_code: STRING = "EABJ"
	eabv_code: STRING = "EABV"
	eabw_code: STRING = "EABW"
	eabx_code: STRING = "EABX"
	eadf_code: STRING = "EADF"
	eadg_code: STRING = "EADG"
	eadh_code: STRING = "EADH"
	eadi_code: STRING = "EADI"
	eadp_code: STRING = "EADP"
	eadq_code: STRING = "EADQ"
	eatb_code: STRING = "EATB"
	eatd_code: STRING = "EATD"
	eate_code: STRING = "EATE"
	eati_code: STRING = "EATI"
	eatm_code: STRING = "EATM"
	eatn_code: STRING = "EATN"
	eats_code: STRING = "EATS"
	eatx_code: STRING = "EATX"
	eltm_code: STRING = "ELTM"
	epcd_code: STRING = "EPCD"
	epcl_code: STRING = "EPCL"
	epcr_code: STRING = "EPCR"
	epcy_code: STRING = "EPCY"
	epfe_code: STRING = "EPFE"
	epud_code: STRING = "EPUD"
	epul_code: STRING = "EPUL"
	epur_code: STRING = "EPUR"
	etam_code: STRING = "ETAM"
	etnu_code: STRING = "ETNU"
			-- Error codes

invariant

	position_not_void: position /= Void
	system_config_not_void: system_config /= Void

end
