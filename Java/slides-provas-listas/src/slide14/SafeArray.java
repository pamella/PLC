package slide14;

import java.util.ArrayList;
import java.util.concurrent.locks.*;

public class SafeArray {
	public ArrayList<Integer> list;
	private ArrayList<Lock> locks;

	public SafeArray() {
		list = new ArrayList<Integer>();
		locks = new ArrayList<Lock>();
	}

	public synchronized void add(Integer x) {
		list.add(x);
		locks.add(new ReentrantLock());
		System.out.println("add " + x);
	}

	public synchronized void remove(int index) {
		list.remove(index);
		locks.remove(index);
	}

	public synchronized void modify(int index, int value) {
		list.set(index, value);
	}

	public void swap(int i, int j) {
		boolean i_lock = locks.get(i).tryLock();
		boolean j_lock = locks.get(j).tryLock();

		while (!i_lock || !j_lock) {
			if (i_lock)
				locks.get(i).unlock();
			if (j_lock)
				locks.get(j).unlock();

			i_lock = locks.get(i).tryLock();
			j_lock = locks.get(j).tryLock();
		}

		int aux = list.get(i);
		list.set(i, list.get(j));
		list.set(j, aux);
		System.out.println("troca: " + i + " " + j);

		locks.get(i).unlock();
		locks.get(j).unlock();
	}

	public static void main(String[] args) {
		SafeArray safeArray = new SafeArray();
		Thread t = new Thread(() -> {
			for (int i = 0; i < 10; i++) {
				safeArray.add(i);
			}
		});
		t.start();
		try {
			t.join();
		} catch (Exception e) {

		}
		new Thread(() -> {
			for (int i = 0; i < 10; i++) {
				safeArray.swap(i, 9 - i);
			}
		}).start();
		new Thread(() -> {
			for (int i = 0; i < 10; i++) {
				safeArray.swap(i, 9 - i);
			}
		}).start();
	}
}