def InfiniteList (α : Type u) : Type u := sorry

def InfiniteList.take (l : InfiniteList α) (n : Nat) : List α := sorry

/- #eval InfiniteList.take id 3 -/

theorem length_take (l : InfiniteList α) (n : Nat) : (l.take n).length = n := by sorry

