package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.widgets.Decorations;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.Shell;

import com.mywie.gui.xmlview.Converters;
import com.mywie.gui.xmlview.DataEditor;
import com.mywie.gui.xmlview.ResultForm;

public class WieMenu extends Menu {
	private MenuItem menuItem;

	public WieMenu(Decorations parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		MenuItem tools = new MenuItem(this, SWT.CASCADE);
		tools.setText("tools");
		Menu resultViewMenu = new Menu(getShell(), SWT.DROP_DOWN);
		tools.setMenu(resultViewMenu);
		MenuItem dataEditItem = new MenuItem(resultViewMenu, SWT.PUSH);
		dataEditItem.setText("open");

		// Add a new person when the user clicks button
		dataEditItem.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent event) {
				new DataEditor().run();
			}
		});
	}

	protected void checkSubclass() {
	}
}
