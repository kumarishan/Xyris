package com.xyris

/**
 * @author ${user.name}
 */
object App {
  
  def foo(x : Array[String]) = x.foldLeft("")((a,b) => a + b)
  
  def main(args : Array[String]) {
    println( "Hello World!" )
    println("concat arguments = " + foo(args))
    HelloScala.helloScala
  }
  
  def helloJava():String = "Hello frim Scala"

}
