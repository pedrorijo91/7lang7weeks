a = (1..16).to_a
a.each_index { |i| puts a[(i..i+3)].join(' ') if i%4 == 0}

a.each_slice(4) {|elem| puts elem.join(' ')}

#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name
  
  def initialize(tree={})
    @node_name = tree.keys.first
    @children = []
    tree[@node_name].each { |n,c| @children << Tree.new(n => c) }
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

treeHash = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}

tree = Tree.new(treeHash)
tree.visit_all { |n| puts n.node_name }
