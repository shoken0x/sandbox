# input
MAX_N, MAX_M = 100, 100
$INF = 100_000_000

str = <<"EOS"
#S.#.....#
#.....##.#
#.#.#..#..#
#..#..####
####G#####
EOS

$maze = str.split(/\r?\n/).map{|l| l.split('')}
$N, $M = 5, 10
$sx, $sy = 0, 1 #スタート
$gx, $gy = 4, 4 #ゴール

# 各点までの最短距離の配列
$d = Array.new(MAX_N){ Array.new(MAX_M) }

# 移動4方向のベクトル
$dx = [1, 0, -1, 0]
$dy = [0, 1, 0, -1]

# (sx, sy)から(gx, gy)への最短距離を求める
# たどり着けないとINF

def bfs
  que = []
  $d.map!{|n| n.map{|nm| nm = $INF}}
  que.push([$sx, $sy])
  $d[$sx][$sy] = 0

  until(que.size == 0)
    p = que.pop
    break if p[0] == $gx && p[1] == $gy
    
    # 移動4方向をループ
    4.times.each do |i|
      nx, ny = p[0] + $dx[i], p[1] + $dy[i]
      
      # 移動が可能かの判定とすでに訪れたことがあるかの判定
      # d[nx][ny] != INFなら訪れたことがある
      if 0 <= nx && nx < $N &&
         0 <= ny && ny < $M &&
         $maze[nx][ny] != '#' && $d[nx][ny] == $INF
        que.push([nx, ny])
        $d[nx][ny] = $d[p[0]][p[1]] + 1
      end
    end
  end
  
  $d[$gx][$gy]
end

def slove
  puts bfs
end

slove
