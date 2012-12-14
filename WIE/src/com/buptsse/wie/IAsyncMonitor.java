package com.buptsse.wie;

/**
 * “Ï≤Ωº‡ ”∆˜
 * 
 */
public interface IAsyncMonitor {
	void onProgressChanged(int progressInPercentage);
	void onCompleted(CompletionType completion, Exception exception, Object result);
	boolean isCancellationRequested();
}
