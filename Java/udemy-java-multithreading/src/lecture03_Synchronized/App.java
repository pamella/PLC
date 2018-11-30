package lecture03_Synchronized;

public class App {
	
	private int count = 0;
	
	// synchronized
	// it works as a lock method
	// if a thread is using and another one tries to use,
	// the second will have to wait the first one finish executing to also
	// get the access.	
	public synchronized void inc() {
		count++;
	}

	public static void main(String[] args) {
		App app = new App();
		app.dowork();
	}
	
	public void dowork() {
		Thread t1 = new Thread(new Runnable() {
			public void run() {
				for(int i = 0; i < 10000; i++) {
					inc();
				}
			}
		});
		
		Thread t2 = new Thread(new Runnable() {
			public void run() {
				for(int i = 0; i < 10000; i++) {
					inc();
				}
			}
		});
		
		t1.start();
		t2.start();
		
		try {
			t1.join();
			t2.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Count is: " + count);
	}

}
