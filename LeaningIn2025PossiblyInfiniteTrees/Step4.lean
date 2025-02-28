import PossiblyInfiniteTrees.PossiblyInfiniteTree.InfiniteTree

structure PossiblyInfiniteTree (α : Type u) where
  infinite_tree : InfiniteTreeSkeleton (Option α)
  -- each node that is not none (except the root) must have a parent that is not none
  no_orphans : sorry
  -- each layer should not contain holes (similar to possibly infinite list)
  no_holes_in_children : sorry

-- children are now a possibly infinite list ...
def PossiblyInfiniteTree.children (tree : PossiblyInfiniteTree α) (node : List Nat) : PossiblyInfiniteList α := sorry

-- ... branches too
def PossiblyInfiniteTree.branches_through (tree : PossiblyInfiniteTree α) (node : List Nat) : Set (PossiblyInfiniteList α) := sorry


structure FiniteDegreeTree (α : Type u) where
  tree : PossiblyInfiniteTree α
  finitely_many_children : sorry

-- children are now a (finite) list; this is actually not so easy to define
def FiniteDegreeTree.children (tree : FiniteDegreeTree α) (node : List Nat) : List α := sorry

-- branches are still a possibly infinite list
def FiniteDegreeTree.branches_through (tree : FiniteDegreeTree α) (node : List Nat) : Set (PossiblyInfiniteList α) := tree.tree.branches_through node

