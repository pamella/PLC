package ee2_2018_1;

import java.util.Random;

public class AppMyBQueue {

	public static void main(String[] args) {
		int size = 15;
		MyBQueue q = new MyBQueue(size);
		
		Random r = new Random();
		
		new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < size; i++) {
					try {
						q.push(r.nextInt(100));
						Thread.sleep(100);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}).start();

		new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < 4; i++) {
					try {
						q.pop();
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}).start();
		
	}

}
