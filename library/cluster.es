[Cluster]
Name=Gobo
Category=Data structures
Sources=Gobo.Sources

[Gobo.Sources]
Gobo.Sources.kernel=
Gobo.Sources.kernel.VE=
Gobo.Sources.lexical=
Gobo.Sources.parse=
Gobo.Sources.structure=
Gobo.Sources.utility=

[Gobo.Sources.kernel]
Mask=kernel/*.e

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

[Gobo.Sources.utility]
Mask=utility/*.e
Recursive=True
