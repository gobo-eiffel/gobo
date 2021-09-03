# Semantics MBRE

These [tests](.) are exercising the semantics rule below.</br>
Click on the `[tests]` label following the case numbers to below to see tests specific to these cases.

## MBRE: Reattachment Semantics

### ECMA 367-2, 8.22.6 page 118

The effect of a reattachment of source expression `source` and target entity `target` is the effect of the first of the following steps whose condition applies:

1. If `source` converts to `target`: perform a conversion attachment from `source` to `target`.
2. If the value of `source` is a void reference: make `target`'s value void as well.
3. [\[tests\]](../mbre3) If the value of `source` is attached to an object with copy semantics: create a clone of that object, if possible, and attach `target` to it.
4. If the value of `source` is attached to an object with reference semantics: attach `target` to that object.

### ECMA 367-3 (working version 3-36), 8.22.6 page 122

Same as above.

### Notes

* Case 3 mentions "if possible". This refers to the fact that the cloning might be impossible for lack of memory, in which case the semantics of the cloning operation specifies triggering an exception, of type `NO_MORE_MEMORY`.
