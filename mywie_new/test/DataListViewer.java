import java.util.Iterator;
import java.util.Vector;

import org.eclipse.jface.viewers.ISelectionChangedListener;
import org.eclipse.jface.viewers.IStructuredContentProvider;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.LabelProvider;
import org.eclipse.jface.viewers.ListViewer;
import org.eclipse.jface.viewers.SelectionChangedEvent;
import org.eclipse.jface.viewers.Viewer;
import org.eclipse.jface.viewers.ViewerFilter;
import org.eclipse.jface.viewers.ViewerSorter;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.RowLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Dialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;

public class DataListViewer extends Dialog{

//	Display display = new Display();
	private Shell shell;//= new Shell(display);

	ListViewer listViewer;

	/**
	 * Represents programming languages.
	 * 
	 */
	public static class Language {
		public String genre;
		public boolean isObjectOriented;

		public Language() {
		}

		public Language(String genre, boolean isObjectOriented) {
			this.genre = genre;
			this.isObjectOriented = isObjectOriented;
		}

		public String toString() {
			return "Lang: " + genre + " ["
					+ (isObjectOriented ? "Object-oriented" : "Procedural")
					+ "]";
		}
	}

	Vector semanticView = new Vector();

	private void init() {
//		languages.add(new Language("Java", true));
//		languages.add(new Language("C", false));
//		languages.add(new Language("C++", true));
//		languages.add(new Language("SmallTalk", true));

		listViewer = new ListViewer(shell);

		listViewer.setContentProvider(new IStructuredContentProvider() {
			public Object[] getElements(Object inputElement) {
				Vector v = (Vector) inputElement;
				return v.toArray();
			}

			public void dispose() {
				System.out.println("Disposing ...");
			}

			public void inputChanged(Viewer viewer, Object oldInput,
					Object newInput) {
				System.out.println("Input changed: old=" + oldInput + ", new="
						+ newInput);
			}
		});

		// listViewer.setContentProvider(new ArrayContentProvider());

		listViewer.setInput(semanticView);

		listViewer.setLabelProvider(new LabelProvider() {
			public Image getImage(Object element) {
				return null;
			}

			public String getText(Object element) {
				return ((Language) element).genre;
			}
		});

		listViewer.addSelectionChangedListener(new ISelectionChangedListener() {
			public void selectionChanged(SelectionChangedEvent event) {
				IStructuredSelection selection = (IStructuredSelection) event
						.getSelection();
				StringBuffer sb = new StringBuffer("Selection - ");
				sb.append("tatal " + selection.size() + " items selected: ");
				for (Iterator iterator = selection.iterator(); iterator
						.hasNext();) {
					sb.append(iterator.next() + ", ");
				}
				System.out.println(sb);
			}
		});

		listViewer.addFilter(new ViewerFilter() {
			public boolean select(Viewer viewer, Object parentElement,
					Object element) {

				if (((Language) element).isObjectOriented)
					return true;
				else
					return false;
			}
		});

		listViewer.setSorter(new ViewerSorter() {
			public int compare(Viewer viewer, Object e1, Object e2) {
				return ((Language) e1).genre.compareTo(((Language) e2).genre);
			}

		});

	}

	Button buttonRemove;

	private void addButtons() {
		
		Composite composite = new Composite(shell, SWT.NULL);
		FillLayout fillLayout = new FillLayout(SWT.VERTICAL);
		fillLayout.spacing = 2;

		composite.setLayout(fillLayout);

		buttonRemove = new Button(composite, SWT.PUSH);
		buttonRemove.setText("Remove");

		buttonRemove.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				IStructuredSelection selection = (IStructuredSelection) listViewer
						.getSelection();
				Language language = (Language) selection.getFirstElement();
				if (language == null) {
					System.out.println("Please select a language first.");
					return;
				}

				semanticView.remove(language);
				System.out.println("Removed: " + language);

				listViewer.refresh(false);
			}
		});
	}

	public DataListViewer(Shell parent) {
		 
		super(parent);
		shell = parent;
		
		RowLayout rowLayout = new RowLayout();
		shell.setLayout(rowLayout);

		(new Label(shell, SWT.NULL)).setText("ап╠М");

		init();

		addButtons();

		shell.pack();
		shell.open();
		// textUser.forceFocus();

		// Set up the event loop.
		Display display = parent.getDisplay();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				// If no more entries in event queue
				display.sleep();
			}
		}

		display.dispose();
	}

	public static void main(String[] args) {
		new DataListViewer(new Shell());
	}
}