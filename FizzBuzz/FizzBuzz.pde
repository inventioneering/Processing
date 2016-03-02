// Write a program that prints the numbers from 1 to 100. 
// But for multiples of three print “Fizz” instead of the 
// number and for the multiples of five print “Buzz”. 
// For numbers which are multiples of both three and five 
// print “FizzBuzz”


// Second attempt
for(int i = 1; i <= 100; i++)
{
  String f = "Fizz";
  String b = "Buzz";
  String output = "";
  
  if(i % 3 == 0)
  {
    output = output + f;
  }
  
  if(i % 5 == 0)
  {
    output = output + b; 
  }
  
  if(output == "")
  {
   output = String(char(i)); 
  }
  
  println(output);
}

// First Attempt -- this is the one I submitted in my application

//for(int i = 1; i<101; i++)
//{
// if(i % 5 == 0)
// {
//  if(i % 3 == 0)
//  {
//   println("FizzBuzz"); 
//  }
//  else 
//  {
//   println("Buzz"); 
//  }
// }
// if(i % 3 == 0)
// {
//  println("Fizz"); 
// }
// else
// {
//   println(i); 
// }
//}