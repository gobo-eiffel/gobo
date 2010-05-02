note

	description:

		"ECF error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
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

	report_syntax_error (a_message: STRING; a_position: ET_POSITION; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report an XML syntax error.
		require
			a_message_not_void: a_message /= Void
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_syntax (a_message, a_position, a_universe)
			report_error (l_error)
		end

feature -- Reporting errors

	report_eaaa_error (a_library_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAA error: the name of the library is missing.
		require
			a_library_element_name_not_void: a_library_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaaa (a_library_element_name, a_universe)
			report_error (l_error)
		end

	report_eaab_error (a_library_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAB error: the location of the library is missing.
		require
			a_library_element_name_not_void: a_library_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaab (a_library_element_name, a_universe)
			report_error (l_error)
		end

	report_eaac_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAC error: the name of the library is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaac (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaad_error (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAD error: the filename of the library is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaad (a_location_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaae_error (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAE error: cannot have both value and excluded_value in build condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaae (a_value_attribute_name, a_excluded_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaaf_error (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAF error: the value in build condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaaf (a_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaag_error (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAG error: the excluded value in build condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaag (a_excluded_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaah_error (a_build_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAH error: value or excluded value missing in build condition.
		require
			a_build_element_name_not_void: a_build_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaah (a_build_element_name, a_universe)
			report_error (l_error)
		end

	report_eaai_error (a_cluster_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAI error: the name of the cluster is missing.
		require
			a_cluster_element_name_not_void: a_cluster_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaai (a_cluster_element_name, a_universe)
			report_error (l_error)
		end

	report_eaaj_error (a_cluster_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAJ error: the location of the cluster is missing.
		require
			a_cluster_element_name_not_void: a_cluster_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaaj (a_cluster_element_name, a_universe)
			report_error (l_error)
		end

	report_eaak_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAK error: the name of the cluster is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaak (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaal_error (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAL error: the filename of the cluster is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaal (a_location_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaam_error (a_recursive_attribute_name: ET_IDENTIFIER; a_recursive_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAM error: the recursive attribute of the cluster should be a boolean.
		require
			a_recursive_attribute_name_not_void: a_recursive_attribute_name /= Void
			a_recursive_value_not_void: a_recursive_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaam (a_recursive_attribute_name, a_recursive_value, a_universe)
			report_error (l_error)
		end

	report_eaan_error (a_custom_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAN error: the name of the custom condition is missing.
		require
			a_custom_element_name_not_void: a_custom_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaan (a_custom_element_name, a_universe)
			report_error (l_error)
		end

	report_eaao_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAO error: the name of the custom condition is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaao (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaap_error (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAP error: cannot have both value and excluded_value in custom condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaap (a_value_attribute_name, a_excluded_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaaq_error (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAQ error: the value in custom condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaaq (a_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaar_error (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAR error: the excluded value in custom condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaar (a_excluded_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaas_error (a_custom_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAS error: value or excluded value missing in custom condition.
		require
			a_custom_element_name_not_void: a_custom_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaas (a_custom_element_name, a_universe)
			report_error (l_error)
		end

	report_eaat_error (a_dotnet_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAT error: the value of the dotnet condition is missing.
		require
			a_dotnet_element_name_not_void: a_dotnet_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaat (a_dotnet_element_name, a_universe)
			report_error (l_error)
		end

	report_eaau_error (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAU error: the value attribute of the dotnet condition should be a boolean.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_value_value_not_void: a_value_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaau (a_value_attribute_name, a_value_value, a_universe)
			report_error (l_error)
		end

	report_eaav_error (a_dynamic_runtime_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAV error: the value of the dynamic_runtime condition is missing.
		require
			a_dynamic_runtime_element_name_not_void: a_dynamic_runtime_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaav (a_dynamic_runtime_element_name, a_universe)
			report_error (l_error)
		end

	report_eaaw_error (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAW error: the value attribute of the dynamic_runtime condition should be a boolean.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_value_value_not_void: a_value_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaaw (a_value_attribute_name, a_value_value, a_universe)
			report_error (l_error)
		end

	report_eaax_error (a_multithreaded_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAX error: the value of the multithreaded condition is missing.
		require
			a_multithreaded_element_name_not_void: a_multithreaded_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaax (a_multithreaded_element_name, a_universe)
			report_error (l_error)
		end

	report_eaay_error (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAY error: the value attribute of the multithreaded condition should be a boolean.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_value_value_not_void: a_value_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaay (a_value_attribute_name, a_value_value, a_universe)
			report_error (l_error)
		end

	report_eaaz_error (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EAAZ error: cannot have both value and excluded_value in platform condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaaz (a_value_attribute_name, a_excluded_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eaba_error (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABA error: the value in platform condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaba (a_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabb_error (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABB error: the excluded value in platform condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabb (a_excluded_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabc_error (a_platform_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABC error: value or excluded value missing in platform condition.
		require
			a_platform_element_name_not_void: a_platform_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabc (a_platform_element_name, a_universe)
			report_error (l_error)
		end

	report_eabd_error (a_target_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABD error: the name of the target is missing.
		require
			a_target_element_name_not_void: a_target_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabd (a_target_element_name, a_universe)
			report_error (l_error)
		end

	report_eabe_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABE error: the name of the target is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabe (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabf_error (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABF error: wrong format for min attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabf (a_min_attribute_name, a_min_value, a_universe)
			report_error (l_error)
		end

	report_eabg_error (a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABG error: wrong format for max attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabg (a_max_attribute_name, a_max_value, a_universe)
			report_error (l_error)
		end

	report_eabh_error (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABH error: the max value should be greater than
			-- or equal to the min value in version condition.
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabh (a_min_attribute_name, a_min_value, a_max_attribute_name, a_max_value, a_universe)
			report_error (l_error)
		end

	report_eabi_error (a_version_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABI error: the type of the version condition is missing.
		require
			a_version_element_name_not_void: a_version_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabi (a_version_element_name, a_universe)
			report_error (l_error)
		end

	report_eabj_error (a_type_attribute_name: ET_IDENTIFIER; a_type_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABJ error: the type of the version condition should be either "compiler" or" msil_clr".
		require
			a_type_attribute_name_not_void: a_type_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabj (a_type_attribute_name, a_type_value, a_universe)
			report_error (l_error)
		end

	report_eabk_error (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABK error: the name of the system is missing.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabk (a_system_element_name, a_universe)
			report_error (l_error)
		end

	report_eabl_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABL error: the name of the system is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabl (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabm_error (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABM error: the name of the system describing a library is missing.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabm (a_system_element_name, a_universe)
			report_error (l_error)
		end

	report_eabn_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABN error: the name of the system describing a library is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabn (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabo_error (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABO error: the uuid of the system describing a library is missing.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabo (a_system_element_name, a_universe)
			report_error (l_error)
		end

	report_eabp_error (a_library_target_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABP error: the name of library target is empty.
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabp (a_library_target_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabq_error (a_library_target_attribute_name: ET_IDENTIFIER; a_library_target_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABQ error: the name of library target is not the name of an existing target.
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			a_library_target_value_not_void: a_library_target_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabq (a_library_target_attribute_name, a_library_target_value, a_universe)
			report_error (l_error)
		end

	report_eabr_error (a_variable_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABR error: the name of the variable missing.
		require
			a_variable_element_name_not_void: a_variable_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabr (a_variable_element_name, a_universe)
			report_error (l_error)
		end

	report_eabs_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABS error: the name of the variable is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabs (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabt_error (a_variable_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABT error: the value of the variable missing.
		require
			a_variable_element_name_not_void: a_variable_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabt (a_variable_element_name, a_universe)
			report_error (l_error)
		end

	report_eabu_error (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABU error: the value of the variable is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabu (a_value_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eabv_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABV error: cannot open library ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabv (a_location_value, a_filename, a_universe)
			report_error (l_error)
		end

	report_eabw_error (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABW error: no library target specified in library ECF file.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabw (a_location_value, a_filename, a_universe)
			report_error (l_error)
		end

	report_eabx_error (a_root_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABX error: the root element of an ECF file should be <system>.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabx (a_root_element_name, a_universe)
			report_error (l_error)
		end

	report_eaby_error (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABY error: no target found in ECF file.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaby (a_system_element_name, a_universe)
			report_error (l_error)
		end

	report_eabz_error (a_all_classes_attribute_name: ET_IDENTIFIER; a_all_classes_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EABZ error: the all_classes attribute of the root element should be a boolean.
		require
			a_all_classes_attribute_name_not_void: a_all_classes_attribute_name /= Void
			a_all_classes_value_not_void: a_all_classes_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eabz (a_all_classes_attribute_name, a_all_classes_value, a_universe)
			report_error (l_error)
		end

	report_eaca_error (a_root_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACA error: the class attribute of the root element is missing.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaca (a_root_element_name, a_universe)
			report_error (l_error)
		end

	report_eacb_error (a_class_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACB error: the class attribute of the root element is empty.
		require
			a_class_attribute_name_not_void: a_class_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacb (a_class_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eacc_error (a_feature_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACC error: the feature attribute of the root element is empty.
		require
			a_feature_attribute_name_not_void: a_feature_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacc (a_feature_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eacd_error (a_override_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACD error: the name of the override is missing.
		require
			a_override_element_name_not_void: a_override_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacd (a_override_element_name, a_universe)
			report_error (l_error)
		end

	report_eace_error (a_override_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACE error: the location of the override is missing.
		require
			a_override_element_name_not_void: a_override_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eace (a_override_element_name, a_universe)
			report_error (l_error)
		end

	report_eacf_error (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACF error: the name of the override is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacf (a_name_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eacg_error (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACG error: the location of the override is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacg (a_location_attribute_name, a_universe)
			report_error (l_error)
		end

	report_each_error (a_recursive_attribute_name: ET_IDENTIFIER; a_recursive_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACH error: the recursive attribute of the override should be a boolean.
		require
			a_recursive_attribute_name_not_void: a_recursive_attribute_name /= Void
			a_recursive_value_not_void: a_recursive_value /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_each (a_recursive_attribute_name, a_recursive_value, a_universe)
			report_error (l_error)
		end

	report_eaci_error (a_external_include_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACI error: the location of the external include element is missing.
		require
			a_external_include_element_name_not_void: a_external_include_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eaci (a_external_include_element_name, a_universe)
			report_error (l_error)
		end

	report_eacj_error (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACJ error: the filename of the external include element is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacj (a_location_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eack_error (a_external_library_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACK error: the location of the external library element is missing.
		require
			a_external_library_element_name_not_void: a_external_library_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eack (a_external_library_element_name, a_universe)
			report_error (l_error)
		end

	report_eacl_error (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACL error: the filename of the external library element is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacl (a_location_attribute_name, a_universe)
			report_error (l_error)
		end

	report_eacm_error (a_external_object_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACM error: the location of the external object element is missing.
		require
			a_external_object_element_name_not_void: a_external_object_element_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacm (a_external_object_element_name, a_universe)
			report_error (l_error)
		end

	report_eacn_error (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Report EACN error: the filename of the external object element is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_error: ET_ECF_ERROR
		do
			create l_error.make_eacn (a_location_attribute_name, a_universe)
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
