package aula;

import java.util.ArrayList;

public class Exercicio02 extends Thread {

	protected long from, to;
	ArrayList<Long> primeList = new ArrayList<Long>();

	public Exercicio02(long from, long to) {
		this.from = from;
		this.to = to;
	}

	public long count = 0;

	public void run() {
		for (long n = from; n <= to; n++) {
			boolean isPrime = true;
			for (long i = 2; i < n; i++) {
				if (n % i == 0) {
					isPrime = false;
					break;
				}
			}
			if (isPrime) {
				count++;
				primeList.add(n);
			}
		}
	}

	public ArrayList<Long> getPrimes() {
		return primeList;
	}

	public static void main(String[] args) throws Exception {
		Exercicio02 gen1 = new Exercicio02(1L, 15L);
		Exercicio02 gen2 = new Exercicio02(16L, 41L);
		Thread t1 = new Thread(gen1);
		Thread t2 = new Thread(gen2);
		
		t1.start();
		t2.start();
		t1.join();
		t2.join();
		
		gen1.getPrimes().forEach(primeList -> System.out.println(primeList));
		gen2.getPrimes().forEach(primeList -> System.out.println(primeList));
	}

}
