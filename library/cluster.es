[Cluster]
Name=Gobo
Category=Data structures
Sources=Gobo.Sources
Bindings=Gobo.Bindings

[Gobo.Sources]
Gobo.Sources.kernel=
Gobo.Sources.kernel.io=
Gobo.Sources.kernel.misc=
Gobo.Sources.kernel.unicode=
Gobo.Sources.kernel.support=
Gobo.Sources.kernel.OS=
Gobo.Sources.kernel.VE=
Gobo.Sources.lexical=
Gobo.Sources.parse=
Gobo.Sources.structure=
Gobo.Sources.test=
Gobo.Sources.time.clock=
Gobo.Sources.time.date=
Gobo.Sources.time.time_zone=
Gobo.Sources.time.VE=
Gobo.Sources.tools=
Gobo.Sources.utility.command=
Gobo.Sources.utility.error=
Gobo.Sources.utility.formatter=
Gobo.Sources.utility.support=
Gobo.Sources.utility.VE=

[Gobo.Sources.kernel]
Mask=kernel/*.e

[Gobo.Sources.kernel.unicode]
Mask=kernel/unicode/*.e

[Gobo.Sources.kernel.support]
Mask=kernel/support/*.e

[Gobo.Sources.kernel.io]
Mask=kernel/io/*.e

[Gobo.Sources.kernel.misc]
Mask=kernel/misc/*.e

[Gobo.Sources.kernel.OS]
Mask=kernel/spec/$GOBO_OS/*.e

[Gobo.Sources.kernel.VE]
Mask=kernel/spec/ve/*.e

[Gobo.Sources.lexical]
Mask=lexical/*.e
Recursive=True

[Gobo.Sources.parse]
Mask=parse/*.e
Recursive=True

[Gobo.Sources.structure]
Mask=structure/*.e
Recursive=True

[Gobo.Sources.test]
Mask=test/*.e
Recursive=True

[Gobo.Sources.time.clock]
Mask=time/clock/*.e

[Gobo.Sources.time.date]
Mask=time/date/*.e

[Gobo.Sources.time.time_zone]
Mask=time/time_zone/*.e

[Gobo.Sources.time.VE]
Mask=time/spec/ve/*.e

[Gobo.Sources.tools]
Mask=tools/*.e
Recursive=True

[Gobo.Sources.utility.command]
Mask=utility/command/*.e
Recursive=True

[Gobo.Sources.utility.error]
Mask=utility/error/*.e
Recursive=True

[Gobo.Sources.utility.formatter]
Mask=utility/formatter/*.e
Recursive=True

[Gobo.Sources.utility.support]
Mask=utility/support/*.e
Recursive=True

[Gobo.Sources.utility.VE]
Mask=utility/spec/ve/*.e



[Gobo.Bindings]
Clusters=Gobo.Clusters.$VE_OS

[Gobo.Clusters.Win32]
VE.Kernel=
VE.Pool=
VE.gArgs=
VE.WinLib=
VE.TimeDate=

[Gobo.Clusters.Linux]
VE.Kernel=
VE.Pool=
VE.gArgs=
VE.TimeDate=

[VE.Kernel]
Name=Kernel
Path=$VE_Lib/Kernel

[VE.Pool]
Name=Pool
Path=$VE_Lib/Misc/Pool

[VE.gArgs]
Name=gArgs
Path=$VE_Lib/Tools/gArgs

[VE.WinLib]
Name=WinLib
Path=$VE_Lib/WinLibs/WinLib

[VE.TimeDate]
Name=TimeDate
Path=$VE_Lib/TimeDate
