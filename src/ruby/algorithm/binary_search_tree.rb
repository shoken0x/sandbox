class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
  end
end

def insert(node, val)
  if node.nil?
    Node.new(val)
  else
    if val < node.val
      node.left = insert(node.left, val)
    else
      node.right = insert(node.right, val)
    end
    node
  end
end

def find(node, val)
  if node.nil?
    false
  elsif val == node.val
    true
  elsif val < node.val
    find(node.left, val)
  else
    find(node.right, val)
  end
end

def remove(node, val)
  if node.nil?
    nil
  elsif val < node.val
    node.left = remove(node.left, val)
  elsif val > node.val
    node.right = remove(node.right.val)
  elsif node.left.nil?
    # 削除したいノードが左の子を持っていない場合、
    # 右の子を持ってくる
    removed_pos = node.right
    return removed_pos
  elsif node.left.right.nil?
    # 削除したいノードの左の子が右の子を持っていなければ、
    # 左の子を持ってくる
    removed_pos = node.left
    removed_pos.right = node.right
    return removed_pos
  else
    # どちらでもない場合、左の子以下で最も大きいノードを
    # 削除したいノードの場所に持ってくる
    max_node = node.left
    while !max_node.right.right.nil? do
      max_node = max_node.right
    end
    removed_pos = max_node.right
    max_node.right = removed_pos.left
    removed_pos.left = node.left
    removed_pos.right = node.right
    return removed_pos
  end
  return node
end

node = Node.new(20)
insert(node, 10)
insert(node, 30)
insert(node, 5)
insert(node, 2)
p node.val       # => 20
p node.right.val # => 30
p node.left.val  # => 10

p find(node, 5) # => true
p find(node, 15) # => false

p remove(node, 5)
p find(node, 5) # => false
p find(node, 2) # => true
