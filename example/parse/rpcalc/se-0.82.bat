@rem system:     "Reverse Polish Notation Calculator"
@rem compiler:   "SmallEiffel -0.82"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1998, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo .\>									loadpath.se
@echo %GOBO%\example\parse\rpcalc\>>		loadpath.se

@rem	-- Gobo Eiffel Parse Library
@echo %GOBO%\library\parse\skeleton\>>		loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo %GOBO%\library\kernel\>>				loadpath.se
@echo %GOBO%\library\kernel\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@echo %SmallEiffel%\lib_std\>>				loadpath.se


set options= -boost -no_split -case_insensitive -no_warning
compile_to_c %options% RPCALC execute
rpcalc.bat
