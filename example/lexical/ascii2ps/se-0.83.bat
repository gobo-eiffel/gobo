@rem system:     "'ascii2ps' pretty-printer"
@rem compiler:   "SmallEiffel -0.84"
@rem author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
@rem copyright:  "Copyright (c) 1997, Eric Bezault"
@rem date:       "$Date$"
@rem revision:   "$Revision$"


@echo .\>									loadpath.se
@echo %GOBO%\example\lexical\ascii2ps\>>	loadpath.se

@rem	-- Gobo Eiffel Lexical Library
@echo %GOBO%\library\lexical\skeleton\>>	loadpath.se

@rem	-- Gobo Eiffel Kernel Library
@echo %GOBO%\library\kernel\>>				loadpath.se
@echo %GOBO%\library\kernel\spec\se\>>		loadpath.se

@rem	-- SmallEiffel Kernel
@echo %SmallEiffel%\lib_std\>>				loadpath.se


compile_to_c -boost -no_split ASCII2PS make
ascii2ps.bat
