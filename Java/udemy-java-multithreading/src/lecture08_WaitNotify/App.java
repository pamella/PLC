package lecture08_WaitNotify;

public class App {

	public static void main(String[] args) throws InterruptedException {
		final Processor processor = new Processor();

		// produce
		Thread t1 = new Thread(new Runnable() {
			public void run() {
				try {
					processor.produce();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		});

		// consume
		Thread t2 = new Thread(new Runnable() {
			public void run() {
				try {
					processor.consume();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		});

		t1.start();
		t2.start();
		
		t1.join();
		t2.join();
	}

}
