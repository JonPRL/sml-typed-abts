functor AbtValence (structure S : ABT_SORT and PS : ABT_SORT) : ABT_VALENCE =
struct
  structure S = S and PS = PS
  type sort = S.t
  type psort = PS.t
  type 'a spine = 'a list
  type bindings = psort spine * sort spine
  type t = bindings * sort

  fun eq (((symbolSorts, variableSorts), sigma), ((symbolSorts', variableSorts'), sigma')) =
    ListPair.allEq PS.eq (symbolSorts, symbolSorts')
      andalso ListPair.allEq S.eq (variableSorts, variableSorts')
      andalso S.eq (sigma, sigma')

  fun toString ((symbolSorts,variableSorts), sigma) =
    let
      val symbols' = ListSpine.pretty PS.toString ", " symbolSorts
      val variables' = ListSpine.pretty S.toString ", " variableSorts
      val sigma' = S.toString sigma
    in
      "{" ^ symbols' ^ "}[" ^ variables' ^ "]." ^ sigma'
    end
end

structure UnisortedAbtValence :> UNISORTED_ABT_VALENCE =
struct
  local
    structure S =
    struct
      type t = unit
      fun eq _ = true
      fun toString _ = "_"
    end

    structure Valence = AbtValence (structure S = S and PS = S and Sp = ListSpine)
  in
    open Valence
  end

  fun repeat n =
    List.tabulate (n, fn _ => ())

  fun make (i, j) =
    ((repeat i, repeat j), ())
end
