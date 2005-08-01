indexing

	description:

		"Internal errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERNAL_ERROR

inherit

	ET_ERROR

create

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
	make_giabq,
	make_giabr,
	make_giabs,
	make_giabt,
	make_giabu,
	make_giabv,
	make_giabw,
	make_giabx,
	make_giaby,
	make_giabz,
	make_giaca,
	make_giacb,
	make_giacc,
	make_giacd,
	make_giace,
	make_giacf,
	make_giacg,
	make_giach,
	make_giaci,
	make_giacj,
	make_giack,
	make_giacl,
	make_giacm,
	make_giacn,
	make_giaco,
	make_giacp,
	make_giacq,
	make_giacr,
	make_giacs,
	make_giact,
	make_giacu,
	make_giacv,
	make_giacw,
	make_giacx,
	make_giacy,
	make_giacz,
	make_giada,
	make_giadb,
	make_giadc,
	make_giadd,
	make_giade,
	make_giadf,
	make_giadg,
	make_giadh,
	make_giadi,
	make_giadj,
	make_giadk,
	make_giadl,
	make_giadm,
	make_giadn,
	make_giado,
	make_giadp,
	make_giadq,
	make_giadr,
	make_giads,
	make_giadt,
	make_giadu,
	make_giadv,
	make_giadw,
	make_giadx,
	make_giady,
	make_giadz,
	make_giaea,
	make_giaeb,
	make_giaec,
	make_giaed,
	make_gibaa,
	make_gibab,
	make_gibac,
	make_gibad,
	make_gibae,
	make_gibaf,
	make_gibag,
	make_gibah,
	make_gibai,
	make_gibaj,
	make_gibak,
	make_gibal,
	make_gibam,
	make_giban,
	make_gibao,
	make_gibap,
	make_gibaq,
	make_gibar,
	make_gibas,
	make_gibat,
	make_gibau,
	make_gibav,
	make_gibaw,
	make_gibax,
	make_gibay,
	make_gibaz,
	make_gibba,
	make_gibbb,
	make_gibbc,
	make_gibbd,
	make_gibbe,
	make_gibbf,
	make_gibbg,
	make_gibbh,
	make_gibbi,
	make_gibbj,
	make_gibbk,
	make_gibbl,
	make_gibbm,
	make_gibbn,
	make_gibbo,
	make_gibbp,
	make_gibbq,
	make_gibbr,
	make_gibbs,
	make_gibbt,
	make_gibbu,
	make_gibbv,
	make_gibbw,
	make_gibbx,
	make_gibby,
	make_gibbz,
	make_gibca,
	make_gibcb,
	make_gibcc,
	make_gibcd,
	make_gibce,
	make_gibcf,
	make_gibcg,
	make_gibch,
	make_gibci,
	make_gibcj,
	make_gibck,
	make_gibcl,
	make_gibcm,
	make_gibcn,
	make_gibco,
	make_gibcp,
	make_gibcq,
	make_gibcr,
	make_gibcs,
	make_gibct,
	make_gibcu,
	make_gibcv,
	make_gibcw,
	make_gibcx,
	make_gibcy,
	make_gibcz,
	make_gibda,
	make_gibdb,
	make_gibdc,
	make_gibdd,
	make_gibde,
	make_gibdf,
	make_gibdg,
	make_gibdh,
	make_gibdi,
	make_gibdj,
	make_gibdk,
	make_gibdl,
	make_gibdm,
	make_gibdn,
	make_gibdo,
	make_gibdp,
	make_gibdq,
	make_gibdr,
	make_gibds,
	make_gibdt,
	make_gibdu,
	make_gibdv,
	make_gibdw,
	make_gibdx,
	make_gibdy,
	make_gibdz,
	make_gibea,
	make_gibeb,
	make_gibec,
	make_gibed,
	make_gibee,
	make_gibef,
	make_gibeg,
	make_gibeh,
	make_gibei,
	make_gibej,
	make_gibek,
	make_gibel,
	make_gibem,
	make_giben,
	make_gibeo,
	make_gibep,
	make_gibeq,
	make_giber,
	make_gibes,
	make_gibet,
	make_gibeu,
	make_gibev,
	make_gibew,
	make_gibex,
	make_gibey,
	make_gibez,
	make_gibfa,
	make_gibfb,
	make_gibfc,
	make_gibfd,
	make_gibfe,
	make_gibff,
	make_gibfg,
	make_gibfh,
	make_gibfi,
	make_gibfj,
	make_gibfk,
	make_gibfl,
	make_gibfm,
	make_gibfn,
	make_gibfo,
	make_gibfp,
	make_gibfq,
	make_gibfr,
	make_gibfs,
	make_gibft,
	make_gibfu,
	make_gibfv,
	make_gibfw,
	make_gibfx,
	make_gibfy,
	make_gibfz,
	make_gibga,
	make_gibgb,
	make_gibgc,
	make_gibgd,
	make_gibge,
	make_gibgf,
	make_gibgg,
	make_gibgh,
	make_gibgi,
	make_gibgj,
	make_gibgk,
	make_gibgl,
	make_gibgm,
	make_gibgn,
	make_gibgo,
	make_gibgp,
	make_gibgq,
	make_gibgr,
	make_gibgs,
	make_gibgt,
	make_gibgu,
	make_gibgv,
	make_gibgw,
	make_gibgx,
	make_gibgy,
	make_gibgz,
	make_gibha,
	make_gibhb,
	make_gibhc,
	make_gibhd,
	make_gibhe,
	make_gibhf,
	make_gibhg,
	make_gibhh,
	make_gibhi,
	make_gibhj,
	make_gibhk,
	make_gibhl,
	make_gibhm,
	make_gibhn,
	make_gibho,
	make_gibhp,
	make_gibhq,
	make_gibhr,
	make_gibhs,
	make_gibht,
	make_gibhu,
	make_gibhv,
	make_gibhw,
	make_gibhx,
	make_gibhy,
	make_gibhz,
	make_gibia,
	make_gibib,
	make_gibic,
	make_gibid,
	make_gibie,
	make_gibif,
	make_gibig,
	make_gibih,
	make_gibii,
	make_gibij,
	make_gibik,
	make_gibil,
	make_gibim,
	make_gibin,
	make_gibio,
	make_gibip,
	make_gibiq,
	make_gibir,
	make_gibis,
	make_gibit,
	make_gibiu,
	make_gibiv,
	make_gibiw,
	make_gibix,
	make_gibiy,
	make_gibiz,
	make_gibja,
	make_gibjb,
	make_gibjc,
	make_gibjd,
	make_gibje,
	make_gibjf,
	make_gibjg,
	make_gibjh,
	make_gibji,
	make_gibjj,
	make_gibjk,
	make_gibjl,
	make_gibjm,
	make_gibjn,
	make_gibjo,
	make_gibjp,
	make_gibjq,
	make_gibjr,
	make_gibjs,
	make_gibjt,
	make_gibju,
	make_gibjv,
	make_gibjw,
	make_gibjx,
	make_gibjy,
	make_gibjz

feature {NONE} -- Initialization

	make_giaaa is
			-- Create a new GIAAA error.
		do
			code := giaaa_template_code
			etl_code := giaaa_etl_code
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
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
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabr is
			-- Create a new GIABR error.
		do
			code := giabr_template_code
			etl_code := giabr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabs is
			-- Create a new GIABS error.
		do
			code := giabs_template_code
			etl_code := giabs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabt is
			-- Create a new GIABT error.
		do
			code := giabt_template_code
			etl_code := giabt_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabu is
			-- Create a new GIABU error.
		do
			code := giabu_template_code
			etl_code := giabu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabv is
			-- Create a new GIABV error.
		do
			code := giabv_template_code
			etl_code := giabv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabw is
			-- Create a new GIABW error.
		do
			code := giabw_template_code
			etl_code := giabw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabx is
			-- Create a new GIABX error.
		do
			code := giabx_template_code
			etl_code := giabx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaby is
			-- Create a new GIABY error.
		do
			code := giaby_template_code
			etl_code := giaby_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giabz is
			-- Create a new GIABZ error.
		do
			code := giabz_template_code
			etl_code := giabz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaca is
			-- Create a new GIACA error.
		do
			code := giaca_template_code
			etl_code := giaca_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacb is
			-- Create a new GIACB error.
		do
			code := giacb_template_code
			etl_code := giacb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacc is
			-- Create a new GIACC error.
		do
			code := giacc_template_code
			etl_code := giacc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacd is
			-- Create a new GIACD error.
		do
			code := giacd_template_code
			etl_code := giacd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giace is
			-- Create a new GIACE error.
		do
			code := giace_template_code
			etl_code := giace_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacf is
			-- Create a new GIACF error.
		do
			code := giacf_template_code
			etl_code := giacf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacg is
			-- Create a new GIACG error.
		do
			code := giacg_template_code
			etl_code := giacg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giach is
			-- Create a new GIACH error.
		do
			code := giach_template_code
			etl_code := giach_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaci is
			-- Create a new GIACI error.
		do
			code := giaci_template_code
			etl_code := giaci_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacj is
			-- Create a new GIACJ error.
		do
			code := giacj_template_code
			etl_code := giacj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giack is
			-- Create a new GIACK error.
		do
			code := giack_template_code
			etl_code := giack_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacl is
			-- Create a new GIACL error.
		do
			code := giacl_template_code
			etl_code := giacl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacm is
			-- Create a new GIACM error.
		do
			code := giacm_template_code
			etl_code := giacm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacn is
			-- Create a new GIACN error.
		do
			code := giacn_template_code
			etl_code := giacn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaco is
			-- Create a new GIACO error.
		do
			code := giaco_template_code
			etl_code := giaco_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacp is
			-- Create a new GIACP error.
		do
			code := giacp_template_code
			etl_code := giacp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacq is
			-- Create a new GIACQ error.
		do
			code := giacq_template_code
			etl_code := giacq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacr is
			-- Create a new GIACR error.
		do
			code := giacr_template_code
			etl_code := giacr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacs is
			-- Create a new GIACS error.
		do
			code := giacs_template_code
			etl_code := giacs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giact is
			-- Create a new GIACT error.
		do
			code := giact_template_code
			etl_code := giact_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacu is
			-- Create a new GIACU error.
		do
			code := giacu_template_code
			etl_code := giacu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacv is
			-- Create a new GIACV error.
		do
			code := giacv_template_code
			etl_code := giacv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacw is
			-- Create a new GIACW error.
		do
			code := giacw_template_code
			etl_code := giacw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacx is
			-- Create a new GIACX error.
		do
			code := giacx_template_code
			etl_code := giacx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacy is
			-- Create a new GIACY error.
		do
			code := giacy_template_code
			etl_code := giacy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giacz is
			-- Create a new GIACZ error.
		do
			code := giacz_template_code
			etl_code := giacz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giada is
			-- Create a new GIADA error.
		do
			code := giada_template_code
			etl_code := giada_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadb is
			-- Create a new GIADB error.
		do
			code := giadb_template_code
			etl_code := giadb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadc is
			-- Create a new GIADC error.
		do
			code := giadc_template_code
			etl_code := giadc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadd is
			-- Create a new GIADD error.
		do
			code := giadd_template_code
			etl_code := giadd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giade is
			-- Create a new GIADE error.
		do
			code := giade_template_code
			etl_code := giade_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadf is
			-- Create a new GIADF error.
		do
			code := giadf_template_code
			etl_code := giadf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadg is
			-- Create a new GIADG error.
		do
			code := giadg_template_code
			etl_code := giadg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadh is
			-- Create a new GIADH error.
		do
			code := giadh_template_code
			etl_code := giadh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadi is
			-- Create a new GIADI error.
		do
			code := giadi_template_code
			etl_code := giadi_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadj is
			-- Create a new GIADJ error.
		do
			code := giadj_template_code
			etl_code := giadj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadk is
			-- Create a new GIADK error.
		do
			code := giadk_template_code
			etl_code := giadk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadl is
			-- Create a new GIADL error.
		do
			code := giadl_template_code
			etl_code := giadl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadm is
			-- Create a new GIADM error.
		do
			code := giadm_template_code
			etl_code := giadm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadn is
			-- Create a new GIADN error.
		do
			code := giadn_template_code
			etl_code := giadn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giado is
			-- Create a new GIADO error.
		do
			code := giado_template_code
			etl_code := giado_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadp is
			-- Create a new GIADP error.
		do
			code := giadp_template_code
			etl_code := giadp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadq is
			-- Create a new GIADQ error.
		do
			code := giadq_template_code
			etl_code := giadq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadr is
			-- Create a new GIADR error.
		do
			code := giadr_template_code
			etl_code := giadr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giads is
			-- Create a new GIADS error.
		do
			code := giads_template_code
			etl_code := giads_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadt is
			-- Create a new GIADT error.
		do
			code := giadt_template_code
			etl_code := giadt_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadu is
			-- Create a new GIADU error.
		do
			code := giadu_template_code
			etl_code := giadu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadv is
			-- Create a new GIADV error.
		do
			code := giadv_template_code
			etl_code := giadv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadw is
			-- Create a new GIADW error.
		do
			code := giadw_template_code
			etl_code := giadw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadx is
			-- Create a new GIADX error.
		do
			code := giadx_template_code
			etl_code := giadx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giady is
			-- Create a new GIADY error.
		do
			code := giady_template_code
			etl_code := giady_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giadz is
			-- Create a new GIADZ error.
		do
			code := giadz_template_code
			etl_code := giadz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaea is
			-- Create a new GIAEA error.
		do
			code := giaea_template_code
			etl_code := giaea_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaeb is
			-- Create a new GIAEB error.
		do
			code := giaeb_template_code
			etl_code := giaeb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaec is
			-- Create a new GIAEC error.
		do
			code := giaec_template_code
			etl_code := giaec_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaed is
			-- Create a new GIAED error.
		do
			code := giaed_template_code
			etl_code := giaed_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibaa is
			-- Create a new GIBAA error.
		do
			code := gibaa_template_code
			etl_code := gibaa_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibab is
			-- Create a new GIBAB error.
		do
			code := gibab_template_code
			etl_code := gibab_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibac is
			-- Create a new GIBAC error.
		do
			code := gibac_template_code
			etl_code := gibac_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibad is
			-- Create a new GIBAD error.
		do
			code := gibad_template_code
			etl_code := gibad_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibae is
			-- Create a new GIBAE error.
		do
			code := gibae_template_code
			etl_code := gibae_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibaf is
			-- Create a new GIBAF error.
		do
			code := gibaf_template_code
			etl_code := gibaf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibag is
			-- Create a new GIBAG error.
		do
			code := gibag_template_code
			etl_code := gibag_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibah is
			-- Create a new GIBAH error.
		do
			code := gibah_template_code
			etl_code := gibah_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibai is
			-- Create a new GIBAI error.
		do
			code := gibai_template_code
			etl_code := gibai_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibaj is
			-- Create a new GIBAJ error.
		do
			code := gibaj_template_code
			etl_code := gibaj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibak is
			-- Create a new GIBAK error.
		do
			code := gibak_template_code
			etl_code := gibak_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibal is
			-- Create a new GIBAL error.
		do
			code := gibal_template_code
			etl_code := gibal_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibam is
			-- Create a new GIBAM error.
		do
			code := gibam_template_code
			etl_code := gibam_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giban is
			-- Create a new GIBAN error.
		do
			code := giban_template_code
			etl_code := giban_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibao is
			-- Create a new GIBAO error.
		do
			code := gibao_template_code
			etl_code := gibao_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibap is
			-- Create a new GIBAP error.
		do
			code := gibap_template_code
			etl_code := gibap_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibaq is
			-- Create a new GIBAQ error.
		do
			code := gibaq_template_code
			etl_code := gibaq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibar is
			-- Create a new GIBAR error.
		do
			code := gibar_template_code
			etl_code := gibar_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibas is
			-- Create a new GIBAS error.
		do
			code := gibas_template_code
			etl_code := gibas_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibat is
			-- Create a new GIBAT error.
		do
			code := gibat_template_code
			etl_code := gibat_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibau is
			-- Create a new GIBAU error.
		do
			code := gibau_template_code
			etl_code := gibau_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibav is
			-- Create a new GIBAV error.
		do
			code := gibav_template_code
			etl_code := gibav_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibaw is
			-- Create a new GIBAW error.
		do
			code := gibaw_template_code
			etl_code := gibaw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibax is
			-- Create a new GIBAX error.
		do
			code := gibax_template_code
			etl_code := gibax_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibay is
			-- Create a new GIBAY error.
		do
			code := gibay_template_code
			etl_code := gibay_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibaz is
			-- Create a new GIBAZ error.
		do
			code := gibaz_template_code
			etl_code := gibaz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibba is
			-- Create a new GIBBA error.
		do
			code := gibba_template_code
			etl_code := gibba_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbb is
			-- Create a new GIBBB error.
		do
			code := gibbb_template_code
			etl_code := gibbb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbc is
			-- Create a new GIBBC error.
		do
			code := gibbc_template_code
			etl_code := gibbc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbd is
			-- Create a new GIBBD error.
		do
			code := gibbd_template_code
			etl_code := gibbd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbe is
			-- Create a new GIBBE error.
		do
			code := gibbe_template_code
			etl_code := gibbe_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbf is
			-- Create a new GIBBF error.
		do
			code := gibbf_template_code
			etl_code := gibbf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbg is
			-- Create a new GIBBG error.
		do
			code := gibbg_template_code
			etl_code := gibbg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbh is
			-- Create a new GIBBH error.
		do
			code := gibbh_template_code
			etl_code := gibbh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbi is
			-- Create a new GIBBI error.
		do
			code := gibbi_template_code
			etl_code := gibbi_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbj is
			-- Create a new GIBBJ error.
		do
			code := gibbj_template_code
			etl_code := gibbj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbk is
			-- Create a new GIBBK error.
		do
			code := gibbk_template_code
			etl_code := gibbk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbl is
			-- Create a new GIBBL error.
		do
			code := gibbl_template_code
			etl_code := gibbl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbm is
			-- Create a new GIBBM error.
		do
			code := gibbm_template_code
			etl_code := gibbm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbn is
			-- Create a new GIBBN error.
		do
			code := gibbn_template_code
			etl_code := gibbn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbo is
			-- Create a new GIBBO error.
		do
			code := gibbo_template_code
			etl_code := gibbo_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbp is
			-- Create a new GIBBP error.
		do
			code := gibbp_template_code
			etl_code := gibbp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbq is
			-- Create a new GIBBQ error.
		do
			code := gibbq_template_code
			etl_code := gibbq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbr is
			-- Create a new GIBBR error.
		do
			code := gibbr_template_code
			etl_code := gibbr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbs is
			-- Create a new GIBBS error.
		do
			code := gibbs_template_code
			etl_code := gibbs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbt is
			-- Create a new GIBBT error.
		do
			code := gibbt_template_code
			etl_code := gibbt_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbu is
			-- Create a new GIBBU error.
		do
			code := gibbu_template_code
			etl_code := gibbu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbv is
			-- Create a new GIBBV error.
		do
			code := gibbv_template_code
			etl_code := gibbv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbw is
			-- Create a new GIBBW error.
		do
			code := gibbw_template_code
			etl_code := gibbw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbx is
			-- Create a new GIBBX error.
		do
			code := gibbx_template_code
			etl_code := gibbx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibby is
			-- Create a new GIBBY error.
		do
			code := gibby_template_code
			etl_code := gibby_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibbz is
			-- Create a new GIBBZ error.
		do
			code := gibbz_template_code
			etl_code := gibbz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibca is
			-- Create a new GIBCA error.
		do
			code := gibca_template_code
			etl_code := gibca_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcb is
			-- Create a new GIBCB error.
		do
			code := gibcb_template_code
			etl_code := gibcb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcc is
			-- Create a new GIBCC error.
		do
			code := gibcc_template_code
			etl_code := gibcc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcd is
			-- Create a new GIBCD error.
		do
			code := gibcd_template_code
			etl_code := gibcd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibce is
			-- Create a new GIBCE error.
		do
			code := gibce_template_code
			etl_code := gibce_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcf is
			-- Create a new GIBCF error.
		do
			code := gibcf_template_code
			etl_code := gibcf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcg is
			-- Create a new GIBCG error.
		do
			code := gibcg_template_code
			etl_code := gibcg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibch is
			-- Create a new GIBCH error.
		do
			code := gibch_template_code
			etl_code := gibch_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibci is
			-- Create a new GIBCI error.
		do
			code := gibci_template_code
			etl_code := gibci_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcj is
			-- Create a new GIBCJ error.
		do
			code := gibcj_template_code
			etl_code := gibcj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibck is
			-- Create a new GIBCK error.
		do
			code := gibck_template_code
			etl_code := gibck_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcl is
			-- Create a new GIBCL error.
		do
			code := gibcl_template_code
			etl_code := gibcl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcm is
			-- Create a new GIBCM error.
		do
			code := gibcm_template_code
			etl_code := gibcm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcn is
			-- Create a new GIBCN error.
		do
			code := gibcn_template_code
			etl_code := gibcn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibco is
			-- Create a new GIBCO error.
		do
			code := gibco_template_code
			etl_code := gibco_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcp is
			-- Create a new GIBCP error.
		do
			code := gibcp_template_code
			etl_code := gibcp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcq is
			-- Create a new GIBCQ error.
		do
			code := gibcq_template_code
			etl_code := gibcq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcr is
			-- Create a new GIBCR error.
		do
			code := gibcr_template_code
			etl_code := gibcr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcs is
			-- Create a new GIBCS error.
		do
			code := gibcs_template_code
			etl_code := gibcs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibct is
			-- Create a new GIBCT error.
		do
			code := gibct_template_code
			etl_code := gibct_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcu is
			-- Create a new GIBCU error.
		do
			code := gibcu_template_code
			etl_code := gibcu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcv is
			-- Create a new GIBCV error.
		do
			code := gibcv_template_code
			etl_code := gibcv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcw is
			-- Create a new GIBCW error.
		do
			code := gibcw_template_code
			etl_code := gibcw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcx is
			-- Create a new GIBCX error.
		do
			code := gibcx_template_code
			etl_code := gibcx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcy is
			-- Create a new GIBCY error.
		do
			code := gibcy_template_code
			etl_code := gibcy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibcz is
			-- Create a new GIBCZ error.
		do
			code := gibcz_template_code
			etl_code := gibcz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibda is
			-- Create a new GIBDA error.
		do
			code := gibda_template_code
			etl_code := gibda_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdb is
			-- Create a new GIBDB error.
		do
			code := gibdb_template_code
			etl_code := gibdb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdc is
			-- Create a new GIBDC error.
		do
			code := gibdc_template_code
			etl_code := gibdc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdd is
			-- Create a new GIBDD error.
		do
			code := gibdd_template_code
			etl_code := gibdd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibde is
			-- Create a new GIBDE error.
		do
			code := gibde_template_code
			etl_code := gibde_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdf is
			-- Create a new GIBDF error.
		do
			code := gibdf_template_code
			etl_code := gibdf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdg is
			-- Create a new GIBDG error.
		do
			code := gibdg_template_code
			etl_code := gibdg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdh is
			-- Create a new GIBDH error.
		do
			code := gibdh_template_code
			etl_code := gibdh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdi is
			-- Create a new GIBDI error.
		do
			code := gibdi_template_code
			etl_code := gibdi_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdj is
			-- Create a new GIBDJ error.
		do
			code := gibdj_template_code
			etl_code := gibdj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdk is
			-- Create a new GIBDK error.
		do
			code := gibdk_template_code
			etl_code := gibdk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdl is
			-- Create a new GIBDL error.
		do
			code := gibdl_template_code
			etl_code := gibdl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdm is
			-- Create a new GIBDM error.
		do
			code := gibdm_template_code
			etl_code := gibdm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdn is
			-- Create a new GIBDN error.
		do
			code := gibdn_template_code
			etl_code := gibdn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdo is
			-- Create a new GIBDO error.
		do
			code := gibdo_template_code
			etl_code := gibdo_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdp is
			-- Create a new GIBDP error.
		do
			code := gibdp_template_code
			etl_code := gibdp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdq is
			-- Create a new GIBDQ error.
		do
			code := gibdq_template_code
			etl_code := gibdq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdr is
			-- Create a new GIBDR error.
		do
			code := gibdr_template_code
			etl_code := gibdr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibds is
			-- Create a new GIBDS error.
		do
			code := gibds_template_code
			etl_code := gibds_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdt is
			-- Create a new GIBDT error.
		do
			code := gibdt_template_code
			etl_code := gibdt_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdu is
			-- Create a new GIBDU error.
		do
			code := gibdu_template_code
			etl_code := gibdu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdv is
			-- Create a new GIBDV error.
		do
			code := gibdv_template_code
			etl_code := gibdv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdw is
			-- Create a new GIBDW error.
		do
			code := gibdw_template_code
			etl_code := gibdw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdx is
			-- Create a new GIBDX error.
		do
			code := gibdx_template_code
			etl_code := gibdx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdy is
			-- Create a new GIBDY error.
		do
			code := gibdy_template_code
			etl_code := gibdy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibdz is
			-- Create a new GIBDZ error.
		do
			code := gibdz_template_code
			etl_code := gibdz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibea is
			-- Create a new GIBEA error.
		do
			code := gibea_template_code
			etl_code := gibea_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibeb is
			-- Create a new GIBEB error.
		do
			code := gibeb_template_code
			etl_code := gibeb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibec is
			-- Create a new GIBEC error.
		do
			code := gibec_template_code
			etl_code := gibec_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibed is
			-- Create a new GIBED error.
		do
			code := gibed_template_code
			etl_code := gibed_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibee is
			-- Create a new GIBEE error.
		do
			code := gibee_template_code
			etl_code := gibee_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibef is
			-- Create a new GIBEF error.
		do
			code := gibef_template_code
			etl_code := gibef_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibeg is
			-- Create a new GIBEG error.
		do
			code := gibeg_template_code
			etl_code := gibeg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibeh is
			-- Create a new GIBEH error.
		do
			code := gibeh_template_code
			etl_code := gibeh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibei is
			-- Create a new GIBEI error.
		do
			code := gibei_template_code
			etl_code := gibei_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibej is
			-- Create a new GIBEJ error.
		do
			code := gibej_template_code
			etl_code := gibej_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibek is
			-- Create a new GIBEK error.
		do
			code := gibek_template_code
			etl_code := gibek_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibel is
			-- Create a new GIBEL error.
		do
			code := gibel_template_code
			etl_code := gibel_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibem is
			-- Create a new GIBEM error.
		do
			code := gibem_template_code
			etl_code := gibem_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giben is
			-- Create a new GIBEN error.
		do
			code := giben_template_code
			etl_code := giben_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibeo is
			-- Create a new GIBEO error.
		do
			code := gibeo_template_code
			etl_code := gibeo_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibep is
			-- Create a new GIBEP error.
		do
			code := gibep_template_code
			etl_code := gibep_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibeq is
			-- Create a new GIBEQ error.
		do
			code := gibeq_template_code
			etl_code := gibeq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giber is
			-- Create a new GIBER error.
		do
			code := giber_template_code
			etl_code := giber_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibes is
			-- Create a new GIBES error.
		do
			code := gibes_template_code
			etl_code := gibes_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibet is
			-- Create a new GIBET error.
		do
			code := gibet_template_code
			etl_code := gibet_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibeu is
			-- Create a new GIBEU error.
		do
			code := gibeu_template_code
			etl_code := gibeu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibev is
			-- Create a new GIBEV error.
		do
			code := gibev_template_code
			etl_code := gibev_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibew is
			-- Create a new GIBEW error.
		do
			code := gibew_template_code
			etl_code := gibew_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibex is
			-- Create a new GIBEX error.
		do
			code := gibex_template_code
			etl_code := gibex_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibey is
			-- Create a new GIBEY error.
		do
			code := gibey_template_code
			etl_code := gibey_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibez is
			-- Create a new GIBEZ error.
		do
			code := gibez_template_code
			etl_code := gibez_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfa is
			-- Create a new GIBFA error.
		do
			code := gibfa_template_code
			etl_code := gibfa_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfb is
			-- Create a new GIBFB error.
		do
			code := gibfb_template_code
			etl_code := gibfb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfc is
			-- Create a new GIBFC error.
		do
			code := gibfc_template_code
			etl_code := gibfc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfd is
			-- Create a new GIBFD error.
		do
			code := gibfd_template_code
			etl_code := gibfd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfe is
			-- Create a new GIBFE error.
		do
			code := gibfe_template_code
			etl_code := gibfe_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibff is
			-- Create a new GIBFF error.
		do
			code := gibff_template_code
			etl_code := gibff_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfg is
			-- Create a new GIBFG error.
		do
			code := gibfg_template_code
			etl_code := gibfg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfh is
			-- Create a new GIBFH error.
		do
			code := gibfh_template_code
			etl_code := gibfh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfi is
			-- Create a new GIBFI error.
		do
			code := gibfi_template_code
			etl_code := gibfi_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfj is
			-- Create a new GIBFJ error.
		do
			code := gibfj_template_code
			etl_code := gibfj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfk is
			-- Create a new GIBFK error.
		do
			code := gibfk_template_code
			etl_code := gibfk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfl is
			-- Create a new GIBFL error.
		do
			code := gibfl_template_code
			etl_code := gibfl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfm is
			-- Create a new GIBFM error.
		do
			code := gibfm_template_code
			etl_code := gibfm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfn is
			-- Create a new GIBFN error.
		do
			code := gibfn_template_code
			etl_code := gibfn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfo is
			-- Create a new GIBFO error.
		do
			code := gibfo_template_code
			etl_code := gibfo_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfp is
			-- Create a new GIBFP error.
		do
			code := gibfp_template_code
			etl_code := gibfp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfq is
			-- Create a new GIBFQ error.
		do
			code := gibfq_template_code
			etl_code := gibfq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfr is
			-- Create a new GIBFR error.
		do
			code := gibfr_template_code
			etl_code := gibfr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfs is
			-- Create a new GIBFS error.
		do
			code := gibfs_template_code
			etl_code := gibfs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibft is
			-- Create a new GIBFT error.
		do
			code := gibft_template_code
			etl_code := gibft_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfu is
			-- Create a new GIBFU error.
		do
			code := gibfu_template_code
			etl_code := gibfu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfv is
			-- Create a new GIBFV error.
		do
			code := gibfv_template_code
			etl_code := gibfv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfw is
			-- Create a new GIBFW error.
		do
			code := gibfw_template_code
			etl_code := gibfw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfx is
			-- Create a new GIBFX error.
		do
			code := gibfx_template_code
			etl_code := gibfx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfy is
			-- Create a new GIBFY error.
		do
			code := gibfy_template_code
			etl_code := gibfy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibfz is
			-- Create a new GIBFZ error.
		do
			code := gibfz_template_code
			etl_code := gibfz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibga is
			-- Create a new GIBGA error.
		do
			code := gibga_template_code
			etl_code := gibga_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgb is
			-- Create a new GIBGB error.
		do
			code := gibgb_template_code
			etl_code := gibgb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgc is
			-- Create a new GIBGC error.
		do
			code := gibgc_template_code
			etl_code := gibgc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgd is
			-- Create a new GIBGD error.
		do
			code := gibgd_template_code
			etl_code := gibgd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibge is
			-- Create a new GIBGE error.
		do
			code := gibge_template_code
			etl_code := gibge_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgf is
			-- Create a new GIBGF error.
		do
			code := gibgf_template_code
			etl_code := gibgf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgg is
			-- Create a new GIBGG error.
		do
			code := gibgg_template_code
			etl_code := gibgg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgh is
			-- Create a new GIBGH error.
		do
			code := gibgh_template_code
			etl_code := gibgh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgi is
			-- Create a new GIBGI error.
		do
			code := gibgi_template_code
			etl_code := gibgi_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgj is
			-- Create a new GIBGJ error.
		do
			code := gibgj_template_code
			etl_code := gibgj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgk is
			-- Create a new GIBGK error.
		do
			code := gibgk_template_code
			etl_code := gibgk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgl is
			-- Create a new GIBGL error.
		do
			code := gibgl_template_code
			etl_code := gibgl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgm is
			-- Create a new GIBGM error.
		do
			code := gibgm_template_code
			etl_code := gibgm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgn is
			-- Create a new GIBGN error.
		do
			code := gibgn_template_code
			etl_code := gibgn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgo is
			-- Create a new GIBGO error.
		do
			code := gibgo_template_code
			etl_code := gibgo_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgp is
			-- Create a new GIBGP error.
		do
			code := gibgp_template_code
			etl_code := gibgp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgq is
			-- Create a new GIBGQ error.
		do
			code := gibgq_template_code
			etl_code := gibgq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgr is
			-- Create a new GIBGR error.
		do
			code := gibgr_template_code
			etl_code := gibgr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgs is
			-- Create a new GIBGS error.
		do
			code := gibgs_template_code
			etl_code := gibgs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgt is
			-- Create a new GIBGT error.
		do
			code := gibgt_template_code
			etl_code := gibgt_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgu is
			-- Create a new GIBGU error.
		do
			code := gibgu_template_code
			etl_code := gibgu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgv is
			-- Create a new GIBGV error.
		do
			code := gibgv_template_code
			etl_code := gibgv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgw is
			-- Create a new GIBGW error.
		do
			code := gibgw_template_code
			etl_code := gibgw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgx is
			-- Create a new GIBGX error.
		do
			code := gibgx_template_code
			etl_code := gibgx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgy is
			-- Create a new GIBGY error.
		do
			code := gibgy_template_code
			etl_code := gibgy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibgz is
			-- Create a new GIBGZ error.
		do
			code := gibgz_template_code
			etl_code := gibgz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibha is
			-- Create a new GIBHA error.
		do
			code := gibha_template_code
			etl_code := gibha_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhb is
			-- Create a new GIBHB error.
		do
			code := gibhb_template_code
			etl_code := gibhb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhc is
			-- Create a new GIBHC error.
		do
			code := gibhc_template_code
			etl_code := gibhc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhd is
			-- Create a new GIBHD error.
		do
			code := gibhd_template_code
			etl_code := gibhd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhe is
			-- Create a new GIBHE error.
		do
			code := gibhe_template_code
			etl_code := gibhe_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhf is
			-- Create a new GIBHF error.
		do
			code := gibhf_template_code
			etl_code := gibhf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhg is
			-- Create a new GIBHG error.
		do
			code := gibhg_template_code
			etl_code := gibhg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhh is
			-- Create a new GIBHH error.
		do
			code := gibhh_template_code
			etl_code := gibhh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhi is
			-- Create a new GIBHI error.
		do
			code := gibhi_template_code
			etl_code := gibhi_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhj is
			-- Create a new GIBHJ error.
		do
			code := gibhj_template_code
			etl_code := gibhj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhk is
			-- Create a new GIBHK error.
		do
			code := gibhk_template_code
			etl_code := gibhk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhl is
			-- Create a new GIBHL error.
		do
			code := gibhl_template_code
			etl_code := gibhl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhm is
			-- Create a new GIBHM error.
		do
			code := gibhm_template_code
			etl_code := gibhm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhn is
			-- Create a new GIBHN error.
		do
			code := gibhn_template_code
			etl_code := gibhn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibho is
			-- Create a new GIBHO error.
		do
			code := gibho_template_code
			etl_code := gibho_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhp is
			-- Create a new GIBHP error.
		do
			code := gibhp_template_code
			etl_code := gibhp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhq is
			-- Create a new GIBHQ error.
		do
			code := gibhq_template_code
			etl_code := gibhq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhr is
			-- Create a new GIBHR error.
		do
			code := gibhr_template_code
			etl_code := gibhr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhs is
			-- Create a new GIBHS error.
		do
			code := gibhs_template_code
			etl_code := gibhs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibht is
			-- Create a new GIBHT error.
		do
			code := gibht_template_code
			etl_code := gibht_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhu is
			-- Create a new GIBHU error.
		do
			code := gibhu_template_code
			etl_code := gibhu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhv is
			-- Create a new GIBHV error.
		do
			code := gibhv_template_code
			etl_code := gibhv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhw is
			-- Create a new GIBHW error.
		do
			code := gibhw_template_code
			etl_code := gibhw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhx is
			-- Create a new GIBHX error.
		do
			code := gibhx_template_code
			etl_code := gibhx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhy is
			-- Create a new GIBHY error.
		do
			code := gibhy_template_code
			etl_code := gibhy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibhz is
			-- Create a new GIBHZ error.
		do
			code := gibhz_template_code
			etl_code := gibhz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibia is
			-- Create a new GIBIA error.
		do
			code := gibia_template_code
			etl_code := gibia_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibib is
			-- Create a new GIBIB error.
		do
			code := gibib_template_code
			etl_code := gibib_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibic is
			-- Create a new GIBIC error.
		do
			code := gibic_template_code
			etl_code := gibic_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibid is
			-- Create a new GIBID error.
		do
			code := gibid_template_code
			etl_code := gibid_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibie is
			-- Create a new GIBIE error.
		do
			code := gibie_template_code
			etl_code := gibie_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibif is
			-- Create a new GIBIF error.
		do
			code := gibif_template_code
			etl_code := gibif_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibig is
			-- Create a new GIBIG error.
		do
			code := gibig_template_code
			etl_code := gibig_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibih is
			-- Create a new GIBIH error.
		do
			code := gibih_template_code
			etl_code := gibih_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibii is
			-- Create a new GIBII error.
		do
			code := gibii_template_code
			etl_code := gibii_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibij is
			-- Create a new GIBIJ error.
		do
			code := gibij_template_code
			etl_code := gibij_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibik is
			-- Create a new GIBIK error.
		do
			code := gibik_template_code
			etl_code := gibik_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibil is
			-- Create a new GIBIL error.
		do
			code := gibil_template_code
			etl_code := gibil_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibim is
			-- Create a new GIBIM error.
		do
			code := gibim_template_code
			etl_code := gibim_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibin is
			-- Create a new GIBIN error.
		do
			code := gibin_template_code
			etl_code := gibin_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibio is
			-- Create a new GIBIO error.
		do
			code := gibio_template_code
			etl_code := gibio_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibip is
			-- Create a new GIBIP error.
		do
			code := gibip_template_code
			etl_code := gibip_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibiq is
			-- Create a new GIBIQ error.
		do
			code := gibiq_template_code
			etl_code := gibiq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibir is
			-- Create a new GIBIR error.
		do
			code := gibir_template_code
			etl_code := gibir_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibis is
			-- Create a new GIBIS error.
		do
			code := gibis_template_code
			etl_code := gibis_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibit is
			-- Create a new GIBIT error.
		do
			code := gibit_template_code
			etl_code := gibit_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibiu is
			-- Create a new GIBIU error.
		do
			code := gibiu_template_code
			etl_code := gibiu_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibiv is
			-- Create a new GIBIV error.
		do
			code := gibiv_template_code
			etl_code := gibiv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibiw is
			-- Create a new GIBIW error.
		do
			code := gibiw_template_code
			etl_code := gibiw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibix is
			-- Create a new GIBIX error.
		do
			code := gibix_template_code
			etl_code := gibix_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibiy is
			-- Create a new GIBIY error.
		do
			code := gibiy_template_code
			etl_code := gibiy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibiz is
			-- Create a new GIBIZ error.
		do
			code := gibiz_template_code
			etl_code := gibiz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibja is
			-- Create a new GIBJA error.
		do
			code := gibja_template_code
			etl_code := gibja_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjb is
			-- Create a new GIBJB error.
		do
			code := gibjb_template_code
			etl_code := gibjb_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjc is
			-- Create a new GIBJC error.
		do
			code := gibjc_template_code
			etl_code := gibjc_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjd is
			-- Create a new GIBJD error.
		do
			code := gibjd_template_code
			etl_code := gibjd_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibje is
			-- Create a new GIBJE error.
		do
			code := gibje_template_code
			etl_code := gibje_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjf is
			-- Create a new GIBJF error.
		do
			code := gibjf_template_code
			etl_code := gibjf_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjg is
			-- Create a new GIBJG error.
		do
			code := gibjg_template_code
			etl_code := gibjg_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjh is
			-- Create a new GIBJH error.
		do
			code := gibjh_template_code
			etl_code := gibjh_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibji is
			-- Create a new GIBJI error.
		do
			code := gibji_template_code
			etl_code := gibji_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjj is
			-- Create a new GIBJJ error.
		do
			code := gibjj_template_code
			etl_code := gibjj_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjk is
			-- Create a new GIBJK error.
		do
			code := gibjk_template_code
			etl_code := gibjk_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjl is
			-- Create a new GIBJL error.
		do
			code := gibjl_template_code
			etl_code := gibjl_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjm is
			-- Create a new GIBJM error.
		do
			code := gibjm_template_code
			etl_code := gibjm_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjn is
			-- Create a new GIBJN error.
		do
			code := gibjn_template_code
			etl_code := gibjn_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjo is
			-- Create a new GIBJO error.
		do
			code := gibjo_template_code
			etl_code := gibjo_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjp is
			-- Create a new GIBJP error.
		do
			code := gibjp_template_code
			etl_code := gibjp_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjq is
			-- Create a new GIBJQ error.
		do
			code := gibjq_template_code
			etl_code := gibjq_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjr is
			-- Create a new GIBJR error.
		do
			code := gibjr_template_code
			etl_code := gibjr_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjs is
			-- Create a new GIBJS error.
		do
			code := gibjs_template_code
			etl_code := gibjs_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjt is
			-- Create a new GIBJT error.
		do
			code := gibjt_template_code
			etl_code := gibjt_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibju is
			-- Create a new GIBJU error.
		do
			code := gibju_template_code
			etl_code := gibju_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjv is
			-- Create a new GIBJV error.
		do
			code := gibjv_template_code
			etl_code := gibjv_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjw is
			-- Create a new GIBJW error.
		do
			code := gibjw_template_code
			etl_code := gibjw_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjx is
			-- Create a new GIBJX error.
		do
			code := gibjx_template_code
			etl_code := gibjx_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjy is
			-- Create a new GIBJY error.
		do
			code := gibjy_template_code
			etl_code := gibjy_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gibjz is
			-- Create a new GIBJZ error.
		do
			code := gibjz_template_code
			etl_code := gibjz_etl_code
			default_template := gi_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

feature {NONE} -- Implementation

	gi_default_template: STRING is "[$1] internal error."
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
	giabr_etl_code: STRING is "GIABR"
	giabs_etl_code: STRING is "GIABS"
	giabt_etl_code: STRING is "GIABT"
	giabu_etl_code: STRING is "GIABU"
	giabv_etl_code: STRING is "GIABV"
	giabw_etl_code: STRING is "GIABW"
	giabx_etl_code: STRING is "GIABX"
	giaby_etl_code: STRING is "GIABY"
	giabz_etl_code: STRING is "GIABZ"
	giaca_etl_code: STRING is "GIACA"
	giacb_etl_code: STRING is "GIACB"
	giacc_etl_code: STRING is "GIACC"
	giacd_etl_code: STRING is "GIACD"
	giace_etl_code: STRING is "GIACE"
	giacf_etl_code: STRING is "GIACF"
	giacg_etl_code: STRING is "GIACG"
	giach_etl_code: STRING is "GIACH"
	giaci_etl_code: STRING is "GIACI"
	giacj_etl_code: STRING is "GIACJ"
	giack_etl_code: STRING is "GIACK"
	giacl_etl_code: STRING is "GIACL"
	giacm_etl_code: STRING is "GIACM"
	giacn_etl_code: STRING is "GIACN"
	giaco_etl_code: STRING is "GIACO"
	giacp_etl_code: STRING is "GIACP"
	giacq_etl_code: STRING is "GIACQ"
	giacr_etl_code: STRING is "GIACR"
	giacs_etl_code: STRING is "GIACS"
	giact_etl_code: STRING is "GIACT"
	giacu_etl_code: STRING is "GIACU"
	giacv_etl_code: STRING is "GIACV"
	giacw_etl_code: STRING is "GIACW"
	giacx_etl_code: STRING is "GIACX"
	giacy_etl_code: STRING is "GIACY"
	giacz_etl_code: STRING is "GIACZ"
	giada_etl_code: STRING is "GIADA"
	giadb_etl_code: STRING is "GIADB"
	giadc_etl_code: STRING is "GIADC"
	giadd_etl_code: STRING is "GIADD"
	giade_etl_code: STRING is "GIADE"
	giadf_etl_code: STRING is "GIADF"
	giadg_etl_code: STRING is "GIADG"
	giadh_etl_code: STRING is "GIADH"
	giadi_etl_code: STRING is "GIADI"
	giadj_etl_code: STRING is "GIADJ"
	giadk_etl_code: STRING is "GIADK"
	giadl_etl_code: STRING is "GIADL"
	giadm_etl_code: STRING is "GIADM"
	giadn_etl_code: STRING is "GIADN"
	giado_etl_code: STRING is "GIADO"
	giadp_etl_code: STRING is "GIADP"
	giadq_etl_code: STRING is "GIADQ"
	giadr_etl_code: STRING is "GIADR"
	giads_etl_code: STRING is "GIADS"
	giadt_etl_code: STRING is "GIADT"
	giadu_etl_code: STRING is "GIADU"
	giadv_etl_code: STRING is "GIADV"
	giadw_etl_code: STRING is "GIADW"
	giadx_etl_code: STRING is "GIADX"
	giady_etl_code: STRING is "GIADY"
	giadz_etl_code: STRING is "GIADZ"
	giaea_etl_code: STRING is "GIAEA"
	giaeb_etl_code: STRING is "GIAEB"
	giaec_etl_code: STRING is "GIAEC"
	giaed_etl_code: STRING is "GIAED"
	gibaa_etl_code: STRING is "GIBAA"
	gibab_etl_code: STRING is "GIBAB"
	gibac_etl_code: STRING is "GIBAC"
	gibad_etl_code: STRING is "GIBAD"
	gibae_etl_code: STRING is "GIBAE"
	gibaf_etl_code: STRING is "GIBAF"
	gibag_etl_code: STRING is "GIBAG"
	gibah_etl_code: STRING is "GIBAH"
	gibai_etl_code: STRING is "GIBAI"
	gibaj_etl_code: STRING is "GIBAJ"
	gibak_etl_code: STRING is "GIBAK"
	gibal_etl_code: STRING is "GIBAL"
	gibam_etl_code: STRING is "GIBAM"
	giban_etl_code: STRING is "GIBAN"
	gibao_etl_code: STRING is "GIBAO"
	gibap_etl_code: STRING is "GIBAP"
	gibaq_etl_code: STRING is "GIBAQ"
	gibar_etl_code: STRING is "GIBAR"
	gibas_etl_code: STRING is "GIBAS"
	gibat_etl_code: STRING is "GIBAT"
	gibau_etl_code: STRING is "GIBAU"
	gibav_etl_code: STRING is "GIBAV"
	gibaw_etl_code: STRING is "GIBAW"
	gibax_etl_code: STRING is "GIBAX"
	gibay_etl_code: STRING is "GIBAY"
	gibaz_etl_code: STRING is "GIBAZ"
	gibba_etl_code: STRING is "GIBBA"
	gibbb_etl_code: STRING is "GIBBB"
	gibbc_etl_code: STRING is "GIBBC"
	gibbd_etl_code: STRING is "GIBBD"
	gibbe_etl_code: STRING is "GIBBE"
	gibbf_etl_code: STRING is "GIBBF"
	gibbg_etl_code: STRING is "GIBBG"
	gibbh_etl_code: STRING is "GIBBH"
	gibbi_etl_code: STRING is "GIBBI"
	gibbj_etl_code: STRING is "GIBBJ"
	gibbk_etl_code: STRING is "GIBBK"
	gibbl_etl_code: STRING is "GIBBL"
	gibbm_etl_code: STRING is "GIBBM"
	gibbn_etl_code: STRING is "GIBBN"
	gibbo_etl_code: STRING is "GIBBO"
	gibbp_etl_code: STRING is "GIBBP"
	gibbq_etl_code: STRING is "GIBBQ"
	gibbr_etl_code: STRING is "GIBBR"
	gibbs_etl_code: STRING is "GIBBS"
	gibbt_etl_code: STRING is "GIBBT"
	gibbu_etl_code: STRING is "GIBBU"
	gibbv_etl_code: STRING is "GIBBV"
	gibbw_etl_code: STRING is "GIBBW"
	gibbx_etl_code: STRING is "GIBBX"
	gibby_etl_code: STRING is "GIBBY"
	gibbz_etl_code: STRING is "GIBBZ"
	gibca_etl_code: STRING is "GIBCA"
	gibcb_etl_code: STRING is "GIBCB"
	gibcc_etl_code: STRING is "GIBCC"
	gibcd_etl_code: STRING is "GIBCD"
	gibce_etl_code: STRING is "GIBCE"
	gibcf_etl_code: STRING is "GIBCF"
	gibcg_etl_code: STRING is "GIBCG"
	gibch_etl_code: STRING is "GIBCH"
	gibci_etl_code: STRING is "GIBCI"
	gibcj_etl_code: STRING is "GIBCJ"
	gibck_etl_code: STRING is "GIBCK"
	gibcl_etl_code: STRING is "GIBCL"
	gibcm_etl_code: STRING is "GIBCM"
	gibcn_etl_code: STRING is "GIBCN"
	gibco_etl_code: STRING is "GIBCO"
	gibcp_etl_code: STRING is "GIBCP"
	gibcq_etl_code: STRING is "GIBCQ"
	gibcr_etl_code: STRING is "GIBCR"
	gibcs_etl_code: STRING is "GIBCS"
	gibct_etl_code: STRING is "GIBCT"
	gibcu_etl_code: STRING is "GIBCU"
	gibcv_etl_code: STRING is "GIBCV"
	gibcw_etl_code: STRING is "GIBCW"
	gibcx_etl_code: STRING is "GIBCX"
	gibcy_etl_code: STRING is "GIBCY"
	gibcz_etl_code: STRING is "GIBCZ"
	gibda_etl_code: STRING is "GIBDA"
	gibdb_etl_code: STRING is "GIBDB"
	gibdc_etl_code: STRING is "GIBDC"
	gibdd_etl_code: STRING is "GIBDD"
	gibde_etl_code: STRING is "GIBDE"
	gibdf_etl_code: STRING is "GIBDF"
	gibdg_etl_code: STRING is "GIBDG"
	gibdh_etl_code: STRING is "GIBDH"
	gibdi_etl_code: STRING is "GIBDI"
	gibdj_etl_code: STRING is "GIBDJ"
	gibdk_etl_code: STRING is "GIBDK"
	gibdl_etl_code: STRING is "GIBDL"
	gibdm_etl_code: STRING is "GIBDM"
	gibdn_etl_code: STRING is "GIBDN"
	gibdo_etl_code: STRING is "GIBDO"
	gibdp_etl_code: STRING is "GIBDP"
	gibdq_etl_code: STRING is "GIBDQ"
	gibdr_etl_code: STRING is "GIBDR"
	gibds_etl_code: STRING is "GIBDS"
	gibdt_etl_code: STRING is "GIBDT"
	gibdu_etl_code: STRING is "GIBDU"
	gibdv_etl_code: STRING is "GIBDV"
	gibdw_etl_code: STRING is "GIBDW"
	gibdx_etl_code: STRING is "GIBDX"
	gibdy_etl_code: STRING is "GIBDY"
	gibdz_etl_code: STRING is "GIBDZ"
	gibea_etl_code: STRING is "GIBEA"
	gibeb_etl_code: STRING is "GIBEB"
	gibec_etl_code: STRING is "GIBEC"
	gibed_etl_code: STRING is "GIBED"
	gibee_etl_code: STRING is "GIBEE"
	gibef_etl_code: STRING is "GIBEF"
	gibeg_etl_code: STRING is "GIBEG"
	gibeh_etl_code: STRING is "GIBEH"
	gibei_etl_code: STRING is "GIBEI"
	gibej_etl_code: STRING is "GIBEJ"
	gibek_etl_code: STRING is "GIBEK"
	gibel_etl_code: STRING is "GIBEL"
	gibem_etl_code: STRING is "GIBEM"
	giben_etl_code: STRING is "GIBEN"
	gibeo_etl_code: STRING is "GIBEO"
	gibep_etl_code: STRING is "GIBEP"
	gibeq_etl_code: STRING is "GIBEQ"
	giber_etl_code: STRING is "GIBER"
	gibes_etl_code: STRING is "GIBES"
	gibet_etl_code: STRING is "GIBET"
	gibeu_etl_code: STRING is "GIBEU"
	gibev_etl_code: STRING is "GIBEV"
	gibew_etl_code: STRING is "GIBEW"
	gibex_etl_code: STRING is "GIBEX"
	gibey_etl_code: STRING is "GIBEY"
	gibez_etl_code: STRING is "GIBEZ"
	gibfa_etl_code: STRING is "GIBFA"
	gibfb_etl_code: STRING is "GIBFB"
	gibfc_etl_code: STRING is "GIBFC"
	gibfd_etl_code: STRING is "GIBFD"
	gibfe_etl_code: STRING is "GIBFE"
	gibff_etl_code: STRING is "GIBFF"
	gibfg_etl_code: STRING is "GIBFG"
	gibfh_etl_code: STRING is "GIBFH"
	gibfi_etl_code: STRING is "GIBFI"
	gibfj_etl_code: STRING is "GIBFJ"
	gibfk_etl_code: STRING is "GIBFK"
	gibfl_etl_code: STRING is "GIBFL"
	gibfm_etl_code: STRING is "GIBFM"
	gibfn_etl_code: STRING is "GIBFN"
	gibfo_etl_code: STRING is "GIBFO"
	gibfp_etl_code: STRING is "GIBFP"
	gibfq_etl_code: STRING is "GIBFQ"
	gibfr_etl_code: STRING is "GIBFR"
	gibfs_etl_code: STRING is "GIBFS"
	gibft_etl_code: STRING is "GIBFT"
	gibfu_etl_code: STRING is "GIBFU"
	gibfv_etl_code: STRING is "GIBFV"
	gibfw_etl_code: STRING is "GIBFW"
	gibfx_etl_code: STRING is "GIBFX"
	gibfy_etl_code: STRING is "GIBFY"
	gibfz_etl_code: STRING is "GIBFZ"
	gibga_etl_code: STRING is "GIBGA"
	gibgb_etl_code: STRING is "GIBGB"
	gibgc_etl_code: STRING is "GIBGC"
	gibgd_etl_code: STRING is "GIBGD"
	gibge_etl_code: STRING is "GIBGE"
	gibgf_etl_code: STRING is "GIBGF"
	gibgg_etl_code: STRING is "GIBGG"
	gibgh_etl_code: STRING is "GIBGH"
	gibgi_etl_code: STRING is "GIBGI"
	gibgj_etl_code: STRING is "GIBGJ"
	gibgk_etl_code: STRING is "GIBGK"
	gibgl_etl_code: STRING is "GIBGL"
	gibgm_etl_code: STRING is "GIBGM"
	gibgn_etl_code: STRING is "GIBGN"
	gibgo_etl_code: STRING is "GIBGO"
	gibgp_etl_code: STRING is "GIBGP"
	gibgq_etl_code: STRING is "GIBGQ"
	gibgr_etl_code: STRING is "GIBGR"
	gibgs_etl_code: STRING is "GIBGS"
	gibgt_etl_code: STRING is "GIBGT"
	gibgu_etl_code: STRING is "GIBGU"
	gibgv_etl_code: STRING is "GIBGV"
	gibgw_etl_code: STRING is "GIBGW"
	gibgx_etl_code: STRING is "GIBGX"
	gibgy_etl_code: STRING is "GIBGY"
	gibgz_etl_code: STRING is "GIBGZ"
	gibha_etl_code: STRING is "GIBHA"
	gibhb_etl_code: STRING is "GIBHB"
	gibhc_etl_code: STRING is "GIBHC"
	gibhd_etl_code: STRING is "GIBHD"
	gibhe_etl_code: STRING is "GIBHE"
	gibhf_etl_code: STRING is "GIBHF"
	gibhg_etl_code: STRING is "GIBHG"
	gibhh_etl_code: STRING is "GIBHH"
	gibhi_etl_code: STRING is "GIBHI"
	gibhj_etl_code: STRING is "GIBHJ"
	gibhk_etl_code: STRING is "GIBHK"
	gibhl_etl_code: STRING is "GIBHL"
	gibhm_etl_code: STRING is "GIBHM"
	gibhn_etl_code: STRING is "GIBHN"
	gibho_etl_code: STRING is "GIBHO"
	gibhp_etl_code: STRING is "GIBHP"
	gibhq_etl_code: STRING is "GIBHQ"
	gibhr_etl_code: STRING is "GIBHR"
	gibhs_etl_code: STRING is "GIBHS"
	gibht_etl_code: STRING is "GIBHT"
	gibhu_etl_code: STRING is "GIBHU"
	gibhv_etl_code: STRING is "GIBHV"
	gibhw_etl_code: STRING is "GIBHW"
	gibhx_etl_code: STRING is "GIBHX"
	gibhy_etl_code: STRING is "GIBHY"
	gibhz_etl_code: STRING is "GIBHZ"
	gibia_etl_code: STRING is "GIBIA"
	gibib_etl_code: STRING is "GIBIB"
	gibic_etl_code: STRING is "GIBIC"
	gibid_etl_code: STRING is "GIBID"
	gibie_etl_code: STRING is "GIBIE"
	gibif_etl_code: STRING is "GIBIF"
	gibig_etl_code: STRING is "GIBIG"
	gibih_etl_code: STRING is "GIBIH"
	gibii_etl_code: STRING is "GIBII"
	gibij_etl_code: STRING is "GIBIJ"
	gibik_etl_code: STRING is "GIBIK"
	gibil_etl_code: STRING is "GIBIL"
	gibim_etl_code: STRING is "GIBIM"
	gibin_etl_code: STRING is "GIBIN"
	gibio_etl_code: STRING is "GIBIO"
	gibip_etl_code: STRING is "GIBIP"
	gibiq_etl_code: STRING is "GIBIQ"
	gibir_etl_code: STRING is "GIBIR"
	gibis_etl_code: STRING is "GIBIS"
	gibit_etl_code: STRING is "GIBIT"
	gibiu_etl_code: STRING is "GIBIU"
	gibiv_etl_code: STRING is "GIBIV"
	gibiw_etl_code: STRING is "GIBIW"
	gibix_etl_code: STRING is "GIBIX"
	gibiy_etl_code: STRING is "GIBIY"
	gibiz_etl_code: STRING is "GIBIZ"
	gibja_etl_code: STRING is "GIBJA"
	gibjb_etl_code: STRING is "GIBJB"
	gibjc_etl_code: STRING is "GIBJC"
	gibjd_etl_code: STRING is "GIBJD"
	gibje_etl_code: STRING is "GIBJE"
	gibjf_etl_code: STRING is "GIBJF"
	gibjg_etl_code: STRING is "GIBJG"
	gibjh_etl_code: STRING is "GIBJH"
	gibji_etl_code: STRING is "GIBJI"
	gibjj_etl_code: STRING is "GIBJJ"
	gibjk_etl_code: STRING is "GIBJK"
	gibjl_etl_code: STRING is "GIBJL"
	gibjm_etl_code: STRING is "GIBJM"
	gibjn_etl_code: STRING is "GIBJN"
	gibjo_etl_code: STRING is "GIBJO"
	gibjp_etl_code: STRING is "GIBJP"
	gibjq_etl_code: STRING is "GIBJQ"
	gibjr_etl_code: STRING is "GIBJR"
	gibjs_etl_code: STRING is "GIBJS"
	gibjt_etl_code: STRING is "GIBJT"
	gibju_etl_code: STRING is "GIBJU"
	gibjv_etl_code: STRING is "GIBJV"
	gibjw_etl_code: STRING is "GIBJW"
	gibjx_etl_code: STRING is "GIBJX"
	gibjy_etl_code: STRING is "GIBJY"
	gibjz_etl_code: STRING is "GIBJZ"
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
	giabr_template_code: STRING is "giabr"
	giabs_template_code: STRING is "giabs"
	giabt_template_code: STRING is "giabt"
	giabu_template_code: STRING is "giabu"
	giabv_template_code: STRING is "giabv"
	giabw_template_code: STRING is "giabw"
	giabx_template_code: STRING is "giabx"
	giaby_template_code: STRING is "giaby"
	giabz_template_code: STRING is "giabz"
	giaca_template_code: STRING is "giaca"
	giacb_template_code: STRING is "giacb"
	giacc_template_code: STRING is "giacc"
	giacd_template_code: STRING is "giacd"
	giace_template_code: STRING is "giace"
	giacf_template_code: STRING is "giacf"
	giacg_template_code: STRING is "giacg"
	giach_template_code: STRING is "giach"
	giaci_template_code: STRING is "giaci"
	giacj_template_code: STRING is "giacj"
	giack_template_code: STRING is "giack"
	giacl_template_code: STRING is "giacl"
	giacm_template_code: STRING is "giacm"
	giacn_template_code: STRING is "giacn"
	giaco_template_code: STRING is "giaco"
	giacp_template_code: STRING is "giacp"
	giacq_template_code: STRING is "giacq"
	giacr_template_code: STRING is "giacr"
	giacs_template_code: STRING is "giacs"
	giact_template_code: STRING is "giact"
	giacu_template_code: STRING is "giacu"
	giacv_template_code: STRING is "giacv"
	giacw_template_code: STRING is "giacw"
	giacx_template_code: STRING is "giacx"
	giacy_template_code: STRING is "giacy"
	giacz_template_code: STRING is "giacz"
	giada_template_code: STRING is "giada"
	giadb_template_code: STRING is "giadb"
	giadc_template_code: STRING is "giadc"
	giadd_template_code: STRING is "giadd"
	giade_template_code: STRING is "giade"
	giadf_template_code: STRING is "giadf"
	giadg_template_code: STRING is "giadg"
	giadh_template_code: STRING is "giadh"
	giadi_template_code: STRING is "giadi"
	giadj_template_code: STRING is "giadj"
	giadk_template_code: STRING is "giadk"
	giadl_template_code: STRING is "giadl"
	giadm_template_code: STRING is "giadm"
	giadn_template_code: STRING is "giadn"
	giado_template_code: STRING is "giado"
	giadp_template_code: STRING is "giadp"
	giadq_template_code: STRING is "giadq"
	giadr_template_code: STRING is "giadr"
	giads_template_code: STRING is "giads"
	giadt_template_code: STRING is "giadt"
	giadu_template_code: STRING is "giadu"
	giadv_template_code: STRING is "giadv"
	giadw_template_code: STRING is "giadw"
	giadx_template_code: STRING is "giadx"
	giady_template_code: STRING is "giady"
	giadz_template_code: STRING is "giadz"
	giaea_template_code: STRING is "giaea"
	giaeb_template_code: STRING is "giaeb"
	giaec_template_code: STRING is "giaec"
	giaed_template_code: STRING is "giaed"
	gibaa_template_code: STRING is "gibaa"
	gibab_template_code: STRING is "gibab"
	gibac_template_code: STRING is "gibac"
	gibad_template_code: STRING is "gibad"
	gibae_template_code: STRING is "gibae"
	gibaf_template_code: STRING is "gibaf"
	gibag_template_code: STRING is "gibag"
	gibah_template_code: STRING is "gibah"
	gibai_template_code: STRING is "gibai"
	gibaj_template_code: STRING is "gibaj"
	gibak_template_code: STRING is "gibak"
	gibal_template_code: STRING is "gibal"
	gibam_template_code: STRING is "gibam"
	giban_template_code: STRING is "giban"
	gibao_template_code: STRING is "gibao"
	gibap_template_code: STRING is "gibap"
	gibaq_template_code: STRING is "gibaq"
	gibar_template_code: STRING is "gibar"
	gibas_template_code: STRING is "gibas"
	gibat_template_code: STRING is "gibat"
	gibau_template_code: STRING is "gibau"
	gibav_template_code: STRING is "gibav"
	gibaw_template_code: STRING is "gibaw"
	gibax_template_code: STRING is "gibax"
	gibay_template_code: STRING is "gibay"
	gibaz_template_code: STRING is "gibaz"
	gibba_template_code: STRING is "gibba"
	gibbb_template_code: STRING is "gibbb"
	gibbc_template_code: STRING is "gibbc"
	gibbd_template_code: STRING is "gibbd"
	gibbe_template_code: STRING is "gibbe"
	gibbf_template_code: STRING is "gibbf"
	gibbg_template_code: STRING is "gibbg"
	gibbh_template_code: STRING is "gibbh"
	gibbi_template_code: STRING is "gibbi"
	gibbj_template_code: STRING is "gibbj"
	gibbk_template_code: STRING is "gibbk"
	gibbl_template_code: STRING is "gibbl"
	gibbm_template_code: STRING is "gibbm"
	gibbn_template_code: STRING is "gibbn"
	gibbo_template_code: STRING is "gibbo"
	gibbp_template_code: STRING is "gibbp"
	gibbq_template_code: STRING is "gibbq"
	gibbr_template_code: STRING is "gibbr"
	gibbs_template_code: STRING is "gibbs"
	gibbt_template_code: STRING is "gibbt"
	gibbu_template_code: STRING is "gibbu"
	gibbv_template_code: STRING is "gibbv"
	gibbw_template_code: STRING is "gibbw"
	gibbx_template_code: STRING is "gibbx"
	gibby_template_code: STRING is "gibby"
	gibbz_template_code: STRING is "gibbz"
	gibca_template_code: STRING is "gibca"
	gibcb_template_code: STRING is "gibcb"
	gibcc_template_code: STRING is "gibcc"
	gibcd_template_code: STRING is "gibcd"
	gibce_template_code: STRING is "gibce"
	gibcf_template_code: STRING is "gibcf"
	gibcg_template_code: STRING is "gibcg"
	gibch_template_code: STRING is "gibch"
	gibci_template_code: STRING is "gibci"
	gibcj_template_code: STRING is "gibcj"
	gibck_template_code: STRING is "gibck"
	gibcl_template_code: STRING is "gibcl"
	gibcm_template_code: STRING is "gibcm"
	gibcn_template_code: STRING is "gibcn"
	gibco_template_code: STRING is "gibco"
	gibcp_template_code: STRING is "gibcp"
	gibcq_template_code: STRING is "gibcq"
	gibcr_template_code: STRING is "gibcr"
	gibcs_template_code: STRING is "gibcs"
	gibct_template_code: STRING is "gibct"
	gibcu_template_code: STRING is "gibcu"
	gibcv_template_code: STRING is "gibcv"
	gibcw_template_code: STRING is "gibcw"
	gibcx_template_code: STRING is "gibcx"
	gibcy_template_code: STRING is "gibcy"
	gibcz_template_code: STRING is "gibcz"
	gibda_template_code: STRING is "gibda"
	gibdb_template_code: STRING is "gibdb"
	gibdc_template_code: STRING is "gibdc"
	gibdd_template_code: STRING is "gibdd"
	gibde_template_code: STRING is "gibde"
	gibdf_template_code: STRING is "gibdf"
	gibdg_template_code: STRING is "gibdg"
	gibdh_template_code: STRING is "gibdh"
	gibdi_template_code: STRING is "gibdi"
	gibdj_template_code: STRING is "gibdj"
	gibdk_template_code: STRING is "gibdk"
	gibdl_template_code: STRING is "gibdl"
	gibdm_template_code: STRING is "gibdm"
	gibdn_template_code: STRING is "gibdn"
	gibdo_template_code: STRING is "gibdo"
	gibdp_template_code: STRING is "gibdp"
	gibdq_template_code: STRING is "gibdq"
	gibdr_template_code: STRING is "gibdr"
	gibds_template_code: STRING is "gibds"
	gibdt_template_code: STRING is "gibdt"
	gibdu_template_code: STRING is "gibdu"
	gibdv_template_code: STRING is "gibdv"
	gibdw_template_code: STRING is "gibdw"
	gibdx_template_code: STRING is "gibdx"
	gibdy_template_code: STRING is "gibdy"
	gibdz_template_code: STRING is "gibdz"
	gibea_template_code: STRING is "gibea"
	gibeb_template_code: STRING is "gibeb"
	gibec_template_code: STRING is "gibec"
	gibed_template_code: STRING is "gibed"
	gibee_template_code: STRING is "gibee"
	gibef_template_code: STRING is "gibef"
	gibeg_template_code: STRING is "gibeg"
	gibeh_template_code: STRING is "gibeh"
	gibei_template_code: STRING is "gibei"
	gibej_template_code: STRING is "gibej"
	gibek_template_code: STRING is "gibek"
	gibel_template_code: STRING is "gibel"
	gibem_template_code: STRING is "gibem"
	giben_template_code: STRING is "giben"
	gibeo_template_code: STRING is "gibeo"
	gibep_template_code: STRING is "gibep"
	gibeq_template_code: STRING is "gibeq"
	giber_template_code: STRING is "giber"
	gibes_template_code: STRING is "gibes"
	gibet_template_code: STRING is "gibet"
	gibeu_template_code: STRING is "gibeu"
	gibev_template_code: STRING is "gibev"
	gibew_template_code: STRING is "gibew"
	gibex_template_code: STRING is "gibex"
	gibey_template_code: STRING is "gibey"
	gibez_template_code: STRING is "gibez"
	gibfa_template_code: STRING is "gibfa"
	gibfb_template_code: STRING is "gibfb"
	gibfc_template_code: STRING is "gibfc"
	gibfd_template_code: STRING is "gibfd"
	gibfe_template_code: STRING is "gibfe"
	gibff_template_code: STRING is "gibff"
	gibfg_template_code: STRING is "gibfg"
	gibfh_template_code: STRING is "gibfh"
	gibfi_template_code: STRING is "gibfi"
	gibfj_template_code: STRING is "gibfj"
	gibfk_template_code: STRING is "gibfk"
	gibfl_template_code: STRING is "gibfl"
	gibfm_template_code: STRING is "gibfm"
	gibfn_template_code: STRING is "gibfn"
	gibfo_template_code: STRING is "gibfo"
	gibfp_template_code: STRING is "gibfp"
	gibfq_template_code: STRING is "gibfq"
	gibfr_template_code: STRING is "gibfr"
	gibfs_template_code: STRING is "gibfs"
	gibft_template_code: STRING is "gibft"
	gibfu_template_code: STRING is "gibfu"
	gibfv_template_code: STRING is "gibfv"
	gibfw_template_code: STRING is "gibfw"
	gibfx_template_code: STRING is "gibfx"
	gibfy_template_code: STRING is "gibfy"
	gibfz_template_code: STRING is "gibfz"
	gibga_template_code: STRING is "gibga"
	gibgb_template_code: STRING is "gibgb"
	gibgc_template_code: STRING is "gibgc"
	gibgd_template_code: STRING is "gibgd"
	gibge_template_code: STRING is "gibge"
	gibgf_template_code: STRING is "gibgf"
	gibgg_template_code: STRING is "gibgg"
	gibgh_template_code: STRING is "gibgh"
	gibgi_template_code: STRING is "gibgi"
	gibgj_template_code: STRING is "gibgj"
	gibgk_template_code: STRING is "gibgk"
	gibgl_template_code: STRING is "gibgl"
	gibgm_template_code: STRING is "gibgm"
	gibgn_template_code: STRING is "gibgn"
	gibgo_template_code: STRING is "gibgo"
	gibgp_template_code: STRING is "gibgp"
	gibgq_template_code: STRING is "gibgq"
	gibgr_template_code: STRING is "gibgr"
	gibgs_template_code: STRING is "gibgs"
	gibgt_template_code: STRING is "gibgt"
	gibgu_template_code: STRING is "gibgu"
	gibgv_template_code: STRING is "gibgv"
	gibgw_template_code: STRING is "gibgw"
	gibgx_template_code: STRING is "gibgx"
	gibgy_template_code: STRING is "gibgy"
	gibgz_template_code: STRING is "gibgz"
	gibha_template_code: STRING is "gibha"
	gibhb_template_code: STRING is "gibhb"
	gibhc_template_code: STRING is "gibhc"
	gibhd_template_code: STRING is "gibhd"
	gibhe_template_code: STRING is "gibhe"
	gibhf_template_code: STRING is "gibhf"
	gibhg_template_code: STRING is "gibhg"
	gibhh_template_code: STRING is "gibhh"
	gibhi_template_code: STRING is "gibhi"
	gibhj_template_code: STRING is "gibhj"
	gibhk_template_code: STRING is "gibhk"
	gibhl_template_code: STRING is "gibhl"
	gibhm_template_code: STRING is "gibhm"
	gibhn_template_code: STRING is "gibhn"
	gibho_template_code: STRING is "gibho"
	gibhp_template_code: STRING is "gibhp"
	gibhq_template_code: STRING is "gibhq"
	gibhr_template_code: STRING is "gibhr"
	gibhs_template_code: STRING is "gibhs"
	gibht_template_code: STRING is "gibht"
	gibhu_template_code: STRING is "gibhu"
	gibhv_template_code: STRING is "gibhv"
	gibhw_template_code: STRING is "gibhw"
	gibhx_template_code: STRING is "gibhx"
	gibhy_template_code: STRING is "gibhy"
	gibhz_template_code: STRING is "gibhz"
	gibia_template_code: STRING is "gibia"
	gibib_template_code: STRING is "gibib"
	gibic_template_code: STRING is "gibic"
	gibid_template_code: STRING is "gibid"
	gibie_template_code: STRING is "gibie"
	gibif_template_code: STRING is "gibif"
	gibig_template_code: STRING is "gibig"
	gibih_template_code: STRING is "gibih"
	gibii_template_code: STRING is "gibii"
	gibij_template_code: STRING is "gibij"
	gibik_template_code: STRING is "gibik"
	gibil_template_code: STRING is "gibil"
	gibim_template_code: STRING is "gibim"
	gibin_template_code: STRING is "gibin"
	gibio_template_code: STRING is "gibio"
	gibip_template_code: STRING is "gibip"
	gibiq_template_code: STRING is "gibiq"
	gibir_template_code: STRING is "gibir"
	gibis_template_code: STRING is "gibis"
	gibit_template_code: STRING is "gibit"
	gibiu_template_code: STRING is "gibiu"
	gibiv_template_code: STRING is "gibiv"
	gibiw_template_code: STRING is "gibiw"
	gibix_template_code: STRING is "gibix"
	gibiy_template_code: STRING is "gibiy"
	gibiz_template_code: STRING is "gibiz"
	gibja_template_code: STRING is "gibja"
	gibjb_template_code: STRING is "gibjb"
	gibjc_template_code: STRING is "gibjc"
	gibjd_template_code: STRING is "gibjd"
	gibje_template_code: STRING is "gibje"
	gibjf_template_code: STRING is "gibjf"
	gibjg_template_code: STRING is "gibjg"
	gibjh_template_code: STRING is "gibjh"
	gibji_template_code: STRING is "gibji"
	gibjj_template_code: STRING is "gibjj"
	gibjk_template_code: STRING is "gibjk"
	gibjl_template_code: STRING is "gibjl"
	gibjm_template_code: STRING is "gibjm"
	gibjn_template_code: STRING is "gibjn"
	gibjo_template_code: STRING is "gibjo"
	gibjp_template_code: STRING is "gibjp"
	gibjq_template_code: STRING is "gibjq"
	gibjr_template_code: STRING is "gibjr"
	gibjs_template_code: STRING is "gibjs"
	gibjt_template_code: STRING is "gibjt"
	gibju_template_code: STRING is "gibju"
	gibjv_template_code: STRING is "gibjv"
	gibjw_template_code: STRING is "gibjw"
	gibjx_template_code: STRING is "gibjx"
	gibjy_template_code: STRING is "gibjy"
	gibjz_template_code: STRING is "gibjz"
		-- Template error codes

end
