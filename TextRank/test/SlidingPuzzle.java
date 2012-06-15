import javax.swing.JFrame;

///////////////////////////////////////////// class SlidePuzzle
public class SlidingPuzzle {
    //============================================= method main
    public static void main(String[] args) {
        JFrame window = new JFrame("Slide Puzzle");
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.setContentPane(new SlidingPuzzleGUI());
        window.pack();  // finalize layout
        window.show();  // make window visible
        window.setResizable(false);
    }//end main
}//endclass SlidePuzzle
