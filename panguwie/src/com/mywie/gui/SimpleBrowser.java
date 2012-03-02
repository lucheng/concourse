package com.mywie.gui;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.jface.viewers.ListViewer;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.Viewer;
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
import org.eclipse.swt.layout.RowData;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Dialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.mywie.core.EditHtml;
import com.mywie.model.MarkData;
import com.mywie.utils.XmlHelp;

public class SimpleBrowser {

	private Display display;
	private Shell shell;
	private String url;
	private String windowStatus;
	private EditHtml editHtml = new EditHtml();
	
	private List<MarkData> markDatas = new ArrayList<MarkData>();
	
	
	public String getWindowStatus() {
		return windowStatus;
	}

	public void setWindowStatus(String windowStatus) {
		this.windowStatus = windowStatus;
	}

	public SimpleBrowser(Display display, String url) {

		this.display = display;
		this.shell = new Shell(display, SWT.CLOSE | SWT.MAX | SWT.APPLICATION_MODAL);
		this.url = url;
		getExtractions(url);
	}

	@SuppressWarnings("unchecked")
	public void getExtractions(String url){
		
		Document doc = XmlHelp.cleanHtml(url);
		
		if (doc != null) {
			Element root = doc.getRootElement();
			List<Element> list = root.selectNodes("//*[@semantic]");
			for (Element element : list) {

				MarkData markData = new MarkData();
				markData.setSemantic(element.attributeValue("semantic"));
				markData.setWindowStatus(element.attributeValue("my_count_id"));
				if(element.attributeValue("block") != null){
					markData.setBlock(element.attributeValue("my_count_id"));
				}
				markDatas.add(markData);
			}
		}
		
	}
	
	private String getHtmlSrc(String url, String windowStatus){
		
		Document doc = XmlHelp.cleanHtml(url);
		Element root = doc.getRootElement();
		Node selectNode = root.selectSingleNode("//*[@my_count_id='"+ windowStatus +"']");
		
		return selectNode.asXML();
	}
	
	public boolean open(){

		shell.setLayout(new FormLayout());
		shell.setMaximized(true);
		
		final Menu menu = new Menu(shell, SWT.BAR);

		final MenuItem selectItem = new MenuItem(menu, SWT.PUSH);
		selectItem.setText("选择");

		final MenuItem editItem = new MenuItem(menu, SWT.CASCADE);
		editItem.setText("查看");

		final MenuItem selectCodeItem = new MenuItem(menu, SWT.CASCADE);
		selectCodeItem.setText("查看标签");
		
		final MenuItem exitItem = new MenuItem(menu, SWT.CASCADE);
		exitItem.setText("保存并退出");
		
		selectItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				Shell parent = (Shell) menu.getParent();
				MarkInputDialog numberInputDialog = new MarkInputDialog(parent);
				MarkData data = numberInputDialog.open();
				gao(data);
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});
		
		editItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				Shell parent = (Shell) menu.getParent();
				
				DataListViewer dataViewViewer = new DataListViewer(parent, markDatas);
				dataViewViewer.open();
				
//				Sample1 sample1 = new Sample1(parent.getDisplay(), markDatas);
//				sample1.open();
				
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});
		
		selectCodeItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				if(windowStatus == null){
					MessageBox messagebox = new MessageBox(shell);
					messagebox.setMessage("请先选择标签！！！");
					messagebox.setText("出现错误！");
					messagebox.open();
				}else {
					String html = getHtmlSrc(url, windowStatus);
					Shell parent = (Shell) menu.getParent();
					CodeViewer codeViewer = new CodeViewer(parent.getDisplay());
					codeViewer.open(html);
				}
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});

		exitItem.addSelectionListener(new SelectionListener() {
			public void widgetSelected(SelectionEvent e) {
				try{
				SafeSaveDialog dl = new SafeSaveDialog(shell);
				String fileName = dl.open();
				if(fileName != null){
					editHtml.setTemplateFile(url);
					editHtml.setSaveFileName(fileName);
					editHtml.edit(markDatas);
					shell.dispose();
				}
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}

			public void widgetDefaultSelected(SelectionEvent e) {

			}
		});

		shell.setMenuBar(menu);

		Composite controls = new Composite(shell, SWT.BEGINNING);

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
		
		return true;
	}
	
	public void close(){
		
		shell.dispose();
	}
	
	public void run(){
		
		shell.setText("模板标注");
		open();
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}

	private void gao(final MarkData data) {
		Display.getDefault().asyncExec(new Runnable() {
			public void run() {
				
				data.setWindowStatus(windowStatus);
				markDatas.add(data);
			}
		});
	}
	
	
}

class MarkInputDialog extends Dialog {

	
	public MarkInputDialog(Shell parent) {
		super(parent);
	}

	
	public MarkInputDialog(Shell parent, int style) {
		super(parent, style);
	}

	
	public MarkData open() {
		
		final MarkData data = new MarkData();
		
		Shell parent = getParent();
		final Shell shell = new Shell(parent, SWT.CLOSE | SWT.APPLICATION_MODAL | SWT.CLOSE);
		shell.setSize(319, 238);
		shell.setText("标注文件");
		
		GridLayout gridLayout = new GridLayout(3, true);
		gridLayout.horizontalSpacing = 100;
		gridLayout.verticalSpacing = 100;
		gridLayout.marginLeft = 50;
		gridLayout.marginRight = 50;
		gridLayout.marginTop = 30;
		gridLayout.marginBottom = 30;
		
		shell.setLayout(gridLayout);
//		System.out.println(shell.getLocation());
		LayoutUtil.centerSell(shell.getDisplay(), shell);
//		shell.setLocation(100, 299);
//		System.out.println(shell.getLocation());
		
		Label label = new Label(shell, SWT.NULL);
		label.setText("标注名:");
		
				final Text text = new Text(shell, SWT.SINGLE | SWT.BORDER);
				text.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1));
				text.setText("");


				final Button button = new Button(shell, SWT.CHECK);
				button.setText("块选择");
				
				final Text text1 = new Text(shell, SWT.SINGLE | SWT.BORDER);
				text1.setEnabled(false);
				text1.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1));
				text1.setText("");
		
				
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
		
		final Button buttonOK = new Button(shell, SWT.PUSH);
		buttonOK.setText("确定");
		GridData gd_buttonOK = new GridData(GridData.HORIZONTAL_ALIGN_END);
		gd_buttonOK.widthHint = 80;
		buttonOK.setLayoutData(gd_buttonOK);
		
		Button buttonCancel = new Button(shell, SWT.PUSH);
		GridData gd_buttonCancel = new GridData(SWT.LEFT, SWT.CENTER, false, false, 1, 1);
		gd_buttonCancel.widthHint = 80;
		buttonCancel.setLayoutData(gd_buttonCancel);
		buttonCancel.setText("取消");
		
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
		
		shell.pack();
		new Label(shell, SWT.NONE);
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
		
		rowLayout.marginBottom = 10;
		rowLayout.marginTop = 10;
//		rowLayout.marginHeight = 100;
//		rowLayout.marginWidth = 100;
		rowLayout.marginLeft = 20;
		rowLayout.marginRight = 20;
		
		shell.setLayout(rowLayout);

		Label label = new Label(shell, SWT.NULL);
		label.setLayoutData(new RowData(39, 25));
		label.setText("列表");

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

class CodeViewer {
	
	Display display;// = new Display();
	Shell shell;// = new Shell(display);

	public CodeViewer(Display display){
		this.display = display;
		this.shell = new Shell(display, SWT.APPLICATION_MODAL | SWT.CLOSE);
	}
	public void open(String htmlSrc) {

		shell.setText("查看标签");

		GridLayout gridLayout = new GridLayout(4, false);
		gridLayout.verticalSpacing = 8;

		shell.setLayout(gridLayout);

		Label label = new Label(shell, SWT.NULL);
		label.setText("标签源码：");

		Text bookAbstract = new Text(shell, SWT.WRAP | SWT.MULTI | SWT.BORDER
				| SWT.H_SCROLL | SWT.V_SCROLL);
		GridData gridData = new GridData(GridData.HORIZONTAL_ALIGN_FILL
				| GridData.VERTICAL_ALIGN_FILL);
		gridData.horizontalSpan = 3;
		gridData.grabExcessVerticalSpace = true;
		gridData.minimumHeight = 200;

		bookAbstract.setLayoutData(gridData);

		bookAbstract.setText(htmlSrc);

		shell.pack();
		shell.open();

		// Set up the event loop.
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				// If no more entries in event queue
				display.sleep();
			}
		}

		shell.dispose();
	}

}

class Sample1 {
	
	private Display display;
	private Shell shell;
	
	private int selection;
	
	private List<MarkData> viewDatas;
	private List<MarkData> oldViewDatas;
	private org.eclipse.swt.widgets.List listViewer;
	
	public Sample1(Display display, List<MarkData> viewDatas){
		this.display = display;
		this.shell = new Shell(display, SWT.APPLICATION_MODAL| SWT.CLOSE);
		
		this.viewDatas = viewDatas;
		this.oldViewDatas = new ArrayList<MarkData>();
		for(MarkData data : viewDatas){
			oldViewDatas.add(data);
		}
	}
	
	public void open() {

		shell.setText("标注列表");

		GridLayout gridLayout = new GridLayout(6, true);
		gridLayout.verticalSpacing = 8;

		shell.setLayout(gridLayout);

		Label label = new Label(shell, SWT.NULL);
		label.setText("标注列表");

		GridData gridData = new GridData(GridData.HORIZONTAL_ALIGN_FILL
				| GridData.VERTICAL_ALIGN_FILL);
		gridData.horizontalSpan = 5;
		gridData.grabExcessVerticalSpace = true;

		listViewer = new org.eclipse.swt.widgets.List(shell, SWT.MAX);
		
	    for (int loopIndex = 0; loopIndex < viewDatas.size(); loopIndex++) {
	    	listViewer.add(viewDatas.get(loopIndex).getSemantic());
	    }
	    
	    listViewer.setLayoutData(gridData);
	    listViewer.addListener(SWT.Selection, new Listener() {
	        public void handleEvent(Event e) {
	            int[] selections = listViewer.getSelectionIndices();
	            for (int i = 0; i < selections.length; i++)
	            	selection = selections[i];
	            System.out.println("DefaultSelection={" + selection + "}");
	          }
	        });
		label = new Label(shell, SWT.NONE);
		
		Button deleBtn = new Button(shell, SWT.PUSH);
		deleBtn.setText("删除");

		gridData = new GridData();
		gridData.horizontalSpan = 1;
//		gridData.horizontalAlignment = GridData.END;
		deleBtn.setLayoutData(gridData);
		
		deleBtn.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				
				MarkData data = (MarkData) viewDatas.get(selection);
				if (data == null) {
					System.out.println("Please select a language first.");
					return;
				}

				viewDatas.remove(data);
				System.out.println("Removed: " + data);

				shell.redraw();
			}
		});

		
		Button cancleBtn = new Button(shell, SWT.PUSH);
		cancleBtn.setText("取消");

		gridData = new GridData();
		gridData.horizontalSpan = 1;
//		gridData.horizontalAlignment = GridData.END;
		cancleBtn.setLayoutData(gridData);
		
		Button confirmBtn = new Button(shell, SWT.PUSH);
		confirmBtn.setText("确定");
		gridData = new GridData();
		gridData.horizontalSpan = 1;
		confirmBtn.setLayoutData(gridData);
		

		shell.pack();
		shell.open();

		// Set up the event loop.
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				// If no more entries in event queue
				display.sleep();
			}
		}

		shell.dispose();
	}
	
}

class SafeSaveDialog {
	
	/*public static void main(String[] args){
		
		Shell shell = new Shell();
		SafeSaveDialog dl = new SafeSaveDialog(shell);
		System.out.println(dl.open());
	}*/
    public SafeSaveDialog(){
    }
    FileDialog dlg;

    public SafeSaveDialog(Shell shell) {
        dlg = new FileDialog(shell, SWT.SAVE);// 设置为保存对话框
        // 设置保存类型
        dlg.setFilterNames(new String[] {
          "Text Files(*.html)"
        });
        dlg.setFilterExtensions(new String[] {
          "*.html"
        });
    }

    public String open() {
        // Store the selected file name in fileName
        String fileName = null;

        // The user has finished when one of the
        // following happens:
        // 1) The user dismisses the dialog by pressing Cancel
        // 2) The selected file name does not exist
        // 3) The user agrees to overwrite existing file
        boolean done = false;

        while (!done) {
            // Open the File Dialog
            fileName = dlg.open();
            if (fileName == null) {
                // User has cancelled, so quit and return
                done = true;
            } else {
                // User has selected a file; see if it already exists
                File file = new File(fileName);
                if (file.exists()) {
                    // The file already exists; asks for confirmation
                    MessageBox mb = new MessageBox(dlg.getParent(),
                            SWT.ICON_WARNING | SWT.YES | SWT.NO);
                    mb.setText("Tips");
                    mb.setMessage(fileName
                            + " already exists. Do you want to replace it?");

                    // If they click Yes, drop out. If they click No,
                    // redisplay the File Dialog
                    done = mb.open() == SWT.YES;
                } else {
                    // File does not exist, so drop out
                    done = true;
                }
            }
        }
        return fileName;
    }
    public String getFileName() {
        return dlg.getFileName();
      }

      public String[] getFileNames() {
        return dlg.getFileNames();
      }

      public String[] getFilterExtensions() {
        return dlg.getFilterExtensions();
      }

      public String[] getFilterNames() {
        return dlg.getFilterNames();
      }

      public String getFilterPath() {
        return dlg.getFilterPath();
      }

      public void setFileName(String string) {
        dlg.setFileName(string);
      }

      public void setFilterExtensions(String[] extensions) {
        dlg.setFilterExtensions(extensions);
      }

      public void setFilterNames(String[] names) {
        dlg.setFilterNames(names);
      }

      public void setFilterPath(String string) {
        dlg.setFilterPath(string);
      }

      public Shell getParent() {
        return dlg.getParent();
      }

      public int getStyle() {
        return dlg.getStyle();
      }

      public String getText() {
        return dlg.getText();
      }

      public void setText(String string) {
        dlg.setText(string);
      }
      /**
         * Runs the application
         */
      public void run() {
        Display display = new Display();
        Shell shell = new Shell(display);
        shell.setText("Safe Save");
       
        shell.pack();
        shell.open();
        while (!shell.isDisposed()) {
          if (!display.readAndDispatch()) {
            display.sleep();
          }
        }
      }
}
