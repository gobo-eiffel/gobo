# Syntax S7SC

These [tests](.) are exercising the syntax rule below.

## S7SC: Semicolon Optionality rule

### ECMA 367-3 (working version 3-44), 8.4.5 page 68

In writing specimens of any construct defined by a Repetition production specifying the semicolon ";" as separator, it is permitted, without any effect on the syntax structure, validity and semantics of the software, to omit any of the semicolons, or to add a semicolon after the last element.

### Notes

* The definition of the unfolded form does not indicate what to do in case of an *Iteration* of the form `across ... is ...`.
* The definition of the unfolded form does not indicate what to do in case of an *Iteration* of the form `∀ ...`, `∃ ...` or `⟳ ... ⟲`.
