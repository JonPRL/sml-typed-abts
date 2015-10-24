### sml-typed-abts

This is a full implementation of Abstract Binding Trees from [Robert
Harper](https://www.cs.cmu.edu/~rwh/)'s book, [Practical Foundations for
Programming Languages](https://www.cs.cmu.edu/~rwh/plbook/2nded.pdf).

In particular, this differs from many implementations of ABTs in the following
respects:

- Unlike Nuprl-style ABTs, this is a library for *many-sorted* abstract binding
  trees.

- We include a proper treatment of symbols and parameters in addition to
  variables. Recall that whilst variables support substitution, symbols support
  only fresh renaming. Operators are fibred over finite sets of symbols and sort
  assignments, and sort-preserving injective maps of symbols lift to renamings of
  operators' parameters. Valences account for the binding of both variables and
  symbols. *Symbols are necessary in order to correctly implement assignables and
  exceptions.*

- Finally, the structure of terms has been generalized to support encodings
  other than lists for bindings & spines; in general, the ABT framework may be
  instantiated at any inductive fan.
