import PossiblyInfiniteTrees.PossiblyInfiniteList.InfiniteList

structure PossiblyInfiniteList (α : Type u) where
  infinite_list : sorry
  -- possibly add more fields

def PossiblyInfiniteList.empty : PossiblyInfiniteList α := sorry

/- #eval (PossiblyInfiniteList.empty (α := Nat)).infinite_list.take 5 -/

