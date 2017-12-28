package com.threadTest;



public class ThreadTest01 extends Thread {

	String word;
	
	ThreadTest01(String word){
		this.word = word;
	}
	
	@Override
	public void run() {	// 쓰레드 실행 영역		
		
		while(true) {
			System.out.println( word );
		}
		
	}
	
	public static void main(String[] args) {
		
		ThreadTest01 thread01 = new ThreadTest01("thread 01");
		ThreadTest01 thread02 = new ThreadTest01("thread 02");
		
		thread01.start();
		thread02.start();
		
		
	}
	
	
}

