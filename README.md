# SQL-Project

_Disclaimer: This project was done in a team of 6 as the final deliverable for a Master's Level Database Management course. The dataset and case description were chosen by the team. The project itself is very simple and easy to replicate and modify._

# Table of Contents
* [Background](https://github.com/aditichand/SQL-Project/tree/main#background) <br>
     * [Business Problems and Objectives](https://github.com/aditichand/SQL-Project/tree/main#business-problems-and-objectives) <br>
     * [Potential Features of the Customer Management System](https://github.com/aditichand/SQL-Project/tree/main#potential-features-of-the-customer-management-system) <br>
* [Relational Data Model](https://github.com/aditichand/SQL-Project/tree/main#relational-data-model) <br>
     * [Assumptions/Notes About Data Entities and Relationships](https://github.com/aditichand/SQL-Project/tree/main#assumptionsnotes-about-data-entities-and-relationships) <br>
     * [Entity-Relationship Diagram](https://github.com/aditichand/SQL-Project/tree/main#entity-relationship-diagram) <br>
* [Physical MySQL Database](https://github.com/aditichand/SQL-Project/tree/main#physical-mysql-database) <br> 
     * [Data in the Database](https://github.com/aditichand/SQL-Project/tree/main#data-in-the-database) <br>
* [Business Solutions using Queries](https://github.com/aditichand/SQL-Project/tree/main#business-solutions-using-queries) <br>
     * [SQL Queries](https://github.com/aditichand/SQL-Project/tree/main#sql-queries) <br>
     * [Stored Procedure](https://github.com/aditichand/SQL-Project/tree/main#stored-procedure) <br>


## Background
Our focus is a pet service center called Paws Inc. founded in Dallas, Texas. It started out as a small-scale on-the-go pet service truck but due to high demand for its services, it went ahead and opened a store in Dallas. During its 7 years of operations, Paws Inc. has rooted itself deeply in the community and proudly services over 20000 pets. At the time, Paws Inc had 25 employees, full or part-time, offering a range of services including cleaning, trimming, training, and dental services for cats and dogs in one location. Its demand grew mostly from word of mouth and the retention rate of customers was around 60%.

## Business Problems and Objectives

We have been approached by the Pet Grooming Company, Paws Inc., to create a customer management system for them that will let them keep track of their customers’ information and needs more efficiently. This database has become essential for the company at this juncture because of its plans to expand to more cities and states.
In order to ensure that the company can meet the demands of a rapidly growing consumer base, our team was tasked with creating a database that would accurately and efficiently display important information regarding the clients, their pets, and the staff charged with taking care of their needs. It is important that the customers feel cared for, so we must create a system where we could keep a complete record of each service that an individual customer has requested, going as far back as the company’s inception in 2015. This is to make sure that no matter which store location a client visits, the employees will always have complete access to each client’s history and preferences.
Paws Inc. understands that growing companies such as theirs can often alienate the clients that helped put them on the map, and in order to avoid that, they also maintain a record of their customers’ pets (including names, types, etc.) so that when an appointment is made, their employees can get everything ready in advance. Furthermore, their suite of services is expanding along with the business, and therefore part of our database deals with each service and its pricing, which will be useful for both staff and clients.

Our database was created with the knowledge that the business may well expand beyond Texas’ borders and is, therefore, future proof, in that we have accounted for all the information they need now, as well as everything they will need in the future. Our current objective is to decide the best location that our client can expand to, given its current customer base, and to come up with strategies that will help the client get the new store up and running efficiently.

## Potential Features of the Customer Management System
Through our system we hope to help the client gain easier access to insights for the purpose of <br>

**➢ Identifying top customers**<br>
Building a customer management system involves fleshing out your customer base and prioritizing them for retention, upselling, and word-of-mouth marketing opportunities.
<br>**➢ Upselling opportunities**<br>
Identify customer preferences in order to suggest the purchase of additional items or shift to a more premium version of their original choice. There's also cross-selling to suggest related products that complement the original purchase.
<br>**➢ Customer retention**<br>
Leverage loyalty programs and special promotional offers.
<br>**➢ Activity documentation**<br>
Keep track of the activity of each customer with regards to services opted for, frequency of visits, invoice amounts, preferred employee, etc.
<br>**➢ Information update**<br>
Update customer information easily across the entire business.

## Relational Data Model
Owners(OwnerID, OwnerFName, OwnerLName, HouseNumber, Street, City, State, zip_code, phone_number)<br>
Pets(PetID, PetName, Type, OwnerID)<br>
Services(ServiceID, ServiceName, Price)<br>
Employees(EmployeeID, EmployeeFName, EmployeeLName, Title, Wage) Invoices(InvoiceNumber, PetID, OwnerID, ServiceID, EmployeeID, Date, Payment)<br>

## Assumptions/Notes About Data Entities and Relationships<br>
* A pet can have only one owner, but an owner can have one or more pets.<br>
* An employee can have 0 or more pets assigned to him, but a pet must have at least one employee assigned to it.<br>
* An employee can perform 0, 1, or many services, on a pet, but a pet must receive at least one service.<br>
* An owner can have none or many invoices, but an invoice can belong to only one owner.<br>
* An invoice can record a pet only once, but a pet can be recorded in one or more invoices.<br>
* An invoice can record one service only once, but a service can be on zero, one, or many Invoices.<br>
* An employee can be recorded on none, one, or more than one invoice but an invoice can record one employee only once.<br>
     
## Entity-Relationship Diagram
 
### Physical MySQL Database
<img width="800" alt="image" src="https://github.com/aditichand/SQL-Project/assets/61296787/882d33eb-44c1-4960-99e7-dfd06068b069">

   
   
 ## Data in the Database
<img width="800" alt="image" src="https://github.com/aditichand/SQL-Project/assets/61296787/7bc331e2-cf86-46f5-bc79-5d9003315d1c">


## Business Solutions using Queries<br>

### SQL Queries
**1. Obtain a list of first and last names, cities, and the pet type of customers who spent more than $15 after June 1st, 2019.**<br>
Select Owners.OwnerFName, Owners.OwnerLName, Owners.City,<br>
Pets.type, Invoices.Payment<br>
from Owners<br>
Join Pets on Owners.OwnerID = Pets.OwnerID Join Invoices ON Pets.OwnerID = Invoices.OwnerID<br>
Where Invoices.Payment >= "15" and Date > "06-01-19" Group by Owners.OwnerID Order by Payment desc;<br>
 
The results of this query show us which customers have contributed the most to the store’s revenue in the last 6 months of 2019.<br>

**2. Obtain an unduplicated list of the cities from where customers are located and the number of customers from each city.**<br>
Select count(City) as No_ofCustomers, City from Owners Group by City<br>
Order by count(City) desc limit 5;<br>

In order to decide on a new location for the store, we need to find out which cities have the most customers and are suitable candidates for a new store.<br>

**3. Who are the top 2 employees that have been the most active i.e performed the most services? Obtain their First and Last Name, employee id, and the number of services performed.**<br>
Select<br>
Count(Invoices.EmployeeID) as No_ofServicesPerformed, Employees.EmployeeFName, Employees.EmployeeLName,<br>
Employees.EmployeeID from Employees<br>
Join Invoices ON Invoices.EmployeeID = Employees.EmployeeID Group By Employees.EmployeeID<br>
Order by<br>
Count(Invoices.EmployeeID) DESC Limit 2;<br>
  
 We need efficient employees to work at the new location for the first few weeks to get the business up and running. These employees need to be familiar with most of our services and also be experienced since they will be supervising new employees at the new store.

**4. Make a list of pets and the services they received including their name, type, id, service id, and service name**<br>
SELECT<br>
Pets.Type, Pets.PetName, Pets.PetID, Invoices.ServiceID, Services.ServiceName FROM Invoices<br>
JOIN Pets ON Pets.PetID = Invoices.PetID<br>
JOIN Services ON Services.ServiceID = Invoices.ServiceID;<br>

We need to see what services each pet has already had so we know what each pet needs and we can recommend additional services to go along with what they have. This is essential in ensuring that each pet has the best service at our store and that both the pet and the owner leave the store satisfied.<br>

**5. Make a list of returning customers stating their first and last names and the number of visits.**<br>
Select COUNT(Invoices.OwnerID) as No_ofVisits, OwnerFName,<br>
OwnerLName FROM Invoices<br>
JOIN Owners ON Owners.OwnerID = Invoices.OwnerID Group By Invoices.OwnerID Having COUNT(Invoices.OwnerID) > 1 Order by Count(Invoices.OwnerID) Desc;<br>
 
We want to know which customers have developed a good relationship with our business. These customers can help us spread the word about our 
new store throughout the state.<br>

**6. Find the top 2 most popular services.**<br>
Select Count(Invoices.ServiceID), Services.ServiceName<br> 
From Services<br>
Left Outer Join Invoices ON Invoices.ServiceID = Services.ServiceID Group by Invoices.ServiceID<br>
Order by<br>
Count(Invoices.ServiceID) DESC Limit 2;<br>

There are some services that are more highly demanded than the others. We need to determine which are the most important services that we 
should focus on in the initial phase of our store. Initially, when the store has just opened, it is likely to be chaotic as the new employees 
navigate around and the older employees that have been relocated are not able to pay attention to everything. Ensuring that the highly demanded 
services are being performed well will help to build a good reputation for the new score.<br>
 
**7. Show the latest 5 customers who have had dog service.**<br>
Select o.Ownerfname, o.Ownerlname, p.petname, p.Type,i.date From Invoices i<br>
left join Owners o on i.OwnerID = o.OwnerID<br>
left join Pets p on i.PetID = p.PetID<br>
where p.type = "Dog" Order by i.Date desc Limit 5;<br>

We just bought some new products for dogs and want to invite the latest 5 dog customers for a free trial so we can get feedback about these new 
products and whether it will be beneficial if we introduce them in the new store, keep them only in the current store, both, or neither.<br>

**8. Show the employees who have served more than 3 different owners. Include employeeID, name, and the number of owners served.**<br>
Select i.EmployeeID, e.EmployeeFName, e.EmployeeLName, count(distinct o.OwnerID) as num_of_Owners_served<br>
From Invoices i<br>
left join Employees e on i.EmployeeID = e.EmployeeID<br>
Left join Owners o on i.OwnerID = o.OwnerID<br>
Group by i.EmployeeID<br>
having count(distinct o.OwnerID) > 3 Order by num_of_Owners_served desc;<br>
  
We want to know if there are any special requests that customers tend to ask for and are not included in our current portfolio. Therefore, we 
find out the employees who have served more than 3 different customers that we think are a good number to ask for opinions.<br>

**9. Count the number of dogs and cats in Rock Springs.**<br>
Select<br>
count(p.Type) as No_ofPets, p.Type<br>
From Pets as p<br>
left join Owners as o on o.OwnerID = p.OwnerID where<br>
o.city = "Rock Springs" Group by p.type;<br>

We want to know which is the most common pet in the city of Rock Springs (one of the cities with the most customers and a potential candidate 
for a new store). This will help us better prepare the kinds of services we are required to provide in the city and anticipate demand for each 
pet type.<br>

**10. List all people who have visited the shop at least twice and live in Palagano.**<br>
Select Invoices.OwnerID, Owners.OwnerFName, Owners.OwnerLName, Owners.City, Pets.Type,<br>
Count(Invoices.OwnerID) as No_of_Visits From Invoices<br>
Join Owners On Owners.OwnerID = Invoices.OwnerID Join Pets on Pets.PetID = Invoices.PetID Where Owners.City ="Palagano" group by Invoices.OwnerID<br>
Having Count(Invoices.OwnerID)>= 2;<br>

We want to spread the word about our new store in the city through people who are already frequent customers in our current store and part of 
the community. We want to find which customers are already frequently visiting us in order to build better relationships with them before opening 
the new store and asking them for references and help with other promotional activities.<br>
  
**11. Find the total amount of people spend on cats and dogs in Rock Springs and Palagano**<br>
Select Pets.Type, Sum(Invoices.Payment) as TotalSpent, Owners.City From Pets<br>
Join Invoices on Invoices.PetID=Pets.PetID<br>
Join Owners on Invoices.OwnerID=Owners.OwnerID<br>
Where Owners.City ="Rock Springs" or Owners.City = "Palagano" Group by Pets.Type, Owners.City;<br>

We want to know which cities spend more on cats or dogs. This will help us decide how we want to price our services as well as any new products 
that we might decide to start selling. For instance, in Rock Springs we can see that customers have spent more on dogs compared to cats but the 
number of pets like cats is much lower in the city. This shows that cat owners spend more on their pets since the proportion of difference is 
low between the total spending between the two types.<br>

**12. Find all the people whose last name starts with A. List their first and last name.**<br>
Select Owners.OwnerID, Owners.OwnerFName, Owners.OwnerLName<br>
From Owners<br>
Join Invoices on Invoices.OwnerID=Invoices.OwnerID Join Pets on Invoices.PetID=Pets.PetID<br> 
Where Owners.OwnerLName Like 'A%' Group by Owners.OwnerID;<br>
  
An employee wants to look up a customer, they know it starts with A, but can't remember the whole last name so they want to see if they can 
identify the customer based on what the name starts with.<br>

**13. Obtain a list of first and last names, city, and the pet type of customers who spent more than $15 after June 1st, 2019.**<br>
Select Owners.OwnerFName, Owners.OwnerLName, Owners.City,<br>
Pets.type, Invoices.Payment<br>
from Owners<br>
Join Pets on Owners.OwnerID = Pets.OwnerID Join Invoices ON Pets.OwnerID = Invoices.OwnerID<br>
Where Invoices.Payment >= "15" and Date > "06-01-19" Group by Owners.OwnerID<br>
Order by Payment desc;<br>

The results of this query show us which customers have contributed the most to the store’s revenue in the last 6 months of 2019.<br>

**14. Obtain an unduplicated list of the cities from where customers are located and the number of customers from each city.**
Select count(City) as No_ofCustomers, City from Owners Group by City Order by count(City) desc limit 5;<br>
 
In order to decide on a new location for the store, we need to find out which cities have the most customers and are suitable candidates for a 
new store.<br>

**15. Who are the top 2 employees that have been the most active i.e performed the most services? Obtain their First and Last Name, employee id, 
and the number of services performed.**<br>
Select Count(Invoices.EmployeeID) as No_ofServicesPerformed, Employees.EmployeeFName, Employees.EmployeeLName,<br>
Employees.EmployeeID from Employees<br>
Join Invoices ON Invoices.EmployeeID = Employees.EmployeeID Group By Employees.EmployeeID<br>
Order by<br>
Count(Invoices.EmployeeID) DESC Limit 2;<br>

We need efficient employees to work at the new location for the first few weeks to get the business up and running. These employees need to be 
familiar with most of our services and also be experienced since they will be supervising new employees at the new store.<br>

**16. Make a list of pets and the services they received including their name, type, id, service id, and service name.**<br>
SELECT<br>
Pets.Type, Pets.PetName, Pets.PetID, Invoices.ServiceID, Services.ServiceName FROM Invoices<br>
JOIN Pets ON Pets.PetID = Invoices.PetID<br>
JOIN Services ON Services.ServiceID = Invoices.ServiceID;<br>

We need to see what services each pet has already had so we know what each pet needs and we can recommend additional services to go along with 
what they have. This is essential in ensuring that each pet has the best service at our store and that both the pet and the owner leave the store 
satisfied. <br>

**17. Make a list of returning customers stating their first and last names and the number of visits.**<br>
Select<br>
COUNT(Invoices.OwnerID) as No_ofVisits, OwnerFName,<br>
OwnerLName FROM Invoices<br>
JOIN Owners ON Owners.OwnerID = Invoices.OwnerID Group By Invoices.OwnerID Having COUNT(Invoices.OwnerID) > 1 Order by Count(Invoices.OwnerID) Desc;<br>
 
We want to know which customers have developed a good relationship with our business. These customers can help us spread the word about our new 
store throughout the state.<br>

**18. Find the top 2 most popular services.**<br>
Select Count(Invoices.ServiceID), Services.ServiceName From Services<br>
Left Outer Join Invoices ON Invoices.ServiceID = Services.ServiceID Group by Invoices.ServiceID<br>
Order by<br>
Count(Invoices.ServiceID) DESC Limit 2;<br>

There are some services which are more highly demanded than the others. We need to determine which are the most important services that we 
should focus on in the initial phase of our store. Initially, when the store has just opened, it is likely to be chaotic as the new employees 
navigate around and the older employees that have been relocated are not able to pay attention to everything. Ensuring that the highly demanded 
services are being performed well will help to build a good reputation for the new score.<br>

**19. Show the latest 5 customers who have had dog service.**<br>
Select o.Ownerfname, o.Ownerlname, p.petname, p.Type, i.date<br>
From Invoices i<br>
left join Owners o on i.OwnerID = o.OwnerID left join Pets p on i.PetID = p.PetID where p.type = "Dog" Order by i.Date desc Limit 5;<br>

We just bought some new products for dogs and want to invite the latest 5 dog customers for a free trial so we can get feedback about these new 
products and whether it will be beneficial if we introduce them in the new store, keep them only in the current store, both, or neither.<br>

**20. Show the employees who have served more than 3 different owners. Include employeeID, name, the number of owners served.**<br>
Select<br>
i.EmployeeID, e.EmployeeFName, e.EmployeeLName,<br>
count(distinct o.OwnerID) as num_of_Owners_served<br>
From Invoices i<br>
left join Employees e on i.EmployeeID = e.EmployeeID Left join Owners o on i.OwnerID = o.OwnerID<br>
Group by i.EmployeeID<br>
having count(distinct o.OwnerID) > 3 Order by num_of_Owners_served desc;<br>
 
We want to know if there are any special requests that customers tend to ask for and are not included in our current portfolio. Therefore, we find out the employees who have served more than 3 different customers that we think are a good number to ask for opinions.<br>

**21. Count the number of dogs and cats in Rock Springs.**<br>
Select count(p.Type) as No_ofPets, p.Type<br>
From Pets as p<br>
left join Owners as o on o.OwnerID = p.OwnerID where<br>
o.city = "Rock Springs" Group by p.type;<br>

We want to know which is the most common pet in the city of Rock Springs (one of the cities with the most customers and a potential candidate 
for a new store). This will help us better prepare for the kinds of services we are required to provide in the city and anticipate demand for
each pet type.<br>
 
**22. List all people who have visited the shop at least twice and live in Palagano.**<br>
Select Invoices.OwnerID, Owners.OwnerFName, Owners.OwnerLName, Owners.City, Pets.Type,<br>
Count(Invoices.OwnerID) as No_of_Visits From Invoices<br>
Join Owners On Owners.OwnerID = Invoices.OwnerID Join Pets on Pets.PetID = Invoices.PetID Where Owners.City ="Palagano" group by Invoices.OwnerID<br>
Having Count(Invoices.OwnerID)>= 2;<br>

We want to spread the word about our new store in the city through people who are already frequent customers in our current store and part of the
community. We want to find which customers are already frequently visiting us in order to build better relationships with them before opening the 
new store and asking them for references and help with other promotional activities.<br>

**23. Find the total amount of people spend on cats and dogs in Rock Springs and Palagano**<br>
Select Pets.Type, Sum(Invoices.Payment) as TotalSpent, Owners.City From Pets<br>
Join Invoices on Invoices.PetID=Pets.PetID<br>
Join Owners on Invoices.OwnerID=Owners.OwnerID<br>
Where Owners.City ="Rock Springs" or Owners.City = "Palagano" Group by Pets.Type, Owners.City;<br>

We want to know which cities spend more on cats or dogs. This will help us decide how we want to price our services as well as any new products 
that we might decide to start selling. For instance, in Rock Springs we can see that customers have spent more on dogs compared to cats but the 
number of pets like cats is much lower in the city. This shows that cat owners spend more on their pets since the proportion of difference is low 
between the total spending between the two types.<br>

**24. Find all the people whose last name starts with A. List their first and last name.**<br>
Select Owners.OwnerID, Owners.OwnerFName, Owners.OwnerLName<br>
From Owners<br>
Join Invoices on Invoices.OwnerID=Invoices.OwnerID Join Pets on Invoices.PetID=Pets.PetID Where Owners.OwnerLName Like 'A%'<br>
Group by Owners.OwnerID;<br>

An employee wants to look up a customer, they know it starts with A, but can't remember the whole last name so they want to see if they can 
identify the customer based on what the name starts with.<br>

#### Stored Procedure
We are using Stored Procedure to update the Wage of the employees.<br>

<img width="730" alt="image" src="https://github.com/aditichand/SQL-Project/assets/61296787/02a1eeac-e268-4935-b8a7-5a036859d8b9">

 
Now if we run the following SQL query we can directly update the wage of the employee by passing the employeeID and the Wage:<br>
call update_employeewage(1,12);
  
