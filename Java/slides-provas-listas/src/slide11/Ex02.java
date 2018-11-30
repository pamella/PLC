package slide11;

import java.util.ArrayList;
import java.util.Scanner;

public class Ex02 extends Thread {
	static ArrayList<Integer> primeList = new ArrayList<Integer>();
	private int from, to;

	public Ex02(int from, int to) {
		this.from = from;
		this.to = to;
	}

	public static ArrayList<Integer> getPrimes() {
		return primeList;
	}

	public synchronized void inc(int value) {
		primeList.add(value);
	}

	public void run() {
		for (int n = from; n <= to; n++) {
			boolean isPrime = true;
			for (int i = 2; i < n; i++) {
				if (n % i == 0) {
					isPrime = false;
					break;
				}
			}
			if (isPrime) {
				inc(n);
			}
		}
	}

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);

		System.out.println("Enter the prime limit.");
		int primeLimit = in.nextInt();
		System.out.println("Enter the amount of threads.");
		int threads = in.nextInt();

		int aux1 = 1;
		int aux2 = primeLimit / threads;

		for (int i = 1; i <= threads; i++) {
			new Ex02(aux1, aux2 * i).start();
			aux1 = aux2 * i;
		}
		
		System.out.println("Prime list below:");
		getPrimes().forEach(primeList -> System.out.println(primeList));

		in.close();
	}

}
