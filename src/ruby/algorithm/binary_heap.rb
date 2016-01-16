$heap = []
$size = 0

# heap実装

def push(x)
  # ヒープが空ならRootに追加して抜ける
  return $heap[0] = x if $heap.empty?
  # 追加されたノードが収まるindex
  i = $size += 1

  while i > 0 do
    parent = (i - 1) / 2
    # 逆転していないなら抜ける
    break if $heap[parent] <= x

    # 親のノードの数字をおろして、自分は上に
    $heap[i] = $heap[parent]
    i = parent
  end

  $heap[i] = x
end

def pop
  return nil if $size < 0
  # returnする最小値を保存
  ret = $heap[0]
  # 最後尾をRootに持っていき、子と比較する
  leaf = $heap[$size]
  # 最後尾が最終的に収まるindex
  i = 0

  while i * 2 + 1 < $size do
    # 子同士を比較
    # 左の子は、自分の番号 * 2 + 1
    # 右の子は、自分の番号 * 2 + 2
    left = i * 2 + 1
    right = i * 2 + 2
    left = right if right < $size && $heap[right] < $heap[left]

    # 逆転していないなら抜ける
    break if $heap[left] >= leaf

    # この数字を持ち上げる
    $heap[i] = $heap[left]
    i = left
  end

  $size -= 1
  $heap[i] = leaf
  ret
end

push(6)
push(3)
push(2)
push(5)
push(1)
push(4)
p pop  # => 1
p pop  # => 2
p pop  # => 3
p pop  # => 4
p pop  # => 5
p pop  # => 6
p pop  # => nil
