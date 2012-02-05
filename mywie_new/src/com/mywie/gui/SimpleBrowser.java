package com.mywie.gui;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.jface.viewers.ListViewer;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.Viewer;
import org.eclipse.jface.viewers.ViewerSorter;
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.browser.StatusTextListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Dialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.mywie.core.EditHtml;
import com.mywie.model.MarkData;

public class SimpleBrowser {

	private Shell shell;
	private String url;
	private String windowStatus;
//	private boolean markState = false;
	private EditHtml editHtml = new EditHtml();
	
	private List<MarkData> markDatas = new ArrayList<MarkData>();
	
	/**
	 * @wbp.parser.entryPoint
	 */
	public String getWindowStatus() {
		return windowStatus;
	}

	public void setWindowStatus(String windowStatus) {
		this.windowStatus = windowStatus;
	}

	/**
	 * @wbp.parser.entryPoint
	 */
	public SimpleBrowser(Shell shell, int style, String url) {

//		super(shell, style);
		this.shell = shell;
		this.url = url;
//		this.setSize(200, 300);
//		this.setLocation(x, y)
	}

	/**
	 * @wbp.parser.entryPoint
	 */
	public void createContents() {

		shell.setLayout(new FormLayout());

		final Menu menu = new Menu(shell, SWT.BAR);

		final MenuItem selectItem = new MenuItem(menu, SWT.PUSH);
		selectItem.setText("选择");

		final MenuItem editItem = new MenuItem(menu, SWT.CASCADE);
		editItem.setText("查看");

		final MenuItem exitItem = new MenuItem(menu, SWT.CASCADE);
		exitItem.setText("保存并退出");

		selectItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				Shell parent = (Shell) menu.getParent();
				MarkInputDialog numberInputDialog = new MarkInputDialog(parent);
				MarkData data = numberInputDialog.open();
				gao(data);
//				System.out.println(data);
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});
		
		editItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				Shell parent = (Shell) menu.getParent();
				DataListViewer dataViewViewer = new DataListViewer(parent, markDatas);
				dataViewViewer.open();
//				System.out.println("修改后：" + markDatas);
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});

		exitItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				
				editHtml.setTemplateFile(url);
				editHtml.edit(markDatas);
				shell.dispose();
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});

		shell.setMenuBar(menu);

		Composite controls = new Composite(shell, SWT.NONE);

		FormData data = new FormData();
		data.top = new FormAttachment(0, 0);
		data.left = new FormAttachment(0, 0);
		data.right = new FormAttachment(100, 0);
		controls.setLayoutData(data);

		// Create the web browser
		final Browser browser = new Browser(shell, SWT.NONE);
		data = new FormData();
		data.top = new FormAttachment(controls);
		data.bottom = new FormAttachment(100, 0);
		data.left = new FormAttachment(0, 0);
		data.right = new FormAttachment(100, 0);
		browser.setLayoutData(data);

		browser.setUrl(url);
		browser.addStatusTextListener(new StatusTextListener() {

			public void changed(org.eclipse.swt.browser.StatusTextEvent e) {
				if (Pattern.matches("[1-9][0-9]*", e.text.trim())) {
					setWindowStatus(e.text);// 需要修改
				}
			}

		});

		controls.setLayout(new GridLayout(6, false));
	}
	
	private void gao(final MarkData data) {
		Display.getDefault().asyncExec(new Runnable() {
			public void run() {
				
				data.setWindowStatus(windowStatus);
				markDatas.add(data);
			}
		});
	}

	/*public static void main(String[] args) {
		Shell shell = new Shell();
		MarkInputDialog dialog = new MarkInputDialog(shell);
		Map<String, String> semantic = new HashMap<String, String>();
		Map<String, String> block = new HashMap<String, String>();
		dialog.open();
		System.out.println();
	}*/
	
}

class MarkInputDialog extends Dialog {

	/**
	 * @param parent
	 */
	public MarkInputDialog(Shell parent) {
		super(parent);
	}

	/**
	 * @param parent
	 * @param style
	 */
	public MarkInputDialog(Shell parent, int style) {
		super(parent, style);
	}

	/**
	 * Makes the dialog visible.
	 * 
	 * @return
	 */
	public MarkData open() {
		
		final MarkData data = new MarkData();
		
		Shell parent = getParent();
		final Shell shell = new Shell(parent, SWT.TITLE| SWT.APPLICATION_MODAL | SWT.CLOSE);
		shell.setText("标注文件");
		
		GridLayout gridLayout = new GridLayout(2, false);
		gridLayout.horizontalSpacing = 30;
		gridLayout.verticalSpacing = 30;
		gridLayout.marginLeft = 10;
		gridLayout.marginRight = 10;
		gridLayout.marginTop = 10;
		gridLayout.marginBottom = 10;
		
		shell.setLayout(gridLayout);

		Label label = new Label(shell, SWT.NULL);
		label.setText("标注名:");

		final Text text = new Text(shell, SWT.SINGLE | SWT.BORDER);
		
		final Button button = new Button(shell, SWT.CHECK);
		button.setText("块选择");
		
		final Text text1 = new Text(shell, SWT.SINGLE | SWT.BORDER);
		text1.setEnabled(false);
		
		final Button buttonOK = new Button(shell, SWT.PUSH);
		buttonOK.setText("确定");
		buttonOK.setLayoutData(new GridData(GridData.HORIZONTAL_ALIGN_END));
		Button buttonCancel = new Button(shell, SWT.PUSH);
		buttonCancel.setText("取消");

		button.addSelectionListener(new SelectionListener(){

			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				
				
			}

			@Override
			public void widgetSelected(SelectionEvent e) {
				
				if(text1.getEnabled()){
					text1.setEnabled(false);
				} else {
					text1.setEnabled(true);
				}
			}
			
		});
		
		buttonOK.addListener(SWT.Selection, new Listener() {
			public void handleEvent(Event event) {
				data.setSemantic(text.getText());
				if(text1.getText() != null && !text1.getText().equals("")){
					data.setBlock(text1.getText());
				}
				shell.dispose();
			}
		});

		buttonCancel.addListener(SWT.Selection, new Listener() {
			public void handleEvent(Event event) {
				shell.dispose();
			}
		});

		shell.addListener(SWT.Traverse, new Listener() {
			public void handleEvent(Event event) {
				if (event.detail == SWT.TRAVERSE_ESCAPE)
					event.doit = false;
			}
		});

		text.setText("");
		text1.setText("");
		
		shell.pack();
		shell.open();

		Display display = parent.getDisplay();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		
		return data;

	}
	
}

class DataListViewer extends Dialog{

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
		shell = new Shell(getParent(), SWT.TITLE| SWT.APPLICATION_MODAL | SWT.CLOSE | SWT.CANCEL | SWT.OK);
	}
	
	private void init() {
		
		listViewer = new ListViewer(shell);

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

		/*listViewer.addFilter(new ViewerFilter() {
			public boolean select(Viewer viewer, Object parentElement,
					Object element) {

				if (((MarkData) element).isBlock())
					return true;
				else
					return false;
			}
		});*/

		listViewer.setSorter(new ViewerSorter() {
			public int compare(Viewer viewer, Object e1, Object e2) {
				return ((MarkData) e1).getSemantic().compareTo(((MarkData) e2).getSemantic());
			}
		});

	}

	private void addButtons() {
		
		Composite composite = new Composite(shell, SWT.NULL);
		FillLayout fillLayout = new FillLayout(SWT.VERTICAL);
		fillLayout.spacing = 2;

		composite.setLayout(fillLayout);

		buttonRemove = new Button(composite, SWT.PUSH);
		buttonRemove.setText("删除");

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
		shell.setLayout(rowLayout);

		(new Label(shell, SWT.NULL)).setText("列表");

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

	/*public static void main(String[] args) {
		new DataListViewer(new Shell());
	}*/
}
