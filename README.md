# toy-language
A C-like toy language compiler front-end written using bison and flex

## output:
0) errors and warnings
1) memory offset
2) TAC

## constructs supported:
0) comments  
1) expressions  
2) declarations  
3) assignment  
4) combined declaration/assignment  
5) if  
6) if else 
7) if else if ladder  
8) for  
9) while  
10) do while  
11) break  
12) continue  
13) type casting  
14) boolean expressions (with short-circuit code)  
15) goto  

## types supported:
int  
float  
char  
double  
long  
arbitrary dimensional arrays  
arbitrary depth pointers  

## verification:
### hard rules (produces errors)
1) all variables must be declared before being used  
2) two variables cannot share name if their scopes intersect  
3) variables cannot be used outside their scope  
4) label names should be unique  
### soft rules (produces warnings)  
1) variables must be initialized before use  
2) a variable, once declared, must be used atleast once  
3) type of lvalue should be compatible with type of rvalue  




## Datatypes:

### integral
char 1  
short 2  
int 4  
long 8  

### floating point
float 4  
double 8  

explicit integers are treated as char by default  

if a value has a point, it is treated as float by default  
(double)0.1 is a double  




## shift conflict errors:

```
if(((a)))
{

}
else
{

}
```

here, the placements of brackets is ambiguous between the booleam and arithmetic expressions
it could be (e), e = (a)
of ((e)), e = a
default action of shifting is a suitable solution for this problem
correctness of generated code is not affected

sr conflict due to dangling else problem
solution: default shift
this causes else to be matched with nearest if
