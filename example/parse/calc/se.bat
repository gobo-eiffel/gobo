@rem system:     "Infix Notation Calculator"
@rem compiler:   "SmallEiffel -0.78"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1998, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo ${GOBO}\example\parse\calc\>			loadpath.se

@rem	-- Gobo Eiffel Parse Library
@echo ${GOBO}\library\parse\skeleton\>>		loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo ${GOBO}\library\kernel\>>				loadpath.se
@echo ${GOBO}\library\kernel\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@rem ${SmallEiffelDir}\lib_std\>>			loadpath.se


set options= -boost -no_split -no_style_warning
compile %options% CALC execute
