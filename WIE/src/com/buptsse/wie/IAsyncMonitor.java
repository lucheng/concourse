package com.buptsse.wie;

/**
 * 异步监视器
 * 
 */
public interface IAsyncMonitor {
	//在进度更改时调用
	void onProgressChanged(int progressInPercentage);
	//在异步操作完成时调用
	void onCompleted(CompletionType completion, Exception exception, Object result);
	//在判断异步操作是否被请求取消时调用,当请求取消时,该函数应返回true,此时异步操作将根据该函数的返回值在适当的时候终止,并调用onCompleted.
	boolean isCancellationRequested();
}
