package slide14;

import java.util.Random;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Conta extends Thread {
	private Lock l = new ReentrantLock();
	private double saldo;
	private int id;

	public Conta(int id, double saldo) {
		this.id = id;
		this.saldo = saldo;
	}

	// deve ser feito atomicamente
	public void transferir(Conta dest, double valor) {
		boolean t1 = l.tryLock();
		boolean t2 = dest.l.tryLock();

		try {
			while (!(t1 && t2)) {
				if (t1)
					l.unlock();
				if (t2)
					dest.l.unlock();
				t1 = l.tryLock();
				t2 = dest.l.tryLock();
			}

			this.saldo -= valor;
			dest.saldo += valor;

		} finally {
			if (t1)
				l.unlock();
			if (t2)
				dest.l.unlock();
		}
	}

}
