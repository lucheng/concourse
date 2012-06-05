package edu.bupt.nlp.entity;

import java.util.Arrays;

public class HeapSort {

	public static void main(String[] args) {
		int[] arry_int = { 49, 38, 65, 97, 76, 13, 27, 55 , 55};
		// int[] arry_int={13, 38, 27, 55, 76, 65, 49, 97};
		HeapSort hsort = new HeapSort();
		hsort.HeapSorting(arry_int);
		// System.out.println(Arrays.toString(arry_int));
	}

	// 调整无序序列为大根堆 s 为数组的起始下标，m为终止下标
	public void HeapAdjust(int[] arr, int s, int m) {
		int temp = arr[s];
		for (int j = 2 * s + 1; j < m; j = j * 2 + 1) {
			if (j + 1 < m && arr[j] > arr[j + 1])
				++j;
			if (temp < arr[j])
				break;
			arr[s] = arr[j];
			s = j;
			arr[s] = temp;

		}
	}

	// 根据大根堆，对堆排序
	public void HeapSorting(int[] arr) {
		// 把顺序表构建成为一个大根堆

		for (int i = (arr.length / 2 - 1); i >= 0; --i) {

			HeapAdjust(arr, i, arr.length);
		}

		for (int j = arr.length - 1; j > 0; --j) {
//			System.out.println("堆顶元素 arrr[0]=" + arr[0]);
//			System.out.println("arr[" + j + "]=" + arr[j]);
//			System.out.println("将当前锥顶元素与第" + j + "个元素互换");
			int temp = arr[0];
			arr[0] = arr[j];
			arr[j] = temp;

			HeapAdjust(arr, 0, j);
		}
		System.out.println(Arrays.toString(arr));
	}
}