package slide13;

import java.util.Random;

public class Tree extends Thread {
	public int number;
	public Tree left, right;
	private Object lock = new Object();

	public Tree(int number) {
		this.number = number;
		left = null;
		right = null;
	}

	public Tree(int number, Tree left, Tree right) {
		this.number = number;
		this.left = left;
		this.right = left;
	}

	public void insert(Tree T, int num) {
		synchronized (lock) {
			if (T.number >= num) {
				if (T.left != null) {
					insert(T.left, num);
				} else {
					T.left = new Tree(num);
				}
			} else {
				if (T.right != null) {
					insert(T.right, num);
				} else {
					T.right = new Tree(num);
				}
			}
		}
	}

	public void run() {

	}

	public static void main(String[] args) {
		Random random = new Random();

		for (int i = 0; i < 50; i++) {
			new Tree(random.nextInt(100)).start();
		}

	}
}
