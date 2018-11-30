package slide11;

import java.util.Scanner;

class Counter extends Thread {
	private int id;
	private int LIMIT;
	private int count = 0;

	public Counter(int id, int limit) {
		this.id = id;
		this.LIMIT = limit;
	}

	public void run() {
		while (this.count < this.LIMIT) {
			System.out.println("Thread " + this.id + "; Counter: " + this.count);
			this.count++;
		}
		System.out.println("Thread " + this.id + " finished.");
	}
}

public class Ex03 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int threads = in.nextInt();
		int limit = in.nextInt();

		for (int i = 0; i < threads; i++) {
			new Counter(i, limit).start();
		}

		in.close();
	}

}
