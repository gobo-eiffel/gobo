indexing

  description:
        "element name constants for GEANT"

    author:     "Sven Ehrke (sven.ehrke@sven-ehrke.de)"
    copyright:  "Sven Ehrke and others"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_ELEMENT_NAMES

	
feature
	ucs_target			: UC_STRING is once !!Result.make_from_string("target") end

	ucs_default_build_filename	: UC_STRING is once !!Result.make_from_string("build.eant") end


	feature -- target attribute names and values
	ucs_project			: UC_STRING is once !!Result.make_from_string("project") end
	ucs_default			: UC_STRING is once !!Result.make_from_string("default") end
	ucs_name			: UC_STRING is once !!Result.make_from_string("name") end
	ucs_true			: UC_STRING is once !!Result.make_from_string("true") end
	ucs_false			: UC_STRING is once !!Result.make_from_string("false") end
	ucs_empty			: UC_STRING is once !!Result.make_from_string("") end

	feature -- task names
	ucs_compile_se			: UC_STRING is once !!Result.make_from_string("compile_se") end
	ucs_exec				: UC_STRING is once !!Result.make_from_string("exec") end
	ucs_xace				: UC_STRING is once !!Result.make_from_string("xace") end
	ucs_gelex				: UC_STRING is once !!Result.make_from_string("gelex") end
	ucs_geyacc				: UC_STRING is once !!Result.make_from_string("geyacc") end
	ucs_lcc					: UC_STRING is once !!Result.make_from_string("lcc") end
	ucs_var					: UC_STRING is once !!Result.make_from_string("var") end


end
