package slide12;

import java.util.Scanner;

class Counter {
	private long value;

	public Counter(long value) {
		this.value = value;
	}

	public synchronized long getAndIncrement() {
		return value++;
	}

}

public class Prime extends Thread {
	static Counter c = new Counter(1);
	private int id;
	
	public Prime(int id){
		this.id = id;
	}

	public static boolean isPrime(long n) {
		// check if n is a multiple of 2
		if (n % 2 == 0) {
			return false;
		}
		// if not, then just check the odds
		for (int i = 3; i * i <= n; i += 2) {
			if (n % i == 0)
				return false;
		}
		return true;
	}
	
	public void run() {
		long j = 0;

		while (j < 90) {
			j = c.getAndIncrement();
			if(isPrime(j)) {
				System.out.println("Thread " + id + " found the prime " + j);
			}
		}
	}

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("Enter the amount of threads.");
		int threads = in.nextInt();
		
		for (int i = 0; i < threads; i++) {
			new Prime(i).start();
		}
		
		in.close();
	}

}
