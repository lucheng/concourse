// SlidePuzzleGUI.java - GUI for SlidePuzzle
// Guoqijun
//
// The SlidePuzzleGUI class creates a panel which 
//     contains two subpanels.
//     1. In the north is a subpanel for controls (just a button now).
//     2. In the center a graphics
// This needs a few improvements.  
//   Both the GUI and Model define the number or rows and columns.
//          How would you set both from one place? 

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;

/////////////////////////////////////////////////// class SlidePuzzleGUI
// This class contains all the parts of the GUI interface
public class SlidingPuzzleGUI extends JPanel {
    //=============================================== instance variables
    private GraphicsPanel    _puzzleGraphics;
    private SlidingPuzzleModel _puzzleModel = new SlidingPuzzleModel();
    //end instance variables


    //====================================================== constructor
    public SlidingPuzzleGUI() {
        //--- Create a button.  Add a listener to it.
        

        //--- Create control panel
        JPanel controlPanel = new JPanel();
        controlPanel.setLayout(new FlowLayout());
        
        
        //--- Create graphics panel
        _puzzleGraphics = new GraphicsPanel();
        
        //--- Set the layout and add the components
        this.setLayout(new BorderLayout());
        this.add(controlPanel, BorderLayout.NORTH);
        this.add(_puzzleGraphics, BorderLayout.CENTER);
    }//end constructor


    //////////////////////////////////////////////// class GraphicsPanel
    // This is defined inside the outer class so that
    // it can use the outer class instance variables.
    class GraphicsPanel extends JPanel implements MouseListener {
        private static final int ROWS = 3;
        private static final int COLS = 3;
        
        private static final int CELL_SIZE = 90; // Pixels
        private Font _biggerFont;
        
        
        //================================================== constructor
        public GraphicsPanel() {
            _biggerFont = new Font("SansSerif", Font.BOLD, CELL_SIZE/3);
            this.setPreferredSize(
                   new Dimension(CELL_SIZE * COLS, CELL_SIZE*ROWS));
            this.setBackground(Color.white);
            this.addMouseListener(this);  // Listen own mouse events.
        }//end constructor
        
        
        //=======================================x method paintComponent
        public void paintComponent(Graphics g) {
            super.paintComponent(g);
            for (int r=0; r<ROWS; r++) {
                for (int c=0; c<COLS; c++) {
                    int x = c * CELL_SIZE;
                    int y = r * CELL_SIZE;
                    String text = _puzzleModel.getFace(r, c);
                    if (text != null) {
                        g.setColor(Color.darkGray);
                        g.fillRect(x+2, y+2, CELL_SIZE-4, CELL_SIZE-4);
                        g.setColor(Color.white);
                        g.setFont(_biggerFont);
                        g.drawString(text, x+20, y+(3*CELL_SIZE)/4);
                    }
                }
            }
        }//end paintComponent
        
        
        //======================================== listener mousePressed
        public void mousePressed(MouseEvent e) {
            //--- map x,y coordinates into a row and col.
            int col = e.getX()/CELL_SIZE;
            int row = e.getY()/CELL_SIZE;
            
            if (!_puzzleModel.moveTile(row, col)) {
                // moveTile moves tile if legal, else returns false.
                Toolkit.getDefaultToolkit().beep();
            }
            
            this.repaint();
            if(Integer.parseInt(_puzzleModel.getFace(1,1))==4&&Integer.parseInt(_puzzleModel.getFace(0,1))==1&&Integer.parseInt(_puzzleModel.getFace(0,2))==2&&Integer.parseInt(_puzzleModel.getFace(1,0))==3&&Integer.parseInt(_puzzleModel.getFace(1,2))==5&&Integer.parseInt(_puzzleModel.getFace(2,0))==6&&Integer.parseInt(_puzzleModel.getFace(2,1))==7&&Integer.parseInt(_puzzleModel.getFace(2,2))==8){
            	int t= JOptionPane.showConfirmDialog(null,
            			   "You have win!","Would you like you play again?", JOptionPane.YES_NO_CANCEL_OPTION);
          
                if (t==0){
                	 _puzzleModel.reset();
                     _puzzleGraphics.repaint();
                	
                }      
                
               if (t==1){
            	   System.exit(0);
               }     }
        
// Show any updates to model.
        }//end mousePressed
        
        
        //========================================== ignore these events
        public void mouseClicked (MouseEvent e) {}
        public void mouseReleased(MouseEvent e) {}
        public void mouseEntered (MouseEvent e) {}
        public void mouseExited  (MouseEvent e) {}
       
    }//end class GraphicsPanel
    
    ////////////////////////////////////////// inner class NewGameAction
    public class NewGameAction implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            _puzzleModel.reset();
            _puzzleGraphics.repaint();
        }
        

    }//end inner class NewGameAction

}//end class SlidePuzzleGUI