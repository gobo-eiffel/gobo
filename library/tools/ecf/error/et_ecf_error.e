indexing

	description:

		"ECF errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ERROR

inherit

	UT_ERROR

create

	make_syntax,
	make_eaaa,
	make_eaab,
	make_eaac,
	make_eaad,
	make_eaae,
	make_eaaf,
	make_eaag,
	make_eaah,
	make_eaai,
	make_eaaj,
	make_eaak,
	make_eaal,
	make_eaam,
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
	make_eabd,
	make_eabe,
	make_eabf,
	make_eabg,
	make_eabh,
	make_eabi,
	make_eabj,
	make_eabk,
	make_eabl,
	make_eabm,
	make_eabn,
	make_eabo,
	make_eabp,
	make_eabq,
	make_eabr,
	make_eabs,
	make_eabt,
	make_eabu,
	make_eabv,
	make_eabw,
	make_eabx,
	make_eaby,
	make_eabz,
	make_eaca,
	make_eacb,
	make_eacc,
	make_eacd,
	make_eace,
	make_eacf,
	make_eacg,
	make_each,
	make_eaci,
	make_eacj,
	make_eack,
	make_eacl,
	make_eacm,
	make_eacn

feature {NONE} -- Initialization

	make_syntax (a_message: STRING; a_position: ET_POSITION; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eaaa (a_library_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAA error: the name of the library is missing.
		require
			a_library_element_name_not_void: a_library_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_library_element_name.position
			code := eaaa_code
			default_template := default_message_template (eaaa_default_template)
			create parameters.make (1, 4)
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

	make_eaab (a_library_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAB error: the location of the library is missing.
		require
			a_library_element_name_not_void: a_library_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_library_element_name.position
			code := eaab_code
			default_template := default_message_template (eaab_default_template)
			create parameters.make (1, 4)
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

	make_eaac (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAC error: the name of the library is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eaac_code
			default_template := default_message_template (eaac_default_template)
			create parameters.make (1, 4)
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

	make_eaad (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAD error: the filename of the library is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eaad_code
			default_template := default_message_template (eaad_default_template)
			create parameters.make (1, 4)
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

	make_eaae (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 4)
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

	make_eaaf (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAF error: the value in build condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaaf_code
			default_template := default_message_template (eaaf_default_template)
			create parameters.make (1, 4)
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

	make_eaag (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAG error: the excluded value in build condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaag_code
			default_template := default_message_template (eaag_default_template)
			create parameters.make (1, 4)
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

	make_eaah (a_build_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAH error: value or excluded value missing in build condition.
		require
			a_build_element_name_not_void: a_build_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_build_element_name.position
			code := eaah_code
			default_template := default_message_template (eaah_default_template)
			create parameters.make (1, 4)
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

	make_eaai (a_cluster_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAI error: the name of the cluster is missing.
		require
			a_cluster_element_name_not_void: a_cluster_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_cluster_element_name.position
			code := eaai_code
			default_template := default_message_template (eaai_default_template)
			create parameters.make (1, 4)
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

	make_eaaj (a_cluster_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAJ error: the location of the cluster is missing.
		require
			a_cluster_element_name_not_void: a_cluster_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_cluster_element_name.position
			code := eaaj_code
			default_template := default_message_template (eaaj_default_template)
			create parameters.make (1, 4)
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

	make_eaak (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAK error: the name of the cluster is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eaak_code
			default_template := default_message_template (eaak_default_template)
			create parameters.make (1, 4)
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

	make_eaal (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAL error: the location of the cluster is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eaal_code
			default_template := default_message_template (eaal_default_template)
			create parameters.make (1, 4)
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

	make_eaam (a_recursive_attribute_name: ET_IDENTIFIER; a_recursive_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAM error: the recursive attribute of the cluster should be a boolean.
		require
			a_recursive_attribute_name_not_void: a_recursive_attribute_name /= Void
			a_recursive_value_not_void: a_recursive_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_recursive_attribute_name.position
			code := eaam_code
			default_template := default_message_template (eaam_default_template)
			create parameters.make (1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_recursive_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = recursive value
		end

	make_eaan (a_custom_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAN error: the name of the custom condition is missing.
		require
			a_custom_element_name_not_void: a_custom_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_custom_element_name.position
			code := eaan_code
			default_template := default_message_template (eaan_default_template)
			create parameters.make (1, 4)
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

	make_eaao (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAO error: the name of the custom condition is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eaao_code
			default_template := default_message_template (eaao_default_template)
			create parameters.make (1, 4)
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

	make_eaap (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 4)
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

	make_eaaq (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAQ error: the value in custom condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaaq_code
			default_template := default_message_template (eaaq_default_template)
			create parameters.make (1, 4)
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

	make_eaar (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAR error: the excluded value in custom condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eaar_code
			default_template := default_message_template (eaar_default_template)
			create parameters.make (1, 4)
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

	make_eaas (a_custom_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAS error: value or excluded value missing in custom condition.
		require
			a_custom_element_name_not_void: a_custom_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_custom_element_name.position
			code := eaas_code
			default_template := default_message_template (eaas_default_template)
			create parameters.make (1, 4)
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

	make_eaat (a_dotnet_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAT error: the value of the dotnet condition is missing.
		require
			a_dotnet_element_name_not_void: a_dotnet_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_dotnet_element_name.position
			code := eaat_code
			default_template := default_message_template (eaat_default_template)
			create parameters.make (1, 4)
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

	make_eaau (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eaav (a_dynamic_runtime_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAV error: the value of the dynamic_runtime condition is missing.
		require
			a_dynamic_runtime_element_name_not_void: a_dynamic_runtime_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_dynamic_runtime_element_name.position
			code := eaav_code
			default_template := default_message_template (eaav_default_template)
			create parameters.make (1, 4)
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

	make_eaaw (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eaax (a_multithreaded_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EAAX error: the value of the multithreaded condition is missing.
		require
			a_multithreaded_element_name_not_void: a_multithreaded_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_multithreaded_element_name.position
			code := eaax_code
			default_template := default_message_template (eaax_default_template)
			create parameters.make (1, 4)
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

	make_eaay (a_value_attribute_name: ET_IDENTIFIER; a_value_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eaaz (a_value_attribute_name, a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 4)
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

	make_eaba (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABA error: the value in platform condition is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eaba_code
			default_template := default_message_template (eaba_default_template)
			create parameters.make (1, 4)
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

	make_eabb (a_excluded_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABB error: the excluded value in platform condition is empty.
		require
			a_excluded_value_attribute_name_not_void: a_excluded_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_excluded_value_attribute_name.position
			code := eabb_code
			default_template := default_message_template (eabb_default_template)
			create parameters.make (1, 4)
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

	make_eabc (a_platform_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABC error: value or excluded value missing in platform condition.
		require
			a_platform_element_name_not_void: a_platform_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_platform_element_name.position
			code := eabc_code
			default_template := default_message_template (eabc_default_template)
			create parameters.make (1, 4)
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

	make_eabd (a_target_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABD error: the name of the target is missing.
		require
			a_target_element_name_not_void: a_target_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_target_element_name.position
			code := eabd_code
			default_template := default_message_template (eabd_default_template)
			create parameters.make (1, 4)
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

	make_eabe (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABE error: the name of the target is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eabe_code
			default_template := default_message_template (eabe_default_template)
			create parameters.make (1, 4)
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

	make_eabf (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eabg (a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eabh (a_min_attribute_name: ET_IDENTIFIER; a_min_value: STRING; a_max_attribute_name: ET_IDENTIFIER; a_max_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 6)
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

	make_eabi (a_version_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABI error: the type of the version condition is missing.
		require
			a_version_element_name_not_void: a_version_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_version_element_name.position
			code := eabi_code
			default_template := default_message_template (eabi_default_template)
			create parameters.make (1, 4)
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

	make_eabj (a_type_attribute_name: ET_IDENTIFIER; a_type_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABJ error: the type of the version condition should be either "compiler" or" msil_clr".
		require
			a_type_attribute_name_not_void: a_type_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_type_attribute_name.position
			code := eabj_code
			default_template := default_message_template (eabj_default_template)
			create parameters.make (1, 5)
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

	make_eabk (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABK error: the name of the system is missing.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_system_element_name.position
			code := eabk_code
			default_template := default_message_template (eabk_default_template)
			create parameters.make (1, 4)
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

	make_eabl (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABL error: the name of the system is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eabl_code
			default_template := default_message_template (eabl_default_template)
			create parameters.make (1, 4)
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

	make_eabm (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABM error: the name of the system describing a library is missing.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_system_element_name.position
			code := eabm_code
			default_template := default_message_template (eabm_default_template)
			create parameters.make (1, 4)
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

	make_eabn (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABN error: the name of the system describing a library is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eabn_code
			default_template := default_message_template (eabn_default_template)
			create parameters.make (1, 4)
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

	make_eabo (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABO error: the uuid of the system describing a library is missing.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_system_element_name.position
			code := eabo_code
			default_template := default_message_template (eabo_default_template)
			create parameters.make (1, 4)
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

	make_eabp (a_library_target_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABP error: the name of library target is empty.
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_library_target_attribute_name.position
			code := eabp_code
			default_template := default_message_template (eabp_default_template)
			create parameters.make (1, 4)
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

	make_eabq (a_library_target_attribute_name: ET_IDENTIFIER; a_library_target_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABQ error: the name of library target is not the name of an existing target.
		require
			a_library_target_attribute_name_not_void: a_library_target_attribute_name /= Void
			a_library_target_value_not_void: a_library_target_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_library_target_attribute_name.position
			code := eabq_code
			default_template := default_message_template (eabq_default_template)
			create parameters.make (1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_library_target_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = library_target value
		end

	make_eabr (a_variable_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABR error: the name of the variable missing.
		require
			a_variable_element_name_not_void: a_variable_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_variable_element_name.position
			code := eabr_code
			default_template := default_message_template (eabr_default_template)
			create parameters.make (1, 4)
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

	make_eabs (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABS error: the name of the variable is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eabs_code
			default_template := default_message_template (eabs_default_template)
			create parameters.make (1, 4)
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

	make_eabt (a_variable_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABT error: the value of the variable missing.
		require
			a_variable_element_name_not_void: a_variable_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_variable_element_name.position
			code := eabt_code
			default_template := default_message_template (eabt_default_template)
			create parameters.make (1, 4)
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

	make_eabu (a_value_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABU error: the value of the variable is empty.
		require
			a_value_attribute_name_not_void: a_value_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_value_attribute_name.position
			code := eabu_code
			default_template := default_message_template (eabu_default_template)
			create parameters.make (1, 4)
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

	make_eabv (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eabw (a_location_value: ET_IDENTIFIER; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
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
			create parameters.make (1, 5)
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

	make_eabx (a_root_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABX error: the root element of an ECF file should be <system>.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_root_element_name.position
			code := eabx_code
			default_template := default_message_template (eabx_default_template)
			create parameters.make (1, 5)
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

	make_eaby (a_system_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABY error: no target found in ECF file.
		require
			a_system_element_name_not_void: a_system_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_system_element_name.position
			code := eaby_code
			default_template := default_message_template (eaby_default_template)
			create parameters.make (1, 4)
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

	make_eabz (a_all_classes_attribute_name: ET_IDENTIFIER; a_all_classes_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EABZ error: the all_classes attribute of the root element should be a boolean.
		require
			a_all_classes_attribute_name_not_void: a_all_classes_attribute_name /= Void
			a_all_classes_value_not_void: a_all_classes_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_all_classes_attribute_name.position
			code := eabz_code
			default_template := default_message_template (eabz_default_template)
			create parameters.make (1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_all_classes_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = all_classes value
		end

	make_eaca (a_root_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACA error: the class attribute of the root element is missing.
		require
			a_root_element_name_not_void: a_root_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_root_element_name.position
			code := eaca_code
			default_template := default_message_template (eaca_default_template)
			create parameters.make (1, 4)
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

	make_eacb (a_class_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACB error: the class attribute of the root element is empty.
		require
			a_class_attribute_name_not_void: a_class_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_class_attribute_name.position
			code := eacb_code
			default_template := default_message_template (eacb_default_template)
			create parameters.make (1, 4)
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

	make_eacc (a_feature_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACC error: the feature attribute of the root element is empty.
		require
			a_feature_attribute_name_not_void: a_feature_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_feature_attribute_name.position
			code := eacc_code
			default_template := default_message_template (eacc_default_template)
			create parameters.make (1, 4)
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

	make_eacd (a_override_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACD error: the name of the override is missing.
		require
			a_override_element_name_not_void: a_override_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_override_element_name.position
			code := eacd_code
			default_template := default_message_template (eacd_default_template)
			create parameters.make (1, 4)
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

	make_eace (a_override_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACE error: the location of the override is missing.
		require
			a_override_element_name_not_void: a_override_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_override_element_name.position
			code := eace_code
			default_template := default_message_template (eace_default_template)
			create parameters.make (1, 4)
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

	make_eacf (a_name_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACF error: the name of the override is empty.
		require
			a_name_attribute_name_not_void: a_name_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_name_attribute_name.position
			code := eacf_code
			default_template := default_message_template (eacf_default_template)
			create parameters.make (1, 4)
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

	make_eacg (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACG error: the location of the override is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eacg_code
			default_template := default_message_template (eacg_default_template)
			create parameters.make (1, 4)
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

	make_each (a_recursive_attribute_name: ET_IDENTIFIER; a_recursive_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACH error: the recursive attribute of the override should be a boolean.
		require
			a_recursive_attribute_name_not_void: a_recursive_attribute_name /= Void
			a_recursive_value_not_void: a_recursive_value /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_recursive_attribute_name.position
			code := each_code
			default_template := default_message_template (each_default_template)
			create parameters.make (1, 5)
			parameters.put (code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (a_recursive_value, 5)
		ensure
			universe_set: universe = a_universe
			-- dollar0: $0 = program name
			-- dollar1: $1 = code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = recursive value
		end

	make_eaci (a_external_include_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACI error: the location of the external include element is missing.
		require
			a_external_include_element_name_not_void: a_external_include_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_external_include_element_name.position
			code := eaci_code
			default_template := default_message_template (eaci_default_template)
			create parameters.make (1, 4)
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

	make_eacj (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACJ error: the filename of the external include element is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eacj_code
			default_template := default_message_template (eacj_default_template)
			create parameters.make (1, 4)
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

	make_eack (a_external_library_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACK error: the location of the external library element is missing.
		require
			a_external_library_element_name_not_void: a_external_library_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_external_library_element_name.position
			code := eack_code
			default_template := default_message_template (eack_default_template)
			create parameters.make (1, 4)
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

	make_eacl (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACL error: the filename of the external library element is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eacl_code
			default_template := default_message_template (eacl_default_template)
			create parameters.make (1, 4)
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

	make_eacm (a_external_object_element_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACM error: the location of the external object element is missing.
		require
			a_external_object_element_name_not_void: a_external_object_element_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_external_object_element_name.position
			code := eacm_code
			default_template := default_message_template (eacm_default_template)
			create parameters.make (1, 4)
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

	make_eacn (a_location_attribute_name: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new EACN error: the filename of the external object element is empty.
		require
			a_location_attribute_name_not_void: a_location_attribute_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			position := a_location_attribute_name.position
			code := eacn_code
			default_template := default_message_template (eacn_default_template)
			create parameters.make (1, 4)
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

feature -- Access

	default_template: STRING
			-- Default template used to built the error message

	code: STRING
			-- Error code

	position: ET_POSITION
			-- Position of current error in `filename'

	filename: STRING is
			-- Name of file where current error occurred
		do
			Result := universe.filename
		ensure
			filename_not_void: Result /= Void
		end

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Universe where current error occurred

feature {NONE} -- Implementation

	default_message_template (a_template: STRING): STRING is
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
			add_client (Result, universe)
		ensure
			template_not_void: Result /= Void
		end

	add_client (a_string: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Add to `a_string' information about recursive clients of `a_universe'.
		require
			a_string_not_void: a_string /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_adapted_library: ET_ECF_ADAPTED_LIBRARY
			l_client_universe: ET_ECF_INTERNAL_UNIVERSE
			l_position: ET_POSITION
		do
			if not a_universe.clients.is_empty then
				l_adapted_library := a_universe.clients.first
				l_client_universe := l_adapted_library.universe
				a_string.append_string ("%N%TUsed in ECF ")
				a_string.append_string (l_client_universe.filename)
				l_position := l_adapted_library.name.position
				a_string.append_string (" (")
				a_string.append_integer (l_position.line)
				a_string.append_character (',')
				a_string.append_integer (l_position.column)
				a_string.append_character (')')
				add_client (a_string, l_client_universe)
			end
		end

	syntax_default_template: STRING is "$5"
	eaaa_default_template: STRING is "'name' attribute is missing in element 'library'."
	eaab_default_template: STRING is "'location' attribute is missing in element 'library'."
	eaac_default_template: STRING is "'name' attribute in element 'library' is empty."
	eaad_default_template: STRING is "'location' attribute in element 'library' is empty."
	eaae_default_template: STRING is "cannot have both 'value' and 'excluded_value' in 'build' condition."
	eaaf_default_template: STRING is "'value' attribute in 'build' condition is empty."
	eaag_default_template: STRING is "'excluded_value' attribute in 'build' condition is empty."
	eaah_default_template: STRING is "'value' or 'excluded_value' attribute is missing in 'build' condition."
	eaai_default_template: STRING is "'name' attribute is missing in element 'cluster'."
	eaaj_default_template: STRING is "'location' attribute is missing in element 'cluster'."
	eaak_default_template: STRING is "'name' attribute in element 'cluster' is empty."
	eaal_default_template: STRING is "'location' attribute in element 'cluster' is empty."
	eaam_default_template: STRING is "'recursive' attribute %"$5%" in element 'cluster' should be a boolean."
	eaan_default_template: STRING is "'name' attribute is missing in 'custom' condition."
	eaao_default_template: STRING is "'name' attribute in 'custom' condition is empty."
	eaap_default_template: STRING is "cannot have both 'value' and 'excluded_value' in 'custom' condition."
	eaaq_default_template: STRING is "'value' attribute in 'custom' condition is empty."
	eaar_default_template: STRING is "'excluded_value' attribute in 'custom' condition is empty."
	eaas_default_template: STRING is "'value' or 'excluded_value' attribute is missing in 'custom' condition."
	eaat_default_template: STRING is "'value' attribute is missing in 'dotnet' condition."
	eaau_default_template: STRING is "'value' attribute %"$5%" in 'dotnet' condition should be a boolean."
	eaav_default_template: STRING is "'value' attribute is missing in 'dynamic_runtime' condition."
	eaaw_default_template: STRING is "'value' attribute %"$5%" in 'dynamic_runtime' condition should be a boolean."
	eaax_default_template: STRING is "'value' attribute is missing in 'multithreaded' condition."
	eaay_default_template: STRING is "'value' attribute %"$5%" in 'multithreaded' condition should be a boolean."
	eaaz_default_template: STRING is "cannot have both 'value' and 'excluded_value' in 'platform' condition."
	eaba_default_template: STRING is "'value' attribute in 'platform' condition is empty."
	eabb_default_template: STRING is "'excluded_value' attribute in 'platform' condition is empty."
	eabc_default_template: STRING is "'value' or 'excluded_value' attribute is missing in 'platform' condition."
	eabd_default_template: STRING is "'name' attribute is missing in element 'target'."
	eabe_default_template: STRING is "'name' attribute in element 'target' is empty."
	eabf_default_template: STRING is "'min' attribute %"$5%" in 'version' condition should be of the form %"N.N.N.N%"."
	eabg_default_template: STRING is "'max' attribute %"$5%" in 'version' condition should be of the form %"N.N.N.N%"."
	eabh_default_template: STRING is "'max' attribute %"$6%" should be greater than or equal to 'min' attribute %"$5%" in 'version' condition."
	eabi_default_template: STRING is "'type' attribute is missing in 'version' condition."
	eabj_default_template: STRING is "'type' attribute %"$5%" in 'version' condition should be either %"compiler%" or %"msil_clr%"."
	eabk_default_template: STRING is "'name' attribute is missing in element 'system'."
	eabl_default_template: STRING is "'name' attribute in element 'system' is empty."
	eabm_default_template: STRING is "'name' attribute is missing in element 'system' describing a library."
	eabn_default_template: STRING is "'name' attribute in element 'system' describing a library is empty."
	eabo_default_template: STRING is "'uuid' attribute is missing in element 'system' describing a library."
	eabp_default_template: STRING is "'library_target' attribute in element 'system' is empty."
	eabq_default_template: STRING is "'library_target' attribute %"$5%" in element 'system' is not the name of an existing target."
	eabr_default_template: STRING is "'name' attribute is missing in element 'variable'."
	eabs_default_template: STRING is "'name' attribute in element 'variable' is empty."
	eabt_default_template: STRING is "'value' attribute is missing in element 'variable'."
	eabu_default_template: STRING is "'value' attribute in element 'variable' is empty."
	eabv_default_template: STRING is "cannot open library ECF file %"$5%"."
	eabw_default_template: STRING is "no library target specified in library ECF file %"$5%"."
	eabx_default_template: STRING is "root element of ECF file should be 'system' and not '$5'."
	eaby_default_template: STRING is "no 'target' element found in element 'system'."
	eabz_default_template: STRING is "'all_classes' attribute %"$5%" in element 'root' should be a boolean."
	eaca_default_template: STRING is "'class' attribute is missing in element 'root'."
	eacb_default_template: STRING is "'class' attribute in element 'root' is empty."
	eacc_default_template: STRING is "'feature' attribute in element 'root' is empty."
	eacd_default_template: STRING is "'name' attribute is missing in element 'override'."
	eace_default_template: STRING is "'location' attribute is missing in element 'override'."
	eacf_default_template: STRING is "'name' attribute in element 'override' is empty."
	eacg_default_template: STRING is "'location' attribute in element 'override' is empty."
	each_default_template: STRING is "'recursive' attribute %"$5%" in element 'override' should be a boolean."
	eaci_default_template: STRING is "'location' attribute is missing in element 'external_include'."
	eacj_default_template: STRING is "'location' attribute in element 'external_include' is empty."
	eack_default_template: STRING is "'location' attribute is missing in element 'external_library'."
	eacl_default_template: STRING is "'location' attribute in element 'external_library' is empty."
	eacm_default_template: STRING is "'location' attribute is missing in element 'external_object'."
	eacn_default_template: STRING is "'location' attribute in element 'external_object' is empty."
			-- Default templates

	syntax_code: STRING is "ESYN"
	eaaa_code: STRING is "EAAA"
	eaab_code: STRING is "EAAB"
	eaac_code: STRING is "EAAC"
	eaad_code: STRING is "EAAD"
	eaae_code: STRING is "EAAE"
	eaaf_code: STRING is "EAAF"
	eaag_code: STRING is "EAAG"
	eaah_code: STRING is "EAAH"
	eaai_code: STRING is "EAAI"
	eaaj_code: STRING is "EAAJ"
	eaak_code: STRING is "EAAK"
	eaal_code: STRING is "EAAL"
	eaam_code: STRING is "EAAM"
	eaan_code: STRING is "EAAN"
	eaao_code: STRING is "EAAO"
	eaap_code: STRING is "EAAP"
	eaaq_code: STRING is "EAAQ"
	eaar_code: STRING is "EAAR"
	eaas_code: STRING is "EAAS"
	eaat_code: STRING is "EAAT"
	eaau_code: STRING is "EAAU"
	eaav_code: STRING is "EAAV"
	eaaw_code: STRING is "EAAW"
	eaax_code: STRING is "EAAX"
	eaay_code: STRING is "EAAY"
	eaaz_code: STRING is "EAAZ"
	eaba_code: STRING is "EABA"
	eabb_code: STRING is "EABB"
	eabc_code: STRING is "EABC"
	eabd_code: STRING is "EABD"
	eabe_code: STRING is "EABE"
	eabf_code: STRING is "EABF"
	eabg_code: STRING is "EABG"
	eabh_code: STRING is "EABH"
	eabi_code: STRING is "EABI"
	eabj_code: STRING is "EABJ"
	eabk_code: STRING is "EABK"
	eabl_code: STRING is "EABL"
	eabm_code: STRING is "EABM"
	eabn_code: STRING is "EABN"
	eabo_code: STRING is "EABO"
	eabp_code: STRING is "EABP"
	eabq_code: STRING is "EABQ"
	eabr_code: STRING is "EABR"
	eabs_code: STRING is "EABS"
	eabt_code: STRING is "EABT"
	eabu_code: STRING is "EABU"
	eabv_code: STRING is "EABV"
	eabw_code: STRING is "EABW"
	eabx_code: STRING is "EABX"
	eaby_code: STRING is "EABY"
	eabz_code: STRING is "EABZ"
	eaca_code: STRING is "EACA"
	eacb_code: STRING is "EACB"
	eacc_code: STRING is "EACC"
	eacd_code: STRING is "EACD"
	eace_code: STRING is "EACE"
	eacf_code: STRING is "EACF"
	eacg_code: STRING is "EACG"
	each_code: STRING is "EACH"
	eaci_code: STRING is "EACI"
	eacj_code: STRING is "EACJ"
	eack_code: STRING is "EACK"
	eacl_code: STRING is "EACL"
	eacm_code: STRING is "EACM"
	eacn_code: STRING is "EACN"
			-- Error codes

invariant

	position_not_void: position /= Void
	universe_not_void: universe /= Void

end
