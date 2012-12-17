package com.buptsse.wie.shell;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.jface.viewers.*;
import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.browser.StatusTextEvent;
import org.eclipse.swt.browser.StatusTextListener;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.*;
import org.eclipse.swt.widgets.*;

import java.io.File;
import java.util.*;
import java.util.List;
import java.util.regex.Pattern;

import com.buptsse.wie.models.SemanticTag;
import com.buptsse.wie.shell.components.Border;
import com.buptsse.wie.utilities.FileHelp;
import com.buptsse.wie.utilities.XmlHelp;

//ģ��༭��
public class TemplateEditorWindow extends ApplicationWindow {

	private TableViewer tagTable;
	private java.util.List<SemanticTag> tagData = new ArrayList<SemanticTag>();
	private Set<String> tagNameTable = new HashSet<String>();
	private Set<String> tagIdTable = new HashSet<String>();
	private Browser browser;
	
	private Document xmlDoc;
	
	private String currentFile;
	private String currentTempFile;
	private String windowStatus;
	
	private Map<String, MenuItem> menuTable = new HashMap<String, MenuItem>();
	
	private boolean isSaved = true;
	
	public TemplateEditorWindow(Shell shell, String file) {
		super(shell);
		// TODO Auto-generated constructor stub
		currentFile = file;
	}
	
	@Override
	protected void handleShellCloseEvent() {
		// TODO Auto-generated method stub
		boolean cancelled = !onClosing();
		
		if (cancelled) {
			setReturnCode(OK);
		} else {
			super.handleShellCloseEvent();
		}
	}
	
	protected Control createContents(Composite parent) {
		getShell().setText("ģ��༭��");
		addMenuBar();
		addToolBar(SWT.NONE);
		
		createMenu();
		
		parent.setSize(1024, 600);
		
		GridLayout layout = new GridLayout(2, false);
		parent.setLayout(layout);
		
		parent.getChildren()[0].dispose();
		
		//������ע�б��������ؼ�
		tagTable = new TableViewer(parent, SWT.FULL_SELECTION|SWT.BORDER|SWT.SINGLE|SWT.H_SCROLL);
		Border border = new Border(parent, SWT.NONE);
		browser = new Browser(border, SWT.NONE);
		browser.addStatusTextListener(new StatusTextListener() {
			
			@Override
			public void changed(StatusTextEvent arg0) {
				// ����Window Status�ı�
				if (Pattern.matches("[1-9][0-9]*", arg0.text.trim())) {
					updateWindowStatus(arg0.text.trim());
				} else if (arg0.text.trim().equals("null")) {
					windowStatus = null;
				}
			}
		});
		
		GridData tableLayoutData = new GridData(GridData.FILL_VERTICAL);
		tableLayoutData.widthHint = 300;
		GridData browserLayoutData = new GridData(GridData.FILL_BOTH);
		
		tagTable.getTable().setLayoutData(tableLayoutData);
		border.setLayoutData(browserLayoutData);
		
		TableLayout tbLayout = new TableLayout();
		tbLayout.addColumnData(new ColumnWeightData(25, true));
		tbLayout.addColumnData(new ColumnWeightData(75, true));
		
		tagTable.getTable().setLayout(tbLayout);
		tagTable.getTable().setLinesVisible(true);
		tagTable.getTable().setHeaderVisible(true);
		tagTable.addDoubleClickListener(new IDoubleClickListener() {
			
			@Override
			public void doubleClick(DoubleClickEvent arg0) {
				// TODO Auto-generated method stub
				IStructuredSelection selection = (IStructuredSelection)arg0.getSelection();
				
				editTag(selection);
			}
		});
		tagTable.addSelectionChangedListener(new ISelectionChangedListener() {
			
			@Override
			public void selectionChanged(SelectionChangedEvent arg0) {
				// TODO Auto-generated method stub
				boolean anySelected = !arg0.getSelection().isEmpty();
				
				setMenuEnabled("edit", anySelected);
				setMenuEnabled("del", anySelected);
			}
		});
		
		TableColumn column1 = new TableColumn(tagTable.getTable(), SWT.LEFT);
		column1.setText("��ע����");
		TableColumn column2 = new TableColumn(tagTable.getTable(), SWT.LEFT);
		column2.setText("��ǩ����");
		
		tagTable.setContentProvider(new IStructuredContentProvider() {	
			@Override
			public Object[] getElements(Object arg0) {
				// TODO Auto-generated method stub
				return ((java.util.List<SemanticTag>)arg0).toArray();
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
		
		tagTable.setLabelProvider(new ITableLabelProvider() {
			
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
				SemanticTag data = (SemanticTag)arg0;
				
				if (data == null) {
					return null;
				} else {
					switch (arg1) {
					case 0:
						return data.getSemantic();
						
					case 1:
						return data.getBlock();
						
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
		
		tagTable.setInput(tagData);
		loadTemplate(currentFile);
		
		return parent;
	}
	
	private void createMenu() {
		Shell shell = getShell();
		Menu menuBar = new Menu(shell, SWT.BAR);
		
		MenuItem fileItem = new MenuItem(menuBar, SWT.CASCADE);
		fileItem.setText("�ļ�(&F)");
		Menu fileMenu = new Menu(fileItem);
		fileItem.setMenu(fileMenu);
		
		MenuItem editItem = new MenuItem(menuBar, SWT.CASCADE);
		editItem.setText("�༭(&E)");
		Menu editMenu = new Menu(editItem);
		editItem.setMenu(editMenu);
		
		MenuItem openItem = new MenuItem(fileMenu, SWT.PUSH);
		openItem.setAccelerator(SWT.CTRL | 'o');
		openItem.setText("��(&O)...\tCTRL+O");
		menuTable.put("open", openItem);
		
		MenuItem saveItem = new MenuItem(fileMenu, SWT.PUSH);
		saveItem.setAccelerator(SWT.CTRL | 's');
		saveItem.setText("����(&S)\tCTRL+S");
		menuTable.put("save", saveItem);
		
		MenuItem saveAsItem = new MenuItem(fileMenu, SWT.PUSH);
		saveAsItem.setText("���Ϊ(&A)...");
		menuTable.put("saveAs", saveAsItem);
		
		new MenuItem(fileMenu, SWT.SEPARATOR);
		
		MenuItem exitItem = new MenuItem(fileMenu, SWT.PUSH);
		exitItem.setText("�˳�(&X)");
		
		MenuItem editTagItem = new MenuItem(editMenu, SWT.PUSH);
		editTagItem.setAccelerator(SWT.CTRL | 'e');
		editTagItem.setText("�༭��ѡ��ע(&E)\tCTRL+E");
		menuTable.put("edit", editTagItem);
		
		MenuItem delTagItem = new MenuItem(editMenu, SWT.PUSH);
		delTagItem.setAccelerator(SWT.DEL);
		delTagItem.setText("ɾ����ѡ��ע(&D)\tDEL");
		menuTable.put("del", delTagItem);
		
		setMenuEnabled("save", false);
		setMenuEnabled("edit", false);
		setMenuEnabled("del", false);
		
		editTagItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				IStructuredSelection selection = (IStructuredSelection)tagTable.getSelection();
				editTag(selection);
				tagTable.refresh();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		delTagItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				IStructuredSelection selection = (IStructuredSelection)tagTable.getSelection();
				
				removeTagData(getSelectedItem());
				tagTable.refresh();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
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
		
		saveItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				saveFile(currentFile);
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		saveAsItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.SAVE);
				dialog.setText("ѡ�񱣴�λ��");
				dialog.setFilterNames(new String[] {"ģ���ļ�(*.htm;*.html)", "�����ļ�(*.*)"});
				dialog.setFilterExtensions(new String[] {"*.htm;*.html", "*.*"});
				
				String target = dialog.open();
				
				if (target != null) {
					saveFile(target);
					currentFile = target;
					reloadTemplate(currentFile);
				}
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
				if (promptSave()) {
					FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
					dialog.setText("ѡ��ģ���ļ�");
					dialog.setFilterNames(new String[] {"ģ���ļ�(*.htm;*.html)", "�����ļ�(*.*)"});
					dialog.setFilterExtensions(new String[] {"*.htm;*.html", "*.*"});
					
					String target = dialog.open();
					
					if (target != null) {
						currentFile = target;
						reloadTemplate(currentFile);
					}
				}
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		shell.setMenuBar(menuBar);
	}
	
	//���ò˵�Enabled����
	private void setMenuEnabled(String name, boolean enabled) {
		if (menuTable.containsKey(name)){
			menuTable.get(name).setEnabled(enabled);
		}
	}
	
	//���ñ���״̬
	private void setSaveStatus(boolean isSaved) {
		if (!this.isSaved && isSaved) {
			this.isSaved = true;
			setMenuEnabled("save", false);
			
		} else if (this.isSaved && !isSaved) {
			this.isSaved = false;
			setMenuEnabled("save", true);
		}
	}
	
	//����±�ע
	private void addTagData(SemanticTag data) {
		if (!tagNameTable.contains(data.getSemantic())) {
			tagData.add(data);
			tagNameTable.add(data.getSemantic());
			tagIdTable.add(data.getWindowStatus());
		}
	}
	
	//ɾ����ע
	private void removeTagData(SemanticTag data) {
		if (tagNameTable.contains(data.getSemantic())) {
			tagData.remove(data);
			tagNameTable.remove(data.getSemantic());
			tagIdTable.remove(data.getWindowStatus());
			
			setSaveStatus(false);
		}
	}
	
	//����Window Status����
	private void updateWindowStatus(String status) {
		if (!status.equals(windowStatus) && !tagIdTable.contains(status)) {
			windowStatus = status;
			
			if (windowStatus != null) {
				//��ѡ����Ԫ�أ�������ע����ʾ�༭��ע�Ի���
				SemanticTag data = new SemanticTag();
				data.setBlock(getBlock(windowStatus));
				data.setSemantic("��ע" + (tagData.size() + 1));
				data.setWindowStatus(windowStatus);
				
				EditTagDialog dialog = new EditTagDialog(getShell(), data, tagNameTable);
				
				dialog.open();
				
				if (dialog.getTagOK()) {
					addTagData(data);
					tagTable.refresh();
					setSaveStatus(false);
					windowStatus = null;
				}
			}
		}
	}
	
	//����ģ���ļ�
	private void reloadTemplate(String newTemplate) {
		tagData.clear();
		tagIdTable.clear();
		tagNameTable.clear();
		
		loadTemplate(newTemplate);
	}
	
	//��ģ���ļ�
	private void loadTemplate(String templateFile) {
		final String file = templateFile;
		
		if (file == null || !new File(file).exists()) {
			return;
		}
		
		Display.getCurrent().asyncExec(new Runnable() {
			@Override
			public void run() {
				// �����������򿪡�
				FileHelp.makedir(FileHelp.TEMPDIR);
				String tempfile = FileHelp.TEMPDIR + "temp.html";
				FileHelp.copyFile(new File(file), new File(tempfile));

				FileHelp.makedir(FileHelp.TEMPDIR + "/include");
				FileHelp.copyJarFile("/com/buptsse/resources/jquery.js", FileHelp.TEMPDIR + "/include/jquery.js");
				FileHelp.copyJarFile("/com/buptsse/resources/template.css", FileHelp.TEMPDIR + "/include/template.css");
				FileHelp.copyJarFile("/com/buptsse/resources/template.js", FileHelp.TEMPDIR + "/include/template.js");
				
				xmlDoc = XmlHelp.cleanHtml(tempfile);
				currentTempFile = tempfile + ".htm";
				XmlHelp.writeDocument(currentTempFile, xmlDoc);
				extractTags();
				
				browser.setUrl(currentTempFile);
				getShell().setText("ģ��༭�� - " + currentFile);
			}
		});
	}
	
	private String getBlock(String windowStatus) {
		Element root = xmlDoc.getRootElement();
		Node selectNode = root.selectSingleNode("//*[@my_count_id='"+ windowStatus +"']");
		return selectNode.asXML();
	}
	
	//��ģ��XML�ĵ��ж�ȡ�ѱ���ı�ע���ݡ�
	private void extractTags() {
		Element root = xmlDoc.getRootElement();
		List<Element> list = root.selectNodes("//*[@semantic]");
		for (Element element : list) {
			SemanticTag data = new SemanticTag();
			data.setSemantic(element.attributeValue("semantic"));
			data.setWindowStatus(element.attributeValue("my_count_id"));
			data.setBehavior(element.attributeValue("wie_behave"));
			data.setBlock(getBlock(data.getWindowStatus()));
			
			addTagData(data);
		}
		
		tagTable.refresh();
	}
	
	//����ģ���ļ�
	private void saveFile(String fileName) {
		if(fileName != null){
			//����Tag�б�
			List<SemanticTag> list = new ArrayList<SemanticTag>();
			for (SemanticTag data : tagData) {
				SemanticTag slim = new SemanticTag();
				slim.setSemantic(data.getSemantic());
				slim.setBehavior(data.getBehavior());
				slim.setBlock("");
				slim.setWindowStatus(data.getWindowStatus());
				list.add(slim);
			}
			
			//���±�ע����
			Element root = XmlHelp.getHtmlDocument(currentTempFile).getRootElement();
			
			List<Node> oldNodes = root.selectNodes("//*[@semantic]");
			for (Node node : oldNodes) {
				if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
					Element element = (Element) node;
					try {
						element.remove(element.attribute("semantic"));
					} catch (Exception e) {
						// TODO: handle exception
					}
					try {
						element.remove(element.attribute("block"));
					} catch (Exception e) {
						// TODO: handle exception
					}
					try {
						element.remove(element.attribute("num"));
					} catch (Exception e) {
						// TODO: handle exception
					}
					
					try {
						element.remove(element.attribute("wie_behave"));
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
			for (SemanticTag data : list) {
				Node node = root.selectSingleNode("//*[@my_count_id='" + data.getWindowStatus() + "']");
				if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
					Element temp = (Element) node;
					temp.addAttribute("semantic", data.getSemantic());
					
					temp.addAttribute("wie_behave", data.getBehavior());
				}
			}
			
			//���浽����
			XmlHelp.writeDocument(fileName, root.getDocument());
			//����Ϊ�ѱ���
			setSaveStatus(true);
		}
	}
	
	//������������
	private boolean promptSave(){
		if (!isSaved) {
			MessageBox mbox = new MessageBox(getShell(), SWT.ICON_QUESTION | SWT.YES | SWT.NO | SWT.CANCEL);
			mbox.setMessage("�Ƿ񱣴���ģ�");
			
			int ret = mbox.open();
			
			switch (ret) {
			case SWT.YES:
				saveFile(currentFile);
				return true;
				
			case SWT.CANCEL:
				return false;
				
			default:
				return true;
			}
		} else {
			return true;
		}
	}
	
	//���ش��ڹر�
	private boolean onClosing() {
		return promptSave();
	}
	
	private SemanticTag getSelectedItem() {
		return getSelectedItem((IStructuredSelection)tagTable.getSelection());
	}
	
	private SemanticTag getSelectedItem(IStructuredSelection selection) {
		
		if (!selection.isEmpty()) {
			for (Iterator i = selection.iterator(); i.hasNext(); ) {
				return (SemanticTag)i.next();
			}
			
			return null;
		} else {
			return null;
		}
	}
	
	//�༭��ע
	private void editTag(IStructuredSelection selection) {
		SemanticTag data = getSelectedItem(selection);
		
		tagNameTable.remove(data.getSemantic());
		//��ʾ�༭�Ի���
		EditTagDialog dialog = new EditTagDialog(getShell(), data, tagNameTable);
		
		dialog.open();
		
		if (dialog.getTagOK()) {
			tagTable.refresh();
			setSaveStatus(false);
		}
		
		tagNameTable.add(data.getSemantic());
	}
}

/**
 * �༭��ע�Ի���
 * 
 */
class EditTagDialog extends org.eclipse.jface.dialogs.Dialog {

	private SemanticTag tag;
	
	private Text tagNameText;
	private Button multi;
	//���������ж�
	private Set<String> nameTable;
	
	private boolean tagOk = false;
	
	//��ʾ�û�ȷ�ϱ�ע�ĸ���
	public boolean getTagOK() {
		return tagOk;
	}
	
	protected EditTagDialog(Shell parentShell, SemanticTag data, Set<String> nameTable) {
		super(parentShell);
		// TODO Auto-generated constructor stub
		tag = data;
		this.nameTable = nameTable;
	}
	
	@Override
	protected void configureShell(Shell newShell) {
		// TODO Auto-generated method stub
		newShell.setText("�༭��ע");
		super.configureShell(newShell);
	}
	
	@Override
	protected Control createDialogArea(Composite parent) {
		// TODO Auto-generated method stub
		Composite area = (Composite)super.createDialogArea(parent);
		
		GridLayout layout = new GridLayout(2, false);
		area.setLayout(layout);
		
		GridData ldLabel = new GridData(GridData.HORIZONTAL_ALIGN_BEGINNING);
		ldLabel.widthHint = 60;
		
		GridData ldTagName = new GridData(GridData.FILL_HORIZONTAL);
		
		GridData ldXml = new GridData(GridData.FILL_BOTH);
		ldXml.horizontalSpan = 2;
		ldXml.widthHint = 300;
		ldXml.heightHint = 100;
		
		Label label = new Label(area, SWT.NONE);
		label.setText("��ע����");
		label.setLayoutData(ldLabel);
		
		tagNameText = new Text(area, SWT.SINGLE | SWT.BORDER);
		tagNameText.setText(tag.getSemantic());
		tagNameText.setLayoutData(ldTagName);
		
		multi = new Button(area, SWT.CHECK);
		multi.setText("��ȡ��Χͬ��Ԫ��");
		GridData ldBtn = new GridData(GridData.HORIZONTAL_ALIGN_END);
		ldBtn.horizontalSpan = 2;
		multi.setLayoutData(ldBtn);
		
		if (tag.getBehavior().equals("multi")) {
			multi.setSelection(true);
		}
		
		Text xmlText = new Text(area, SWT.MULTI | SWT.BORDER | SWT.READ_ONLY | SWT.H_SCROLL | SWT.V_SCROLL);
		xmlText.setText(tag.getBlock());
		xmlText.setLayoutData(ldXml);
		
		return area;
	}
	
	@Override
	protected void createButtonsForButtonBar(Composite parent) {
		// TODO Auto-generated method stub
		createButton(parent,
					 IDialogConstants.OK_ID,
					 "ȷ��",
					 true);
		
		createButton(parent,
					 IDialogConstants.CANCEL_ID,
					 "ȡ��",
					 false);
	}
	
	//����Ի���ť�¼�
	@Override
	protected void buttonPressed(int buttonId) {
		// TODO Auto-generated method stub
		if (buttonId == IDialogConstants.OK_ID) {
			String name = tagNameText.getText().trim();
			
			if (name.equals("")) {
				MessageBox mbox = new MessageBox(getShell(),
						SWT.ICON_INFORMATION | SWT.OK);
				mbox.setMessage("���Ʋ���Ϊ��");
				mbox.open();
				
				return;
			}
			
			if (nameTable.contains(tagNameText.getText().trim())) {
				MessageBox mbox = new MessageBox(getShell(),
						SWT.ICON_INFORMATION | SWT.OK);
				mbox.setMessage("�����Ѵ���");
				mbox.open();
				
				return;
			}
			
			tag.setSemantic(tagNameText.getText().trim());
			if (multi.getSelection()) {
				tag.setBehavior("multi");
			} else {
				tag.setBehavior("single");
			}
			tagOk = true;
		}
		super.buttonPressed(buttonId);
	}
}