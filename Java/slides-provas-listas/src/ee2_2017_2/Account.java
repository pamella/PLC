package ee2_2017_2;

import java.util.Random;

public class Account {
	private int id, balance;

	public Account(int id, int balance) {
		this.id = id;
		this.balance = balance;
	}

	public synchronized void deposit(int value) throws InterruptedException {
		this.balance += value;

		Thread.sleep(100);
		
		System.out.println("Account: " + this.id + " | Deposit: " + value + " | Balance: " + this.balance);
	}

	public synchronized int withdraw(int value) throws InterruptedException {
		if (this.balance < value) {
			wait();
		}

		this.balance -= value;
		notifyAll();
		Thread.sleep(100);

		System.out.println("Account: " + this.id + " | Withdraw: " + value + " | Balance: " + this.balance);

		return this.balance;
	}

	public static void main(String[] args) throws InterruptedException {
		Account a = new Account(1, 10000);
		Random r = new Random();

		Thread t1 = new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < 5; i++) {
					try {
						a.deposit(r.nextInt(100));
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		});

		Thread t2 = new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < 5; i++) {
					try {
						a.withdraw(r.nextInt(1000));
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
		t2.join();

	}

}
