--- Preparing the data
SELECT *
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

--- Processing the data
-- Checking for duplicate values
SELECT DISTINCT(Customer_ID)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
-- Checking for Null values
SELECT *
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
  WHERE Customer_ID IS NULL
 OR Gender IS NULL
 OR Age IS NULL
 OR Married IS NULL
 OR Number_of_Dependents IS NULL
 OR City IS NULL
 OR Zip_Code IS NULL
 OR Latitude IS NULL
 OR Longitude IS NULL
  OR Number_of_Referrals IS NULL
  OR Tenure_in_Months IS NULL
 OR Offer IS NULL
  OR Phone_Service IS NULL     
OR Avg_Monthly_Long_Distance_Charges IS NULL
 OR Multiple_Lines IS NULL
 OR Internet_Service IS NULL
 OR Internet_Type IS NULL
  OR Avg_Monthly_GB_Download IS NULL
 OR Online_Security IS NULL
 OR Online_Backup IS NULL
 OR Device_Protection_Plan IS NULL
 OR Premium_Tech_Support IS NULL
 OR Streaming_TV IS NULL
 OR Streaming_Movies  IS NULL
 OR Streaming_Music IS NULL
 OR Unlimited_Data IS NULL
 OR Contract IS NULL
 OR Paperless_Billing IS NULL
 OR Payment_Method IS NULL
 OR Monthly_Charge IS NULL
 OR Total_Charges IS NULL
 OR Total_Refunds IS NULL
 OR Total_Extra_Data_Charges IS NULL
 OR Total_Long_Distance_Charges IS NULL
 OR Total_Revenue IS NULL
 OR Customer_Status IS NULL
 OR Churn_Category IS NULL
 OR Churn_Reason IS NULL
 --- There are null values present in the dataset, but i wont be removing them

----Checking for distinctive values
SELECT DISTINCT(Gender)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

  SELECT  DISTINCT Offer
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

  SELECT DISTINCT(Internet_Type)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
  WHERE Internet_Type IS NOT NULL

  SELECT DISTINCT(Contract)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

  SELECT DISTINCT(Payment_Method)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

  SELECT DISTINCT(Customer_Status)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

  SELECT DISTINCT(Churn_Category)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
  WHERE Churn_Category IS NOT NULL

  SELECT DISTINCT(Churn_Reason)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
  WHERE Churn_Reason IS NOT NULL
 
 SELECT DISTINCT(City)
  FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

----Analyse 
--- Cities with the most customers
SELECT City, COUNT(Customer_ID) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY City
ORDER BY count DESC

--- customers age range
SELECT MAX(Age) AS oldest, MIN(Age) AS youngest
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

---Customer distribution by Age
SELECT DISTINCT(Age),COUNT(Customer_ID) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Age
ORDER BY count DESC

--- Customer distribution by Gender
SELECT DISTINCT(Gender), COUNT(Gender)
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Gender

--- Customer distribution by Marital Status
SELECT DISTINCT(Married), COUNT(Married)
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Married
--- Where 0 = No and 1 = Yes

----Company's Stats at the end of the quarter
--- Total  Revenue
SELECT ROUND(SUM(Total_Revenue),0) AS total_revenue
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

---Average Revenue per customer
SELECT ROUND(AVG(Total_Revenue),0) AS avg_revenue
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

---Total long distance charges
SELECT ROUND(SUM(Total_Long_Distance_Charges),0) AS total_lng_dist_charge
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]

---Total Refunds
SELECT ROUND(SUM(Total_Refunds),0) AS total_refunds
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]


--- Customer distribution by their subscription 
--- Customer who subscribed for phone services
SELECT Phone_Service, COUNT(Customer_ID) AS num_of_customers
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Phone_Service
HAVING Phone_Service = 1
--Customers who subscribed for Internet services
SELECT Internet_Service, COUNT(Customer_ID) AS num_of_customers
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Internet_Service
HAVING Internet_Service = 1
--- Customers who subscribed for both Phone and Internet service
SELECT Internet_Service, Phone_Service,COUNT(Customer_ID) AS num_of_customers
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Internet_Service, Phone_Service
HAVING Internet_Service = 1 AND Phone_Service = 1

---Idedentifying high valued customers. Customers with monthly charger greater than $100 are considered high valued customers
SELECT COUNT(Monthly_Charge) AS high_value
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
WHERE Monthly_Charge >= 100 

--- Customer distribution and their status
SELECT DISTINCT(Customer_Status), COUNT(Customer_Status) AS num_of_customers
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status

--- CUstomer Distribution by their Contract type
SELECT DISTINCT(Contract), COUNT(Contract) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Contract

--- Customer Distribution by their Payment type
SELECT DISTINCT(Payment_Method), COUNT(Payment_Method) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Payment_Method

--- Customer Distribution by their Internet connection type
SELECT DISTINCT(Internet_Type), COUNT(Internet_Type) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Internet_Type
HAVING Internet_Type IS NOT NULL

--- Customer Status
SELECT DISTINCT(Customer_Status), COUNT(Customer_Status) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status

--- Customers and the last marketing offer they accepted
SELECT DISTINCT(Offer), COUNT(Offer) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Offer

--- WWhat was the highest number of referrals the company got, and how many customers gave this amount of referrals?
SELECT MAX(Number_of_Referrals) AS max_referrals
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
SELECT COUNT(Number_of_Referrals) AS count_max_referrals
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
WHERE Number_of_Referrals = 11

--- How many customers referred the company?
SELECT COUNT(Number_of_Referrals) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
WHERE Number_of_Referrals >= 1

--- How many High valued customers stayed,joined, and churned at the end of the quarter?
WITH high_value AS (SELECT Customer_Status, Monthly_Charge 
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
WHERE Monthly_Charge >= 100
)
SELECT DISTINCT(Customer_Status), COUNT(Customer_Status) AS count
FROM high_value
GROUP BY Customer_Status

--- Average months spent by Customers that Joined, Stayed and Churned
SELECT DISTINCT(Customer_Status), AVG(Tenure_in_Months)
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status

---- Customer Churn Analysis
--- Number of churned customers
SELECT COUNT(Customer_Status) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
WHERE Customer_Status = 'Churned'

--- Total Revenue that will be lost with the churned customers
SELECT ROUND(SUM(Total_Revenue),0) AS count, Customer_Status 
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status
HAVING Customer_Status = 'Churned'

--- Total Monthly charge that will be lost with the churned customers
SELECT ROUND(SUM(Monthly_Charge),0) AS count, Customer_Status 
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status
HAVING Customer_Status = 'Churned'

--- Average monthly charge that will be lost per churned customers
SELECT ROUND(AVG(Monthly_Charge),0) AS count, Customer_Status 
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status
HAVING Customer_Status = 'Churned'

--- Last Marketing Offer accepted by Churned Customers
SELECT DISTINCT(Offer), COUNT(Offer) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,Offer
HAVING Customer_Status = 'Churned'

--- Churned Customers choice of Internet type
SELECT DISTINCT(Internet_Type), COUNT(Internet_Type) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status, Internet_Type
HAVING Customer_Status = 'Churned'

--- Age distribution of churned customers
SELECT DISTINCT(Age), COUNT(Age) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,Age
HAVING Customer_Status = 'Churned'
ORDER BY count DESC

--- Gender distribution of Churned Customers
SELECT DISTINCT(Gender), COUNT(Gender) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,Gender
HAVING Customer_Status = 'Churned'
ORDER BY count DESC

--- Churned Customers and their contract type
SELECT DISTINCT(Contract), COUNT(Contract) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,Contract
HAVING Customer_Status = 'Churned'
ORDER BY count DESC


---Does the number of  Dependent living with  customers influece churning?
SELECT DISTINCT(Number_of_Dependents), COUNT(Number_of_Dependents) AS count, Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status, Number_of_Dependents
ORDER BY Number_of_Dependents 

---  Cities of Churned customers
SELECT DISTINCT(City), COUNT(Customer_Status) AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,City
HAVING Customer_Status = 'Churned'
ORDER BY count DESC

--- Customer Churn Category
SELECT DISTINCT(Churn_Category), COUNT(Churn_Category) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,Churn_Category
HAVING Customer_Status = 'Churned'
ORDER BY count DESC

--- Customer Churn Reasons
SELECT DISTINCT(Churn_Reason), COUNT(Churn_Reason) AS count , Customer_Status
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status,Churn_Reason
HAVING Customer_Status = 'Churned'
ORDER BY count DESC

--- How many of the churned customers subscribed for technical support plan
SELECT COUNT(Customer_Status), Premium_Tech_Support AS count
FROM [telecom_customer_churn].[dbo].[telecom_customer_churn]
GROUP BY Customer_Status, Premium_Tech_Support
HAVING Customer_Status = 'Churned' AND Premium_Tech_Support = 1

