package com.threadTest;


public class ThreadTest05 {

	public static void main(String[] args) {
		
		WorkObject workObject = new WorkObject();
		
		Thread threadA = new ThreadA(workObject);
		Thread threadB = new ThreadB(workObject);
		
		threadA.start();
		threadB.start();
		
	}//main
}//ThreadTest05


class ThreadA extends Thread{
	
	WorkObject workObject;
	
	public ThreadA( WorkObject workObject ) {
		this.workObject = workObject;
	}
	
	@Override
	public void run() {
		for( int i=0;i<10;i++ ) {
			workObject.methodA();
		}	//for
	}	//run
}	//ThreadA


class ThreadB extends Thread{
	
WorkObject workObject;
	
	public ThreadB( WorkObject workObject ) {
		this.workObject = workObject;
	}
	
	@Override
	public void run() {
		for( int i=0;i<10;i++ ) {
			workObject.methodB();
		}	//for
	}	//run
}	//ThreadB


class WorkObject{
	
	public synchronized void methodA() {
		System.out.println("methodA() run");
		notify();
		
		try {
			wait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public synchronized void methodB() {
		System.out.println("methodB() run");
		notify();
		
		try {
			wait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
