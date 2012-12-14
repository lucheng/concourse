package com.buptsse.wie;

/**
 * �첽������
 * 
 */
public interface IAsyncMonitor {
	void onProgressChanged(int progressInPercentage);
	void onCompleted(CompletionType completion, Exception exception, Object result);
	boolean isCancellationRequested();
}
