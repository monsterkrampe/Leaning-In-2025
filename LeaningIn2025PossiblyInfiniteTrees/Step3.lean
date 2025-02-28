import BasicLeanDatastructures.Set.Basic
import PossiblyInfiniteTrees.PossiblyInfiniteList.InfiniteList

def InfiniteTreeSkeleton (α : Type u) : Type u := sorry

-- the type of node depends on how we define the InfiniteTreeSkeleton
def InfiniteTreeSkeleton.children (tree : InfiniteTreeSkeleton α) (node : sorry) : InfiniteList α := sorry

-- a branch in an infinite tree is simply an infinite list of nodes starting from the root; 
-- we collect all branches going through "node" in a set here
#print Set -- a Set is just a function α -> Prop
def InfiniteTreeSkeleton.branches_through (tree : InfiniteTreeSkeleton α) (node : sorry) : Set (InfiniteList α) := sorry

