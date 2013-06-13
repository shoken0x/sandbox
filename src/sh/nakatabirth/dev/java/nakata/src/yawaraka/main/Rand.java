package yawaraka.main;

/**
 * @author てつたろう
 * 振れ幅内乱数生成
 * ver 1.0
 */
public class Rand {
	
	/**
	 * 振れ幅
	 */
	public static final int WIDTH = 2;
	
	/**（基数-振れ幅）から（基数+振れ幅)までの間の数をランダムで生成し、標準出力に出力
	 * @param argv コマンドライン引数
	 * 第一引数：基数
	 */
	public static void main(String argv[]){
		System.out.println((int)(Math.random()*WIDTH*2)-WIDTH+Integer.parseInt(argv[0]));
	}
}
