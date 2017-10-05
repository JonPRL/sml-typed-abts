### sml-typed-abts

This is an implementation of Abstract Binding Trees from [Robert
Harper](https://www.cs.cmu.edu/~rwh/)'s book, [Practical Foundations for
Programming Languages](https://www.cs.cmu.edu/~rwh/plbook/2nded.pdf).

In particular, this differs from many implementations of ABTs in the following
respects:

- Unlike Nuprl-style ABTs, this is a library for *many-sorted* abstract binding
  trees.

### Getting Started
#### Prerequisites

You need either SML/NJ or MLton. Either [download the binary SML/NJ
installer](http://www.smlnj.org/) or, on OS X, use homebrew:

    brew update && brew install smlnj

#### Downloading the repository

Recursively clone the repo:

    git clone --recursive https://github.com/jonsterling/sml-typed-abts.git

Note: whenever you pull anew from this repository, be sure to refresh the
submodules:

    git submodule update --init --recursive

#### Running the example with MLton

To run the example with MLton, use the included script, and then run the
resulting executable:

    ./scripts/mlton.sh
    ./example.out

Eventually, a prompt should appear at which you can parse and sort-check/infer
ABT expressions. Here's an example session:

    Type an expression at the prompt

    > \x. x
    lam([x@10].x@10)

    > (\f. f 3) (\x. x)
    Error: Fail: expected exp == nat

    > (\f. f #3) (\x. x)
    ap(lam([f@31].ap(f@31; num(3))); lam([x@32].x@32))

The printer is in "debug mode", which means that all variables are
annotated with a unique index; this is useful for convincing oneself that
variables are being bound properly.

#### Running the example in SML/NJ

Start the SML REPL:

    cd sml-typed-abts
    rlwrap sml
    Standard ML of New Jersey v110.78 [built: Sun Apr 26 01:06:11 2015]
    -

At the `-` prompt, type:

    - CM.make "example.cm";

You should see a lot of compilation messages and then, the prompt should
appear:

    Type an expression at the prompt

    >
