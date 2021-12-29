note

	description:

		"Null error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NULL_ERROR_HANDLER

inherit

	ET_ERROR_HANDLER
		redefine
			reportable_gaaaa_error,
			reportable_gazzz_error,
			reportable_gcaaa_error,
			reportable_gcaab_error,
			reportable_gcdep_error,
			reportable_gcpro_error,
			reportable_gcscm_error,
			reportable_gvknl1_error,
			reportable_gvsrc3_error,
			reportable_gvsrc4_error,
			reportable_gvsrc5_error,
			reportable_gvsrc6_error,
			reportable_vaol1_error,
			reportable_vape1_error,
			reportable_vape2_error,
			reportable_vave_error,
			reportable_vbac1_error,
			reportable_vbac2_error,
			reportable_vcch1_error,
			reportable_vcch2_error,
			reportable_vcfg1_error,
			reportable_vcfg2_error,
			reportable_vdjr_error,
			reportable_vdjr2_error,
			reportable_vdpr1_error,
			reportable_vdpr2_error,
			reportable_vdpr3_error,
			reportable_vdpr4_error,
			reportable_vdrd2_error,
			reportable_vdrd3_error,
			reportable_vdrd4_error,
			reportable_vdrd5_error,
			reportable_vdrd6_error,
			reportable_vdrd7_error,
			reportable_vdrs1_error,
			reportable_vdrs2_error,
			reportable_vdrs3_error,
			reportable_vdrs4_error,
			reportable_vdus1_error,
			reportable_vdus2_error,
			reportable_vdus3_error,
			reportable_vdus4_error,
			reportable_veen_error,
			reportable_veen2_error,
			reportable_veen8_error,
			reportable_veen9_error,
			reportable_vevi_error,
			reportable_vfac1_error,
			reportable_vfac2_error,
			reportable_vfac3_error,
			reportable_vfac4_error,
			reportable_vfav1_error,
			reportable_vfav2_error,
			reportable_vfav3_error,
			reportable_vfav4_error,
			reportable_vfav5_error,
			reportable_vffd4_error,
			reportable_vffd7_error,
			reportable_vgcc1_error,
			reportable_vgcc3_error,
			reportable_vgcc5_error,
			reportable_vgcc6_error,
			reportable_vgcc8_error,
			reportable_vgcp1_error,
			reportable_vgcp2_error,
			reportable_vgcp3_error,
			reportable_vggc1_error,
			reportable_vggc2_error,
			reportable_vggc3_error,
			reportable_vgmc_error,
			reportable_vhay_error,
			reportable_vhpr1_error,
			reportable_vhpr2_error,
			reportable_vhpr3_error,
			reportable_vhrc1_error,
			reportable_vhrc2_error,
			reportable_vjar_error,
			reportable_vjaw_error,
			reportable_vjrv_error,
			reportable_vkcn1_error,
			reportable_vkcn2_error,
			reportable_vlel1_error,
			reportable_vlel2_error,
			reportable_vlel3_error,
			reportable_vmfn_error,
			reportable_vmfn2_error,
			reportable_vmrc2_error,
			reportable_vmss1_error,
			reportable_vmss2_error,
			reportable_vmss3_error,
			reportable_voit1_error,
			reportable_voit2_error,
			reportable_voit3_error,
			reportable_vomb1_error,
			reportable_vomb2_error,
			reportable_vpca1_error,
			reportable_vpca2_error,
			reportable_vpca3_error,
			reportable_vpca4_error,
			reportable_vpca5_error,
			reportable_vpir1_error,
			reportable_vpir3_error,
			reportable_vqmc1_error,
			reportable_vqmc2_error,
			reportable_vqmc3_error,
			reportable_vqmc4_error,
			reportable_vqmc5_error,
			reportable_vqui_error,
			reportable_vred_error,
			reportable_vreg_error,
			reportable_vrfa_error,
			reportable_vrle1_error,
			reportable_vrle2_error,
			reportable_vrlv1_error,
			reportable_vrlv2_error,
			reportable_vscn_error,
			reportable_vsrc1_error,
			reportable_vtat1_error,
			reportable_vtat2_error,
			reportable_vtcg3_error,
			reportable_vtcg4_error,
			reportable_vtct_error,
			reportable_vtug1_error,
			reportable_vtug2_error,
			reportable_vuar1_error,
			reportable_vuar2_error,
			reportable_vuar4_error,
			reportable_vucr_error,
			reportable_vuex1_error,
			reportable_vuex2_error,
			reportable_vuno3_error,
			reportable_vuno5_error,
			reportable_vuot1_error,
			reportable_vuot3_error,
			reportable_vuot4_error,
			reportable_vuta2_error,
			reportable_vvok1_error,
			reportable_vvok2_error,
			reportable_vwab_error,
			reportable_vwbe_error,
			reportable_vwce_error,
			reportable_vweq_error,
			reportable_vwma1_error,
			reportable_vwma2_error,
			reportable_vwmq_error,
			reportable_vwst1_error,
			reportable_vwst2_error,
			reportable_vxrt_error,
			reportable_gvagp_error,
			reportable_gvhpr5_error,
			reportable_gvhso1_error,
			reportable_gvhso2_error,
			reportable_gvkbs_error,
			reportable_gvkbu1_error,
			reportable_gvkfe1_error,
			reportable_gvkfe2_error,
			reportable_gvkfe3_error,
			reportable_gvkfe4_error,
			reportable_gvkfe5_error,
			reportable_gvkfe6_error,
			reportable_gvscn1_error,
			reportable_gvtcg5_error,
			reportable_gvuaa_error,
			reportable_gvuac_error,
			reportable_gvual_error,
			reportable_gvuao_error,
			reportable_gvuia_error,
			reportable_gvuic_error,
			reportable_gvuil_error,
			reportable_gvuio_error,
			reportable_gvwmc2_error
		end

create

	make_standard, make_null

feature -- Cluster error status

	reportable_gcaaa_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCAAA error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

	reportable_gcaab_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCAAB error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

	reportable_gcdep_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCDEP error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

	reportable_gcpro_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCPRO error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

	reportable_gcscm_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCSCM error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

feature -- Universe error status

	reportable_vscn_error (a_universe: ET_UNIVERSE): BOOLEAN
			-- Can a VSCN error be reported when it
			-- appears in `a_universe'?
		do
			Result := False
		end

feature -- .NET assembly error status

	reportable_gaaaa_error (an_assembly: ET_DOTNET_ASSEMBLY): BOOLEAN
			-- Can a GAAAA error be reported when it
			-- appears in `an_assembly'?
		do
			Result := False
		end

	reportable_gazzz_error (an_assembly: ET_DOTNET_ASSEMBLY): BOOLEAN
			-- Can a GAZZZ error be reported when it
			-- appears in `an_assembly'?
		do
			Result := False
		end

feature -- System error status

	reportable_vsrc1_error: BOOLEAN
			-- Can a VSRC-1 error be reported?
		do
			Result := False
		end

	reportable_gvknl1_error: BOOLEAN
			-- Can a GVKNL-1 error be reported?
		do
			Result := False
		end

	reportable_gvsrc3_error: BOOLEAN
			-- Can a GVSRC-3 error be reported?
		do
			Result := False
		end

	reportable_gvsrc4_error: BOOLEAN
			-- Can a GVSRC-4 error be reported?
		do
			Result := False
		end

	reportable_gvsrc5_error: BOOLEAN
			-- Can a GVSRC-5 error be reported?
		do
			Result := False
		end

	reportable_gvsrc6_error: BOOLEAN
			-- Can a GVSRC-6 error be reported?
		do
			Result := False
		end

feature -- Validity error status

	reportable_vaol1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAOL-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vape1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAPE-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vape2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAPE-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vave_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAVE error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vbac1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VBAC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vbac2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VBAC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcch1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCCH-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcch2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCCH-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcfg1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCFG-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcfg2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCFG-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdjr_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDJR error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdjr2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDJR-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd6_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd7_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-7 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_veen_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_veen2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_veen8_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN-8 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_veen9_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN-9 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vevi_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEVI error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfac1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfac2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfac3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfac4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfav1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfav2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfav3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfav4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vfav5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vffd4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFFD-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vffd7_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFFD-7 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc6_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc8_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-8 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcp1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCP-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcp2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCP-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcp3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCP-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vggc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGGC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vggc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGGC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vggc3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGGC-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgmc_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGMC error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhay_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHAY error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhpr1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHPR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhpr2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHPR-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhpr3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHPR-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhrc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHRC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhrc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHRC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vjar_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VJAR error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vjaw_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VJAW error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vjrv_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VJRV error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vkcn1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VKCN-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vkcn2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VKCN-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vlel1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VLEL-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vlel2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VLEL-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vlel3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VLEL-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmfn_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMFN error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmfn2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMFN-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmrc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMRC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmss1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMSS-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmss2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMSS-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmss3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMSS-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_voit1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOIT-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_voit2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOIT-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_voit3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOIT-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vomb1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOMB-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vomb2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOMB-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpir1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPIR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpir3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPIR-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqui_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQUI error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vred_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRED error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vreg_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VREG error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrfa_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRFA error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrle1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLE-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrle2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLE-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrlv1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLV-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrlv2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLV-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtat1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTAT-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtat2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTAT-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtcg3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTCG-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtcg4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTCG-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtct_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTCT error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtug1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTUG-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtug2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTUG-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuar1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUAR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuar2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUAR-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuar4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUAR-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vucr_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUCR error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuex1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUEX-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuex2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUEX-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuno3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUNO-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuno5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUNO-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuot1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUOT-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuot3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUOT-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuot4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUOT-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuta2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUTA-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vvok1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VVOK-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vvok2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VVOK-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwab_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWAB error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwbe_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWBE error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwce_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWCE error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vweq_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWEQ error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwma1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWMA-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwma2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWMA-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwmq_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWMQ error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwst1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWST-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwst2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWST-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vxrt_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VXRT error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvagp_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVAGP error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvhpr5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVHPR-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvhso1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVHSO-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvhso2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVHSO-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkbs_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKBS error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkbu1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKBU-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkfe1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkfe2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkfe3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkfe4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkfe5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvkfe6_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvscn1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVSCN-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvtcg5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVTCG-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuaa_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAA error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuac_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAC error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvual_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAL error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuao_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAO error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuia_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIA error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuic_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIC error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuil_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIL error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuio_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIO error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvwmc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVWMC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

end
