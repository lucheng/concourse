package com.mywie.utils;

import java.io.OutputStream;
import java.io.PrintStream;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Text;

public class MyPrintStream extends PrintStream {

	private Text textArea;

	public MyPrintStream(OutputStream out, Text textArea) {
		super(out);
		this.textArea = textArea;
	}

	/** */
	/**
	 * �������ؽ�,���еĴ�ӡ������Ҫ���õķ���
	 */
	public void write(byte[] buf, int off, int len) {
		final String message = new String(buf, off, len);

		/**//* SWT�ǽ����̷߳�������ķ�ʽ */
		Display.getDefault().syncExec(new Thread() {
			public void run() {
				/**//* ���������Ϣ��ӵ������ */
				textArea.append(message);
			}
		});
	}

}