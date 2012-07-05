import java.util.List;
import java.util.Map;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Dialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

public class MarkInputDialog extends Dialog {

	String value;

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
	public String open() {
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

		return value;
	}

		
    public void centerSell(Display display,Shell shell) {
        Rectangle displayBounds = display.getPrimaryMonitor().getBounds();
        Rectangle shellBounds = shell.getBounds();
        int x = displayBounds.x + (displayBounds.width-shellBounds.width)>>1;
        int y = displayBounds.y + (displayBounds.height - shellBounds.height)>>1;
        shell.setLocation(x, y);
    }
	
	public static void main(String[] args) {
		Shell shell = new Shell();
		MarkInputDialog dialog = new MarkInputDialog(shell);
		dialog.centerSell(shell.getDisplay(), shell);
		System.out.println(dialog.open());
	}
}