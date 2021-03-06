functor AbtArity (Vl : ABT_VALENCE) : ABT_ARITY =
struct
  structure Vl = Vl and S = Vl.S

  type valence = Vl.t
  type sort = Vl.sort
  type t = valence list * sort

  fun eq ((valences, sigma), (valences', sigma')) =
    ListPair.allEq Vl.eq (valences, valences')
      andalso S.eq (sigma, sigma')

  fun toString (valences, sigma) =
      let
        val valences' = ListUtil.joinWith Vl.toString ", " valences
        val sigma' = S.toString sigma
      in
        "(" ^ valences' ^ ")" ^ sigma'
      end
end

functor ListAbtArity (structure S : ABT_SORT) : ABT_ARITY =
  AbtArity
    (AbtValence
      (structure S = S))

structure UnisortedAbtArity : UNISORTED_ABT_ARITY =
struct
  local
    structure Vl = UnisortedAbtValence
    structure A = AbtArity (Vl)
  in
    fun make vls =
      (List.map Vl.make vls, ())
    open A
  end
end
