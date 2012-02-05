/*
 * Browser example snippet: modify HTML title tag
 *
 * For a list of all SWT example snippets see
 * http://dev.eclipse.org/viewcvs/index.cgi/%7Echeckout%7E/platform-swt-home/dev.html#snippets
 */
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.browser.ProgressEvent;
import org.eclipse.swt.browser.ProgressListener;
import org.eclipse.swt.browser.TitleEvent;
import org.eclipse.swt.browser.TitleListener;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class Snippet159 {
  public static void main(String[] args) {
    final String newTitle = "New Value for Title";
    Display display = new Display();
    final Shell shell = new Shell(display);
    shell.setLayout(new FillLayout());
    final Browser browser = new Browser(shell, SWT.NONE);
    browser.addTitleListener(new TitleListener() {
      public void changed(TitleEvent event) {
        System.out.println("TitleEvent: " + event.title);
        shell.setText(event.title);
      }
    });
    browser.addProgressListener(new ProgressListener() {
      public void changed(ProgressEvent event) {
      }

      public void completed(ProgressEvent event) {
        /*
         * Set HTML title tag using JavaScript and DOM when page has
         * been loaded
         */
        boolean result = browser.execute("document.title='" + newTitle
            + "'");
        if (!result) {
          /*
           * Script may fail or may not be supported on certain
           * platforms.
           */
          System.out.println("Script was not executed.");
        }
      }
    });
    /* Load an HTML document */
    browser.setUrl("http://www.eclipse.org");
    shell.open();
    while (!shell.isDisposed()) {
      if (!display.readAndDispatch())
        display.sleep();
    }
    display.dispose();
  }
}