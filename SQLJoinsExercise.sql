/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name as Product, c.Name as Category
 FROM Products AS p INNER JOIN categories AS c
 ON c.CategoryID=p.categoryID
 WHERE c.Name='Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM Products AS p INNER JOIN Reviews AS r
ON p.productid=r.productid
WHERE r.Rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(s.Quantity) as Quantity
FROM sales AS s INNER JOIN employees AS e
ON e.EmployeeID=s.EmployeeID
GROUP BY e.EmployeeId
ORDER BY Quantity DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS Department, c.Name AS Category
FROM categories AS c INNER JOIN departments AS d
ON c.DepartmentID=d.departmentid
WHERE c.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS TotalQuantity, SUM(s.PricePerUnit * s.Quantity) AS TotalPrice
FROM Products AS p INNER JOIN sales AS s
ON p.productid=s.productid
WHERE p.Name ='Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p INNER JOIN reviews AS r
ON p.ProductID=r.ProductID
WHERE p.Name='Visio TV'
ORDER BY r.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalQuantity
FROM sales AS s
INNER JOIN employees AS e ON s.EmployeeID=e.EmployeeID
INNER JOIN products AS p on s.ProductID=p.productid
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.LastName, e.FirstName, p.Name


