indexing

	description:

		"Null error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NULL_ERROR_HANDLER

inherit

	ET_ERROR_HANDLER
		redefine
			reportable_gcaaa_error,
			reportable_gcaab_error,
			reportable_vaol1_error,
			reportable_vape_error,
			reportable_vave_error,
			reportable_vcch1_error,
			reportable_vcch2_error,
			reportable_vcfg1_error,
			reportable_vcfg2_error,
			reportable_vcfg3_error,
			reportable_vdjr_error,
			reportable_vdpr1_error,
			reportable_vdpr2_error,
			reportable_vdpr3_error,
			reportable_vdpr4_error,
			reportable_vdrd2_error,
			reportable_vdrd3_error,
			reportable_vdrd4_error,
			reportable_vdrd5_error,
			reportable_vdrd6_error,
			reportable_vdrs1_error,
			reportable_vdrs2_error,
			reportable_vdrs3_error,
			reportable_vdrs4_error,
			reportable_vdus1_error,
			reportable_vdus2_error,
			reportable_vdus3_error,
			reportable_vdus4_error,
			reportable_vffd4_error,
			reportable_vffd5_error,
			reportable_vffd6_error,
			reportable_vffd7_error,
			reportable_veen_error,
			reportable_veen2_error,
			reportable_vgcc3_error,
			reportable_vgcc5_error,
			reportable_vgcc6_error,
			reportable_vgcc8_error,
			reportable_vgcp1_error,
			reportable_vgcp2_error,
			reportable_vgcp3_error,
			reportable_vhay_error,
			reportable_vhpr1_error,
			reportable_vhpr3_error,
			reportable_vhrc1_error,
			reportable_vhrc2_error,
			reportable_vhrc4_error,
			reportable_vhrc5_error,
			reportable_vjar_error,
			reportable_vjaw_error,
			reportable_vjrv_error,
			reportable_vkcn1_error,
			reportable_vkcn2_error,
			reportable_vlel1_error,
			reportable_vlel2_error,
			reportable_vlel3_error,
			reportable_vmfn_error,
			reportable_vmrc2_error,
			reportable_vmss1_error,
			reportable_vmss2_error,
			reportable_vmss3_error,
			reportable_vomb1_error,
			reportable_vomb2_error,
			reportable_vpca1_error,
			reportable_vpca2_error,
			reportable_vpca3_error,
			reportable_vpca4_error,
			reportable_vpca5_error,
			reportable_vqmc1_error,
			reportable_vqmc2_error,
			reportable_vqmc3_error,
			reportable_vqmc4_error,
			reportable_vqmc5_error,
			reportable_vqmc6_error,
			reportable_vqui_error,
			reportable_vreg_error,
			reportable_vrfa_error,
			reportable_vrle1_error,
			reportable_vrle2_error,
			reportable_vscn_error,
			reportable_vtat_error,
			reportable_vtbt_error,
			reportable_vtcg3_error,
			reportable_vtcg4_error,
			reportable_vtct_error,
			reportable_vtgc_error,
			reportable_vtug1_error,
			reportable_vtug2_error,
			reportable_vuar1_error,
			reportable_vuar2_error,
			reportable_vuar4_error,
			reportable_vuex1_error,
			reportable_vuex2_error,
			reportable_vwbe_error,
			reportable_vweq_error,
			reportable_vwst1_error,
			reportable_vwst2_error,
			reportable_vxrt_error,
			reportable_gvagp_error,
			reportable_gvhpr4_error,
			reportable_gvhpr5_error,
			reportable_gvuaa_error,
			reportable_gvual_error,
			reportable_gvuia_error,
			reportable_gvuil_error
		end

create

	make_standard, make_null

feature -- Cluster error status

	reportable_gcaaa_error (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Can a GCAAA error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

	reportable_gcaab_error (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Can a GCAAB error be reported when it
			-- appears in `a_cluster'?
		do
			Result := False
		end

feature -- Validity error status

	reportable_vaol1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VAOL-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vape_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VAPE error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vave_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VAVE error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcch1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCCH-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcch2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCCH-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcfg1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCFG-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcfg2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCFG-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vcfg3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCFG-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdjr_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDJR error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdpr4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrd6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdrs4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vdus4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vffd4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vffd5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vffd6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vffd7_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-7 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_veen_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VEEN error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_veen2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VEEN-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcc8_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-8 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcp1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCP-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcp2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCP-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vgcp3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCP-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhay_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHAY error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhpr1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHPR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhpr3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHPR-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhrc1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhrc2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhrc4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vhrc5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vjar_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VJAR error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vjaw_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VJAW error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vjrv_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VJRV error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vkcn1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VKCN-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vkcn2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VKCN-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vlel1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VLEL-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vlel2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VLEL-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vlel3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VLEL-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmfn_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMFN error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmrc2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMRC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmss1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMSS-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmss2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMSS-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vmss3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMSS-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vomb1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VOMB-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vomb2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VOMB-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vpca5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqmc6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-6 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vqui_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQUI error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vreg_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VREG error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrfa_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VRFA error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrle1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VRLE-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vrle2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VRLE-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vscn_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VSCN error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtat_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTAT error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtbt_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTBT error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtcg3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTCG-3 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtcg4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTCG-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtct_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTCT error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtgc_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTGC error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtug1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTUG-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vtug2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTUG-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuar1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUAR-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuar2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUAR-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuar4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUAR-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuex1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUEX-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vuex2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUEX-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwbe_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWBE error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vweq_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWEQ error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwst1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWST-1 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vwst2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWST-2 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_vxrt_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VXRT error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvagp_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVAGP error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvhpr4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVHPR-4 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvhpr5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVHPR-5 error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuaa_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUAA error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvual_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUAL error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuia_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUIA error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

	reportable_gvuil_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUIL error be reported when it
			-- appears in `a_class'?
		do
			Result := False
		end

end
