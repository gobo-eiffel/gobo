indexing

	description:

		"Internal errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERNAL_ERROR

inherit

	ET_ERROR

creation

	make_giaaa,
	make_giaab,
	make_giaac,
	make_giaad,
	make_giaae,
	make_giaaf,
	make_giaag,
	make_giaah,
	make_giaai,
	make_giaaj,
	make_giaak,
	make_giaal,
	make_giaam,
	make_giaan,
	make_giaao,
	make_giaap,
	make_giaaq,
	make_giaar,
	make_giaas,
	make_giaat,
	make_giaau,
	make_giaav,
	make_giaaw,
	make_giaax,
	make_giaay,
	make_giaaz,
	make_giaba,
	make_giabb,
	make_giabc,
	make_giabd,
	make_giabe,
	make_giabf,
	make_giabg,
	make_giabh,
	make_giabi,
	make_giabj,
	make_giabk,
	make_giabl,
	make_giabm,
	make_giabn,
	make_giabo,
	make_giabp,
	make_giabq

feature {NONE} -- Initialization

	make_giaaa is
			-- Create a new GIAAA error.
		do
			code := giaaa_template_code
			etl_code := giaaa_etl_code
			default_template := giaaa_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaab is
			-- Create a new GIAAB error.
		do
			code := giaab_template_code
			etl_code := giaab_etl_code
			default_template := giaab_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaac is
			-- Create a new GIAAC error.
		do
			code := giaac_template_code
			etl_code := giaac_etl_code
			default_template := giaac_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaad is
			-- Create a new GIAAD error.
		do
			code := giaad_template_code
			etl_code := giaad_etl_code
			default_template := giaad_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaae is
			-- Create a new GIAAE error.
		do
			code := giaae_template_code
			etl_code := giaae_etl_code
			default_template := giaae_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaaf is
			-- Create a new GIAAF error.
		do
			code := giaaf_template_code
			etl_code := giaaf_etl_code
			default_template := giaaf_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaag is
			-- Create a new GIAAG error.
		do
			code := giaag_template_code
			etl_code := giaag_etl_code
			default_template := giaag_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaah is
			-- Create a new GIAAH error.
		do
			code := giaah_template_code
			etl_code := giaah_etl_code
			default_template := giaah_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaai is
			-- Create a new GIAAI error.
		do
			code := giaai_template_code
			etl_code := giaai_etl_code
			default_template := giaai_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaaj is
			-- Create a new GIAAJ error.
		do
			code := giaaj_template_code
			etl_code := giaaj_etl_code
			default_template := giaaj_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaak is
			-- Create a new GIAAK error.
		do
			code := giaak_template_code
			etl_code := giaak_etl_code
			default_template := giaak_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaal is
			-- Create a new GIAAL error.
		do
			code := giaal_template_code
			etl_code := giaal_etl_code
			default_template := giaal_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaam is
			-- Create a new GIAAM error.
		do
			code := giaam_template_code
			etl_code := giaam_etl_code
			default_template := giaam_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaan is
			-- Create a new GIAAN error.
		do
			code := giaan_template_code
			etl_code := giaan_etl_code
			default_template := giaan_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaao is
			-- Create a new GIAAO error.
		do
			code := giaao_template_code
			etl_code := giaao_etl_code
			default_template := giaao_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaap is
			-- Create a new GIAAP error.
		do
			code := giaap_template_code
			etl_code := giaap_etl_code
			default_template := giaap_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaaq is
			-- Create a new GIAAQ error.
		do
			code := giaaq_template_code
			etl_code := giaaq_etl_code
			default_template := giaaq_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaar is
			-- Create a new GIAAR error.
		do
			code := giaar_template_code
			etl_code := giaar_etl_code
			default_template := giaar_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaas is
			-- Create a new GIAAS error.
		do
			code := giaas_template_code
			etl_code := giaas_etl_code
			default_template := giaas_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaat is
			-- Create a new GIAAT error.
		do
			code := giaat_template_code
			etl_code := giaat_etl_code
			default_template := giaat_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaau is
			-- Create a new GIAAU error.
		do
			code := giaau_template_code
			etl_code := giaau_etl_code
			default_template := giaau_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaav is
			-- Create a new GIAAV error.
		do
			code := giaav_template_code
			etl_code := giaav_etl_code
			default_template := giaav_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaaw is
			-- Create a new GIAAW error.
		do
			code := giaaw_template_code
			etl_code := giaaw_etl_code
			default_template := giaaw_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaax is
			-- Create a new GIAAX error.
		do
			code := giaax_template_code
			etl_code := giaax_etl_code
			default_template := giaax_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaay is
			-- Create a new GIAAY error.
		do
			code := giaay_template_code
			etl_code := giaay_etl_code
			default_template := giaay_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaaz is
			-- Create a new GIAAZ error.
		do
			code := giaaz_template_code
			etl_code := giaaz_etl_code
			default_template := giaaz_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaba is
			-- Create a new GIABA error.
		do
			code := giaba_template_code
			etl_code := giaba_etl_code
			default_template := giaba_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabb is
			-- Create a new GIABB error.
		do
			code := giabb_template_code
			etl_code := giabb_etl_code
			default_template := giabb_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabc is
			-- Create a new GIABC error.
		do
			code := giabc_template_code
			etl_code := giabc_etl_code
			default_template := giabc_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabd is
			-- Create a new GIABD error.
		do
			code := giabd_template_code
			etl_code := giabd_etl_code
			default_template := giabd_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabe is
			-- Create a new GIABE error.
		do
			code := giabe_template_code
			etl_code := giabe_etl_code
			default_template := giabe_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabf is
			-- Create a new GIABF error.
		do
			code := giabf_template_code
			etl_code := giabf_etl_code
			default_template := giabf_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabg is
			-- Create a new GIABG error.
		do
			code := giabg_template_code
			etl_code := giabg_etl_code
			default_template := giabg_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabh is
			-- Create a new GIABH error.
		do
			code := giabh_template_code
			etl_code := giabh_etl_code
			default_template := giabh_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabi is
			-- Create a new GIABI error.
		do
			code := giabi_template_code
			etl_code := giabi_etl_code
			default_template := giabi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabj is
			-- Create a new GIABJ error.
		do
			code := giabj_template_code
			etl_code := giabj_etl_code
			default_template := giabj_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabk is
			-- Create a new GIABK error.
		do
			code := giabk_template_code
			etl_code := giabk_etl_code
			default_template := giabk_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabl is
			-- Create a new GIABL error.
		do
			code := giabl_template_code
			etl_code := giabl_etl_code
			default_template := giabl_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabm is
			-- Create a new GIABM error.
		do
			code := giabm_template_code
			etl_code := giabm_etl_code
			default_template := giabm_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabn is
			-- Create a new GIABN error.
		do
			code := giabn_template_code
			etl_code := giabn_etl_code
			default_template := giabn_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabo is
			-- Create a new GIABO error.
		do
			code := giabo_template_code
			etl_code := giabo_etl_code
			default_template := giabo_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabp is
			-- Create a new GIABP error.
		do
			code := giabp_template_code
			etl_code := giabp_etl_code
			default_template := giabp_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabq is
			-- Create a new GIABQ error.
		do
			code := giabq_template_code
			etl_code := giabq_etl_code
			default_template := giabq_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

feature {NONE} -- Implementation

	giaaa_default_template: STRING is "[$1] internal error."
	giaab_default_template: STRING is "[$1] internal error."
	giaac_default_template: STRING is "[$1] internal error."
	giaad_default_template: STRING is "[$1] internal error."
	giaae_default_template: STRING is "[$1] internal error."
	giaaf_default_template: STRING is "[$1] internal error."
	giaag_default_template: STRING is "[$1] internal error."
	giaah_default_template: STRING is "[$1] internal error."
	giaai_default_template: STRING is "[$1] internal error."
	giaaj_default_template: STRING is "[$1] internal error."
	giaak_default_template: STRING is "[$1] internal error."
	giaal_default_template: STRING is "[$1] internal error."
	giaam_default_template: STRING is "[$1] internal error."
	giaan_default_template: STRING is "[$1] internal error."
	giaao_default_template: STRING is "[$1] internal error."
	giaap_default_template: STRING is "[$1] internal error."
	giaaq_default_template: STRING is "[$1] internal error."
	giaar_default_template: STRING is "[$1] internal error."
	giaas_default_template: STRING is "[$1] internal error."
	giaat_default_template: STRING is "[$1] internal error."
	giaau_default_template: STRING is "[$1] internal error."
	giaav_default_template: STRING is "[$1] internal error."
	giaaw_default_template: STRING is "[$1] internal error."
	giaax_default_template: STRING is "[$1] internal error."
	giaay_default_template: STRING is "[$1] internal error."
	giaaz_default_template: STRING is "[$1] internal error."
	giaba_default_template: STRING is "[$1] internal error."
	giabb_default_template: STRING is "[$1] internal error."
	giabc_default_template: STRING is "[$1] internal error."
	giabd_default_template: STRING is "[$1] internal error."
	giabe_default_template: STRING is "[$1] internal error."
	giabf_default_template: STRING is "[$1] internal error."
	giabg_default_template: STRING is "[$1] internal error."
	giabh_default_template: STRING is "[$1] internal error."
	giabi_default_template: STRING is "[$1] internal error."
	giabj_default_template: STRING is "[$1] internal error."
	giabk_default_template: STRING is "[$1] internal error."
	giabl_default_template: STRING is "[$1] internal error."
	giabm_default_template: STRING is "[$1] internal error."
	giabn_default_template: STRING is "[$1] internal error."
	giabo_default_template: STRING is "[$1] internal error."
	giabp_default_template: STRING is "[$1] internal error."
	giabq_default_template: STRING is "[$1] internal error."
			-- Default templates

	giaaa_etl_code: STRING is "GIAAA"
	giaab_etl_code: STRING is "GIAAB"
	giaac_etl_code: STRING is "GIAAC"
	giaad_etl_code: STRING is "GIAAD"
	giaae_etl_code: STRING is "GIAAE"
	giaaf_etl_code: STRING is "GIAAF"
	giaag_etl_code: STRING is "GIAAG"
	giaah_etl_code: STRING is "GIAAH"
	giaai_etl_code: STRING is "GIAAI"
	giaaj_etl_code: STRING is "GIAAJ"
	giaak_etl_code: STRING is "GIAAK"
	giaal_etl_code: STRING is "GIAAL"
	giaam_etl_code: STRING is "GIAAM"
	giaan_etl_code: STRING is "GIAAN"
	giaao_etl_code: STRING is "GIAAO"
	giaap_etl_code: STRING is "GIAAP"
	giaaq_etl_code: STRING is "GIAAQ"
	giaar_etl_code: STRING is "GIAAR"
	giaas_etl_code: STRING is "GIAAS"
	giaat_etl_code: STRING is "GIAAT"
	giaau_etl_code: STRING is "GIAAU"
	giaav_etl_code: STRING is "GIAAV"
	giaaw_etl_code: STRING is "GIAAW"
	giaax_etl_code: STRING is "GIAAX"
	giaay_etl_code: STRING is "GIAAY"
	giaaz_etl_code: STRING is "GIAAZ"
	giaba_etl_code: STRING is "GIABA"
	giabb_etl_code: STRING is "GIABB"
	giabc_etl_code: STRING is "GIABC"
	giabd_etl_code: STRING is "GIABD"
	giabe_etl_code: STRING is "GIABE"
	giabf_etl_code: STRING is "GIABF"
	giabg_etl_code: STRING is "GIABG"
	giabh_etl_code: STRING is "GIABH"
	giabi_etl_code: STRING is "GIABI"
	giabj_etl_code: STRING is "GIABJ"
	giabk_etl_code: STRING is "GIABK"
	giabl_etl_code: STRING is "GIABL"
	giabm_etl_code: STRING is "GIABM"
	giabn_etl_code: STRING is "GIABN"
	giabo_etl_code: STRING is "GIABO"
	giabp_etl_code: STRING is "GIABP"
	giabq_etl_code: STRING is "GIABQ"
			-- ETL validity codes

	giaaa_template_code: STRING is "giaaa"
	giaab_template_code: STRING is "giaab"
	giaac_template_code: STRING is "giaac"
	giaad_template_code: STRING is "giaad"
	giaae_template_code: STRING is "giaae"
	giaaf_template_code: STRING is "giaaf"
	giaag_template_code: STRING is "giaag"
	giaah_template_code: STRING is "giaah"
	giaai_template_code: STRING is "giaai"
	giaaj_template_code: STRING is "giaaj"
	giaak_template_code: STRING is "giaak"
	giaal_template_code: STRING is "giaal"
	giaam_template_code: STRING is "giaam"
	giaan_template_code: STRING is "giaan"
	giaao_template_code: STRING is "giaao"
	giaap_template_code: STRING is "giaap"
	giaaq_template_code: STRING is "giaaq"
	giaar_template_code: STRING is "giaar"
	giaas_template_code: STRING is "giaas"
	giaat_template_code: STRING is "giaat"
	giaau_template_code: STRING is "giaau"
	giaav_template_code: STRING is "giaav"
	giaaw_template_code: STRING is "giaaw"
	giaax_template_code: STRING is "giaax"
	giaay_template_code: STRING is "giaay"
	giaaz_template_code: STRING is "giaaz"
	giaba_template_code: STRING is "giaba"
	giabb_template_code: STRING is "giabb"
	giabc_template_code: STRING is "giabc"
	giabd_template_code: STRING is "giabd"
	giabe_template_code: STRING is "giabe"
	giabf_template_code: STRING is "giabf"
	giabg_template_code: STRING is "giabg"
	giabh_template_code: STRING is "giabh"
	giabi_template_code: STRING is "giabi"
	giabj_template_code: STRING is "giabj"
	giabk_template_code: STRING is "giabk"
	giabl_template_code: STRING is "giabl"
	giabm_template_code: STRING is "giabm"
	giabn_template_code: STRING is "giabn"
	giabo_template_code: STRING is "giabo"
	giabp_template_code: STRING is "giabp"
	giabq_template_code: STRING is "giabq"
			-- Template error codes

end
