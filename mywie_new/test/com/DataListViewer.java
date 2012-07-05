package com;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.jface.viewers.ListViewer;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.Viewer;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Dialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;

import com.mywie.model.MarkData;
import org.eclipse.swt.layout.RowData;

public class DataListViewer extends Dialog{

//	Display display = new Display();
	private Shell shell;
	//= new Shell(display);
	List<MarkData> viewDatas;
	List<MarkData> oldViewDatas;
	
	ListViewer listViewer;
	Button buttonRemove;
	Button buttonOk;
	Button buttonCancle;
	
	public DataListViewer(Shell parent, List<MarkData> viewDatas) {
		 
		super(parent);
		this.viewDatas = viewDatas;
		this.oldViewDatas = new ArrayList<MarkData>();
		for(MarkData data : viewDatas){
			oldViewDatas.add(data);
		}
		shell = new Shell(getParent(), SWT.TITLE| SWT.APPLICATION_MODAL | SWT.CLOSE);
	}
	
	private void init() {
		
		listViewer = new ListViewer(shell);
		org.eclipse.swt.widgets.List list = listViewer.getList();
		list.setLayoutData(new RowData(270, SWT.DEFAULT));

		listViewer.setContentProvider(new IStructuredContentProvider() {
			public Object[] getElements(Object inputElement) {
				List v = (List) inputElement;
				return v.toArray();
			}

			public void dispose() {
				System.out.println("Disposing ...");
			}

			public void inputChanged(Viewer viewer, Object oldInput, Object newInput) {
				System.out.println("Input changed: old=" + oldInput + ", new=" + newInput);
			}
		});

		listViewer.setInput(viewDatas);
		
		listViewer.setLabelProvider(new LabelProvider() {
			public Image getImage(Object element) {
				return null;
			}

			public String getText(Object element) {
				return ((MarkData) element).getSemantic();
			}
		});

		listViewer.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(SelectionChangedEvent event) {
				IStructuredSelection selection = (IStructuredSelection) event
						.getSelection();
				StringBuffer sb = new StringBuffer("Selection - ");
				sb.append("tatal " + selection.size() + " items selected: ");
				for (Iterator iterator = selection.iterator(); iterator
						.hasNext();) {
					sb.append(iterator.next() + ", ");
				}
				System.out.println(sb);
			}
		});

	}

	private void addButtons() {
		
		Composite composite = new Composite(shell, SWT.NULL);
		FillLayout fillLayout = new FillLayout(SWT.VERTICAL);
		fillLayout.spacing = 2;

		composite.setLayout(fillLayout);

		buttonRemove = new Button(composite, SWT.PUSH);
		buttonRemove.setText("и╬ЁЩ");

		buttonRemove.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				IStructuredSelection selection = (IStructuredSelection) listViewer.getSelection();
				MarkData data = (MarkData) selection.getFirstElement();
				if (data == null) {
					System.out.println("Please select a language first.");
					return;
				}

				viewDatas.remove(data);
				System.out.println("Removed: " + data);

				listViewer.refresh(false);
			}
		});
		
		buttonOk = new Button(composite, SWT.PUSH);
		buttonOk.setText("OK");
		buttonOk.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				
				System.out.println("ok:" + viewDatas);
				shell.dispose();
			}
		});
		
		buttonCancle = new Button(composite, SWT.PUSH);
		buttonCancle.setText("Cancle");
		buttonCancle.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				
				viewDatas.clear();
				for(MarkData data : oldViewDatas){
					viewDatas.add(data);
				}
				System.out.println("cancle:" + viewDatas);
				shell.dispose();
			}
		});
	}

	public void open() {
		
		RowLayout rowLayout = new RowLayout();
		
		rowLayout.marginBottom = 10;
		rowLayout.marginTop = 10;
//		rowLayout.marginHeight = 100;
//		rowLayout.marginWidth = 100;
		rowLayout.marginLeft = 20;
		rowLayout.marginRight = 20;
		
		shell.setLayout(rowLayout);

		Label label = new Label(shell, SWT.NULL);
		label.setLayoutData(new RowData(39, 25));
		label.setText("ап╠М");

		init();

		addButtons();

		shell.pack();
		shell.open();
		// textUser.forceFocus();

		// Set up the event loop.
		Display display = shell.getDisplay();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		shell.dispose();
	}

}
