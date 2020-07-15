/*Query 1*/

SELECT ID_E_Position
FROM employee
WHERE ID_E_Position > '3';

/*Query 2*/

SELECT FirstName, LastName 
FROM recipient
WHERE FirstName = 'Rocky';

/*Query 3*/

SELECT * FROM processingsystem 
WHERE Delivered_Date
BETWEEN         
"2020-01-01" AND "2020-02-08";


/*Query 4*/

SELECT employee.FirstName, employee.LastName, employee.ID_E_Position, e_position.Role, processingsystem.ID_Process, processingsystem.ID_Package
FROM employee 
JOIN e_position ON employee.ID_E_Position = e_position.ID_E_Position 
JOIN processingsystem ON employee.ID_Employee = processingsystem.ID_Employee 
WHERE processingsystem.ID_Process = "6" and e_position.Role = "Office";


/*Query 5*/

SELECT count(processingsystem.ID_Recipient) FROM processingsystem where processingsystem.Deposited_Date BETWEEN "2020-01-01" and "2020-03-01";


/*Query 6*/

SELECT sender.FirstName, sender.LastName, processingsystem.ID_Sender, processingsystem.ID_Recipient 
FROM processingsystem 
JOIN sender ON processingsystem.ID_Sender = sender.ID_Sender 
WHERE processingsystem.ID_Sender = "5";

