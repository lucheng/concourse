package com.mywie.model;

public class EditDistance {
	private char[] str1;
	private char[] str2;

	private int[][] dis;

	private int lenstr1;
	private int lenstr2;

	EditDistance() {
	}

	EditDistance(String a, String b) {
		initial(a, b);
	}

	private void initial(String a, String b) {
		str1 = a.toCharArray();
		str2 = b.toCharArray();

		lenstr1 = str1.length + 1;
		lenstr2 = str2.length + 1;

		dis = new int[2][lenstr1];
		for (int i = 0; i < lenstr1; i++)
			dis[0][i] = i;
	}

	public int distanceCalculate(String a, String b) {
		initial(a, b);
		return cal();
	}

	private int cal() {
		for (int i = 1; i < lenstr2; i++) {
			dis[1][0] = i;
			for (int j = 1; j < lenstr1; j++) {
				if (str1[i - 1] == str2[j - 1])
					dis[1][j] = dis[0][j - 1];
				else {
					int temp = dis[0][j - 1] + 1 < dis[1][j - 1] + 1 ? dis[0][j - 1] + 1
							: dis[1][j - 1] + 1;
					dis[1][j] = temp < dis[0][j] + 1 ? temp : dis[0][j] + 1;

				}
			}
			for (int k = 0; k < lenstr1; k++)
				dis[0][k] = dis[1][k];
		}

		return dis[0][lenstr1 - 1];
	}

}
