import BasicLeanDatastructures.Set.Basic
import PossiblyInfiniteTrees.PossiblyInfiniteList.InfiniteList

def InfiniteTreeSkeleton (α : Type u) : Type u := sorry

-- the type of node depends on how we define the InfiniteTreeSkeleton
def InfiniteTreeSkeleton.children (tree : InfiniteTreeSkeleton α) (node : sorry) : InfiniteList α := sorry

/- def exampleTree : InfiniteTreeSkeleton Nat := fun path => path.sum -/
/- #eval exampleTree []  -/
/- #eval exampleTree [0]  -/
/- #eval exampleTree [2]  -/
/- #eval exampleTree [1, 1]  -/
/- #eval exampleTree [2, 1]  -/

-- a branch in an infinite tree is simply an infinite list of nodes starting from the root; 
-- we collect all branches going through "node" in a set here
#print Set -- a Set is just a function α -> Prop
def InfiniteTreeSkeleton.branches_through (tree : InfiniteTreeSkeleton α) (node : sorry) : Set (InfiniteList α) := sorry

/- example : id ∈ exampleTree.branches_through [1] := by  -/
/-   exists fun _ => 1 -/
/-   constructor -/
/-   . intro n  -/
/-     induction n with  -/
/-     | zero => simp [InfiniteList.take, exampleTree] -/
/-     | succ n ih => simp [InfiniteList.take, exampleTree] at *; rw [ih, Nat.add_comm];  -/
/-   . simp [InfiniteList.take] -/

