package com.buptsse.wie;

/**
 * �첽������
 * 
 */
public interface IAsyncMonitor {
	//�ڽ��ȸ���ʱ����
	void onProgressChanged(int progressInPercentage);
	//���첽�������ʱ����
	void onCompleted(CompletionType completion, Exception exception, Object result);
	//���ж��첽�����Ƿ�����ȡ��ʱ����,������ȡ��ʱ,�ú���Ӧ����true,��ʱ�첽���������ݸú����ķ���ֵ���ʵ���ʱ����ֹ,������onCompleted.
	boolean isCancellationRequested();
}
