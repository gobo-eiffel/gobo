Gobo Eiffel Time Library

The Gobo Eiffel Time Library is a portable Eiffel class library
covering date and time handling. When this library has been
developed, there was no date and time library standard, and
no portable library supporting the main Eiffel compilers
was publicly available. Each Eiffel compiler provides its own
date and time library, but none of them is fully portable.
Furthermore the existing date and time libraries only covered
the absolute time and duration notions, leaving untackled areas
such as time zones, stopwatches, clocks or timers. The Gobo Eiffel
Time Library tries to address these issues with the same care
that characterizes the other high-quality libraries that make
up the Gobo Eiffel Project.

Clusters:

clock
    Clocks, system clock, customizable clocks.
date
    Date, time and duration classes.
stopwatch
    Stopwatches.
time_zone
    Time zones, date/time conversions. (STILL UNDER DEVELOPMENT)

A more detailed documentation for this library, in HTML format,
is provided in "$GOBO/doc/time". Examples for this library can
be found in "$GOBO/example/time".

--
Copyright (c) 2000-2009, Eric Bezault and others
