signature ABT_OPERATOR =
sig
  structure Ar : ABT_ARITY
  structure P : ABT_PARAM

  type 'i t

  val arity : 'i t -> Ar.t
  val support : 'i P.t t -> ('i * Ar.Vl.sort) list

  val eq : ('i * 'i -> bool) -> 'i t * 'i t -> bool
  val toString : ('i -> string) -> 'i t -> string
  val map : ('i -> 'j) -> 'i t -> 'j t
end

signature ABT_SIMPLE_OPERATOR =
sig
  structure Ar : ABT_ARITY

  type t
  val arity : t -> Ar.t
  val eq : t * t -> bool
  val toString : t -> string
end
