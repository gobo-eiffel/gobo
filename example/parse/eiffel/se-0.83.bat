@rem system:     "Eiffel parser"
@rem compiler:   "SmallEiffel -0.83"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1997, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo .\>									loadpath.se
@echo %GOBO%\example\parse\eiffel\>>		loadpath.se

@rem	-- Gobo Eiffel Parse Library
@echo %GOBO%\library\parse\skeleton\>>		loadpath.se

@rem	-- Gobo Eiffel Lexical Library
@echo %GOBO%\library\lexical\skeleton\>>	loadpath.se

@rem	-- Gobo Eiffel Utility Library
@echo %GOBO%\library\utility\support\>>		loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo %GOBO%\library\kernel\>>				loadpath.se
@echo %GOBO%\library\kernel\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@echo %SmallEiffel%\lib_std\>>				loadpath.se


set options= -boost -no_split -case_insensitive -no_warning
compile_to_c %options% EIFFEL_PARSER benchmark
eiffel_parser.bat
