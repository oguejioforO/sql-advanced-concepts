# sql-advanced-concepts

Description:
A collection of SQL examples covering advanced concepts such as stored procedures, conditionals (IF/ELSE, CASE), triggers, and constraints. 
Each file demonstrates how these features work in MySQL with practical examples.


# SQL Basics (For Beginners)

### 1. Loop
- A loop means **doing something again and again until a condition is met**.  
- Example: keep adding numbers until you reach 100.  
- In SQL, loops are used inside **stored procedures** or functions.  

---

### 2. Trigger
- A trigger is like an **automatic alarm**.  
- When something happens in a table (*insert, update, delete*), the trigger runs automatically.  
- Example: If a new staff is added, a trigger can log the date and time.  

---

### 3. Constraint
- A constraint is a **rule** on a table to keep data correct.  
- Examples:  
  - `NOT NULL` → column cannot be empty.  
  - `UNIQUE` → no duplicate values allowed.  
  - `CHECK (age >= 18)` → only 18 or older allowed.  

---

### 4. Partition By
- Think of it as **grouping inside a table without losing details**.  
- It splits data into sections but still shows the full table.  
- Example: Find each student’s rank *within their class*, not the whole school.  

---

### 5. Stored Procedures
- A stored procedure is like a **recipe** saved in SQL.  
- Write the steps once, save it, and run it whenever you need.  
- Example: A procedure to calculate monthly salary for staff.  

---

 ### 6. Function
- A function is like a mini-machine: you give it input, and it gives you output.
- Example: A function that takes two numbers and returns their sum.
- SQL has built-in ones (SUM, AVG) and you can also create your own.

---
### 7. If / Else Statement
- Works like a **decision maker**.  
- If the condition is true → do this.  
- Else → do something else.  

--- 

### In short:
- Loop = repeat
- Trigger = auto-run on event
- Constraint = rule
- Partition By = divide but still see all
- Stored Procedure = saved recipe
- If/Else = decision making
- Function = mini-machine

