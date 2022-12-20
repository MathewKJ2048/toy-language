# toy-language

A C-like toy language compiler front-end written using bison and flex.

## Output:
- memory offset for each variable
- TAC
- errors
- warnings


## Constructs supported:
- comments  
- expressions  
- declarations  
- assignment  
- combined declaration/assignment  
- if  
- if else 
- if else if ladder  
- for  
- while  
- do while  
- break  
- continue  
- type casting  
- boolean expressions (with short-circuit code)  
- goto  


## Verification:

### Hard rules (produces errors if violated)

- All variables must be declared before being used.  
- Two variables cannot share name if their scopes intersect.  
- Variables cannot be used outside their scope.  
- Label names should be unique.

### Soft rules (produces warnings if violated)  
- Variables must be initialized before use.  
- A variable, once declared, must be used atleast once.  
- The type of the lvalue should be compatible with the type of the rvalue.  




## Datatypes:

|name|bytes|
|----|-----|
|char|1|
|short|2|
|int|4|
|float|4|
|long|8|
|double|8|

Explicit integers are treated as char by default.  
If a value has a point, it is treated as float by default.  
`(double)0.1` is a double.  




## Shift-reduce conflicts:

```
if(((a)))
{
}
else
{
}
```

Here, the placements of brackets is ambiguous between the boolean and arithmetic expressions;
it could be `(e)` where `e -> (a)` or `((e))` where `e -> a`  

Setting the default action to shifting is a suitable solution for this problem since the correctness of generated code is not affected.

SR conflicts due to 'dangling else' problem can be solved by setting the default action to shift, which
causes 'else' to be matched with nearest 'if'.
