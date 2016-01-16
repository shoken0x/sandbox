class Edge
  # 頂点fromから頂点toへのコストcostの辺
  attr_accessor :from, :to, :cost
  def initialize(from, to, cost)
    @from, @to, @cost = from, to, cost
  end
end

MAX_V = 10
$INF = 100_000_000

$edges = [Edge.new(0, 1, 2),
         Edge.new(0, 2, 5),
         Edge.new(1, 2, 4),
         Edge.new(1, 3, 6),
         Edge.new(1, 4, 10),
         Edge.new(2, 1, 4),
         Edge.new(2, 3, 2),
         Edge.new(3, 1, 6),
         Edge.new(3, 2, 2),
         Edge.new(3, 5, 1),
         Edge.new(4, 1, 10),
         Edge.new(4, 5, 3),
         Edge.new(4, 6, 5),
         Edge.new(5, 3, 1),
         Edge.new(5, 4, 3),
         Edge.new(5, 6, 9),
         Edge.new(6, 4, 5),
         Edge.new(6, 5, 9)]
$d = Array.new(MAX_V, $INF)
$V = 7
$E = 10

def shortest_path(start)
  $d[start] = 0
  while true do
    update = false
    $edges.each do |e|
      if $d[e.from] != $INF && $d[e.to] > $d[e.from] + e.cost
        $d[e.to] = $d[e.from] + e.cost
        update = true
      end
    end
    break unless update
  end
end

start = 0
goal = 6
shortest_path(start)
puts $d[goal]
