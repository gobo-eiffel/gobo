note

	description:

		"ECF errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ERROR

inherit

	UT_ERROR

create

	make_syntax,
	make_eaae,
	make_eaaf,
	make_eaag,
	make_eaah,
	make_eaan,
	make_eaao,
	make_eaap,
	make_eaaq,
	make_eaar,
	make_eaas,
	make_eaat,
	make_eaau,
	make_eaav,
	make_eaaw,
	make_eaax,
	make_eaay,
	make_eaaz,
	make_eaba,
	make_eabb,
	make_eabc,
	make_eabf,
	make_eabg,
	make_eabh,
	make_eabi,
	make_eabj,
	make_eabv,
	make_eabw,
	make_eabx,
	make_eaby,
	make_eadb,
	make_eadc,
	make_eadd,
	make_eade,
	make_eadf,
	make_eadg,
	make_eadh,
	make_eadi,
	make_eadp,
	make_eadq,
	make_eadr,
	make_eads,
	make_eatb,
	make_eatd,
	make_eate,
	make_eati,
	make_eatm,
	make_eats,
	make_eltm

feature {NONE} -- Initialization

	make_syntax (a_message: STRING; a_position: ET_POSITION; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new syntax error.
		require
			a_message_not_void: a_message /= Void
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = message
		end

	make_eaae (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAE error: cannot have both value and excluded_value in build condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaae_code
			default_template := default_message_template (eaae_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaaf (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAF error: the value in build condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaaf_code
			default_template := default_message_template (eaaf_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaag (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAG error: the excluded value in build condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaag_code
			default_template := default_message_template (eaag_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaah (a_build_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAH error: value or excluded value missing in build condition.
		require
			a_build_element_name_not_void: a_build_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_build_element_name.position
			code := eaah_code
			default_template := default_message_template (eaah_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaan (a_custom_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAN error: the name of the custom condition is missing.
		require
			a_custom_element_name_not_void: a_custom_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_custom_element_name.position
			code := eaan_code
			default_template := default_message_template (eaan_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaao (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAO error: the name of the custom condition is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eaao_code
			default_template := default_message_template (eaao_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaap (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAP error: cannot have both value and excluded_value in custom condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaap_code
			default_template := default_message_template (eaap_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaaq (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAQ error: the value in custom condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaaq_code
			default_template := default_message_template (eaaq_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaar (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAR error: the excluded value in custom condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaar_code
			default_template := default_message_template (eaar_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaas (a_custom_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAS error: value or excluded value missing in custom condition.
		require
			a_custom_element_name_not_void: a_custom_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_custom_element_name.position
			code := eaas_code
			default_template := default_message_template (eaas_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaat (a_dotnet_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAT error: the value of the dotnet condition is missing.
		require
			a_dotnet_element_name_not_void: a_dotnet_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_dotnet_element_name.position
			code := eaat_code
			default_template := default_message_template (eaat_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaau (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAU error: the value attribute of the dotnet condition should be a boolean.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_value_value_not_void: a_value_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaau_code
			default_template := default_message_template (eaau_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_value_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = value value
		end

	make_eaav (a_dynamic_runtime_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAV error: the value of the dynamic_runtime condition is missing.
		require
			a_dynamic_runtime_element_name_not_void: a_dynamic_runtime_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_dynamic_runtime_element_name.position
			code := eaav_code
			default_template := default_message_template (eaav_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaaw (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAW error: the value attribute of the dynamic_runtime condition should be a boolean.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_value_value_not_void: a_value_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaaw_code
			default_template := default_message_template (eaaw_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_value_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = value value
		end

	make_eaax (a_multithreaded_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAX error: the value of the multithreaded condition is missing.
		require
			a_multithreaded_element_name_not_void: a_multithreaded_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_multithreaded_element_name.position
			code := eaax_code
			default_template := default_message_template (eaax_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaay (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAY error: the value attribute of the multithreaded condition should be a boolean.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_value_value_not_void: a_value_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaay_code
			default_template := default_message_template (eaay_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_value_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = value value
		end

	make_eaaz (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EAAZ error: cannot have both value and excluded_value in platform condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaaz_code
			default_template := default_message_template (eaaz_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eaba (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABA error: the value in platform condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaba_code
			default_template := default_message_template (eaba_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eabb (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABB error: the excluded value in platform condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eabb_code
			default_template := default_message_template (eabb_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eabc (a_platform_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABC error: value or excluded value missing in platform condition.
		require
			a_platform_element_name_not_void: a_platform_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_platform_element_name.position
			code := eabc_code
			default_template := default_message_template (eabc_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eabf (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABF error: wrong format for min attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = min value
		end

	make_eabg (a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABG error: wrong format for max attribute in version condition.
			-- It should be of the form "N.N.N.N".
		require
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = max value
		end

	make_eabh (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABH error: the max value should be greater than
			-- or equal to the min value in version condition.
		require
			a_min_attribute_name_not_void: a_min_attribute_name /= Void
			a_min_value_not_void: a_min_value /= Void
			a_max_attribute_name_not_void: a_max_attribute_name /= Void
			a_max_value_not_void: a_max_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = min value
			-- dollar6: $6 = max value
		end

	make_eabi (a_version_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABI error: the type of the version condition is missing.
		require
			a_version_element_name_not_void: a_version_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_version_element_name.position
			code := eabi_code
			default_template := default_message_template (eabi_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eabj (a_type_attribute_name: ET_IDENTIFIER; a_type_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABJ error: the type of the version condition should be either "compiler" or" msil_clr".
		require
			a_type_attribute_name_not_void: a_type_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = type value
		end

	make_eabv (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABV error: cannot open library ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = filename
		end

	make_eabw (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABW error: no library target specified in library ECF file.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = filename
		end

	make_eabx (a_root_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABX error: the root element of an ECF file should be <system>.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = root element name
		end

	make_eaby (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EABY error: no target found in ECF file.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_system_element_name.position
			code := eaby_code
			default_template := default_message_template (eaby_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadb (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADB error: cannot have both value and excluded_value in concurrency condition.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eadb_code
			default_template := default_message_template (eadb_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadc (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADC error: the value in concurrency condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eadc_code
			default_template := default_message_template (eadc_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadd (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADD error: the excluded value in concurrency condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eadd_code
			default_template := default_message_template (eadd_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eade (a_platform_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADE error: value or excluded value missing in concurrency condition.
		require
			a_platform_element_name_not_void: a_platform_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_platform_element_name.position
			code := eade_code
			default_template := default_message_template (eade_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadf (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADF error: cannot open redirected ECF file `a_filename'.
		require
			a_location_value_not_void: a_location_value /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = filename
		end

	make_eadg (a_redirection_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADG error: the location of the redirected ECF is missing.
		require
			a_redirection_element_name_not_void: a_redirection_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_redirection_element_name.position
			code := eadg_code
			default_template := default_message_template (eadg_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadh (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADH error: the filename of the redirected ECF is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eadh_code
			default_template := default_message_template (eadh_default_template)
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
		end

	make_eadi (a_location_attribute_name: ET_IDENTIFIER; a_cycle: DS_HASH_SET [STRING]; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADI error: cycle in ECF file redirections.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_cycle_not_void: a_cycle /= Void
			a_cycle_not_void: not a_cycle.is_empty
			no_void_filename: not a_cycle.has_void
			a_universe_not_void: a_universe /= Void
		local
			l_cursor: DS_HASH_SET_CURSOR [STRING]
			l_string: STRING
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = cycle
		end

	make_eadp (a_capability_name: STRING; a_capability_value: STRING; a_library_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADP error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by `a_universe') is not supported by library `a_library_name'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_library_name_not_void: a_library_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
			-- dollar7: $7 = library name
		end

	make_eadq (a_capability_name: STRING; a_capability_value: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADQ error: value `a_capability_value' for capability `a_capability_name'
			-- is not supported by current target in `a_universe'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
		end

	make_eadr (a_extends_value: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADR error: parent target `a_extends_value' is
			-- not known in `a_universe'.
		require
			a_extends_value_not_void: a_extends_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_extends_value.position
			code := eadr_code
			default_template := default_message_template (eadr_default_template)
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_extends_value.name, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = parent target name
		end

	make_eads (a_capability_name: STRING; a_capability_value: STRING; a_parent_target_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EADS error: value `a_capability_value' for capability `a_capability_name'
			-- (supported by current target) is not supported by parent target `a_parent_target_name'.
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_capability_value_not_void: a_capability_value /= Void
			a_parent_target_name_not_void: a_parent_target_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_parent_target_name.position
			code := eads_code
			default_template := default_message_template (eads_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_capability_name, 5)
			parameters.put (a_capability_value, 6)
			parameters.put (a_parent_target_name.name, 7)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = capability name
			-- dollar6: $6 = capability value
			-- dollar7: $7 = parent target name
		end

	make_eatb (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EATB error: attribute `a_attribute_name' with value
			-- `a_attribute_value' in element `a_element_name' should be a boolean.
			--
			-- EATD: Ecf ATtribute Boolean
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = attribute value
			-- dollar7: $7 = element name
		end

	make_eatd (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EATD error: attribute `a_attribute_name' with value
			-- `a_attribute_value' already appears in another element `a_element_name'.
			--
			-- EATD: Ecf ATtribute Duplicated
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = attribute value
			-- dollar7: $7 = element name
		end

	make_eate (a_attribute_name, a_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EATE error: attribute `a_attribute_name' is empty in element `a_element_name'.
			--
			-- EATE: Ecf ATtribute Empty
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = element name
		end

	make_eati (a_attribute_name, a_attribute_value, a_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EATI error: attribute `a_attribute_name' with value
			-- `a_attribute_value' in element `a_element_name' should be an
			-- unsigned integer.
			--
			-- EATI: Ecf ATtribute unsigned Integer
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_attribute_value_not_void: a_attribute_value /= Void
			a_element_name_not_void: a_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = attribute value
			-- dollar7: $7 = element name
		end

	make_eatm (a_attribute_name: STRING; a_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EATM error: attribute `a_attribute_name' is missing in element `a_element_name'.
			--
			-- EATM: Ecf ATtribute Missing
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = attribute name
			-- dollar6: $6 = element name
		end

	make_eats (a_attribute_name: STRING; a_other_attribute_name, a_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new EATS error: attribute `a_attribute_name' is missing
			-- in element `a_element_name' when `a_other_attribute_name' is specified.
			--
			-- EATS: Ecf ATtribute miSsing
		require
			a_attribute_name_not_void: a_attribute_name /= Void
			a_other_attribute_name_not_void: a_other_attribute_name /= Void
			a_element_name_not_void: a_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = missing attribute name
			-- dollar6: $6 = other attribute name
			-- dollar7: $7 = element name
		end

	make_eltm (a_library_target_attribute_name, a_library_target_attribute_value: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Create a new ELTM error: the name of library target is not the name of an existing target.
			--
			-- ELTM: Ecf Library Target Missing
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			a_library_target_attribute_value_not_void: a_library_target_attribute_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
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
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = library_target value
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
			Result := universe.filename
		ensure
			filename_not_void: Result /= Void
		end

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Universe where current error occurred

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
			add_dependent_universes (Result, universe)
		ensure
			template_not_void: Result /= Void
		end

	add_dependent_universes (a_string: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add to `a_string' information about universes that depends (recursively) on `a_universe'.
			-- Note: only add one of the paths from the current system to `a_universe'.
		require
			a_string_not_void: a_string /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_shortest_path: DS_ARRAYED_LIST [ET_ADAPTED_UNIVERSE]
			l_adapted_universe: ET_ADAPTED_UNIVERSE
			i, nb: INTEGER
			l_position: ET_POSITION
		do
			l_shortest_path := a_universe.current_system.shortest_path (a_universe)
			nb := l_shortest_path.count
			from i := nb until i < 1 loop
				l_adapted_universe := l_shortest_path.item (i)
				if attached {ET_ECF_ADAPTED_LIBRARY} l_adapted_universe as l_adapted_ecf_library then
					a_string.append_string ("%N%TUsed in ECF ")
					a_string.append_string (l_adapted_ecf_library.universe.filename)
					l_position := l_adapted_ecf_library.name_id.position
					a_string.append_string (" (")
					a_string.append_integer (l_position.line)
					a_string.append_character (',')
					a_string.append_integer (l_position.column)
					a_string.append_character (')')
				else
					a_string.append_string ("%N%TUsed in universe ")
					if i > 1 then
						a_string.append_string (l_shortest_path.item (i - 1).name)
					else
						a_string.append_string (a_universe.current_system.name)
					end
				end
				i := i - 1
			end
		end

	syntax_default_template: STRING = "$5"
	eaae_default_template: STRING = "cannot have both 'value' and 'excluded_value' in 'build' condition."
	eaaf_default_template: STRING = "'value' attribute in 'build' condition is empty."
	eaag_default_template: STRING = "'excluded_value' attribute in 'build' condition is empty."
	eaah_default_template: STRING = "'value' or 'excluded_value' attribute is missing in 'build' condition."
	eaan_default_template: STRING = "'name' attribute is missing in 'custom' condition."
	eaao_default_template: STRING = "'name' attribute in 'custom' condition is empty."
	eaap_default_template: STRING = "cannot have both 'value' and 'excluded_value' in 'custom' condition."
	eaaq_default_template: STRING = "'value' attribute in 'custom' condition is empty."
	eaar_default_template: STRING = "'excluded_value' attribute in 'custom' condition is empty."
	eaas_default_template: STRING = "'value' or 'excluded_value' attribute is missing in 'custom' condition."
	eaat_default_template: STRING = "'value' attribute is missing in 'dotnet' condition."
	eaau_default_template: STRING = "'value' attribute %"$5%" in 'dotnet' condition should be a boolean."
	eaav_default_template: STRING = "'value' attribute is missing in 'dynamic_runtime' condition."
	eaaw_default_template: STRING = "'value' attribute %"$5%" in 'dynamic_runtime' condition should be a boolean."
	eaax_default_template: STRING = "'value' attribute is missing in 'multithreaded' condition."
	eaay_default_template: STRING = "'value' attribute %"$5%" in 'multithreaded' condition should be a boolean."
	eaaz_default_template: STRING = "cannot have both 'value' and 'excluded_value' in 'platform' condition."
	eaba_default_template: STRING = "'value' attribute in 'platform' condition is empty."
	eabb_default_template: STRING = "'excluded_value' attribute in 'platform' condition is empty."
	eabc_default_template: STRING = "'value' or 'excluded_value' attribute is missing in 'platform' condition."
	eabf_default_template: STRING = "'min' attribute %"$5%" in 'version' condition should be of the form %"N.N.N.N%"."
	eabg_default_template: STRING = "'max' attribute %"$5%" in 'version' condition should be of the form %"N.N.N.N%"."
	eabh_default_template: STRING = "'max' attribute %"$6%" should be greater than or equal to 'min' attribute %"$5%" in 'version' condition."
	eabi_default_template: STRING = "'type' attribute is missing in 'version' condition."
	eabj_default_template: STRING = "'type' attribute %"$5%" in 'version' condition should be either %"compiler%" or %"msil_clr%"."
	eabv_default_template: STRING = "cannot open library ECF file %"$5%"."
	eabw_default_template: STRING = "no library target specified in library ECF file %"$5%"."
	eabx_default_template: STRING = "root element of ECF file should be 'system' and not '$5'."
	eaby_default_template: STRING = "no 'target' element found in element 'system'."
	eadb_default_template: STRING = "cannot have both 'value' and 'excluded_value' in 'concurrency' condition."
	eadc_default_template: STRING = "'value' attribute in 'concurrency' condition is empty."
	eadd_default_template: STRING = "'excluded_value' attribute in 'concurrency' condition is empty."
	eade_default_template: STRING = "'value' or 'excluded_value' attribute is missing in 'concurrency' condition."
	eadf_default_template: STRING = "cannot open redirected ECF file %"$5%"."
	eadg_default_template: STRING = "'location' attribute is missing in element 'redirection'."
	eadh_default_template: STRING = "'location' attribute in element 'redirection' is empty."
	eadi_default_template: STRING = "cycle in ECF file redirections:%N%T$5"
	eadp_default_template: STRING = "value '$6' for capability '$5' not supported by library '$7'."
	eadq_default_template: STRING = "value '$6' for capability '$5' not supported by current target."
	eadr_default_template: STRING = "unknown parent target '$5'."
	eads_default_template: STRING = "value '$6' for capability '$5' not supported by parent target '$7'."
	eatb_default_template: STRING = "attribute '$5' with value %"$6%" in element '$7' should be a boolean."
	eatd_default_template: STRING = "attribute '$5' with value %"$6%" already appears in another element '$7'."
	eate_default_template: STRING = "attribute '$5' is empty in element '$6'."
	eati_default_template: STRING = "attribute '$5' with value %"$6%" in element '$7' should be an unsigned integer."
	eatm_default_template: STRING = "attribute '$5' is missing in element '$6'."
	eats_default_template: STRING = "attribute '$6' specified in element '$7' but '$5' is missing."
	eltm_default_template: STRING = "attribute 'library_target' with value %"$5%" in element 'system' is not the name of an existing target."
			-- Default templates

	syntax_code: STRING = "ESYN"
	eaae_code: STRING = "EAAE"
	eaaf_code: STRING = "EAAF"
	eaag_code: STRING = "EAAG"
	eaah_code: STRING = "EAAH"
	eaan_code: STRING = "EAAN"
	eaao_code: STRING = "EAAO"
	eaap_code: STRING = "EAAP"
	eaaq_code: STRING = "EAAQ"
	eaar_code: STRING = "EAAR"
	eaas_code: STRING = "EAAS"
	eaat_code: STRING = "EAAT"
	eaau_code: STRING = "EAAU"
	eaav_code: STRING = "EAAV"
	eaaw_code: STRING = "EAAW"
	eaax_code: STRING = "EAAX"
	eaay_code: STRING = "EAAY"
	eaaz_code: STRING = "EAAZ"
	eaba_code: STRING = "EABA"
	eabb_code: STRING = "EABB"
	eabc_code: STRING = "EABC"
	eabf_code: STRING = "EABF"
	eabg_code: STRING = "EABG"
	eabh_code: STRING = "EABH"
	eabi_code: STRING = "EABI"
	eabj_code: STRING = "EABJ"
	eabv_code: STRING = "EABV"
	eabw_code: STRING = "EABW"
	eabx_code: STRING = "EABX"
	eaby_code: STRING = "EABY"
	eadb_code: STRING = "EADB"
	eadc_code: STRING = "EADC"
	eadd_code: STRING = "EADD"
	eade_code: STRING = "EADE"
	eadf_code: STRING = "EADF"
	eadg_code: STRING = "EADG"
	eadh_code: STRING = "EADH"
	eadi_code: STRING = "EADI"
	eadp_code: STRING = "EADP"
	eadq_code: STRING = "EADQ"
	eadr_code: STRING = "EADR"
	eads_code: STRING = "EADS"
	eatb_code: STRING = "EATB"
	eatd_code: STRING = "EATD"
	eate_code: STRING = "EATE"
	eati_code: STRING = "EATI"
	eatm_code: STRING = "EATM"
	eltm_code: STRING = "ELTM"
	eats_code: STRING = "EATS"
			-- Error codes

invariant

	position_not_void: position /= Void
	universe_not_void: universe /= Void

end
