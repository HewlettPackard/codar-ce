package org.springframework.samples.petclinic;

import org.junit.Assert;
import org.junit.Test;

public class SimpleTest {
	
	@Test
	public void test() {
		SampleExample example = new SampleExample();
		example.addInteger(10);
		example.addInteger(100);
		Assert.assertEquals(example.getSize(), 2);
	}
}
