///usr/bin/env jbang "$0" "$@" ; exit $? 

//DEPS com.github.javaparser:javaparser-symbol-solver-core:3.24.2

import com.github.javaparser.JavaParser;
import com.github.javaparser.ast.CompilationUnit;

import java.io.FileInputStream;

public class MethodPrinter {

  public static void main(String[] args) throws Exception {
    // creates an input stream for the file to be parsed
    FileInputStream in = new FileInputStream(args[0]);

    CompilationUnit cu;
    try {
      // parse the file
      cu = JavaParser.parse(in);
    } finally {
      in.close();
    }

    // visit and print the methods names
    new MethodVisitor().visit(cu, null);
  }

  /**
   * Simple visitor implementation for visiting MethodDeclaration nodes.
   */
  private static class MethodVisitor extends VoidVisitorAdapter {

    @Override
    public void visit(MethodDeclaration n, Object arg) {
      // here you can access the attributes of the method.
      // this method will be called for all methods in this
      // CompilationUnit, including inner class methods
      String name = n.getName();
      if(name.startsWith("_")){
      	System.out.println(n.getName());
      }
    }
  }
}
