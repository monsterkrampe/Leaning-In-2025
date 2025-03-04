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

/-
def exampleTree : InfiniteTreeSkeleton (Option Nat) := fun path => match path with
  | .nil => some 0
  | .cons i path => 
    match exampleTree path with 
    | .none => none 
    | .some _ => if i ≤ path.length then some (i::path).sum else none

def examplePossiblyInfiniteTree : PossiblyInfiniteTree Nat := {
  infinite_tree := exampleTree 
  no_orphans := by 
    intro node 
    induction node with 
    | nil => simp
    | cons hd tl ih => 
      intro h ancestor
      rcases ancestor.property with ⟨diff, eq⟩
      cases diff with 
      | nil => simp at eq; rw [eq]; exact h
      | cons hd' tl' => 
        simp at eq
        specialize ih (by intro contra; apply h; unfold exampleTree; simp [contra]) ⟨ancestor.val, by exists tl'; exact eq.right⟩
        exact ih
  no_holes_in_children := by 
    intro node n h m

    cases eq : exampleTree node with 
    | none => exfalso; apply h; unfold InfiniteTreeSkeleton.children; unfold exampleTree; rw [eq]
    | some _ => 
      have : n ≤ node.length := by 
        apply Decidable.byContradiction
        intro contra
        apply h
        unfold InfiniteTreeSkeleton.children
        unfold exampleTree
        rw [eq]
        simp [contra]

      have : m.val ≤ node.length := by apply Nat.le_trans; apply Nat.le_of_lt; exact m.isLt; exact this

      unfold InfiniteTreeSkeleton.children
      unfold exampleTree
      rw [eq]
      simp [this]
}

def exampleFiniteDegreeTree : FiniteDegreeTree Nat := {
  tree := examplePossiblyInfiniteTree
  finitely_many_children := by 
    intro node
    unfold PossiblyInfiniteTree.children
    unfold InfiniteTreeSkeleton.children
    unfold examplePossiblyInfiniteTree
    unfold exampleTree
    cases exampleTree node with 
    | none => 
      exists 0
      constructor
      . simp
      . intro m 
        have isLt := m.isLt 
        simp at isLt
    | some _ =>
      exists node.length + 1
      simp only
      constructor 
      . simp
      . intro k'
        have : k'.val ≤ node.length := by apply Nat.le_of_lt_succ; exact k'.isLt
        simp [this]
}

#eval exampleFiniteDegreeTree.children []
#eval exampleFiniteDegreeTree.children [0]
#eval exampleFiniteDegreeTree.children [1]
#eval exampleFiniteDegreeTree.children [0,0]
#eval exampleFiniteDegreeTree.children [1,0]
#eval exampleFiniteDegreeTree.children [4,3,2,1,0]
-/ 

