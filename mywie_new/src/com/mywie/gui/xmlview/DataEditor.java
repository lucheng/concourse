package com.mywie.gui.xmlview;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.jface.viewers.CellEditor;
import org.eclipse.jface.viewers.TableViewer;
import org.eclipse.jface.viewers.TextCellEditor;
import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableColumn;

/**
 * This class demonstrates CellEditors. It allows you to create and edit Data
 * objects
 */
public class DataEditor extends ApplicationWindow {
	// Table column names/properties
	public List<String> titles;

	// The datas model
	private List<Data> datas;

	private TableViewer tableViewer;

	private Composite composite;

	/**
	 * Constructs a PersonEditor
	 */
	public DataEditor() {
		super(null);
		titles = new ArrayList<String>();
		datas = new ArrayList<Data>();
	}

	/**
	 * Runs the application
	 */
	public void run() {
		System.out.println("a".compareTo("aT"));
		// Don't return from open() until window closes
		setBlockOnOpen(true);

		// Open the main window
		open();
		// while (!Display.getCurrent().isDisposed()) {
		// if (!Display.getCurrent().readAndDispatch())
		// Display.getCurrent().sleep();
		// }
		// // Dispose the display
		// Display.getCurrent().dispose();
	}

	/**
	 * Configures the shell
	 * 
	 * @param shell
	 *            the shell
	 */
	protected void configureShell(Shell shell) {
		super.configureShell(shell);
		shell.setText("Data Editor");
		shell.setSize(600, 600);
	}

	/**
	 * Creates the main window's contents
	 * 
	 * @param parent
	 *            the main window
	 * @return Control
	 */
	protected Control createContents(Composite parent) {
		composite = new Composite(parent, SWT.NONE);
		composite.setLayout(new GridLayout(1, false));
		createMenu();
		createTableViewer();
		return composite;
	}

	public void createMenu() {
		// Add a button to create the new person
		Menu menu = new Menu(composite.getShell(), SWT.BAR);
		composite.getShell().setMenuBar(menu);
		MenuItem file = new MenuItem(menu, SWT.CASCADE);
		file.setText("file");
		Menu filemenu = new Menu(composite.getShell(), SWT.DROP_DOWN);
		file.setMenu(filemenu);

		MenuItem openItem = new MenuItem(filemenu, SWT.PUSH);
		openItem.setText("open");

		// Add a new person when the user clicks button
		openItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent event) {
				FileDialog fileDialog = new FileDialog(getShell());
				String[] filterExtensions = { "*.xml" };
				fileDialog.setFilterExtensions(filterExtensions);
				fileDialog.setText("请选择文件");
				String filePath = fileDialog.open();
				ResultForm resultForm = Converters.converter(filePath);
				if (resultForm != null) {
					titles = resultForm.getTitles();
					datas = resultForm.getDatas();
					loadFile();
				} else {
					MessageBox messageBox = new MessageBox(getShell(),
							SWT.ICON_WARNING | SWT.CHECK | SWT.CANCEL);
					messageBox.setText("出错了！");
					messageBox.setMessage("打开文件出错!");
					messageBox.open();
				}
			}
		});

		MenuItem saveItem = new MenuItem(filemenu, SWT.PUSH);
		saveItem.setText("save");

		MenuItem edit = new MenuItem(menu, SWT.CASCADE);
		edit.setText("edit");
		Menu editmenu = new Menu(composite.getShell(), SWT.DROP_DOWN);
		edit.setMenu(editmenu);
	}

	public void createTableViewer() {
		// Add the TableViewer
		tableViewer = new TableViewer(composite, SWT.FULL_SELECTION);
		tableViewer.setContentProvider(new DataContentProvider());
		tableViewer.setLabelProvider(new DataLabelProvider());
		tableViewer.setInput(datas);
		tableViewer.setCellModifier(new DataCellModifier(tableViewer, titles));
		// Create the cell editors
		Table table = tableViewer.getTable();
		table.setLayoutData(new GridData(GridData.FILL_BOTH));

		for (String title : titles) {
			new TableColumn(table, SWT.CENTER).setText(title);
		}

		for (int i = 0, n = table.getColumnCount(); i < n; i++) {
			table.getColumn(i).pack();
		}

		table.setHeaderVisible(true);
		table.setLinesVisible(true);
		CellEditor[] editors = new CellEditor[titles.size()];
		for (int i = 0; i < editors.length; i++) {
			editors[i] = new TextCellEditor(table);
		}
		tableViewer.setCellEditors(editors);

		// Set up the table

		// Set the editors, cell modifier, and column properties
		String[] props = new String[titles.size()];
		for (int i = 0; i < titles.size(); i++) {
			props[i] = titles.get(i);
		}
		tableViewer.setColumnProperties(props);
	}

	public void loadFile() {
		tableViewer.setInput(datas);
		tableViewer.setCellModifier(new DataCellModifier(tableViewer, titles));
		Table table = tableViewer.getTable();
		for (TableColumn col : table.getColumns()) {
			col.dispose();
		}

		for (String title : titles) {
			TableColumn col = new TableColumn(table, SWT.CENTER);
			col.setText(title);
			col.setWidth(title.length());
		}

		for (int i = 0, n = table.getColumnCount(); i < n; i++) {
			table.getColumn(i).pack();
		}

		CellEditor[] editors = new CellEditor[titles.size()];
		for (int i = 0; i < editors.length; i++) {
			editors[i] = new TextCellEditor(table);
		}
		tableViewer.setCellEditors(editors);

		// Set the editors, cell modifier, and column properties
		String[] props = new String[titles.size()];
		for (int i = 0; i < titles.size(); i++) {
			props[i] = titles.get(i);
		}
		tableViewer.setColumnProperties(props);

		tableViewer.refresh();
	}

	/**
	 * The application entry point
	 * 
	 * @param args
	 *            the command line arguments
	 */
	public static void main(String[] args) {
		new DataEditor().run();
	}

	public List<String> getTitles() {
		return titles;
	}

	public void setTitles(List<String> titles) {
		this.titles = titles;
	}

}

/**
 * This class provides the content for the person table
 */

/**
 * This class provides the content for the FoodList application
 */

/**
 * This class represents the cell modifier for the PersonEditor program
 */

/**
 * This class represents a person
 */

/**
 * This class contains all the foods on the "grocery list"
 */

/**
 * This class represents a type of food
 */

/**
 * This class provides the labels for the person table
 */

/**
 * This class encapsulates age ranges
 */

