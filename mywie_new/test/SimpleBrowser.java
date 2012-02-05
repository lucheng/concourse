import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.*;
import org.eclipse.swt.events.*;
import org.eclipse.swt.layout.*;
import org.eclipse.swt.widgets.*;

/**
 * This class implements a web browser
 */
public class SimpleBrowser {
  /**
   * Runs the application
   */
  public void run() {
    Display display = new Display();
    Shell shell = new Shell(display);
    shell.setText("Simple Browser");
    createContents(shell);
    shell.open();
    while (!shell.isDisposed()) {
      if (!display.readAndDispatch()) {
        display.sleep();
      }
    }
    display.dispose();
  }

  /**
   * Creates the main window's contents
   * 
   * @param shell the main window
   */
  private void createContents(Shell shell) {
    
	  shell.setLayout(new FormLayout());

	  Menu menu = new Menu(shell, SWT.BAR);

		// create a file menu and add an exit item
	   /* final MenuItem file = new MenuItem(menu, SWT.CASCADE);
	    file.setText("File");
	    final Menu filemenu = new Menu(shell, SWT.DROP_DOWN);
	    file.setMenu(filemenu);
	    // create an open menu and to sub-menu items
	    final MenuItem openItem = new MenuItem(filemenu, SWT.CASCADE);
	    openItem.setText("Open");
	    final Menu submenu = new Menu(shell, SWT.DROP_DOWN);
	    openItem.setMenu(submenu);
	    */
	    final MenuItem childItem = new MenuItem(menu, SWT.PUSH);
	    childItem.setText("Child");
	    final MenuItem dialogItem = new MenuItem(menu, SWT.PUSH);
	    dialogItem.setText("Dialog");
	    final MenuItem exitItem = new MenuItem(menu, SWT.PUSH);
	    exitItem.setText("Exit");

	    // create an edit menu and add cut copy and paste items
	    final MenuItem edit = new MenuItem(menu, SWT.CASCADE);
	    edit.setText("Edit");
	    final Menu editmenu = new Menu(shell, SWT.DROP_DOWN);
	    edit.setMenu(editmenu);
	    final MenuItem cutItem = new MenuItem(editmenu, SWT.PUSH);
	    cutItem.setText("Cut");
	    final MenuItem copyItem = new MenuItem(editmenu, SWT.PUSH);
	    copyItem.setText("Copy");
	    final MenuItem pasteItem = new MenuItem(editmenu, SWT.PUSH);
	    pasteItem.setText("Paste");

	    //create a Window menu and add Child item
	    /*final MenuItem window = new MenuItem(menu, SWT.CASCADE);
	    window.setText("Help");
	    final Menu windowmenu = new Menu(shell, SWT.DROP_DOWN);
	    window.setMenu(windowmenu);
	    final MenuItem maxItem = new MenuItem(windowmenu, SWT.PUSH);
	    maxItem.setText("About");*/

	    // create a Help menu and add an about item
	    final MenuItem help = new MenuItem(menu, SWT.CASCADE);
	    help.setText("Help");
	    final Menu helpmenu = new Menu(shell, SWT.DROP_DOWN);
	    help.setMenu(helpmenu);
	    final MenuItem aboutItem = new MenuItem(helpmenu, SWT.PUSH);
	    aboutItem.setText("About");

	    childItem.addSelectionListener(new SelectionListener() {
	      public void widgetSelected(SelectionEvent e) {
	        Shell parent = (Shell) aboutItem.getParent().getParent();
	        ChildShell cs = new ChildShell(parent);
	      }

	      public void widgetDefaultSelected(SelectionEvent e) {

	      }
	    });

	    dialogItem.addSelectionListener(new SelectionListener() {
	      public void widgetSelected(SelectionEvent e) {
	        Shell parent = (Shell) aboutItem.getParent().getParent();
	        DialogExample de = new DialogExample(parent);
	        de.open();
	      }

	      public void widgetDefaultSelected(SelectionEvent e) {

	      }
	    });

	    exitItem.addSelectionListener(new SelectionListener() {
	      public void widgetSelected(SelectionEvent e) {
	        System.exit(0);
	      }

	      public void widgetDefaultSelected(SelectionEvent e) {

	      }
	    });

	    cutItem.addSelectionListener(new SelectionListener() {
	      public void widgetSelected(SelectionEvent e) {
	        System.out.println("Cut");
	      }

	      public void widgetDefaultSelected(SelectionEvent e) {

	      }
	    });

	    copyItem.addSelectionListener(new SelectionListener() {
	      public void widgetSelected(SelectionEvent e) {
	        System.out.println("Copy");
	      }

	      public void widgetDefaultSelected(SelectionEvent e) {

	      }
	    });

	    pasteItem.addSelectionListener(new SelectionListener() {
	      public void widgetSelected(SelectionEvent e) {
	        System.out.println("Paste");
	      }

	      public void widgetDefaultSelected(SelectionEvent e) {

	      }
	    });



	    shell.setMenuBar(menu);
    // Create the composite to hold the buttons and text field
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

    browser.setUrl("http://www.baidu.com");
    // Create the controls and wire them to the browser
    controls.setLayout(new GridLayout(5, false));

  }

  /**
   * The application entry point
   * 
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    new SimpleBrowser().run();
  }
}