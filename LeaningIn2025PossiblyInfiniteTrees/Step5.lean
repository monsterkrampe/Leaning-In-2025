import PossiblyInfiniteTrees.PossiblyInfiniteTree.FiniteDegreeTree.Basic

-- We define a Set to be finite if there exists a list without duplicates that has exactly the same elements
#print Set.finite

-- If a node does not exist (i.e. if it is none), then only finitely many branches go through this node. 
-- Indeed, the number of such branches is greater 0 since finite branches end in an infinite sequence of "none" values!
-- This is a long proof, feel free to attemt it but we will skip it and just assume this to be true
theorem branches_through_finite_of_get_eq_none (tree : FiniteDegreeTree α) (node : List Nat) : 
    tree.get node = none -> (tree.branches_through node).finite := by sorry

-- If only finitelty many branches go through each successor of a given node, then the number of branches going through this node must also be finite (since there are only finitely many successors).
-- this is a long proof, feel free to attemt it but we will skip it and just assume this to be true
theorem branches_through_finite_of_each_successor_branches_through_finite (tree : FiniteDegreeTree α) (node : List Nat) : 
    (∀ i, (tree.branches_through (i :: node)).finite) -> (tree.branches_through node).finite := by sorry

-- If tree has infinitely many branches, then for each depth we can find a node that has infinitely branches going through it.
-- In particular, we do not only show existence of such a node but choose a specific one with Classical.choose.
-- Try to fill in the gaps!
noncomputable def infinite_branching_node_for_depth_of_branches_infinite 
    (tree : FiniteDegreeTree α) 
    (not_finite : ¬ tree.branches.finite) : 
    (depth : Nat) -> { node : List Nat // node.length = depth ∧ ¬ (tree.branches_through node).finite }
| .zero => sorry
| .succ depth =>
  let prev_res := infinite_branching_node_for_depth_of_branches_infinite tree not_finite depth
  let prev_node := prev_res.val
  let length_eq := prev_res.property.left
  let not_finite := prev_res.property.right

  -- try to use branches_through_finite_of_each_successor_branches_through_finite
  have : ¬ ∀ i, (tree.branches_through (i :: prev_node)).finite := by
    sorry

  have : ∃ i, ¬ (tree.branches_through (i :: prev_node)).finite := by simp at this; exact this
  
  let i := Classical.choose this
  let i_spec := Classical.choose_spec this

  -- compose the result
  ⟨i :: prev_node, by sorry⟩ 

-- by construction, the node chosen for step depth.succ is a successor of the node chosen for step depth
theorem infinite_branching_node_extends_previous 
    (tree : FiniteDegreeTree α) 
    (not_finite : ¬ tree.branches.finite) 
    (depth : Nat) : 
    (infinite_branching_node_for_depth_of_branches_infinite tree not_finite depth.succ).val = 
      (infinite_branching_node_for_depth_of_branches_infinite tree not_finite depth.succ).val.head 
        (by simp [infinite_branching_node_for_depth_of_branches_infinite]) :: 
      (infinite_branching_node_for_depth_of_branches_infinite tree not_finite depth).val := by
  simp [infinite_branching_node_for_depth_of_branches_infinite]

-- This is König's Lemma (well, a special case of it): If each branch is finite, then there are only finitely many branches.
-- Let's try to fill in the gaps!
theorem branches_finite_of_each_branch_finite (tree : FiniteDegreeTree α) : 
    (∀ branch, branch ∈ tree.branches -> ∃ i, branch.infinite_list i = none) -> tree.branches.finite := by
  intro h

  apply Classical.byContradiction
  intro contra

  -- we now build an infinite path that contains the nodes which have infinitely many branches going through them
  have : ∃ (nodes : InfiniteList Nat), ∀ (i : Nat), ¬ (tree.branches_through (nodes.take i).reverse).finite := by
    let nodes : InfiniteList Nat := fun n => sorry
    have : ∀ i, (nodes.take i).reverse = (infinite_branching_node_for_depth_of_branches_infinite tree contra i).val := by
      sorry
    
    exists nodes
    intro i
    rw [this]
    have prop := (infinite_branching_node_for_depth_of_branches_infinite tree contra i).property
    exact prop.right

  rcases this with ⟨nodes, all_infinite⟩

  -- the path directly yields a branch
  let branch : PossiblyInfiniteList α := ⟨fun n => tree.get (nodes.take n).reverse, by
    sorry
  ⟩

  specialize h branch (by
    exists nodes
    constructor
    . intro n
      rfl
    . rfl
  )

  rcases h with ⟨i, hi⟩
  apply all_infinite i
  apply branches_through_finite_of_get_eq_none
  exact hi

