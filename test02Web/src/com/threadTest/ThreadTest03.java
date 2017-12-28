package com.threadTest;



public class ThreadTest03 {

	public static void main(String[] args) throws Exception {
		
		RunnerableThread rThread = new RunnerableThread();
		Thread t = new Thread(rThread);
		t.start();
		//t.join();
		System.out.println( "sum 값 : " + rThread.getSum() );
		
	}// main
	
	
}// ThreadTest03


class RunnerableThread implements Runnable{

	private int sum = 0;
	
	public int getSum() {
		return sum;
	}
	
	//@Override
	public void run() {

		for(int i=0;i<1000;i++) {
			sum = sum + i;
		}
		
	}//run
	
}// RunnerableThread