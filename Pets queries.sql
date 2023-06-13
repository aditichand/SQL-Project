Select Owners.OwnerFName, Owners.OwnerLName, Owners.City,
Pets.type, Invoices.Payment
from Owners
Join Pets on Owners.OwnerID = Pets.OwnerID Join Invoices ON Pets.OwnerID = Invoices.OwnerID
Where Invoices.Payment >= "15" and Date > "06-01-19" Group by Owners.OwnerID Order by Payment desc;

Select count(City) as No_ofCustomers, City from Owners Group by City
Order by count(City) desc limit 5;

Select Count(Invoices.EmployeeID) as No_ofServicesPerformed, Employees.EmployeeFName, Employees.EmployeeLName,
Employees.EmployeeID from Employees
Join Invoices ON Invoices.EmployeeID = Employees.EmployeeID Group By Employees.EmployeeID
Order by
Count(Invoices.EmployeeID) DESC Limit 2;

SELECT
Pets.Type, Pets.PetName, Pets.PetID, Invoices.ServiceID, Services.ServiceName FROM Invoices
JOIN Pets ON Pets.PetID = Invoices.PetID
JOIN Services ON Services.ServiceID = Invoices.ServiceID;

Select COUNT(Invoices.OwnerID) as No_ofVisits, OwnerFName,
OwnerLName FROM Invoices
JOIN Owners ON Owners.OwnerID = Invoices.OwnerID Group By Invoices.OwnerID Having COUNT(Invoices.OwnerID) > 1 
Order by Count(Invoices.OwnerID) Desc;

Select Count(Invoices.ServiceID), Services.ServiceName From
Services
Left Outer Join Invoices ON Invoices.ServiceID = Services.ServiceID Group by Invoices.ServiceID
Order by
Count(Invoices.ServiceID) DESC Limit 2;

Select o.Ownerfname, o.Ownerlname, p.petname, p.Type,i.date From Invoices i
left join Owners o on i.OwnerID = o.OwnerID
left join Pets p on i.PetID = p.PetID
where p.type = "Dog" Order by i.Date desc Limit 5;


Select i.EmployeeID, e.EmployeeFName, e.EmployeeLName, count(distinct o.OwnerID) as num_of_Owners_served
From Invoices i
left join Employees e on i.EmployeeID = e.EmployeeID
Left join Owners o on i.OwnerID = o.OwnerID
Group by i.EmployeeID
having count(distinct o.OwnerID) > 3 Order by num_of_Owners_served desc;

Select
count(p.Type) as No_ofPets, p.Type
From Pets as p
left join Owners as o on o.OwnerID = p.OwnerID where
o.city = "Rock Springs" Group by p.type;


Select Invoices.OwnerID, Owners.OwnerFName, Owners.OwnerLName, Owners.City, Pets.Type,
Count(Invoices.OwnerID) as No_of_Visits From Invoices
Join Owners On Owners.OwnerID = Invoices.OwnerID Join Pets on Pets.PetID = Invoices.PetID Where Owners.City ="Palagano" group by Invoices.OwnerID
Having Count(Invoices.OwnerID)>= 2;


Select Pets.Type, Sum(Invoices.Payment) as TotalSpent, Owners.City From Pets
Join Invoices on Invoices.PetID=Pets.PetID
Join Owners on Invoices.OwnerID=Owners.OwnerID
Where Owners.City ="Rock Springs" or Owners.City = "Palagano" Group by Pets.Type, Owners.City;

Select
Owners.OwnerID, Owners.OwnerFName, Owners.OwnerLName
From Owners
Join Invoices on Invoices.OwnerID=Invoices.OwnerID Join Pets on Invoices.PetID=Pets.PetID 
Where Owners.OwnerLName Like 'A%' 
Group by Owners.OwnerID;

Select Owners.OwnerFName, Owners.OwnerLName, Owners.City,
Pets.type, Invoices.Payment
from Owners
Join Pets on Owners.OwnerID = Pets.OwnerID Join Invoices ON Pets.OwnerID = Invoices.OwnerID
Where Invoices.Payment >= "15" and Date > "06-01-19" Group by Owners.OwnerID;

Select count(City) as No_ofCustomers, City from Owners 
Group by City Order by count(City) desc limit 5;

Select
Count(Invoices.EmployeeID) as No_ofServicesPerformed, Employees.EmployeeFName, Employees.EmployeeLName,
Employees.EmployeeID from Employees
Join Invoices ON Invoices.EmployeeID = Employees.EmployeeID Group By Employees.EmployeeID
Order by
Count(Invoices.EmployeeID) DESC Limit 2;

SELECT
Pets.Type, Pets.PetName, Pets.PetID, Invoices.ServiceID, Services.ServiceName FROM Invoices
JOIN Pets ON Pets.PetID = Invoices.PetID
JOIN Services ON Services.ServiceID = Invoices.ServiceID;

Select
COUNT(Invoices.OwnerID) as No_ofVisits, OwnerFName,
OwnerLName FROM Invoices
JOIN Owners ON Owners.OwnerID = Invoices.OwnerID Group By Invoices.OwnerID 
Having COUNT(Invoices.OwnerID) > 1 
Order by Count(Invoices.OwnerID) Desc;

Select Count(Invoices.ServiceID), Services.ServiceName From
Services
Left Outer Join Invoices ON Invoices.ServiceID = Services.ServiceID Group by Invoices.ServiceID
Order by
Count(Invoices.ServiceID) DESC Limit 2;

Select
o.Ownerfname, o.Ownerlname, p.petname, p.Type,
i.date
From Invoices i
left join Owners o on i.OwnerID = o.OwnerID left join Pets p on i.PetID = p.PetID where p.type = "Dog" Order by i.Date desc Limit 5;


Select
i.EmployeeID, e.EmployeeFName, e.EmployeeLName,
count(distinct o.OwnerID) as num_of_Owners_served
From Invoices i
left join Employees e on i.EmployeeID = e.EmployeeID Left join Owners o on i.OwnerID = o.OwnerID
Group by i.EmployeeID
having count(distinct o.OwnerID) > 3 Order by num_of_Owners_served desc;

Select count(p.Type) as No_ofPets, p.Type
From Pets as p
left join Owners as o on o.OwnerID = p.OwnerID where
o.city = "Rock Springs" Group by p.type;

Select Invoices.OwnerID, Owners.OwnerFName, Owners.OwnerLName, Owners.City, Pets.Type,
Count(Invoices.OwnerID) as No_of_Visits From Invoices
Join Owners On Owners.OwnerID = Invoices.OwnerID Join Pets on Pets.PetID = Invoices.PetID Where Owners.City ="Palagano" group by Invoices.OwnerID
Having Count(Invoices.OwnerID)>= 2;


Select Pets.Type, Sum(Invoices.Payment) as TotalSpent, Owners.City From Pets
Join Invoices on Invoices.PetID=Pets.PetID
Join Owners on Invoices.OwnerID=Owners.OwnerID
Where Owners.City ="Rock Springs" or Owners.City = "Palagano" Group by Pets.Type, Owners.City;

Select Owners.OwnerID, Owners.OwnerFName, Owners.OwnerLName
From Owners
Join Invoices on Invoices.OwnerID=Invoices.OwnerID 
Join Pets on Invoices.PetID=Pets.PetID 
Where Owners.OwnerLName Like 'A%' Group by Owners.OwnerID;



















