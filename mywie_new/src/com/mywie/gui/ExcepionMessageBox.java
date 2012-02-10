package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;

public class ExcepionMessageBox {
	
  public ExcepionMessageBox(Shell shell) {
	  MessageBox messageBox = new MessageBox(shell, SWT.ICON_WARNING | SWT.ABORT | SWT.RETRY | SWT.IGNORE);
	    
	    messageBox.setText("Warning");
	    messageBox.setMessage("Save the changes before exiting?");
	    int buttonID = messageBox.open();
	    switch(buttonID) {
	      case SWT.YES:
	        // saves changes ...
	      case SWT.NO:
	        // exits here ...
	        break;
	      case SWT.CANCEL:
	        // does nothing ...
	    }
  }

  public static void main(String[] args) {
    new ExcepionMessageBox(new Shell());
  }
}


