package org.rc.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Aspect
@Log
public class TimeChecker {

	 @Around("execution(* org.rc.service.*.*(..))")
	 public Object sampleAround(ProceedingJoinPoint jp) throws Throwable {
	        long start = System.currentTimeMillis();
	        
	        String methodName = jp.getSignature().getName();
	        
	        //Method.invoke()
	        Object result = jp.proceed(); 
	        
	        long end = System.currentTimeMillis();
	        
	        log.info(methodName + " " + (end - start));
	        
	        return result;
	    }


}
