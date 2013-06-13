package yawaraka.main;
import yawaraka.kazoe.*;
/**
 * @author てつたろう
 * メイン処理
 * ver 1.0
 */
public class Control {
	/**
	 * 引数からブロックのアスキーアートを生成し、標準出力に出力
	 * @param argv コマンドライン引数
	 * 第一引数：ブロックの数
	 * 第二引数：段数
	 */
	public static void main(String[] argv){
		
		boolean[][][] blockPosi; //ブロックの配置を表す三次元配列
		
		//引数からブロックの配置を生成
		blockPosi=Question.makeBlockPosi(Integer.parseInt(argv[0]), Integer.parseInt(argv[1]));

		//ブロックの配置からアスキーアートを作成し、標準出力に出力
		Print.printBlock(blockPosi);
	}
}
