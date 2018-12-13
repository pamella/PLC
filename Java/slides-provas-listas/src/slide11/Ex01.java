package slide11;

class Processor extends Thread {
	private int id;
	private int count = 0;

	public Processor(int id) {
		// id is to know which thread we are dealing with
		this.id = id;
	}

	public void run() {
		while (this.count < 40000000) {
			this.count++;
		}

		System.out.println("Completed thread: " + this.id + " after counting " + this.count);
	}
}

public class Ex01 {

	public static void main(String args[]) {
		
		for (int i = 0; i < 50; i++) {
			new Processor(i).start();
		}
		
	}

}