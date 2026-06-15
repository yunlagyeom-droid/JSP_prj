package day0612;

import java.util.ArrayList;
import java.util.List;

public class TestService {

	public List<TestDTO> searchMember(){
		List<TestDTO> list=new ArrayList<TestDTO>();
		list.add(new TestDTO("박지성", 25));
		list.add(new TestDTO("안정환", 26));
		list.add(new TestDTO("손흥민", 27));
		list.add(new TestDTO("이영표", 28));
		return list;
	}
		
}
