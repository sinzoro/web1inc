package com.threadTest;




public class ThreadTest02 implements Runnable {

	String word;
	
	ThreadTest02(String word){
		this.word = word;
	}
	
	//@Override
	public void run() {
		
		for(int i=0;i<5;i++) {
			System.out.println( i+"번째:"+word );
		}
		System.out.println( "쓰레드종료 : "+word );
	}
	
	public static void main(String[] args) {
		
		ThreadTest02 thread01 = new ThreadTest02("thread 01");
		ThreadTest02 thread02 = new ThreadTest02("thread 02");
		
//		thread01.run();
//		thread02.run();
//		new Thread(thread01).start();
//		new Thread(thread02).start();
		
		Thread t1 = new Thread(thread01);
		Thread t2 = new Thread(thread02);
		
		System.out.println( "t1 Thread name : "+ t1.getName() );
		System.out.println( "t2 Thread name : "+ t2.getName() );
		
		t1.start();
		t2.start();
		
	}
	
}
