import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

public class GridLayoutSampleGrabSpace {
	
	public GridLayoutSampleGrabSpace() {

		Display display = new Display();
		Shell shell = new Shell(display);

		GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 3;
		shell.setLayout(gridLayout);

		Label label = new Label(shell, SWT.BORDER);
		label.setText("label");

		GridData gridData3 = new GridData();
		gridData3.widthHint = 60;
		gridData3.heightHint = 20;

		label.setLayoutData(gridData3);

		Browser browser = new Browser(shell, SWT.NONE);
		browser.setUrl("http://www.baidu.com");
		
//		Text text = new Text(shell, SWT.SINGLE | SWT.BORDER);
//		text.setText("text");

		GridData gridData = new GridData();
		gridData.grabExcessHorizontalSpace = true;
		gridData.grabExcessVerticalSpace = true;
		gridData.horizontalAlignment = GridData.FILL;
		gridData.verticalAlignment = GridData.FILL;
//		text.setLayoutData(gridData);
		browser.setLayoutData(gridData);

		Button button = new Button(shell, SWT.PUSH);
		button.setText("button");

		GridData gridData2 = new GridData();
		gridData2.grabExcessVerticalSpace = true;
		gridData2.grabExcessHorizontalSpace = true;
		gridData2.verticalAlignment = GridData.FILL;
		gridData2.horizontalAlignment = GridData.FILL;

		button.setLayoutData(gridData2);

		shell.setSize(300, 80);
		// shell.pack();
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		display.dispose();
	}

	public static void main(String[] args) {
		new GridLayoutSampleGrabSpace();
	}
}