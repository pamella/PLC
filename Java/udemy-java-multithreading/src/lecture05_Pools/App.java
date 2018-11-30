package lecture05_Pools;
// Thread pools is a way to manage many threads at the same time

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

class Processor implements Runnable {
	private int id;
	
	public Processor(int id){
		// id is to know which thread we are dealing with
		this.id = id;
	}
	
	public void run(){
		System.out.println("Starting: " + id);
		
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Completed: " + id);
	}
}

public class App {

	public static void main(String[] args) {
		ExecutorService executor = Executors.newFixedThreadPool(2);
		
		for(int i = 0; i < 5; i++){
			executor.submit(new Processor(i));
		}
		
		executor.shutdown();
		
		System.out.println("All tasks submitted.");
		
		try {
			executor.awaitTermination(1, TimeUnit.DAYS);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("All tasks completed.");
	}

}
