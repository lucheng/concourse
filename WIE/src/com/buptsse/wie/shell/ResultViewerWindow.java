package com.buptsse.wie.shell;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.eclipse.jface.dialogs.Dialog;
import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.jface.viewers.ColumnWeightData;
import org.eclipse.jface.viewers.DoubleClickEvent;
import org.eclipse.jface.viewers.IContentProvider;
import org.eclipse.jface.viewers.IDoubleClickListener;
import org.eclipse.jface.viewers.ILabelProviderListener;
import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.ITableLabelProvider;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.TableLayout;
import org.eclipse.jface.viewers.TableViewer;
import org.eclipse.jface.viewers.Viewer;
import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.TabFolder;
import org.eclipse.swt.widgets.TabItem;
import org.eclipse.swt.widgets.TableColumn;

import com.buptsse.wie.ExtractionResult;
import com.buptsse.wie.ExtractionContent;
import com.buptsse.wie.ExtractionResultCollection;
import com.buptsse.wie.ExtractionTag;
import com.buptsse.wie.models.SemanticTag;

public class ResultViewerWindow extends ApplicationWindow {

	private String resultFile;
	private TableViewer resultTable;
	Object[] headers;
	MenuItem detailItem;
	
	public ResultViewerWindow(Shell parentShell, String resultFile) {
		super(parentShell);
		// TODO Auto-generated constructor stub
		this.resultFile = resultFile;
	}

	@Override
	protected Control createContents(Composite parent) {
		// TODO Auto-generated method stub
		final Composite fParent = parent;
		
		getShell().setText("结果查看器");
		addMenuBar();
		parent.setSize(800, 600);
		parent.setLayout(new FillLayout());
		parent.getChildren()[0].dispose();
		
		Shell shell = getShell();
		Menu menuBar = new Menu(shell, SWT.BAR);
		
		MenuItem fileItem = new MenuItem(menuBar, SWT.CASCADE);
		fileItem.setText("文件(&F)");
		Menu fileMenu = new Menu(fileItem);
		fileItem.setMenu(fileMenu);
		
		MenuItem viewItem = new MenuItem(menuBar, SWT.CASCADE);
		viewItem.setText("查看(&V)");
		Menu viewMenu = new Menu(viewItem);
		viewItem.setMenu(viewMenu);
		
		MenuItem openItem = new MenuItem(fileMenu, SWT.PUSH);
		openItem.setAccelerator(SWT.CTRL | 'o');
		openItem.setText("打开(&O)...\tCTRL+O");
		
		new MenuItem(fileMenu, SWT.SEPARATOR);
		
		MenuItem exitItem = new MenuItem(fileMenu, SWT.PUSH);
		exitItem.setText("退出(&X)");
		
		detailItem = new MenuItem(viewMenu, SWT.PUSH);
		detailItem.setText("详细信息(&D)\tCTRL+D");
		detailItem.setAccelerator(SWT.CTRL | 'd');
		detailItem.setEnabled(false);
		
		exitItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				getShell().close();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		openItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
				dialog.setText("选择抽取结果");
				dialog.setFilterNames(new String[] {"抽取结果(*.xml)", "所有文件(*.*)"});
				dialog.setFilterExtensions(new String[] {"*.xml", "*.*"});
				
				String target = dialog.open();
				
				if (target != null) {
					resultFile = target;
					openResult(resultFile, fParent);
				}
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		detailItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				IStructuredSelection selection = (IStructuredSelection)resultTable.getSelection();
				showDetail(selection);
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		openResult(resultFile, parent);
		
		getShell().setMenuBar(menuBar);
		
		return parent;
	}
	
	private void showDetail(IStructuredSelection selection) {
		ExtractionResult result = getSelectedItem(selection);
		
		DetailResultDialog dialog = new DetailResultDialog(getShell(), result);
		
		dialog.open();
	}
	
	private ExtractionResult getSelectedItem(IStructuredSelection selection) {
		
		if (!selection.isEmpty()) {
			for (Iterator i = selection.iterator(); i.hasNext(); ) {
				return (ExtractionResult)i.next();
			}
			
			return null;
		} else {
			return null;
		}
	}
	
	private void openResult(String resultFile, Composite parent) {
		if (resultFile != null && new File(resultFile).exists()) {
			
			
			ExtractionResultCollection rc = new ExtractionResultCollection();
			try {
				rc.loadXml(resultFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				MessageBox mbox = new MessageBox(getShell(),
						SWT.ICON_WARNING | SWT.OK);
				mbox.setMessage("无法打开指定文件。");
				mbox.open();
				
				return;
			}
			
			getShell().setText("结果查看器 - " + resultFile);
			
			if (resultTable != null) {
				resultTable.getTable().dispose();
				resultTable = null;
			}
			resultTable = new TableViewer(parent, SWT.FULL_SELECTION|SWT.BORDER|SWT.SINGLE);
			
			resultTable.getTable().setLinesVisible(true);
			resultTable.getTable().setHeaderVisible(true);
			
			resultTable.addSelectionChangedListener(new ISelectionChangedListener() {
				
				@Override
				public void selectionChanged(SelectionChangedEvent arg0) {
					// TODO Auto-generated method stub
					boolean anySelected = !arg0.getSelection().isEmpty();
					
					detailItem.setEnabled(anySelected);
				}
			});
			
			resultTable.addDoubleClickListener(new IDoubleClickListener() {
				
				@Override
				public void doubleClick(DoubleClickEvent arg0) {
					// TODO Auto-generated method stub
					IStructuredSelection selection = (IStructuredSelection)arg0.getSelection();
					
					showDetail(selection);
				}
			});
			
			headers = rc.headers().toArray();
			
			int share = 100 / (headers.length + 1);
			
			TableLayout tbLayout = new TableLayout();
			
			for (int i = 0; i < headers.length + 1; i++) {
				tbLayout.addColumnData(new ColumnWeightData(share, true));
			}
			
			TableColumn fileCol = new TableColumn(resultTable.getTable(), SWT.LEFT);
			fileCol.setText("文件");
			
			for (Object header : headers) {
				TableColumn column = new TableColumn(resultTable.getTable(), SWT.LEFT);
				column.setText((String)header);
			}
			
			resultTable.setContentProvider(new IStructuredContentProvider() {	
				@Override
				public Object[] getElements(Object arg0) {
					// TODO Auto-generated method stub
					return ((Collection<ExtractionResult>)arg0).toArray();
				}

				@Override
				public void dispose() {
					// TODO Auto-generated method stub
					
				}

				@Override
				public void inputChanged(Viewer arg0, Object arg1, Object arg2) {
					// TODO Auto-generated method stub
					
				}
			});
			
			resultTable.setLabelProvider(new ITableLabelProvider() {
				
				@Override
				public void removeListener(ILabelProviderListener arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public boolean isLabelProperty(Object arg0, String arg1) {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public void dispose() {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void addListener(ILabelProviderListener arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public String getColumnText(Object arg0, int arg1) {
					// TODO Auto-generated method stub
					ExtractionResult result = (ExtractionResult)arg0;
					
					if (result == null) {
						return null;
					} else {
						if (arg1 == 0) {
							return new File(result.getFileName()).getName();
						} else {
							String header = (String)headers[arg1 - 1];
							
							ExtractionTag tag = result.getTag(header);
							
							if (tag == null) {
								return null;
							} else {
								if (tag.contents().size() == 0) {
									return null;
								} else if (tag.contents().size() == 1) {
									return tag.contents().get(0).getValue();
								} else {
									return "[集合(" + tag.contents().size() + ")]" + tag.contents().get(0).getValue() + 
											"; " + tag.contents().get(1).getValue() + " ...";
								}
							}
						}
					}
				}
				
				@Override
				public Image getColumnImage(Object arg0, int arg1) {
					// TODO Auto-generated method stub
					return null;
				}
			});

			resultTable.getTable().setLayout(tbLayout);
			
			resultTable.setInput(rc.results());
			
			getShell().layout();
		}
	}
}

class DetailResultDialog extends Dialog {

	private ExtractionResult result;
	
	protected DetailResultDialog(Shell parentShell, ExtractionResult result) {
		super(parentShell);
		// TODO Auto-generated constructor stub
		this.result = result;
	}
	
	@Override
	protected void configureShell(Shell newShell) {
		// TODO Auto-generated method stub
		newShell.setText("详细结果 - " + result.getFileName());
		newShell.setSize(800, 600);
		super.configureShell(newShell);
	}
	
	@Override
	protected int getShellStyle() {
		// TODO Auto-generated method stub
		return SWT.SHELL_TRIM | super.getShellStyle();
	}
	
	@Override
	protected Control createDialogArea(Composite parent) {
		// TODO Auto-generated method stub
		parent.setSize(800, 600);
		
		Composite root = new Composite(parent, SWT.NONE);
		root.setLayoutData(new GridData(GridData.FILL_BOTH));
		root.setLayout(new FillLayout());
		
		TabFolder tabFolder = new TabFolder(root, SWT.BORDER);
		for (ExtractionTag tag : result.tags()) {
			TabItem item = new TabItem(tabFolder, SWT.NONE);
			item.setText(tag.getName());
			
			TableViewer table = new TableViewer(item.getParent(), SWT.FULL_SELECTION|SWT.BORDER|SWT.SINGLE);
			table.getTable().setLinesVisible(true);
			table.getTable().setHeaderVisible(true);
			
			TableLayout tbLayout = new TableLayout();
			tbLayout.addColumnData(new ColumnWeightData(66, true));
			tbLayout.addColumnData(new ColumnWeightData(33, true));
			
			TableColumn contentCol = new TableColumn(table.getTable(), SWT.LEFT);
			contentCol.setText("内容");
			
			TableColumn linkCol = new TableColumn(table.getTable(), SWT.LEFT);
			linkCol.setText("链接");
			
			table.getTable().setLayout(tbLayout);
			
			table.setContentProvider(new IStructuredContentProvider() {
				
				@Override
				public void inputChanged(Viewer arg0, Object arg1, Object arg2) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void dispose() {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public Object[] getElements(Object arg0) {
					// TODO Auto-generated method stub
					return ((List<ExtractionContent>)arg0).toArray();
				}
			});
			
			table.setLabelProvider(new ITableLabelProvider() {
				
				@Override
				public void removeListener(ILabelProviderListener arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public boolean isLabelProperty(Object arg0, String arg1) {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public void dispose() {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void addListener(ILabelProviderListener arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public String getColumnText(Object arg0, int arg1) {
					// TODO Auto-generated method stub
					ExtractionContent content = (ExtractionContent)arg0;
					
					if (content == null) {
						return null;
					} else {
						switch (arg1) {
						case 0:
							return content.getValue();
						case 1:
							return content.getLink();
						default:
								return null;
						}
					}
				}
				
				@Override
				public Image getColumnImage(Object arg0, int arg1) {
					// TODO Auto-generated method stub
					return null;
				}
			});
			
			table.setInput(tag.contents());
			
			item.setControl(table.getTable());
		}
		
		return parent;
	}
	
	@Override
	protected void createButtonsForButtonBar(Composite parent) {
		// TODO Auto-generated method stub
		createButton(parent, IDialogConstants.OK_ID, "返回", true);
	}
}
