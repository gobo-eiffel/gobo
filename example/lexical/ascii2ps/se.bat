@rem system:     "'ascii2ps' pretty-printer"
@rem compiler:   "SmallEiffel -0.78"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1998, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo ${GOBO}\example\lexical\ascii2ps\>	loadpath.se

@rem	-- Gobo Eiffel Lexical Library
@echo ${GOBO}\library\lexical\skeleton\>>	loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo ${GOBO}\library\kernel\>>				loadpath.se
@echo ${GOBO}\library\kernel\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@rem ${SmallEiffelDir}\lib_std\>>			loadpath.se


set options= -boost -no_split -no_style_warning -no_gc
compile %options% ASCII2PS make
