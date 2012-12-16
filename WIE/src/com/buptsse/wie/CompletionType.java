package com.buptsse.wie;

/**
 * 程序执行状态
 * 描述程序的运行状态
 */
public enum CompletionType {
	Cancelled, 	// 取消
	Exception, 	// 抛出现异常
	Normal,		// 正常运行
	NotRunning	// 运行停止
}
