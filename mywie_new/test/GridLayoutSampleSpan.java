import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.List;
import org.eclipse.swt.widgets.Shell;

public class GridLayoutSampleSpan {

	Display display = new Display();
	Shell shell = new Shell(display);

	public GridLayoutSampleSpan() {

		GridLayout gridLayout = new GridLayout();
		gridLayout.numColumns = 2;
		gridLayout.makeColumnsEqualWidth = true;
		shell.setLayout(gridLayout);
		Button button1 = new Button(shell, SWT.PUSH);
		button1.setText("button1");
		button1.setLayoutData(new GridData(GridData.VERTICAL_ALIGN_BEGINNING));

		List list = new List(shell, SWT.BORDER);
		list.add("item 1");
		list.add("item 2");
		list.add("item 3");
		list.setLayoutData(new GridData(GridData.VERTICAL_ALIGN_CENTER));

		Button button2 = new Button(shell, SWT.PUSH);
		button2.setText("button #2");
		GridData gridData = new GridData(GridData.VERTICAL_ALIGN_END);
		gridData.horizontalSpan = 2;
		gridData.horizontalAlignment = GridData.FILL;
		button2.setLayoutData(gridData);

		Button button3 = new Button(shell, SWT.PUSH);
		button3.setText("3");
		GridData gridData2 = new GridData(GridData.VERTICAL_ALIGN_END);
		gridData2.verticalSpan = 3;
		button3.setLayoutData(gridData2);

		shell.pack();
		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
		display.dispose();
	}

	public static void main(String[] args) {
		new GridLayoutSampleSpan();
	}
}