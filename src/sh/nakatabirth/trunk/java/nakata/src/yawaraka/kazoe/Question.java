package yawaraka.kazoe;
import java.util.*;
/**
 * @author さとちー
 *　ブロック配置生成
 * ver 1.0
 */

public class Question {

	/**
	 * 引数からブロックの配置を生成
	 * @param blockNo ブロック数
	 * @param height ブロックの高さ制限
	 * @return ブロック配置
	 */
	public static boolean[][][] makeBlockPosi(int blockNo, int height){
	
		int xSize = 5;
		int ySize = 5;
		int zSize = height;

		int slcX, slcY, slcZ;

		int count = blockNo;
		int dummy = 0;

		Vector<MyPoint> can_blk = new Vector<MyPoint>(); //候補積み木
		Vector<MyPoint> fix_blk = new Vector<MyPoint>(); //確定積み木

		boolean block[][][] = new boolean[xSize][ySize][5]; //返り値積み木


		//初期化
		for(int i=0; i<xSize; i++){
			for(int j=0; j<ySize; j++){
				for(int k=0; k<5; k++){
					block[i][j][k] = false;
				}
			}
		}

		//ダミーの作成
		for(int i=0; i<xSize; i++){
			for(int k=0; k<zSize; k++){
				fix_blk.add(new MyPoint(i,-1,k));
				dummy++;
			}
		}
		for(int j=0; j<ySize; j++){
			for(int k=0; k<zSize; k++){
				fix_blk.add(new MyPoint(-1,j,k));
				dummy++;
			}
		}		
		for(int i=0; i<xSize; i++){
			for(int j=0; j<ySize; j++){
				fix_blk.add(new MyPoint(i,j,-1));
				dummy++;
			}
		}



		//原点のボックス作成と候補の追加
		fix_blk.add(new MyPoint(0,0,0));
		can_blk.add(new MyPoint(1,0,0));
		can_blk.add(new MyPoint(0,1,0));
		can_blk.add(new MyPoint(0,0,1));
		count--;

		//初期値（上に移動？）
		MyPoint tmp;
		int tNum;
		boolean chk,chk2;

		//メインルーチン
		while(count > 0){

			//置き場所選択
			tNum = (int)(Math.random()*can_blk.size());
			tmp = can_blk.elementAt(tNum);
			can_blk.remove(tNum);
			fix_blk.add(tmp);

			slcX = tmp.getX();
			slcY = tmp.getY();
			slcZ = tmp.getZ();

			if(slcX != xSize){
				chk = checkBlock(slcX+1,slcY-1,slcZ,fix_blk);
				chk2 = checkBlock(slcX+1,slcY,slcZ-1,fix_blk);
				if(chk == true && chk2 == true) {
					can_blk.add(new MyPoint(slcX+1,slcY,slcZ));
				}
			}

			if(slcY != ySize){
				chk = checkBlock(slcX-1,slcY+1,slcZ,fix_blk);
				chk2 = checkBlock(slcX,slcY+1,slcZ-1,fix_blk);
				if(chk == true && chk2 == true) {
					can_blk.add(new MyPoint(slcX,slcY+1,slcZ));
				}
			}

			if(slcZ != zSize){
				chk = checkBlock(slcX,slcY-1,slcZ+1,fix_blk);
				chk2 = checkBlock(slcX-1,slcY,slcZ+1,fix_blk);
				if(chk == true && chk2 == true) {
					can_blk.add(new MyPoint(slcX,slcY,slcZ+1));
				}
			}

			count--;

		}

		for(int i=0; i<dummy; i++){
			fix_blk.remove(0);
		}

		for(int i=fix_blk.size(); i>0; i--){
			tmp = fix_blk.elementAt(i-1);
			block[tmp.getX()][tmp.getY()][tmp.getZ()] = true;
		}

		return block;
	}

	static boolean checkBlock(int x, int y, int z, Vector<MyPoint> fix_blk){
		MyPoint tmp;

		for(int i=0; i<fix_blk.size(); i++){

			tmp = fix_blk.elementAt(i);
			int tmpX = tmp.getX();
			int tmpY = tmp.getY();
			int tmpZ = tmp.getZ();

			if(tmpX == x && tmpY == y && tmpZ == z) {
				return true;
			}
		}

		return false;

	}

}