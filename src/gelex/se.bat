@rem system:     "Gobo Eiffel Lex: lexical analyzer generator"
@rem compiler:   "SmallEiffel -0.78"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1999, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo ${GOBO}\src\gelex\>							loadpath.se

@rem	-- Gobo Eiffel Lexical Library
@echo ${GOBO}\library\lexical\automaton\>>			loadpath.se
@echo ${GOBO}\library\lexical\error\>>				loadpath.se
@echo ${GOBO}\library\lexical\lex\>>				loadpath.se
@echo ${GOBO}\library\lexical\generation\>>			loadpath.se
@echo ${GOBO}\library\lexical\regexp\>>				loadpath.se
@echo ${GOBO}\library\lexical\scanner\>>			loadpath.se
@echo ${GOBO}\library\lexical\skeleton\>>			loadpath.se
@echo ${GOBO}\library\lexical\support\>>			loadpath.se

@rem	-- Gobo Eiffel Parse Library
@echo ${GOBO}\library\parse\skeleton\>>				loadpath.se

@rem	-- Gobo Eiffel Utility Library
@echo ${GOBO}\library\utility\command\>>			loadpath.se
@echo ${GOBO}\library\utility\error\>>				loadpath.se
@echo ${GOBO}\library\utility\formatter\>>			loadpath.se
@echo ${GOBO}\library\utility\support\>>			loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo ${GOBO}\library\kernel\>>						loadpath.se
@echo ${GOBO}\library\kernel\spec\se\>>				loadpath.se

@rem	-- Gobo Eiffel Structure Library
@echo ${GOBO}\library\structure\container\>>		loadpath.se
@echo ${GOBO}\library\structure\cursor\>>			loadpath.se
@echo ${GOBO}\library\structure\list\>>				loadpath.se
@echo ${GOBO}\library\structure\search\>>			loadpath.se
@echo ${GOBO}\library\structure\sort\>>				loadpath.se
@echo ${GOBO}\library\structure\support\>>			loadpath.se
@echo ${GOBO}\library\structure\stack\>>			loadpath.se
@echo ${GOBO}\library\structure\table\>>			loadpath.se

@rem	-- SmallEiffel Kernel
@rem ${SmallEiffelDir}\lib_std\>>					loadpath.se


set options= -boost -no_split -no_style_warning -no_gc
compile %options% GELEX execute
