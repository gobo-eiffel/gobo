@rem system:     "'gepp' preprocessor"
@rem compiler:   "SmallEiffel -0.84"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1997, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo .\>											loadpath.se
@echo %GOBO%\src\gepp\>>							loadpath.se

@rem	-- Gobo Eiffel Lexical Library
@echo %GOBO%\library\lexical\skeleton\>>			loadpath.se

@rem	-- Gobo Eiffel Parse Library
@echo %GOBO%\library\parse\skeleton\>>				loadpath.se

@rem	-- Gobo Eiffel Utility Library
@echo %GOBO%\library\utility\support\>>				loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo %GOBO%\library\kernel\>>						loadpath.se
@echo %GOBO%\library\kernel\spec\se\>>				loadpath.se

@rem	-- Gobo Eiffel Structure Library
@echo %GOBO%\library\structure\container\>>			loadpath.se
@echo %GOBO%\library\structure\cursor\>>			loadpath.se
@echo %GOBO%\library\structure\cursor\spec\se\>>	loadpath.se
@echo %GOBO%\library\structure\list\>>				loadpath.se
@echo %GOBO%\library\structure\search\>>			loadpath.se
@echo %GOBO%\library\structure\search\spec\se\>>	loadpath.se
@echo %GOBO%\library\structure\sort\>>				loadpath.se
@echo %GOBO%\library\structure\support\>>			loadpath.se
@echo %GOBO%\library\structure\stack\>>				loadpath.se
@echo %GOBO%\library\structure\table\>>				loadpath.se
@echo %GOBO%\library\structure\table\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@echo %SmallEiffel%\lib_std\>>						loadpath.se


compile_to_c -boost -no_split GEPP execute
gepp.bat
