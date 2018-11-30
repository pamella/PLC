package slide17;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

class Producer extends Thread {
	private BlockingQueue<Integer> bq;
	private int id;

	public Producer(BlockingQueue<Integer> bq, int id) {
		this.bq = bq;
		this.id = id;
	}

	public void run() {
		for (int i = 0; i < 10; i++) {
			try {
				bq.put(i);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Thread " + this.id + " puts: " + i);
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

class Consumer extends Thread {
	private BlockingQueue<Integer> bq;
	private int id;

	public Consumer(BlockingQueue<Integer> bq, int id) {
		this.bq = bq;
		this.id = id;
	}

	public void run() {
		for (int i = 0; i < 10; i++) {
			try {
				bq.take();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Thread " + this.id + " takes: " + i);
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

public class ProducerConsumer {

	public static void main(String[] args) throws InterruptedException {
		BlockingQueue<Integer> bq = new ArrayBlockingQueue<Integer>(10);
		Producer p = new Producer(bq, 1);
		Consumer c = new Consumer(bq, 1);

		p.start();
		c.start();
		
		p.join();
		c.join();
	}

}
