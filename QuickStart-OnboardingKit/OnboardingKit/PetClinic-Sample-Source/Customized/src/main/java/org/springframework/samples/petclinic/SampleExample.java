package org.springframework.samples.petclinic;

import java.util.List;
import java.util.ArrayList;

public class SampleExample {
	private List<Integer> integers = null;
	
	public SampleExample() {
		integers = new ArrayList<Integer> ();
	}
	
	public void addInteger(int num) {
		integers.add(num);
	}
	
	public int getSize() {
		return integers.size();
	}
}
