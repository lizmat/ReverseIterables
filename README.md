[![Actions Status](https://github.com/lizmat/ReverseIterables/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/ReverseIterables/actions) [![Actions Status](https://github.com/lizmat/ReverseIterables/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/ReverseIterables/actions) [![Actions Status](https://github.com/lizmat/ReverseIterables/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/ReverseIterables/actions)

NAME
====

ReverseIterables - turn two or more Iterables into a single iterator reversing

SYNOPSIS
========

```raku
use ReverseIterables;

my @a = ^5;
my @b = <a b c d e>;
my @c = ReverseIterables.new(@a,@b).Seq;
say @c;  # [e d c b a 4 3 2 1]
```

DESCRIPTION
===========

The `ReverseIterables` distribution provides a `ReverseIterables` class that creates a single `Iterator` from any number `Iterables` that will **lazily** produce values in a "reverse" order (from the end of the last `Iterable`, to the start of the first `Iterable`).

It does **not** recurse into any `Iterable` values that it encounters.

It also provides a `Seq` method, to directly produce a `Seq` object from the iterator, so it can be used in expressions.

PROBABLY NOT USER FACING
========================

This module is probably more useful for module developers, than for people writing direct Raku production code.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/ReverseIterables . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

