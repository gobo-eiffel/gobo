# Semantics MBRE-3

This [test](.) is exercising the condition [`3`](../Readme.md) of the semantics rule [`MBRE`](../../mbre/Readme.md).

### Description

In this test, we have a call chain `b.d.set_value (3)`, with the object attached to `b.d` with copy semantics. However no attachment is involved. In particular this is not equivalent to:

```
d := b.d
d.set_value (3)
```

where an attachment would have been involved. Since there is no attachment, the semantics rule `MBRE`, and in particular `MBRE-3`, does not apply. So there is no cloning of the object attached to `b.d` despite its copy semantics.
