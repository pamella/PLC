package lecture08_WaitNotify;

import java.util.Scanner;

public class Processor {

	public void produce() throws InterruptedException {
		synchronized (this) {
			System.out.println("Producer thread running...");
			// method of object class in java
			// wait the notify sync method ends in order to continue
			wait();
			System.out.println("Resumed.");
		}
	}

	public void consume() throws InterruptedException {
		Scanner in = new Scanner(System.in);
		Thread.sleep(2000);

		synchronized (this) {
			System.out.println("Waiting for return key.");
			in.nextLine();
			System.out.println("Return key pressed.");
			// notify all the threads that are waiting for the same lock
			// notify does not controll the lock
			// in this case, the wait will only continue after the thread sleep
			notify();
			Thread.sleep(5000);
			// the lock finishes when the sync method finishes
		}
	}
}
