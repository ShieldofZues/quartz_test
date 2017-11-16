package com.snailxr.base;/**
 * @author alpha
 * @create 2017-11-03 10:57
 **/

import com.snailxr.base.support.spring.A;

/**
 *
 * @author alpha
 * @create 2017-11-03 10:57
 **/
public class Incss {
    public static void   dd() {
        Object oo = null;
        try {
            Class clas = Class.forName("com.snailxr.base.support.spring.B");
            oo = clas.newInstance();
            A a = (A) oo;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }


    }

    public static void main(String[] args) {
        dd();
    }
}