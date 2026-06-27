## On-Demand Food Delivery Service Database 
### Introduction: 
 
The On-Demand Food Delivery Service Database project focuses on designing and 
implementing a structured and reliable Relational Database Management System (RDBMS) 
to support the complete operational workflow of an online food-delivery platform. The goal 
is to build a database that accurately manages customers, restaurants, menu offerings, 
orders, riders, and payment transactions, while ensuring data integrity, consistency, and 
secure access. Using SQL Server, the project emphasizes strong schema design, proper 
normalization, enforcement of referential integrity, and implementation of transactional 
rules that reflect real-world business operations. 
The database serves as the central backbone that enables the platform to process orders 
efficiently—from menu browsing and ordering to dispatch, delivery, and payment 
settlement. 
 
 
 
### Project Description : 
 ##### Key Stakeholders 
The system is built around coordinating these five parties: 
1. Customer: Places orders, pays, and submits reviews. 
2. Restaurant (Vendor): Accepts, prepares, and confirms order fulfillment. 
3. Rider (Delivery Agent): Picks up orders and completes the delivery. 
4. Admin / Platform: Manages the entire operation, user onboarding, finances, and 
customer support. 
5. Payment Gateway: Handles all financial transactions (Card, Online, or COD 
settlement).

##### Core Business Workflow 
The process follows a logical sequence centered on the Order entity: 
1. Order Placement: The Customer selects a menu, chooses a payment method (stored 
in the Payment table), and places the order. 
2. Preparation: The system sends the order to the Restaurant, which accepts it and 
updates the status to "Preparing." 
3. Dispatch: As the food nears completion, the platform locates an available Rider and 
assigns the delivery job. 
4. Transit: The Rider picks up the order ("Picked Up") and delivers it to the customer 
("Delivered"). 
5. Settlement: The Payment is confirmed (via Gateway or COD collection), and the 
platform distributes funds to the relevant parties. 
6. Feedback: The Customer finalizes the loop by reviewing the service.
   
##### Business Rules 
1. An Order must contain at least one Menu Item. 
2. A Customer can place many Orders. 
3. A Restaurant must offer one or many Menu Items. 
4. A Menu Item must be offered by one and only one Restaurant. 
5. An Order must be delivered by exactly one Rider (once assigned). 
6. An Order is linked to exactly one Payment. 
7. A Payment is linked to exactly one Order. 
8. Online payments are preferred, and a bill can be generated even if the order is not 
placed at the restaurant. 
9. An Order must be placed by one and only one Customer. 
10. An Order must be fulfilled by one and only one Restaurant. 
11. A Rider can deliver many Orders. 
12. An Order must contain one or many Order Items (line items).
