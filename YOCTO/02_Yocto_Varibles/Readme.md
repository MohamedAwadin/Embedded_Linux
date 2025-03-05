# Variable Assignment


### Types of Variable Assignments

Here's an explanation of the types of variable assignments in Bitbake :

In the Yocto Project and Bitbake environment, different operators are used to assign values to variables. Each operator has a specific behavior and use case. Below is a detailed breakdown:

1. **?=**  
   - **Purpose**: Assigns a default value to a variable.
   - **Characteristics**: This value can be overridden by a later assignment using `=` or `:=` or similar operators.
   - **Example**: `VAR ?= "value"` - If `VAR` doesn’t already have a value, it will be set to "value".

2. **??=**  
   - **Purpose**: Assigns a default value to a variable, but it’s a weak assignment.
   - **Characteristics**: It can be easily overridden. If multiple `??=` assignments are made to the same variable, the last one takes effect.
   - **Example**: 
     ```
     VAR ??= "first"
     VAR ??= "second"
     ```
     Here, `VAR` will be "second" because it’s the last weak assignment.

3. **=**  
   - **Purpose**: A simple variable assignment.
   - **Characteristics**: Requires quotes `" "`, and spaces are significant (they are preserved). Variables within the value (e.g., `${VAR}`) are expanded later when the variable is used, not immediately.
   - **Example**: `VAR = "hello ${USER}"` - `${USER}` won’t be replaced until `VAR` is accessed.

4. **:=**  
   - **Purpose**: Immediate variable expansion.
   - **Characteristics**: The value is expanded right away when assigned, not deferred until later.
   - **Example**: `VAR := "hello ${USER}"` - If `${USER}` is "ahmed", `VAR` becomes "hello ahmed" immediately.

5. **+=**  
   - **Purpose**: Appends a value to an existing variable.
   - **Characteristics**: Adds a space between the current value and the new value, and the change takes effect immediately.
   - **Example**: 
     ```
     VAR = "hello"
     VAR += "world"
     ```
     `VAR` becomes "hello world".

6. **=+**  
   - **Purpose**: Prepends a value to an existing variable.
   - **Characteristics**: Adds a space between the new value and the current value, and the change takes effect immediately.
   - **Example**: 
     ```
     VAR = "world"
     VAR =+ "hello"
     ```
     `VAR` becomes "hello world".

7. **.=**  
   - **Purpose**: Appends a value to an existing variable.
   - **Characteristics**: Adds no space between the current value and the new value, and the change takes effect immediately.
   - **Example**: 
     ```
     VAR = "hello"
     VAR .= "world"
     ```
     `VAR` becomes "helloworld".

8. **=.**  
   - **Purpose**: Prepends a value to an existing variable.
   - **Characteristics**: Adds no space between the new value and the current value, and the change takes effect immediately.
   - **Example**: 
     ```
     VAR = "world"
     VAR =. "hello"
     ```
     `VAR` becomes "helloworld".

9. **:append**  
   - **Purpose**: Appends a value to a variable.
   - **Characteristics**: Adds no space, and the effect is applied when the variable is expanded (not immediately).
   - **Example**: 
     ```
     VAR = "hello"
     VAR:append = "world"
     ```
     When expanded, `VAR` becomes "helloworld".

10. **:prepend**  
    - **Purpose**: Prepends a value to a variable.
    - **Characteristics**: Adds no space, and the effect is applied when the variable is expanded (not immediately).
    - **Example**: 
      ```
      VAR = "world"
      VAR:prepend = "hello"
      ```
      When expanded, `VAR` becomes "helloworld".

11. **:remove**  
    - **Purpose**: Removes values from a list variable.
    - **Characteristics**: Removes all instances of the specified value from the variable.
    - **Example**: 
      ```
      VAR = "one two three two"
      VAR:remove = "two"
      ```
      `VAR` becomes "one three".



### How to Read Variable Value 

```bash
bitbake -e <RECIPE_NAME> | grep ^<VARIABLE_NAME>=
```



### Assignment Type ?= 

```bitbake
TEST ?= "Mohamed"
TEST ?= "Awadin"
TEST ?= "Badawi"
TEST ?= "Ahmed"

# The final value is TEST="Mohamed" 
```

### Assignment Type ??= 

```bitbake
TEST ??= "Mohamed"
TEST ??= "Awadin"
TEST ??= "Badawi"
TEST ??= "Ahmed"

# The final value is TEST="Ahmed"
```

```bitbake
TEST ??= "Mohamed"
TEST ?=  "Awadin"
TEST ?=  "Badawi"
TEST ??= "Ahmed"

# The final value is TEST="Awadin" 
```

### Assignment Type = 

```bitbake
# Override
A ?= "Moahmed"
A =  "Awadin"

# The final value is A="Awadin" 

# Variable Expansion
A = "Mohamed"
B = "${A}"
A = "Awadin"

# The final value is B="Awadin" 
```

### Assignment Type := 

```bitbake
# Override
A ?= "Mohamed"
A := "Awadin"

# The final value is A="Awadin" 

# Variable Expansion
A = "Mohamed"
B := "${A}"
A = "Awadin"
# The final value is B="Mohamed" 
```

### Assignment Type +=  and =+

```bitbake
# Spaces are added here

# Append
A =  "Mohamed"
A += "Awadin"

# The final value is A="Mohamed Awadin" 

# Prepend
B =  "Mohamed"
B =+ "Awadin"

# The final value is B="Awadin Mohamed"

# Append
A ?= "Mohamed"
A += "Awadin"

# The final value is A="Awadin"

# Prepend
B ??= "Mohamed"
B =+  "Awadin"

# The final value is B="Awadin"
```

### Assignment Type .=  and =.

```bitbake
# No Spaces are added here
# Needs to add extra space

# Append
A =  "Mohamed"
A .= "Awadin"

# The final value is A="MohamedAwadin" 

# Prepend
B =  "Mohamed"
B =. "Awadin"

# The final value is B="AwadinMohamed"
```

### Assignment Type :append, :prepend and :remove

```bitbake
# No Spaces are added here
# Needs to add extra space
# Parsed at the end

# Append
A =        "Mohamed"
A:append = "Awadin"
# The final value is A="MohamedAwadin" 

# Append
A =        "Mohamed"
A:append = "Awadin"
A +=       "Badawi"
# The final value is A="Mohamed AwadinBadawi" 

# Append
A =        "Mohamed"
A:append = "Awadin"
# The final value is A="Mohamed Awadin" 


# Prepend
A =         "Mohamed"
A:prepend = "Awadin"
# The final value is A="AwadinMohamed" 

# Prepend
A =         "Mohamed"
A:prepend = "Awadin"
A =+        "Badawi"
# The final value is A="AwadinBadawi Mohamed" 

# Prepend
A =         "Mohamed"
A:prepend =  "Awadin "
# The final value is A="Awadin Moahemd" 

#remove

A = "Mohamed Awadin"
A:remove = "Awadin"
# The final value is A=" Mohamed" 

```





## Reference 

https://docs.yoctoproject.org/bitbake/2.2/bitbake-user-manual/bitbake-user-manual-metadata.html

