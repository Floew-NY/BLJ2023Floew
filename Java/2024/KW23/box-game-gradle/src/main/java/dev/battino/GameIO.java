package dev.battino;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class GameIO extends JFrame {

    private enum textureReference {
        BOX, FLOOR, WALL, PLAYER, BUTTON, ACTIVATED
    }

    private Game game;
    private BufferedImage displayArea;

    private int scale;


    private final Map<Integer, Runnable> inputMap;


    private final Map<textureReference, BufferedImage> textures = new HashMap<>();

    public GameIO(Game game, int scale) {
        this.game = game;
        this.scale = scale;


        inputMap = Map.of(KeyEvent.VK_UP, game::moveUp, KeyEvent.VK_DOWN, game::moveDown,
                KeyEvent.VK_LEFT, game::moveLeft, KeyEvent.VK_RIGHT, game::moveRight, KeyEvent.VK_ESCAPE,
                game::resetField);
        try {
            loadImages();
        } catch (IOException e) {
            e.printStackTrace();
        }

        initInput();
        initOutput();
        updateOutput();
    }

    private void initOutput() {
        displayArea = new BufferedImage(game.getRowCount() * scale, game.getColCount() * scale,
                BufferedImage.TYPE_INT_ARGB);

        this.getContentPane().add(new JLabel(new ImageIcon(displayArea)));
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);
        this.setTitle("Sokoban");
        this.pack();
        this.setLocationRelativeTo(null);
        this.setVisible(true);
    }

    private void initInput() {
        this.addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                if (inputMap.containsKey(e.getKeyCode())) {
                    inputMap.get(e.getKeyCode()).run();
                    updateOutput();
                }
            }
        });
    }

    private void loadImages() throws IOException {
        textures.put(textureReference.BOX, ImageIO.read(Objects.requireNonNull(getClass().getResourceAsStream("/box.png"))));
        textures.put(textureReference.FLOOR, ImageIO.read(Objects.requireNonNull(getClass().getResourceAsStream("/floor.png"))));
        textures.put(textureReference.WALL, ImageIO.read(Objects.requireNonNull(getClass().getResourceAsStream("/wall.png"))));
        textures.put(textureReference.PLAYER, ImageIO.read(Objects.requireNonNull(getClass().getResourceAsStream("/player.png"))));
        textures.put(textureReference.BUTTON, ImageIO.read(Objects.requireNonNull(getClass().getResourceAsStream("/goal.png"))));
        textures.put(textureReference.ACTIVATED, ImageIO.read(Objects.requireNonNull(getClass().getResourceAsStream("/box_on_goal.png"))));
    }

    private void updateOutput() {
        Graphics2D g2d = (Graphics2D) displayArea.getGraphics();

        for (int x = 0; x < game.getRowCount(); x++) {
            for (int y = 0; y < game.getColCount(); y++) {
                int scaledX = x * scale;
                int scaledY = y * scale;
                g2d.drawImage(textures.get(textureReference.FLOOR), scaledX, scaledY, scale, scale, null);
                switch (game.getTile(new Point(x, y))) {
                    case BOX -> g2d.drawImage(textures.get(textureReference.BOX), scaledX, scaledY, scale, scale, null);
                    case WALL ->
                            g2d.drawImage(textures.get(textureReference.WALL), scaledX, scaledY, scale, scale, null);
                    case BUTTON ->
                            g2d.drawImage(textures.get(textureReference.BUTTON), scaledX, scaledY, scale, scale, null);
                    case ACTIVE ->
                            g2d.drawImage(textures.get(textureReference.ACTIVATED), scaledX, scaledY, scale, scale, null);
                }
                if (game.isPlayer(x, y))
                    g2d.drawImage(textures.get(textureReference.PLAYER), scaledX, scaledY, scale, scale, null);
            }
        }
        g2d.setFont(new Font("Arial", Font.BOLD, 20));
        g2d.setColor(Color.RED);
        if (game.getWon())
            g2d.drawString("YOU WON", 100, 100);
        repaint();
    }
}
