package ee2_2017_2;

import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

public class AtomicAccount {
	private AtomicInteger id, balance;

	public AtomicAccount(AtomicInteger id, AtomicInteger balance) {
		this.id = id;
		this.balance = balance;
	}

	public void deposit(int value) {
		this.balance.addAndGet(value);

		System.out.println("Account: " + this.id.get() + " | Deposit: " + value + " | Balance: " + this.balance.get());
	}

	public synchronized int withdraw(int value) throws InterruptedException {
		if (this.balance.get() < value) {
			wait();
		}
		for (int i = 0; i < value; i++) {
			this.balance.getAndDecrement();
		}

		System.out.println("Account: " + this.id.get() + " | Withdraw: " + value + " | Balance: " + this.balance.get());
		notifyAll();

		return this.balance.get();
	}

	public static void main(String[] args) throws InterruptedException {
		AtomicAccount a = new AtomicAccount(new AtomicInteger(1), new AtomicInteger(10000));
		Random r = new Random();

		Thread t1 = new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < 5; i++) {
					a.deposit((100));
				}
			}
		});

		Thread t2 = new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < 5; i++) {
					try {
						a.withdraw(10);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		});

		t1.start();
		t2.start();

		t1.join();
		t1.join();

	}

}
