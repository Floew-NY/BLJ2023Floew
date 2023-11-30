package ch.battino;

import java.util.Scanner;

public class Tree {
    private final int treeHeight; // get from user input
    private int getNumberOfOrnaments; // get from user input
    private final int treeStumpBase = 4;
    private StringBuilder builtTree;

    public Tree() {
        System.out.println("Enter The Tree's Height:");
        this.treeHeight = inputInt();
    }

    private int findStump(int segments) {
        return isDivisible(treeHeight - treeStumpBase) ? 4 : 4 + ((treeHeight - treeStumpBase) % segments);
    }

    public int findSegments() {

        int numberOfLeaves = treeHeight - treeStumpBase;
        int segments = numberOfLeaves;
        if (isDivisible(numberOfLeaves)) {
            while (!((numberOfLeaves / segments) >= 4 && numberOfLeaves % segments == 0)) {
                segments--;
            }
        } else {
            segments = numberOfLeaves / 4;
        }
        System.out.println("segments" + segments + "\n" + "lines:" + (numberOfLeaves / segments));

        return segments;
    }

    private boolean isDivisible(int number) {
        for (int i = number - 1; i >= 4; i--) {
            if ((number % i) == 0) {
                return true;
            }
        }
        return false;
    }

    private int inputInt() {
        Scanner scan = new Scanner(System.in);
        do {
            try {
                int temp = scan.nextInt();
                scan.nextLine();
                scan.close();
                return temp;

            } catch (Exception ignored) {
                System.out.println("ENTER A NUMBER!!!");
                scan.nextLine();
            }
        } while (true);

    }


    public void buildTree() {
        builtTree = new StringBuilder();
        int segments = findSegments();
        int treeStump = findStump(segments);
        int linesPerSegment = (treeHeight - treeStump) / segments;
        int totalWidth = 1 + segments * (linesPerSegment + segments) * 2 - (segments - 1) * 2;
        int spacing = (totalWidth / 2) - 1;
        int count = 1;
        builtTree.append(" ".repeat(spacing + 1));
        builtTree.append("8\n");
        for (int segmentCount = 1; segmentCount <= segments; segmentCount++) {
            for (int lineOnSegment = 1; lineOnSegment <= linesPerSegment + segmentCount - 1; lineOnSegment++) {
                if (lineOnSegment == linesPerSegment + segmentCount - 1) {
                    //Added Leaf
                    builtTree.append(" ".repeat(spacing - 1));

                    //Added Leaf
                    builtTree.append("*".repeat(count * 2 + 3));
                } else {
                    //Added Leaf
                    builtTree.append(" ".repeat(spacing));

                    //Added Leaf
                    builtTree.append("*".repeat(count * 2 + 1));

                }
                //decreases Spacing for next iteration
                spacing -= 1;
                count += 1;
                //next line
                builtTree.append("\n");
            }
            //Indents
            spacing += 4;
            count -= 4;
        }
        for (int lineOfTreeStump = 0; lineOfTreeStump < treeStump; lineOfTreeStump++) {
            builtTree.append(" ".repeat(totalWidth / 2 - 1));
            builtTree.append("#".repeat(3));
            builtTree.append("\n");
        }
    }

    public void displayTree() {
        System.out.printf(builtTree.toString());
    }
}



