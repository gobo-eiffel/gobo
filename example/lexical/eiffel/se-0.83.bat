@rem system:     "Eiffel scanner"
@rem compiler:   "SmallEiffel -0.84"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1997, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo .\>									loadpath.se
@echo %GOBO%\example\lexical\eiffel\>>		loadpath.se

@rem	-- Gobo Eiffel Lexical Library
@echo %GOBO%\library\lexical\skeleton\>>	loadpath.se

@rem	-- Gobo Eiffel Utility Library
@echo %GOBO%\library\utility\support\>>		loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo %GOBO%\library\kernel\>>				loadpath.se
@echo %GOBO%\library\kernel\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@echo %SmallEiffel%\lib_std\>>				loadpath.se


compile_to_c -boost -no_split EIFFEL_SCANNER benchmark
eiffel_scanner.bat
