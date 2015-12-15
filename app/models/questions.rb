class Questions

QUESTIONNAIRES = {
1 => { "I understand something better after I" => ["try it out", "think it through"]},
2 => { "I would rather be considered" => ["realistic", "innovative"]},
3 => { "When I think about what I did yesterday, I am most likely to get" => ["a picture", "words"]},
4 => { "I tend to" => ["understand details of a subject but may be fuzzy about its overall structure", "understand the overall structure but may be fuzzy about details"]},
5 => { "When I am learning something new, it helps me to" => [" talk about it", " think about it"]},
6 => { "If I were a teacher, I would rather teach a course" => [" that deals with facts and real life situations.", " that deals with ideas and theories"]},
7 => { "I prefer to get new information in" => [" pictures, diagrams, graphs, or maps", " written directions or verbal information"]},
8 => { "Once I understand" => [" all the parts, I understand the whole thing", " the whole thing, I see how the parts fit"]},
9 => { "In a study group working on difficult material, I am more likely to" => [" jump in and contribute ideas", " sit back and listen"]},
10 => { "I find it easier" => [" to learn facts", " to learn concepts"]},
11 => { "In a book with lots of pictures and charts, I am likely to" => [" look over the pictures and charts carefully", " focus on the written text"]},
12 => { "When I solve math problems" => [" I usually work my way to the solutions one step at a time", " I often just see the solutions but then have to struggle to figure out the steps to get to them"]},
13 => { "In classes I have taken" => [" I have usually gotten to know many of the students", " I have rarely gotten to know many of the students"]},
14 => { "In reading nonfiction, I prefer" => [" something that teaches me new facts or tells me how to do something", " something that gives me new ideas to think about"]},
15 => { "I like teachers" => [" who put a lot of diagrams on the board", " who spend a lot of time explaining"]},
16 => { "When I'm analyzing a story or a novel" => [" I think of the incidents and try to put them together to figure out the themes", " I just know what the themes are when I finish reading and then I have to go back and find the
incidents that demonstrate them"]},
17 => { "When I start a homework problem, I am more likely to" => [" start working on the solution immediately", " totry to fully understand the problem first"]},
18 => { "I prefer the idea of" => [" certainty", " theory"]},
19 => { "I remember best" => [" what I see", " what I hear"]},
20 => { "It is more important to me that an instructor" => [" lay out the material in clear sequential steps", " give me an overall picture and relate the material to other subjects"]},
21 => { "I prefer to study" => [" in a study group", " alone"]},
22 => { "I am more likely to be considered" => [" careful about the details of my work", " creative about how to do my work"]},
23 => { "When I get directions to a new place, I prefer" => [" a map", " written instructions"]},
24 => { "I learn" => [" at a fairly regular pace. If I study hard, I'll get it", " in fits and starts. I'll be totally confused and then suddenly it all clicks"]},
25 => { "I would rather first" => [" try things out", " think about how I'm going to do it"]},
26 => { "When I am reading for enjoyment, I like writers to" => [" clearly say what they mean", " say things in creative, interesting ways"]},
27 => { "When I see a diagram or sketch in class, I am most likely to remember" => [" the picture", " what the instructor said about it"]},
28 => { "When considering a body of information, I am more likely to" => [" focus on details and miss the big picture", " try to understand the big picture before getting into the details"]},
29 => { "I more easily remember" => [" something I have done", " something I have thought a lot about"]},
30 => { "When I have to perform a task, I prefer to" => [" master one way of doing it", " come up with new ways of doing it"]},
31 => { "When someone is showing me data, I prefer" => [" charts or graphs", " text summarizing the results."]},
32 => { "When writing a paper, I am more likely to" => [" work on (think about or write) the beginning of the paper and progress forward", " work on (think about or write) different parts of the paper and then order them"]},
33 => { "When I have to work on a group project, I first want to" => [" have group brainstorming where everyone contributes ideas", " brainstorm individually and then come together as a group to compare ideas"]},
34 => { "I consider it higher praise to call someone" => [" sensible", " imaginative"]},
35 => { "When I meet people at a party, I am more likely to remember" => [" what they looked like", " what they said about themselves"]},
36 => { "When I am learning a new subject, I prefer to" => [" stay focused on that subject, learning as much about it as I can", " try to make connections between that subject and related subjects"]},
37 => { "I am more likely to be considered" => [" outgoing", " reserved"]},
38 => { "I prefer courses that emphasize" => [" concrete material (facts, data)", " abstract material (concepts, theories)"]},
39 => { "For entertainment, I would rather" => [" watch television", " read a book"]},
40 => { "Some teachers start their lectures with an outline of what they will cover. Such outlines are" => [" somewhat helpful to me", " very helpful to me"]},
41 => { "The idea of doing homework in groups, with one grade for the entire group" => [" appeals to me", " does not appeal to me"]},
42 => { "When I am doing long calculations," => [" I tend to repeat all my steps and check my work carefully", " I find checking my work tiresome and have to force myself to do it"]},
43 => { "I tend to picture places I have been" => [" easily and fairly accurately", " with difficulty and without much detail"]},
44 => { "When solving problems in a group, I would be more likely to" => [" think of the steps in the solution process", " think of possible consequences or applications of the solution in a wide range of areas"]},
}

# ActiveRecord::Base.connection.execute("truncate table questionnaires")
  def self.questions
    [Java_Questions, Java_Questions_Char, Java_Questions_Lit,
      Java_Questions_Array, Java_Questions_Arit, Java_Questions_Bitwise,
      Java_Questions_Relational, Java_Questions_Ass, Java_Questions_Control,
      Java_Questions_Objects, Java_Questions_Methods, Java_Questions_Access,
      Java_Questions_String, Java_Questions_Inheritance
      ].each_with_index do |topic, ind|

      topic.each do |key, val|
        val.each do |question, choices|
          q = Questionnaire.create(question: question, tag: ind)
          choices.each do |choice|
            q.questionnaire_items.create(item: choice, is_answer: false)
          end
        end
      end
    end
  end

# I. Integer and Floating Data Types
Java_Questions = {

1 => { "What is the range of data type short in Java?" =>["-128 to 127"," -32768 to 32767","-2147483648 to 2147483647","None of the above"]},
2 => { "What is the range of data type byte in Java?" =>["-128 to 127"," -32768 to 32767","-2147483648 to 2147483647","None of the above"]},
3 => { "Which of the following are legal lines of Java code?\n1. int w = (int)888.8;\n2. byte x = (byte)100L;\n3. long y = (byte)100;\n4. byte z = (byte)100L;"=>["1 and 2","2 and 3","3 and 4","All of the statements are correct"]},
4 => { "An expression involving byte, int, and literal numbers is promoted to which of these?"=>["int"," long","-byte","float"]},
5 => { "Which of these literals can be contained in a data type float variable?"=>["1.7e-308"," 3.4e-038","1.7e+308","3.4e-050"]},
6 => { "Which data type value is returned by all transcendental math functions?"=>[" int"," float","double","long"]},
7 => { "What is the output of this program?<pre>1.class average{ \n2.  public static void main(String args[]) {  \n3.    double num[] = {5.5, 10.1, 11, 12.8, 56.9, 2.5};\n4.    double result; \n6.    result = 0\n7.    for (int i = 0; i < 6; ++i)\n8.\tresult = result + num[i] \n9.    System.out.print(result/6);  \n10. } \n11.}</pre>"=>["16.34"," 16.566666644","16.46666666666667"," 16.46666666666666"]},
8 => { "What is the output of this program?<pre>1. class conversion {\n2.   public static void main(String args[]) {    \n3.     double a = 295.04;\n4.     int  b = 300;\n5.     byte c = (byte) a;\n6.     byte d = (byte) b;\n7      System.out.println(c + " "  + d);\n8.   } \n9.}</pre>"=>["38 43"," 39 44","295 300","295.04 300"]},
9  => { "What is the output of this program?<pre>1.class increment {\n2.  public static void main(String args[]) {        \n3.    int g = 3;\n4.    System.out.print(++g * 8);\n5.  } \n6.}</pre>"=>[" 25"," 24","32","33"]},
10 =>{ "What is the output of this program?<pre>1. class area {\n2.  public static void main(String args[]) {    \n4.    double r, pi, a;\n5.    r = 9.8;\n6.    pi = 3.14;\n7.    a = pi * r * r;\n8.    System.out.println(a);\n9.  } \n10.}</pre>"=>["301.5656"," 301","301.56","301.56560000"]},

}

# II. Character and Boolean Datatypes of Java Programming Language
Java_Questions_Char = {
  1 => { "What is the numerical range of a char in Java?"=>["-128 to 127"," 0 to 256","0 to 32767","0 to 65535"]},
  2 => { "Which of these coding types is used for data type characters in Java?"=>["ASCII"," ISO-LATIN-1","UNICODE","None of the above"]},
  3 => { "Which of these values can a boolean variable contain?"=>["True & False"," 0 & 1","Any integer value","true"]},
  4 => { "Which of these occupy first 0 to 127 in Unicode character set used for characters in Java?"=>["ASCII"," 0ISO-LATIN-1","None of the aove","ASCII and ISO-LATIN1"]},
  5 => { "Which one is a valid declaration of a boolean?"=>["boolean b1 = 1;"," boolean b2 = ‘false’;","boolean b3 = false;","boolean b4 = ‘true’"]},
  6 => { "What is the output of this program?<pre>1. class array_output {\n2.  public static void main(String args[]) {    \n3.    char array_variable [] = new char[10];\n4.    for (int i = 0; i < 10; ++i) {\n5.      array_variable[i] = 'i';\n6.      System.out.print(array_variable[i] + "" );\n7.      i++;\n8.    }\n9.  } \n10.}</pre>"=>["i i i i i"," 0 1 2 3 4","i j k l m","None of the above"]},
  7 => { "What is the output of this program?<pre>1. class mainclass {\n2.  public static void main(String args[]) {\n3.    char a = 'A';\n4.    a++;\n5.    System.out.print((int)a);\n6.  } \n7. }</pre>"=>["66"," 67;","65","64"]},
  8 => { "What is the output of this program?<pre>1. class mainclass {\n2.  public static void main(String args[]) {\n3.    char a = 'A';\n4.    a++;\n5.    System.out.print((int)a);\n6.  } \n7. }</pre>"=>["0"," 1","true","false"]},
  9 => { "What is the output of this program?<pre>1. class booloperators {\n2.  public static void main(String args[]) {\n3.    boolean var1 = true;\n4.    boolean var2 = false;\n5.    System.out.println((var2 & var2));\n6.  } \n7. }</pre>"=>["0"," 1","true","false"]},
  10 => { "What is the output of this program?<pre>1 class asciicodes {\n2.  public static void main(String args[]) {\n3.    char var1 = 'A';\n4.    char var2 = 'a';\n5.    System.out.println((int)var1 + " " + (int)var2);\n6.  } \n7. }</pre>"=>["162","  65 97","67 95","66 98"]},

}

# III. Literals & variables of Java Programming Language
Java_Questions_Lit = {
  1 => { "Which of these is data type long literal? "=>[" 0x99fffL"," ABCDEFG"," 0x99fffa"," 99671246"]},
  2 => { "Which of these is returned by operators &, ?"=>["Integer"," Boolean"," Character"," Float"]},
  3 => { "Literals in java must be preceded by which of these?"=>["L"," I"," D"," L and I "]},
  4 => { "Literal can be of which of these data types?"=>[" integer"," float"," boolean"," all of the above"]},
  5 => { "Which of these can not be used for a variable name in Java?"=>[" identifier"," keyword"," identifier & keyword"," None of the above"]},
  6 => { "What is the output of this program?<pre>1. class evaluate {\n2.  public static void main(String args[]) {\n3.    int a[] = {1,2,3,4,5};\n4.    int d[] = a;\n5.    int sum = 0;\n6.    for (int j = 0; j < 3; ++j)\n7.      sum += (a[j] * d[j + 1]) + (a[j + 1] * d[j]);\n8.    System.out.println(sum);\n9. } \n10.}</pre>"=>["38","39","40","41"]},
  7 => { "What is the output of this program?<pre>1. class array_output {\n2.  public static void main(String args[]) {\n3.    int array_variable [] = new int[10];\n4.    for (int i = 0; i < 10; ++i) {\n5.      array_variable[i] = i/2;\n6.      array_variable[i]++;\n7.      System.out.print(array_variable[i] + " ");\n8.      i++;\n9.    }\n10. } \n11.}</pre>"=>["0 2 4 6 8"," 1 2 3 4 5"," 0 1 2 3 4 5 6 7 8 9"," 1 2 3 4 5 6 7 8 9 10"]},
  8 => { "What is the output of this program?<pre>1. class variable_scope {\n2.  public static void main(String args[]) {\n3.    int x;\n4.    x = 5;\n5.    {\n6.      int y = 6;\n7.      System.out.print(x + " " + y);\n8.    }\n9.    System.out.println(x + " " + y);\n10. } \n11.}</pre>"=>["5 6 5 6"," 5 6 5"," Runtime error"," Compilation error"]},
  9 => { " Which of these is incorrect string literal? "=>[' "Hello World"',' "Hello\nWorld"',' "\"Hello World"',' "Hello world"']},
  10 => { "What is the output of this program?<pre>1. class dynamic_initialization {\n2.  public static void main(String args[]) {\n3.    double a, b;\n4.    a = 3.0;\n5.    b = 4.0;\n6.    double c = Math.sqrt(a * a + b * b);\n7.    System.out.println(c);\n8.  } \n9. }</pre>"=>[" 5.0"," 25.0"," 7.0"," Compilation Error"]},
}

# IV. Array Data Structure of Java Programming Language
Java_Questions_Array = {
  1 => { "Which of these operators is used to allocate memory to array variable in Java?"=>[" malloc"," alloc"," new"," new malloc"]},
  2 => { "Which of these is an incorrect array declaration?"=>[" intarr[] = new int[5]"," int [] arr = new int[5]"," intarr[]arr = new int[5]"," intarr[] = int [5] new"]},
  3 => { "What will this code print? intarr[] = new int [5]; System.out.print(arr);"=>[" 0"," value stored in arr[0]."," 00000"," Garbage value"]},
  4 => { "Which of these is an incorrect Statement?"=>[" It is necessary to use new operator to initialize an array."," Array can be initialized using comma separated expressions surrounded by curly braces."," Array can be initialized when they are declared."," None of the above"]},
  5 => { "Which of these is necessary to specify at time of array initialization?"=>[" Row"," Column"," Both Row and Column"," None of the above"]},
  6 => { "What is the output of this program?<pre>1. class array_output {\n2.   public static void main(String args[]) {\n3.     int array_variable [] = new int[10];\n4.     for (int i = 0; i < 10; ++i) {\n5.       array_variable[i] = i;\n6.       System.out.print(array_variable[i] + " ");\n7.       i++;\n8.     }\n9.  } \n10.}</pre>"=>[" 0 2 4 6 8"," 1 3 5 7 9"," 0 1 2 3 4 5 6 7 8 9"," 1 2 3 4 5 6 7 8 9 10"]},
  7 => { "What is the output of this program?<pre>1. class multidimention_array {\n2.   public static void main(String args[]) {\n3.     int arr[][] = new int[3][];\n4.     arr[0] = new int[1];\n5.     arr[1] = new int[2];\n6.     arr[2] = new int[3];\n7.     int sum = 0;\n8.     for (int i = 0; i < 3; ++i)\n9.       for (int j = 0; j < i + 1; ++j)\n10.        arr[i][j] = j + 1;\n11.        for (int i = 0; i < 3; ++i)\n12.          for (int j = 0; j < i + 1; ++j)\n13.            sum + = arr[i][j];\n14.    System.out.print(sum);\n15.  }\n16.}</pre>"=>["11"," 10"," 13"," 14"]},
  8 => { "What is the output of this program?<pre>1. class evaluate {\n2.   public static void main(String args[]) {\n3.     int arr[] = new int[] {0 , 1, 2, 3, 4, 5, 6, 7, 8, 9};\n4.     int n = 6;\n5.     n = arr[arr[n] / 2];\n6.     System.out.println(arr[n] / 2);\n7.   } \n8. }</pre>"=>["3","0"," 6"," 1"]},
  9 => { "What is the output of this program?<pre>1.class array_output {\n2.  public static void main(String args[]) {\n3.    char array_variable [] = new char[10];\n4.    for (int i = 0; i < 10; ++i) {\n5.      array_variable[i] = 'i';\n6.      System.out.print(array_variable[i] + "");\n7.    }\n8.  }\n9.}</pre>"=>["1 2 3 4 5 6 7 8 9 10"," 0 1 2 3 4 5 6 7 8 9 10"," i j k l m n o p q r"," iiiiiiiiii"]},
  10 => { "What is the output of this program?<pre>1. class array_output {\n2.   public static void main(String args[]) {\n3.     int array_variable[][] = {{ 1, 2, 3}, { 4 , 5, 6}, { 7, 8, 9}};\n4.     int sum = 0;\n5.     for (int i = 0; i < 3; ++i)\n6.       for (int j = 0; j <  3 ; ++j)\n7.         sum = sum + array_variable[i][j];\n8.     System.out.print(sum / 5);\n9.   } \n10.}</pre>"=>["8"," 9"," 10"," 11"]}
}

# V. Arithmetic Operators
Java_Questions_Arit = {

  1 => { "Which of the following can be operands of arithmetic operators?"=>[" Numeric"," Boolean"," Characters"," Both Boolean & Characters"]},
  2 => { "Modulus operator, %, can be applied to which of these?"=>[" Integers"," Floating – point numbers"," Both Integers and floating – point numbers."," None of the above"]},
  3 => { "With x = 0, which of the following are legal lines of Java code for changing the value of x to 1? 1. x++; 2. x = x + 1; 3. x += 1;4. x =+ 1;"=>[" 1, 2 & 3"," 1 & 4"," 1, 2, 3 & 4"," 3 & 2"]},
  4 => { "Decrement operator, –, decreases value of variable by what number?"=>[" 1"," 2"," 3"," 4"]},
  5 => { "Which of these statements are incorrect?"=>[" Assignment operators are more efficiently implemented by Java run-time system than their equivalent long forms."," Assignment operators run faster than their equivalent long forms."," Assignment operators can be used only with numeric and character data type."," None"]},
  6 => { "What is the output of this program?<pre>1.class increment {\n2.  public static void main(String args[]) {\n3.    double var1 = 1 + 5;\n4.    double var2 = var1 / 4;\n5.    int var3 = 1 + 5;\n6.    int var4 = var3 / 4;\n7.    System.out.print(var2 + " " + var4);\n8.  }\n9.}</pre>"=>["1 1"," 0 1"," 1.5 1"," 1.5 1.0"]},
  7 => { "What is the output of this program?<pre>1.class Modulus {\n2.  public static void main(String args[]) {    \n3.    double a = 25.64;\n4.    int  b = 25;\n5.    a = a % 10;\n6.    b = b % 10;\n7.    System.out.println(a + " "  + b);\n8.  } \n9.}</pre>"=>["5.640000000000001 5"," 5.640000000000001 5.0"," 5 5"," 5 5.640000000000001"]},
  8 => { "What is the output of this program?<pre>1.class increment {\n2.    public static void main(String args[]) {        \n3.         int g = 3;\n4.         System.out.print(++g * 8);\n5.    } \n6.}</pre>"=>[" 25"," 24"," 32"," 33"]},
  9 => { "What is the output of this program?<pre>1. class Output {\n2.   public static void main(String args[]) {    \n3.     int x , y;\n4.     x = 10;\n5.     x++;\n6.     --x;\n7.     y = x++;\n8.     System.out.println(x + " " + y);\n9.  } \n10.}</pre>"=>["11 11"," 10 10"," 11 10"," 10 11"]},
  10 => { "What is the output of this program?<pre>1. class Output {\n2.   public static void main(String args[]) {    \n3.     int a = 1;\n4.     int b = 2;\n5.     int c;\n6.     int d;\n7.     c = ++b;\n8.     d = a++;\n9.     c++;\n10.    b++;\n11.    ++a;\n12.    System.out.println(a + " " + b + " " + c);\n13.  } \n14.}</pre>"=>[" 3 2 4"," 3 2 3"," 2 3 4"," 3 4 4"]},
}


# VI. Java Questions & Answers – Bitwise Operators
Java_Questions_Bitwise = {
  1 => { "Which of these is not a bitwise operator?"=>[" &"," &="," |="," <="]},
  2 => { "Which operator is used to invert all the digits in binary representation of a number?"=>[" ~"," <<<"," >>>"," ^"]},
  3 => { "On applying Left shift operator, <<, on an integer bits are lost one they are shifted past which position bit?"=>[" 1"," 32"," 33"," 31"]},
  4 => { "Which right shift operator preserves the sign of the value?"=>[" <<"," >>","  <<="," >>="]},
  5 => { "Which of these statements are incorrect?"=>[" The left shift operator, <<, shifts all of the bite in a value to the left specified number of times."," The right shift operator, >>, shifts all of the bite in a value to the right specified number of times."," The left shift operator can be used as an alternative to multiplying by 2.
"," The right shift operator automatically fills the higher order bits with 0"]},
  6 => { "What is the output of this program?<pre>1.class bitwise_operator {\n2.  public static void main(String args[])\n3.  {\n4.    int var1 = 42;\n5.    int var2 = ~var1;\n6.    System.out.print(var1 + " " + var2);\n7.  }\n8.}</pre>"=>["42 42"," 43 43"," 42 -43"," 42 43"]},
  7 => { "What is the output of this program?<pre>1. class bitwise_operator {\n2.   public static void main(String args[])\n3.   {\n4.     int a = 3;\n5.     int b = 6;\n6.     int c = a | b;\n7.     int d = a & b;\n8.     System.out.println(c + " "  + d);\n9.   }\n10.}</pre>"=>["7 2"," 7 7"," 7 5"," 5 2"]},
  8 => { "What is the output of this program?<pre>1. class leftshift_operator {\n2.   public static void main(String args[])\n3.   {\n4.     byte x = 64;\n5.     int i;\n6.     byte y;\n7.     i = x << 2;\n8.     y = (byte) (x << 2)\n9.     System.out.print(i + " " + y);\n10.  }\n11.}</pre>"=>[" 0 64"," 64 0"," 0 256"," 256 0"]},
  9 => { "What is the output of this program?<pre>1.class rightshift_operator {\n2.  public static void main(String args[])\n3.  {\n4.    int x;\n5.    x = 10;\n6.    x = x >> 1;\n7.    System.out.println(x);\n8.  }\n9.}</pre>"=>["10"," 5"," 2"," 20"]},
  10 => { "What is the output of this program?<pre>1. class Output {\n2.   public static void main(String args[])\n3.   {\n4.     int a = 1;\n5.     int b = 2;\n6.     int c = 3;\n7.     a |= 4;\n8.     b >>= 1;\n9.     c <<= 1;\n10.    a ^= c;\n11.    System.out.println(a + " " + b + " " + c);\n12.  }\n13.}</pre>"=>["3 1 6"," 2 2 3"," 2 3 4"," 3 3 6"]},
}

# VII. Relational Operators and Boolean Logic Operators
Java_Questions_Relational = {
  1 => { "What is the output of relational operators?"=>[" Integer"," Boolean"," Characters"," Double"]},
  2 => { "Which of these is returned by greater than, <, and equal to, ==, operator?"=>[" Integers"," Floating - point numbers"," Boolean"," None of the above"]},
  3 => { "Which of the following operators can operate on a boolean variable?1. &&2. ==3. ?:4. +="=>[" 3 & 2"," 1 & 4"," 1, 2 & 4"," 1, 2 & 3"]},
  4 => { "Which of these operators can skip evaluating right hand operand?"=>[" !"," |"," &"," &&"]},
  5 => { "Which of these statement is correct?"=>[" true and false are numeric values 1 and 0."," true and false are numeric values 0 and 1."," true is any non zero value and false is 0."," true and false are non numeric values."]},
  6 => { "What is the output of this program?<pre>1.class Relational_operator {\n2.  public static void main(String args[])\n3.  {\n4.    int var1 = 5;\n5.    int var2 = 6;\n6.    System.out.print(var1 > var2);\n7.  }\n8.}</pre>"=>[" 1","0"," true"," false"]},
  7 => { "What is the output of this program?<pre>1.class bool_operator {\n2.  public static void main(String args[])\n3.  {\n4.    boolean a = true;\n5.    boolean b = !true;\n6.    boolean c = a | b;\n7.    boolean d = a & b;\n8.    boolean e = d ? b : c;\n9.    System.out.println(d + " " + e);\n10. }\n11.}</pre>"=>["falsefalse"," true ture"," true false"," false true"]},
  8 => { "What is the output of this program?<pre>1. class ternary_operator {\n2.   public static void main(String args[])\n3.   {\n4.     int x = 3;\n5.     int y =~ x;\n6.     int z;\n7.     z = x > y ? x : y;\n8.     System.out.print(z);\n9.   }\n10.}</pre>"=>["0"," 1"," 3"," -4"]},
  9 => { "What is the output of this program?<pre>1. class Output {\n2.   public static void main(String args[])\n3.   {\n4.     int x , y = 1;\n5.     x = 10;\n6.     if (x != 10 && x / 0 == 0)\n7.       System.out.println(y);\n8.     else\n9.       System.out.println(++y);\n10.  }\n11.}</pre>"=>[" 1"," 2"," Runtime error owing to division by zero in if condition."," Unpredictable behavior of program."]},
  10 => { "What is the output of this program?<pre>1.class Output {\n2.  public static void main(String args[])\n3.  {\n4.     boolean a = true;\n5.     boolean b = false;\n6.     boolean c = a ^ b;\n7.     System.out.println(!c);\n8.  }\n9.}</pre>"=>["0"," 1"," false"," true"]},

}

# VIII. Assignment Operators and Operator Precedence
Java_Questions_Ass = {

  1 => { "Which of these have highest precedence?"=>[" ()","++","*",">>"]},
  2 => { "What should be expression1 evaluate to in using ternary operator as in this line?expression1 ?expression2 : expression3"=>[" Integer"," Floating – point numbers"," Boolean"," None of the above"]},
  3 => { "What is the value stored in x in following lines of code?int x, y, z;x = 0;y = 1;x = y = z = 8;"=>[" 0"," 1"," 9"," 8"]},
  4 => { "What is the order of precedence (highest to lowest) of following operators? 1. &2. ^3. ?:"=>[" 1 -> 2 -> 3"," 2 -> 1 -> 3"," 3 -> 2 -> 1"," 2 -> 3 -> 1"]},
  5 => { "Which of these statements are incorrect?1. &2. ^3. ?:"=>[" Equal to operator has least precedence."," 2 Brackets () have highest precedence."," Division operator, /, has higher precedence than multiplication operator."," Addition operator, +, and subtraction operator have equal precedence."]},

  6 => { "What is the output of this program?<pre>1. class operators {\n2.   public static void main(String args[])\n3.   {\n4.     int var1 = 5;\n5.     int var2 = 6;\n6.     int var3;\n7.     var3 = ++ var2 * var1 / var2 + var2;\n8.     System.out.print(var3);\n9.   }\n10.}</pre>"=>["10"," 11"," 12"," 56"]},
  7 => { "What is the output of this program?<pre>1.class operators {\n2.  public static void main(String args[])\n3.  {\n4.    int x = 8;\n5.    System.out.println(++x * 3 + " " + x);\n6.  }\n7.}</pre>"=>["24 8"," 24 9"," 27 8"," 27 9"]},
  8 => { "What is the output of this program?<pre>1. class ternary_operator {\n2.   public static void main(String args[])\n3.   {\n4.     int x = 3;\n5.     int y = ~ x;\n6.     int z;\n7.     z = x > y ? x : y;\n8.     System.out.print(z);\n9.   }\n10.}</pre>"=>[" 0","1"," 3"," -4"]},
  9 => { "Which of these lines of code will give better performance?1. a | 4 + c >> b & 7;2. (a | ((( 4 * c ) >> b ) & 7 ))"=>[" 1 will give better performance as it has no parentheses."," 2 will give better performance as it has parentheses."," Both 1 & 2 will give equal performance."," Dependent on the computer system."]},
  10 => { "What is the output of this program?<pre>1. class Output {\n2.   public static void main(String args[])\n3.   {\n4.     int x , y = 1;\n5.     x = 10;\n6.     if (x != 10 && x / 0 == 0)\n7.       System.out.println(y);\n8.     else\n9.       System.out.println(++y);\n10.  }\n11.}</pre>"=>["1" , "2"," Runtime error owing to division by zero in if condition."," Unpredictable behavior of program."]}
}



# IX. Control Statements
Java_Questions_Control = {
  1 => { "Which of these selection statements test only for equality?"=>[" if"," switch"," if & switch"," None of the above"]},
  2 => { "Which of these are selection statements in Java?"=>[" if()","for()","continue"," break"]},
  3 => { "Which of the following loops will execute the body of loop even when condition controlling the loop is initially false?"=>[" do-while"," while"," for"," None of the above"]},
  4 => { "Which of these jump statements can skip processing remainder of code in its body for a particular iteration?"=>[" break"," return"," exit"," continue"]},
  5 => { "Which of these statement is correct?"=>[" switch statement is more efficient than a set of nested ifs."," two case constants in the same switch can have identical values."," switch statement can only test for equality, whereas if statement can evaluateany type of boolean expression."," it is possible to create a nested switch statements."]},
  6 => { "What is the output of this program?<pre>1. class selection_statements {\n2.   public static void main(String args[])\n3.   {\n4.     int var1 = 5;\n5.     int var2 = 6;\n6.     if ((var2 = 1) == var1)\n7.       System.out.print(var2);\n8.     else \n9.       System.out.print(++var2);\n10.  } \n11.}</pre>"=>["1"," 2"," 3"," 4"]},
  7 => { "What is the output of this program?<pre>1.class comma_operator {\n2.  public static void main(String args[]) \n3.  {\n4.    int sum = 0;\n5.    for (int i = 0, j = 0; i < 5 & j < 5; ++i, j = i + 1)\n6.      sum += i;\n7.    System.out.println(sum);\n8.  } \n9.}</pre>"=>["5"," 6"," 14"," compilation error"]},
  8 => { "What is the output of this program?<pre>1. class jump_statments {\n2.   public static void main(String args[])\n3.   {\n4.     int x = 2;\n5.     int y = 0;\n6.     for ( ; y < 10; ++y) {\n7.       if (y % x == 0)\n8.         continue;\n9.       else if (y == 8)\n10.        break;\n11.      else\n12.        System.out.print(y + " ");\n13.    }\n14.  }\n15.}</pre>"=>["1 3 5 7"," 2 4 6 8"," 1 3 5 7 9"," 1 2 3 4 5 6 7 8 9"]},
  9 => { "What is the output of this program?<pre>1. class Output {\n2.   public static void main(String args[])\n3.   {\n4.     int x, y = 1;\n5.     x = 10;\n6.     if (x != 10 && x / 0 == 0)\n7.       System.out.println(y);\n8.     else\n9.       System.out.println(++y);\n10.  }\n11.}</pre>"=>["1"," 2"," Runtime error owing to division by zero in if condition."," Unpredictable behavior of program."]},
  10 => { "What is the output of this program?<pre>1. class Output {\n2.     public static void main(String args[])\n3.     {\n4.          int a = 5;\n5.          int b = 10;\n6.          first: {\n7.             second: {\n8.                third: {\n9.                    if (a ==  b >> 1)\n10.                       break second;\n11.                      }\n12.               System.out.println(a);\n13.            }\n14.            System.out.println(b);\n15.         }\n16.    }\n17.}</pre>"=>["5 10"," 10 5"," 5"," 10"]},
}

# X. Class Fundamentals & Declaring objects
# 8 => { "What is the output of this program?<pre></pre>"=>[]},
Java_Questions_Objects = {
  1 => { "What is the stored in the object obj in following lines of code?boxobj;"=>[" What is the stored in the object obj in following lines of code?
boxobj;"," NULL"," Any arbitrary pointer"," Garbage"]},
  2 => { "Which of these keywords is used to make a class?"=>[" class"," struct"," int"," None of the above"]},
  3 => { "Which of the following is a valid declaration of an object of class Box?"=>[" Box obj = new Box();","Box obj = new Box;"," obj = new Box();","new Box obj;"]},
  4 => { "Which of these operators is used to allocate memory for an object?"=>[" malloc"," alloc"," new"," give"]},
  5 => { "Which of these statement is incorrect?"=>[" Every class must contain a main() method."," Applets do not require a main() method at all."," There can be only one main() method in a program."," main() method must be made public."]},
  6 => { "What is the output of this program?<pre>1.class main_class {\n2.  public static void main(String args[])\n3.  {\n4.    int x = 9;\n5.    if (x == 9) { \n6.      int x = 8;\n7.      System.out.println(x);\n8.    }\n9.  } \n10}</pre>"=>["9"," 8"," Compilation error"," Runtime error"]},
  7 => { "Which of the following statements is correct?"=>[" Public method is accessible to all other classes in the hierarchy"," Public method is accessible only to subclasses of its parent class"," Public method can only be called by object of its class"," Public method can be accessed by calling object of the public class."]},
  8 => { "What is the output of this program?<pre>1. class box {\n2.   int width;\n3.   int height;\n4.   int length;\n5. } \n6. class mainclass {\n7.   public static void main(String args[]) \n8.   {        \n9.     box obj = new box();\n10.    obj.width = 10;\n11.    obj.height = 2;\n12.    obj.length = 10;\n13.    int y = obj.width * obj.height * obj.length; \n14.    System.out.print(y);\n15.  } \n16.}</pre>"=>[" 12"," 200"," 400"," 100"]},
  9 => { "What is the output of this program?<pre>1. class box {\n2.   int width;\n3.   int height;\n4.   int length;\n5. } \n6. class mainclass {\n7.   public static void main(String args[]) \n8.   {        \n9.     box obj1 = new box();\n10.    box obj2 = new box();\n11.    obj1.height = 1;\n12.    obj1.length = 2;\n13.    obj1.width = 1;\n14.    obj2 = obj1;\n15.    System.out.println(obj2.height);\n16.  } \n17.}</pre>"=>["1"," 2"," Runtime error"," Garbage value"]},
  10 => { "What is the output of this program?<pre>1. class box {\n2.   int width;\n3.   int height;\n4.   int length;\n5.  } \n6. class mainclass {\n7.   public static void main(String args[]) \n8.   {        \n9.     box obj = new box();\n10.    System.out.println(obj);\n11.  } \n12.}</pre>"=>["0"," 1"," Runtime error"," Garbage value"]},
}

# XI. Introduction to Methods
# 8 => { "What is the output of this program?<pre></pre>"=>[]},
Java_Questions_Methods = {
  1 => { "What is the return type of a method that does not returns any value?"=>[" int"," float"," void"," double"]},
  2 => { "What is the process of defining more than one method in a class differentiatedby method signature?"=>[" Function overriding"," Function overloading"," Function doubling"," None of the above"]},
  3 => { "Which of the following is a method having same name as that of its class?"=>[" finalize"," delete"," class"," constructor"]},
  4 => { "Which method can be defined only once in a program?"=>[" main method"," finalize method"," static method"," private method"]},
  5 => { "Which of these statement is incorrect?"=>[" All object of a class are allotted memory for the all the variables defined in theclass."," If a function is defined public it can be accessed by object of other class by inheritation."," If a function is defined public it can be accessed by object of other class by inheritation."," All object of a class are allotted memory for the methods defined in the class."]},
  6 => { "What is the output of this program?<pre>1. class box {\n2.   int width;\n3.   int height;\n4.   int length;\n5.   int volume;\n6.   void volume(int height, int length, int width) {\n7.    volume = width*height*length;\n8.   } \n9. }    \n10.class Prameterized_method{\n11.  public static void main(String args[])\n12.  {\n13.    box obj = new box();\n14.    obj.height = 1;\n15.    obj.length = 5;\n16.    obj.width = 5;\n17.    obj.volume(3,2,1);\n18.    System.out.println(obj.volume);        \n19.  } \n20.}</pre>"=>["0"," 1"," 6"," 25"]},
  7 => { "What is the output of this program?<pre>1.class equality {\n2.  int x;\n3.  int y;\n4.  boolean isequal(){\n5.  return(x == y);  \n6.  } \n7.}    \n8. class Output {\n9.   public static void main(String args[])\n10.  {\n11.    equality obj = new equality();\n12.    obj.x = 5;\n13.    obj.y = 5;\n14.    System.out.println(obj.isequal); } \n15.  }</pre>"=>[" false"," true"," 0"," 1"]},
  8 => { "What is the output of this program?<pre>1. class box {\n2.   int width;\n3.   int height;\n4.   int length;\n5.   int volume;\n6.   void volume() {\n7.     volume = width*height*length;\n8.   }\n9. }\n10.class Output {\n11.  public static void main(String args[])\n12.  {\n13.     box obj = new box();\n14.     obj.height = 1;\n15.     obj.length = 5;\n16.     obj.width = 5;\n17.     obj.volume();\n18.     System.out.println(obj.volume);\n19.  }\n20.}</pre>"=>["0"," 1"," 25","26"]},
  9 => { "What is the output of this program?<pre>1. class Output {\n2.   static void main(String args[]) \n3.   {    \n4.     int x , y = 1;\n5.     x = 10;\n6.     if (x != 10 && x / 0 == 0)\n7.       System.out.println(y);\n8.     else\n9.       System.out.println(++y);\n10.  } \n11.}</pre>"=>["1"," 2"," Runtime Error"," Compilation Error"]},
  10 => { "What is the output of this program?<pre>1. class area {\n2.   int width;\n3.   int length;\n4.   int volume;\n5.   area() {\n6.   width=5;\n7.   length=6;\n8.   }\n9.   void volume() {\n10.    volume = width*length*height;\n11.  } \n12.}    \n13.class cons_method {\n14.  public static void main(String args[])\n15.  {\n16.    area obj = new area();\n17.    obj.volume();\n18.    System.out.println(obj.volume);        \n19.  } \n20.}</pre>"=>["0"," 1"," 30"," error"]},
}


# XII. Access Control
Java_Questions_Access = {
  1 => { "Which of these access specifiers must be used for main() method?"=>[" private"," public"," protected"," None of the above"]},
  2 => { "Which of these is used to access member of class before object of that class is created?"=>[" public"," private"," static"," protected"]},
  3 => { "Which of these is used as default for a member of a class if no access specifier is used for it?"=>[" private"," public"," public, within its own package"," protected"]},
  4 => { "What is the process by which we can control what parts of a program can access the members of a class?"=>[" Polymorphism"," Abstraction"," Encapsulation"," Recursion"]},
  5 => { "Which of the following statements are incorrect?"=>[" public members of class can be accessed by any code in the program."," private members of class can only be accessed by other members of the class.
"," private members of class can be inherited by a sub class, and become protected members in sub class.
"," protected members of a class can be inherited by a sub class, and become private members of the sub class."]},
  6 => { "What is the output of this program?<pre>1. class access{\n2.   public int x;\n3.   private int y;\n4.   void cal(int a, int b){\n5.     x =  a + 1;\n6.     y =  b;\n7.   }\n8.}\n9. class access_specifier {\n10.  public static void main(String args[])\n11.  {\n12.    access obj = new access();\n13.    obj.cal(2, 3);\n14.    System.out.println(obj.x + " " + obj.y);\n15.  }\n16.}</pre>"=>["3 3","2 3","Runtime Error","Compilation Error"]},
  7 => { "What is the output of this program?<pre>1. class access{\n2.   public int x;\n3.   private int y;\n4.   void cal(int a, int b){\n5.     x =  a + 1;\n6.     y =  b;\n7.   }\n8.   void print() {\n9.     system.out.println(" " + y);\n10.  }\n11.}\n12.class access_specifier {\n13.  public static void main(String args[])\n14.  {\n15.     access obj = new access();\n16.     obj.cal(2, 3);\n17.     System.out.println(obj.x);\n18.     obj.print();\n19.  }\n20.}</pre>"=>["2 3","3 3","Runtime Error","Compilation Error"]},
  8 => { "What is the output of this program?<pre>1. class static_out {\n2.   static int x;\n3.   static int y;\n4.   void add(int a, int b){\n5.     x = a + b;\n6.     y = x + b;\n7.   }\n8. }\n9. class static_use {\n10.  public static void main(String args[])\n11.  {\n12.    static_out obj1 = new static_out();\n13.    static_out obj2 = new static_out();\n14.    int a = 2;\n15.    obj1.add(a, a + 1);\n16.    obj2.add(5, a);\n17.    System.out.println(obj1.x + " " + obj2.y);\n18.  }\n19.}</pre>"=>["7 7","6 6","7 9","9 7"]},
  9 => { "Which of these access specifier must be used for class so that it can be inherited by another sub class?"=>[" public","private","protected","None of the above"]},
  10 => { "What is the output of this program?<pre>1. class test {\n2.   int a;\n3.   int b;\n4.   test(int i, int j) {\n5.     a = i;\n6.     b = j;\n7.   }\n8.   void meth(test o) {\n9.     o.a *= 2;\n10.    O.b /= 2;\n11.  }\n12.}\n13.class Output {\n14.  public static void main(String args[])\n15.  {\n16.    test obj = new test(10 , 20);\n17.    obj.meth(obj);\n18.    System.out.println(obj.a + " " + obj.b);  }\n19.  }</pre>"=>["10 20","20 10","20 40","40 20"]},

}



# XIII. String Class
Java_Questions_String = {
  1 => { "String in Java is a?"=>[" class"," object"," variable"," character array"]},
  2 => { "Which of these method of String class is used to obtain character at specified index?"=>[" char()","Charat()","charat()","charAt()"]},
  3 => { "Which of these keywords is used to refer to member of base class from a subclass?"=>[" upper"," super"," this"," None of the above"]},
  4 => { "Which of these method of String class can be used to test to strings for equality?"=>[" isequal()","isequals()","equal()","equals()"]},
  5 => { "Which of the following statements are incorrect?"=>[" String is a class."," Strings in java are mutable."," Every string is an object of class String."," Java defines a peer class of String, called StringBuffer, which allows string to be altered."]},
  6 => { "What is the output of this program?<pre>1. class string_demo {\n2.   public static void main(String args[])\n3.   {\n4.     String obj = 'I' + 'like' + 'Java';   \n5.     System.out.println(obj);     \n6.   }\n7. }</pre>"=>["I"," like"," Java"," IlikeJava"]},
  7 => { "What is the output of this program?<pre>1. class string_class {\n2.   public static void main(String args[])\n3.   {\n4.     String obj = 'I LIKE JAVA';   \n5.      System.out.println(obj.charAt(3));\n6.   } \n7. }</pre>"=>["I"," L"," K"," E"]},
  8 => { "What is the output of this program?<pre>1. class string_class {\n2.   public static void main(String args[])\n3.   {\n4.     String obj = 'I LIKE JAVA';   \n5.     System.out.println(obj.length());\n6.   }\n7. }</pre>"=>["9","10"," 11"," 12"]},
  9 => { "What is the output of this program?<pre>1. class string_class {\n2.   public static void main(String args[])\n3.   {\n4.     String obj = 'hello';\n5.     String obj1 = 'world';   \n6.     String obj2 = obj;\n7.     obj2 = ' world';\n8.     System.out.println(obj + " " + obj2);\n9.   }\n10.}</pre>"=>["hellohello"," world world"," hello world"," world hello"]},
  10 => { "What is the output of this program?<pre>1.class string_class {\n2.  public static void main(String args[])\n3.  {\n4.    String obj = 'hello';\n5.    String obj1 = 'world';   \n6.    String obj2 = 'hello';\n7.    System.out.println(obj.equals(obj1) + " " + obj.equals(obj2));\n8.  }\n9.}</pre>"=>["falsefalse"," true true"," true false"," false true"]},

}

# XIV. Inheritance
# 8 => { "What is the output of this program?<pre></pre>"=>[]},
Java_Questions_Inheritance = {
  1 => { "Which of these keyword must be used to inherit a class?"=>[" super"," this"," extent"," extends"]},
  2 => { "Which of these keywords is used to refer to member of base class from a subclass?"=>[" upper"," super"," this"," None of the above"]},
  3 => { "A class member declared protected becomes member of subclass of which type?"=>[" public member"," private member"," protected member"," static member"]},
  4 => { "Which of these is correct way of inheriting class A by class B?"=>[" class B + class A {}
"," class B inherits class A {}"," class B extends A {}"," class B extends class A {}"]},
  5 => { "Which of the following statements are incorrect?"=>[" public members of class can be accessed by any code in the program."," private members of class can only be accessed by other members of the class."," private members of class can be inherited by a sub class, and become protected members in sub class."," ) protected members of a class can be inherited by a sub class, and become private members of the sub class."]},
  6 => { "What is the output of this program?<pre>1. class A {\n2.   int i;\n3.   void display() {\n4.     System.out.println(i);\n5.   }\n6. }\n7. class B extends A {\n8.   int j;\n9.   void display() {\n10.    System.out.println(j);\n11.  }\n12.}\n13.class inheritance_demo {\n14.  public static void main(String args[])\n15.  {\n16.    B obj = new B();\n17.    obj.i=1;\n18.    obj.j=2;\n19.    obj.display();\n20.  }\n21.}</pre>"=>["0"," 1"," 2"," Compilation Error"]},
  7 => { "What is the output of this program?<pre>1. class A {\n2.   int i;\n3. }    \n4. class B extends A {\n5.   int j;\n6.   void display() {\n7.     super.i = j + 1;\n8.     System.out.println(j + " " + i);\n9.   }\n10.}    \n11.class inheritance {\n12.  public static void main(String args[])\n13.  {\n14.    B obj = new B();\n15.    obj.i=1;\n16.    obj.j=2;   \n17.    obj.display();     \n18.  }\n19.}</pre>"=>["2 2"," 3 3"," 2 3"," 3 2"]},
  8 => { "What is the output of this program?<pre>1. class A {\n2.   public int i;\n3.   private int j;\n4. }    \n5. class B extends A {\n6.   void display() {\n7.     super.j = super.i + 1;\n8.     System.out.println(super.i + " " + super.j);\n9.   }\n10.}    \n11.class inheritance {\n12.  public static void main(String args[])\n13.  {\n14.    B obj = new B();\n15.    obj.i=1;\n16.    obj.j=2;   \n17.    obj.display();     \n18.  }\n19.}</pre>"=>["2 2"," 3 3"," Runtime Error"," Compilation Error"]},
  9 => { "What is the output of this program?<pre>1. class A {\n2.   public int i;\n3.   public int j;\n4.   A() {\n5.     i = 1;\n6.     j = 2;\n7.   }\n8. }    \n9. class B extends A {\n10.  int a;\n11.  B() {\n12.    super();\n13.  } \n14.}    \n15.class super_use {\n16.  public static void main(String args[])\n17.  {\n18.    B obj = new B();\n19.    System.out.println(obj.i + " " + obj.j)     \n20.  }\n21.}</pre>"=>["1 2"," 2 1"," Runtime Error"," Compilation Error"]},
  10 => { "What is the output of this program?<pre>1. class A {\n2.   public int i;\n3.   protected int j;\n4. }    \n5. class B extends A {\n6.   int j;\n7.   void display() {\n8.     super.j = 3;\n9.     System.out.println(i + " " + j);\n10.  }\n11.}    \n12.class Output {\n13.  public static void main(String args[])\n14.  {\n15.    B obj = new B();\n16.    obj.i=1;\n17.    obj.j=2;   \n18.    obj.display();     \n19.  }\n20.}</pre>"=>["1 2"," 2 1"," 1 3"," 3 1"]},

}

#Answer
/#

[2,
 5,
 12,
 13,
 18,
 23,
 27,
 30,
 35,
 37,
 44,
 47,
 49,
 56,
 59,
 61,
 65,
 71,
 76,
 78,
 81,
 87,
 92,
 96,
 98,
 103,
 106,
 112,
 116,
 117,
 123,
 128,
 132,
 133,
 137,
 141,
 146,
 152,
 156,
 158,
 164,
 167,
 172,
 173,
 180,
 183,
 185,
 191,
 195,
 200,
 204,
 205,
 212,
 214,
 220,
 223,
 225,
 232,
 234,
 237,
 242,
 247,
 252,
 256,
 260,
 264,
 268,
 271,
 274,
 279,
 281,
 287,
 292,
 293,
 299,
 303,
 308,
 311,
 315,
 318,
 322,
 325,
 329,
 336,
 338,
 342,
 346,
 351,
 354,
 360,
 362,
 365,
 369,
 375,
 377,
 383,
 385,
 390,
 393,
 400,
 403,
 406,
 412,
 413,
 420,
 423,
 426,
 431,
 436,
 440,
 442,
 447,
 449,
 455,
 459,
 463,
 466,
 471,
 473,
 478,
 481,
 488,
 490,
 496,
 498,
 504,
 505,
 511,
 515,
 520,
 524,
 526,
 530,
 535,
 539,
 543,
 547,
 552,
 553,
 557]
#/




JQ={
11 => {"Which of these is data type long literal? "=>[" 0x99fffL"," ABCDEFG"," 0x99fffa"," 99671246"]},
12 => {"Which of these is returned by operators &, ?"=>["Integer"," Boolean"," Character"," Float"]},
13 => {"Literals in java must be preceded by which of these?"=>["L"," I"," D"," L and I "]},
14 => {"Literal can be of which of these data types?"=>[" integer"," float"," boolean"," all of the above"]},
15 => {"Which of these can not be used for a variable name in Java?"=>[" identifier"," keyword"," identifier & keyword"," None of the above"]}
}
end