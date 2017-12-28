package com.threadTest;




public class ThreadTest04 {

	public static void main(String[] args) {
		
		for(int i=1; i<=10; i++) {
			Thread thread = new Thread("thread-"+i);
			
			if( i != 10 && i != 5 ) {
				thread.setPriority( Thread.MIN_PRIORITY );	//1
			}else if( i == 5 ){
				thread.setPriority( Thread.NORM_PRIORITY );	//5
			}else{
				thread.setPriority( Thread.MAX_PRIORITY );	//10
			}
			
			thread.start();
		}
		
	}
	
}


class InnerThread extends Thread {

	public InnerThread( String threadName ) {
		setName( threadName );
	}

	@Override
	public void run() {

		for( long i=0; i<3000000000000L; i++ ) {
			
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
		}
		
		System.out.println( getName() + "thread end" );
	}
	
}

