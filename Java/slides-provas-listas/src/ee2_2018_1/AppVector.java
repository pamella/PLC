package ee2_2018_1;

public class AppVector {

	public static void main(String[] args) {
		int size = 10;
		Vector v = new Vector(size);

		new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < size; i++) {
					v.set(i, i+1);
				}
			}
		}).start();

		new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < size / 2; i++) {
					v.swap(i, i * 2);
				}
			}
		}).start();

		new Thread(new Runnable() {
			public void run() {
				for (int i = 0; i < size; i++) {
					System.out.println("Position " + i + " is the value: " + v.get(i));
				}
			}
		}).start();
	}
}
