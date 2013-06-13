package yawaraka.kazoe;

/**
 * @author izumi
 * ブロック描画
 * ver 1.0
 */

public class Print {
	
    static final int HX = 7;
    static final int HY = 2;
    static final int HZ = HY+1;
    static final int MX = 5;
    static final int MY = 5;
    static final int MZ = 5;

    public static void main(String[] args) {
	boolean[][][] blockPosi = new boolean[MX][MY][MZ];
	blockPosi[0][0][0] = true;
	blockPosi[0][1][0] = true;
	blockPosi[0][2][0] = true;
	blockPosi[0][0][1] = true;
        blockPosi[0][1][1] = true;
        blockPosi[0][2][1] = true;
	blockPosi[0][0][2] = true;
	blockPosi[1][0][0] = true;
        blockPosi[1][1][0] = true;
        blockPosi[1][2][0] = true;
	blockPosi[1][0][1] = true;
	blockPosi[2][0][0] = true;
	blockPosi[2][0][1] = true;
	blockPosi[0][3][0] = true;
	blockPosi[0][4][0] = true;
	blockPosi[3][0][0] = true;
	blockPosi[4][0][0] = true;
	blockPosi[0][0][3] = true;
	blockPosi[0][0][4] = true;
	printBlock(blockPosi);
    }

    /**
     * ブロックの配置からアスキーアートを生成し、標準出力へ出力する
     * @param blockPosi ブロックの配置
     * 
     */
    public static void printBlock(boolean[][][] blockPosi) {
	int lx = MX;
	int ly = MY;
	int lz = MZ;
	int scrX = (HX+2)*MX+(HY+2)*MY;
	int scrY = HY*MY+(HZ+1)*MZ;
	char[][] view = new char[scrX][scrY];
	
	for (int i = 0; i < scrX; i++)
	    for (int j = 0; j < scrY; j++)
		view[i][j] = ' ';

	for (int x = lx-1; x >= 0; x--) {
	    for (int y = ly-1; y >= 0; y--) {
		for (int z = 0; z < lz; z++) {
		    int px = GetPosX(x, y, z);
		    int py = GetPosY(x, y, z);
		    if (blockPosi[x][y][z]) {
			if (x == lx-1 || z == lz-1 || !blockPosi[x+1][y][z+1]) {
                            for (int i = 0; i < HY; i++)
				view[px+i][py-i] = '/';
			}
                        if (y == ly-1 || z == lz-1 || !blockPosi[x][y+1][z+1]) {
			    for (int i = 0; i < HX; i++)
				view[px-1-i][py] = '_';
			}
			if (x == lx-1 || y == ly-1 || !blockPosi[x+1][y+1][z]) {
			    for (int i = 0; i < HZ; i++)
				view[px][py+1+i] = '|';
			}

			if (z == 0) {
			    if (y == ly-1 || (y < ly-1 && !blockPosi[x][y+1][z])) {
				for (int i = 0; i < HX; i++)
				    view[px-1-i][py+HZ] = '_';
			    }
			    if (x == lx-1 || (x < lx-1 && !blockPosi[x+1][y][z])) {
				for (int i = 0; i < HY; i++)
				    view[px+i][py-i+HZ] = '/';
			    }
                        }
			if (x == 0) {
			    if (y == ly-1 || (y < ly-1 && !blockPosi[x][y+1][z])) {
				for (int i = 0; i < HZ; i++)
				    view[px-1-HX][py+1+i] = '|';
			    }
			    if (z == lz-1 || (z < lz-1 && !blockPosi[x][y][z+1])) {
                                for (int i = 0; i < HY; i++)
                                    view[px+i-1-HX][py-i] = '/';
                            }
			}
			if (y == 0) {
			    if (z == lz-1 || (z < lz-1 && !blockPosi[x][y][z+1])) {
				for (int i = 0; i < HX; i++)
				    view[px+HY-1-i][py-HY] = '_';
			    }
			    if (x == lx-1 || (x < lx-1 && !blockPosi[x+1][y][z])) {
				for (int i = 0; i < HZ; i++)
				    view[px+HY][py-HY+1+i] = '|';
			    }
			}
		    }
		}
	    }
	}
	for (int y = 0; y < scrY; y++) {
            for (int x = 0; x < scrX; x++) {
		System.out.print(view[x][y]);
	    }
	    System.out.println();
	}
	System.out.println();
    }

    static int GetPosX(int x, int y, int z) {
	return 10 + HY*MY + (HX+1)*x - HY*y;
    }

    static int GetPosY(int x, int y, int z) {
        return -1 + HZ*MZ + HY*y - HZ*z;
    }
}
