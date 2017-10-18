package org.rc.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rc.dto.SampleDTO;
import org.rc.mapper.SampleMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
@Log
public class MapperTest {
	
	@Inject
    private SampleMapper mapper;
    
    @Test
    public void test5() {
        
        log.info("" + mapper);
        
        SampleDTO dto = new SampleDTO();
        
        dto.setTitle("Test......");
        
        mapper.insert(dto);
    }

}
