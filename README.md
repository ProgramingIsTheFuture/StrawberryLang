
<div align="center">
<img width="250px" height="250px" src=".github/StrawberryLang.png" alt="Strawberry IMG" title="Strawberry Lang" />
</div>

# Strawberry Lang

### Strawberry CLI

if no parameters are given it will interpret line by line

if any file is given it will instead interpret the file

```bash
# this will display the help you need
# both -help and --help will work and display information
strawberry -help
```

### Data types

*Int*

123

25

*Strings*

"Hello World!"

*Boolean*

true

false

### Strawberry Syntax

Basic write to console:

```strawberry
strawberry("Hello World")

strawberry("Hello " + 10) 🍓 This will print "Hello 10"
strawberry(15 + 10) 🍓 This will print 25 
strawberry("Hello " + "World!") 🍓 This will print "Hello World!"

🍓 this is a comment
```

### Strawberry Arithmetic

| Operator  | Use   |
|-------------- | -------------- |
| +    | Strings and numbers. (Ex: 2 + 4 = 6)     |
| -    | Numbers. (Ex: 3 - 2 = 1)     |
| *    | Numbers. (Ex: 2 * 2 = 4)     |
| /    | Numbers, Int division. (Ex: 4 * 2 = 0)     |
| %    | Numbers. (Ex: 4 % 2 = 0)     |

#### Particular case
  
if the compilers gets something like
```strawberry
"Hello " "World" 🍓 This is equal to "Hello World"
5 10 🍓 This is equal to 15
```

### Variables

you can create variables with any of these patterns:

- my_var
- var2
- Name_Var

```strawberry
myvar = 10
myvar = (10 + 15 + 5) / 2
var2 = "Hello World"
strawberry(myvar, var2)
```

### Conditions

Ternary Operator

```strawberry
🍓 Condition ? statement : statement
true ? strawberry("Hello") : strawberry("World")
```

### TO DO

- [ ] compare conditions (==, <, ≤, >, >=)
- [ ] If and Else statement
- [ ] Loops

