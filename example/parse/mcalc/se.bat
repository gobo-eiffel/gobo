@rem system:     "Calculator with memory"
@rem compiler:   "SmallEiffel -0.78"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1999, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo ${GOBO}\example\parse\mcalc\>				loadpath.se

@rem	-- Gobo Eiffel Parse Library
@echo ${GOBO}\library\parse\skeleton\>>			loadpath.se

@rem	-- Gobo Eiffel Structure Library
@echo ${GOBO}\library\structure\container\>>	loadpath.se
@echo ${GOBO}\library\structure\cursor\>>		loadpath.se
@echo ${GOBO}\library\structure\list\>>			loadpath.se
@echo ${GOBO}\library\structure\search\>>		loadpath.se
@echo ${GOBO}\library\structure\sort\>>			loadpath.se
@echo ${GOBO}\library\structure\stack\>>		loadpath.se
@echo ${GOBO}\library\structure\support\>>		loadpath.se
@echo ${GOBO}\library\structure\table\>>		loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo ${GOBO}\library\kernel\>>					loadpath.se
@echo ${GOBO}\library\kernel\spec\se\>>			loadpath.se

@rem	-- SmallEiffel Kernel
@rem ${SmallEiffelDir}\lib_std\>>				loadpath.se


set options= -boost -no_split -no_style_warning
compile %options% MCALC execute
