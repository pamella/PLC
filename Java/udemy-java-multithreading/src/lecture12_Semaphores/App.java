package lecture12_Semaphores;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class App {

	public static void main(String[] args) throws InterruptedException {
		// maintains available permits
		// it is basically a lock
		// Semaphore s = new Semaphore(1);
		// increase the number of available permits
		// s.release();
		// decrease the number of available permits
		// s.acquire();
		// System.out.println("Available permits: " + s.availablePermits());

		ExecutorService executor = Executors.newCachedThreadPool();

		for (int i = 0; i < 200; i++) {
			executor.submit(new Runnable() {
				public void run() {
					Connection.getInstance().connect();					
				}
			});
		}
		
		executor.shutdown();
		executor.awaitTermination(1, TimeUnit.DAYS);

	}

}
