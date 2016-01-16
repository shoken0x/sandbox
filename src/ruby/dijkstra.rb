MAX_V = 10
INF = 100_000_000
$d = Array.new(MAX_V, INF)      # 頂点sからの最短距離
$used = Array.new(MAX_V, false) # すでに使われたかのフラグ
$V = 7

# | i\j | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
# |-----|---|---|---|---|---|---|---|
# | 0   | 0 | 2 | 5 |INF|INF|INF|INF|
# | 1   | 2 | 0 | 4 | 6 |10 |INF|INF|
# | 2   | 5 | 4 | 0 | 2 |INF|INF|INF|
# | 3   |INF| 6 | 2 | 0 |INF| 1 |INF|
# | 4   |INF|10 |INF|INF| 0 | 3 | 5 |
# | 5   |INF|INF|INF| 1 | 3 | 0 | 9 |
# | 6   |INF|INF|INF|INF| 5 | 9 | 0 |
#
# cost[u][v]は辺e=(u,v)のコスト。存在しない場合はINF
$cost = [[0, 2, 5, INF, INF, INF, INF],
         [2, 0, 4, 6, 10, INF, INF],
         [5, 4, 0, 2, INF, INF, INF],
         [INF, 6, 2, 0, INF, 1, INF],
         [INF, 10, INF, INF, 0, 3, 5],
         [INF, INF, INF, 1, 3, 0, 9],
         [INF, INF, INF, INF, 5, 9, 0]]

def dijkstra(start)
  $d[start] = 0

  while true do
    v = -1 # 頂点
    # まだ使われていない頂点のうち距離が最小のものを探す
    $V.times.each do |u|
      v = u if !$used[u] && (v == -1 || $d[u] < $d[v])
    end
    break if v == -1

    $used[v] = true
    $V.times.each do |u|
      # このループではd[v]から辺が出ている頂点の最短距離を更新する。
      # $cost[u][v]は辺が無い場合はINFになる。辺があるとコスト。
      # $d[u]と、$d[u]までのコストを比較して、小さい方をセット。
      $d[u] = [$d[u], $d[v] + $cost[u][v]].min
    end
  end
end

start = 0
goal = 6
dijkstra(start)
p $d[goal]
