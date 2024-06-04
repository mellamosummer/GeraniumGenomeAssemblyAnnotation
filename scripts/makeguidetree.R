library(ape)
setwd("/Users/summerblanco/Desktop") # Put here the directory where your tree is
tree <- read.tree("astral4_353_supercontigs.tree") # A normal Newick with bootstraps from RAxML, for example
tree$node.label <- NULL # Erase the bootstrap values from the phylo object
write.tree(tree, file = "guide_tree") 
