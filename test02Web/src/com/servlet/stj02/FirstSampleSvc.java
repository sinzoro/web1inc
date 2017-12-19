package com.servlet.stj02;



public class FirstSampleSvc {

	public Integer numSum( int num ) {
		
		int sum = 0;
		for( int i=1; i<=num; i++ ) {
			sum += i;
		}
		
		return sum;
	}
	
}
