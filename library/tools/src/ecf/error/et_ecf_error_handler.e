note

	description:

		"ECF error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error_message
		end

create

	make_standard, make_null

feature -- Status report

	has_error: BOOLEAN
			-- Has an error been reported?
		do
			Result := (error_count > 0)
		end

feature -- Measurement

	error_count: INTEGER
			-- Number of errors reported so far

feature -- Syntax error

	report_syntax_error (a_message: STRING; a_position: ET_POSITION; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report an XML syntax error.
		require
			a_message_not_void: a_message /= Void
			a_position_not_void: a_position /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_syntax (a_message, a_position, a_system_config)
			report_error (l_error)
		end

feature -- Internal error

	report_internal_error (a_position: ET_POSITION; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report an internal error.
		require
			a_position_not_void: a_position /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_internal (a_position, a_system_config)
			report_error (l_error)
		end

feature -- Reporting errors

	report_eabf_error (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABF error: wrong format for min attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabf (a_min_attribute_name, a_min_value, a_system_config)
			report_error (l_error)
		end

	report_eabg_error (a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABG error: wrong format for max attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabg (a_max_attribute_name, a_max_value, a_system_config)
			report_error (l_error)
		end

	report_eabh_error (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABH error: the max value should be greater than
			-- or equal to the min value in version condition.
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabh (a_min_attribute_name, a_min_value, a_max_attribute_name, a_max_value, a_system_config)
			report_error (l_error)
		end

	report_eabi_error (a_version_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABI error: the type of the version condition is missing.
		require
			a_version_element_name_not_void: a_version_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabi (a_version_element_name, a_system_config)
			report_error (l_error)
		end

	report_eabj_error (a_type_attribute_name: ET_IDENTIFIER; a_type_value: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABJ error: the type of the version condition should be either "compiler" or "msil_clr".
		require
			a_type_attribute_name_not_void: a_type_attribute_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabj (a_type_attribute_name, a_type_value, a_system_config)
			report_error (l_error)
		end

	report_eabv_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABV error: cannot open library ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabv (a_location_value, a_filename, a_system_config)
			report_error (l_error)
		end

	report_eabw_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABW error: no library target specified in library ECF file.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabw (a_location_value, a_filename, a_system_config)
			report_error (l_error)
		end

	report_eabx_error (a_root_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EABX error: the root element of an ECF file should be <system>.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabx (a_root_element_name, a_system_config)
			report_error (l_error)
		end

	report_eadf_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EADF error: cannot open redirected ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eadf (a_location_value, a_filename, a_system_config)
			report_error (l_error)
		end

	report_eadg_error (a_redirection_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EADG error: the location of the redirected ECF is missing.
		require
			a_redirection_element_name_not_void: a_redirection_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eadg (a_redirection_element_name, a_system_config)
			report_error (l_error)
		end

	report_eadh_error (a_location_attribute_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EADH error: the filename of the redirected ECF is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eadh (a_location_attribute_name, a_system_config)
			report_error (l_error)
		end

	report_eadi_error (a_location_attribute_name: ET_IDENTIFIER; a_cycle: DS_HASH_SET [STRING]; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EADI error: cycle in ECF file redirections.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_cycle_not_void: a_cycle /= Void
			a_cycle_not_void: not a_cycle.is_empty
			no_void_filename: not a_cycle.has_void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eadi (a_location_attribute_name, a_cycle, a_system_config)
			report_error (l_error)
		end

	report_eadp_error (a_capability_name: STRING; a_capability_value: STRING; a_library_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EADP error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by `a_system_config.universe') is not supported by library `a_library_name'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_library_name_not_void: a_library_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eadp (a_capability_name, a_capability_value, a_library_name, a_system_config)
			report_error (l_error)
		end

	report_eadq_error (a_capability_name: STRING; a_capability_value: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EADQ error: value `a_capability_value' for capability `a_capability_name'
			-- is not supported by current target in `a_system_config.universe'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eadq (a_capability_name, a_capability_value, a_system_config)
			report_error (l_error)
		end

	report_eatb_error (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATB error: attribute `a_attribute_name' with value
			-- `a_attribute_value' in element `a_element_name' should be a boolean.
			--
			-- EATB: Ecf ATtribute Boolean
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eatb (a_attribute_name, a_attribute_value, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eatd_error (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATD error: attribute `a_attribute_name' with value
			-- `a_attribute_value' already appears in another element `a_element_name'.
			--
			-- EATD: Ecf ATtribute Duplicated
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eatd (a_attribute_name, a_attribute_value, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eate_error (a_attribute_name, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATE error: attribute `a_attribute_name' is empty in element `a_element_name'.
			--
			-- EATE: Ecf ATtribute Empty
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eate (a_attribute_name, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eati_error (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATI error: attribute `a_attribute_name' with value
			-- `a_attribute_value' in element `a_element_name' should be
			-- an unsigned integer.
			--
			-- EATI: Ecf ATtribute unsigned Integer
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eati (a_attribute_name, a_attribute_value, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eatm_error (a_attribute_name: STRING; a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATM error: attribute `a_attribute_name' is missing in element `a_element_name'.
			--
			-- EATM: Ecf ATtribute Missing
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eatm (a_attribute_name, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eatn_error (a_attribute_name_1, a_attribute_name_2: STRING; a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATN error: attribute `a_attribute_name_1' or `a_attribute_name_2'
			-- is missing in element `a_element_name'.
			--
			-- EATM: Ecf ATtribute missiNg
		require
			a_attribute_name_1_not_void: a_attribute_name_1 /= Void
			a_attribute_name_2_not_void: a_attribute_name_2 /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eatn (a_attribute_name_1, a_attribute_name_2, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eats_error (a_attribute_name: STRING; a_other_attribute_name, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATS error: attribute `a_attribute_name' is missing
			-- in element `a_element_name' when `a_other_attribute_name' is specified.
			--
			-- EATS: Ecf ATtribute miSsing
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_other_attribute_name_not_void: a_other_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eats (a_attribute_name, a_other_attribute_name, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eatx_error (a_attribute_name_1, a_attribute_name_2, a_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EATX error: cannot have both attributes `a_attribute_name_1' and `a_attribute_name_2'
			-- in element `a_element_name'.
			--
			-- EATM: Ecf ATtributes mutually eXclusive
		require
			a_attribute_name_1_not_void: a_attribute_name_1 /= Void
			a_attribute_name_2_not_void: a_attribute_name_2 /= Void
			a_element_name_not_void: a_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eatx (a_attribute_name_1, a_attribute_name_2, a_element_name, a_system_config)
			report_error (l_error)
		end

	report_eltm_error (a_library_target_attribute_name, a_library_target_attribute_value: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report ELTM error: the name of library target is not the name of an existing target.
			--
			-- ELTM: Ecf Library Target Missing
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			aa_library_target_attribute_value_not_void: a_library_target_attribute_value /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eltm (a_library_target_attribute_name, a_library_target_attribute_value, a_system_config)
			report_error (l_error)
		end

	report_epcd_error (a_capability_name: STRING; a_capability_value: STRING; a_parent_location_value: ET_IDENTIFIER; a_library_target_name: STRING; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPCD error: value `a_capability_value' for capability `a_capability_name'
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
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epcd (a_capability_name, a_capability_value, a_parent_location_value, a_library_target_name, a_filename, a_system_config)
			report_error (l_error)
		end

	report_epcl_error (a_capability_name: STRING; a_capability_value: STRING; a_parent_target_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPCL error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by current target) is not supported by parent target `a_parent_target_name'.
			--
			-- EPCL: Ecf Parent Capability Local
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_parent_target_name_not_void: a_parent_target_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epcl (a_capability_name, a_capability_value, a_parent_target_name, a_system_config)
			report_error (l_error)
		end

	report_epcr_error (a_capability_name: STRING; a_capability_value: STRING; a_parent_target_name: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPCR error: value `a_capability_value' for capability `a_capability_name'
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
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epcr (a_capability_name, a_capability_value, a_parent_target_name, a_filename, a_system_config)
			report_error (l_error)
		end

	report_epcy_error (a_position: ET_POSITION; a_cycle: DS_ARRAYED_LIST [STRING]; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPCY error: cycle in target parents.
			--
			-- EPCY: Ecf Parent CYcle
		require
			a_position_not_void: a_position /= Void
			a_cycle_not_void: a_cycle /= Void
			a_cycle_not_void: not a_cycle.is_empty
			no_void_filename: not a_cycle.has_void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epcy (a_position, a_cycle, a_system_config)
			report_error (l_error)
		end

	report_epfe_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPFE error: cannot open target parent ECF file `a_filename'.
			--
			-- EPFE: Ecf Parent File Error
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epfe (a_location_value, a_filename, a_system_config)
			report_error (l_error)
		end

	report_epud_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPUD error: no library target in parent ECF file `a_filename'.
			--
			-- EPUD: Ecf Parent Unknown Default
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epud (a_location_value, a_filename, a_system_config)
			report_error (l_error)
		end

	report_epul_error (a_extends_value: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPUL error: parent target `a_extends_value' is
			-- not known in `a_system_config.universe'.
			--
			-- EPUL: Ecf Parent Unknown Local
		require
			a_extends_value_not_void: a_extends_value /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epul (a_extends_value, a_system_config)
			report_error (l_error)
		end

	report_epur_error (a_extends_value: ET_IDENTIFIER; a_filename: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report EPUR error: parent target `a_extends_value' is
			-- not known in parent ECF `a_filename'.
			--
			-- EPUR: Ecf Parent Unknown Remote
		require
			a_extends_value_not_void: a_extends_value /= Void
			a_filename_not_void: a_filename /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_epur (a_extends_value, a_filename, a_system_config)
			report_error (l_error)
		end

	report_etam_error (a_system_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report ETAM error: no target found in ECF file.
			--
			-- ETAM: Ecf TArgets Missing
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_etam (a_system_element_name, a_system_config)
			report_error (l_error)
		end

	report_etnu_error (a_target_name: STRING; a_system_element_name: ET_IDENTIFIER; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Report ETNU error: no target `a_target_name' found in ECF file.
			--
			-- ETNU: Ecf Target Name Unknown
		require
			a_target_name_not_void: a_target_name /= Void
			a_system_element_name_not_void: a_system_element_name /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_etnu (a_target_name, a_system_element_name, a_system_config)
			report_error (l_error)
		end

feature -- Reporting

	report_error_message (an_error: STRING)
			-- Report `an_error'.
		do
			error_count := error_count + 1
			precursor (an_error)
		end

end
