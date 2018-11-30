package lecture02_Volatile;

import java.util.Scanner;

class Processor extends Thread {
	// volatile is used to prevent threads caching variables
	// when they're not changed from within that thread
	public volatile boolean running = true;
	
	public void run() {
		while(running) {
			System.out.println("Hello");
			
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void shutdown() {
		running = false;
	}
	
}

public class App {

	public static void main(String[] args) {
		Processor p1 = new Processor();
		p1.start();
		
		System.out.println("Press return to stop...");
		Scanner in = new Scanner(System.in);
		in.nextLine(); // press enter
		
		p1.shutdown();
		
	}

}
