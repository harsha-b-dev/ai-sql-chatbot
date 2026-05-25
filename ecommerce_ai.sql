-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_ai
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics'),(2,'Mobiles'),(3,'Laptops'),(4,'Fashion'),(5,'Shoes'),(6,'Books'),(7,'Furniture'),(8,'Beauty'),(9,'Toys'),(10,'Sports'),(11,'Groceries'),(12,'Accessories'),(13,'Gaming'),(14,'Kitchen'),(15,'Office'),(16,'Health'),(17,'Jewellery'),(18,'Automotive'),(19,'Music'),(20,'Travel');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ravi','ravi@gmail.com','Bangalore'),(2,'Anu','anu@gmail.com','Chennai'),(3,'Kiran','kiran@gmail.com','Hyderabad'),(4,'Megha','megha@gmail.com','Delhi'),(5,'Arjun','arjun@gmail.com','Mumbai'),(6,'Pooja','pooja@gmail.com','Pune'),(7,'Nikhil','nikhil@gmail.com','Kolkata'),(8,'Divya','divya@gmail.com','Jaipur'),(9,'Rahul','rahul@gmail.com','Goa'),(10,'Sneha','sneha@gmail.com','Mysore'),(11,'Aman','aman@gmail.com','Bhopal'),(12,'Neha','neha@gmail.com','Surat'),(13,'Varun','varun@gmail.com','Noida'),(14,'Priya','priya@gmail.com','Patna'),(15,'Teja','teja@gmail.com','Vizag'),(16,'Ramesh','ramesh@gmail.com','Coimbatore'),(17,'Sita','sita@gmail.com','Madurai'),(18,'John','john@gmail.com','Kochi'),(19,'Ali','ali@gmail.com','Lucknow'),(20,'Sara','sara@gmail.com','Nagpur');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Harsha','AI Developer'),(2,'Raju','Manager'),(3,'Kiran','Support'),(4,'Anu','HR'),(5,'Megha','Sales'),(6,'Rahul','Delivery'),(7,'Divya','QA'),(8,'Sneha','Admin'),(9,'Aman','Finance'),(10,'Neha','Designer'),(11,'Varun','Engineer'),(12,'Priya','Analyst'),(13,'Teja','Intern'),(14,'Ramesh','Security'),(15,'Sita','Reception'),(16,'John','Lead'),(17,'Ali','Marketing'),(18,'Sara','Trainer'),(19,'Vijay','Ops'),(20,'Deepa','Consultant');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,1),(4,4,4,3),(5,5,5,2),(6,6,6,1),(7,7,7,4),(8,8,8,2),(9,9,9,1),(10,10,10,5),(11,11,11,1),(12,12,12,2),(13,13,13,1),(14,14,14,3),(15,15,15,1),(16,16,16,2),(17,17,17,1),(18,18,18,1),(19,19,19,4),(20,20,20,2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'cash','2024-01-01'),(2,2,'upi','2024-01-02'),(3,3,'card','2024-01-03'),(4,4,'cash','2024-01-04'),(5,5,'upi','2024-01-05'),(6,6,'card','2024-01-06'),(7,7,'cash','2024-01-07'),(8,8,'upi','2024-01-08'),(9,9,'card','2024-01-09'),(10,10,'cash','2024-01-10'),(11,11,'upi','2024-01-11'),(12,12,'card','2024-01-12'),(13,13,'cash','2024-01-13'),(14,14,'upi','2024-01-14'),(15,15,'card','2024-01-15'),(16,16,'cash','2024-01-16'),(17,17,'upi','2024-01-17'),(18,18,'card','2024-01-18'),(19,19,'cash','2024-01-19'),(20,20,'upi','2024-01-20');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,55000.00,'paid'),(2,2,40000.00,'paid'),(3,3,45000.00,'paid'),(4,4,9000.00,'paid'),(5,5,10000.00,'pending'),(6,6,8000.00,'paid'),(7,7,2000.00,'paid'),(8,8,5000.00,'pending'),(9,9,7000.00,'paid'),(10,10,3500.00,'paid'),(11,11,700.00,'paid'),(12,12,2400.00,'paid'),(13,13,65000.00,'paid'),(14,14,3000.00,'paid'),(15,15,40000.00,'paid'),(16,16,2000.00,'pending'),(17,17,6000.00,'paid'),(18,18,20000.00,'paid'),(19,19,1200.00,'paid'),(20,20,2500.00,'paid');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop A',3,55000.00),(2,'Mobile X',2,20000.00),(3,'TV',1,45000.00),(4,'Headphones',1,3000.00),(5,'Chair',7,5000.00),(6,'Table',7,8000.00),(7,'Book A',6,500.00),(8,'Shoes A',5,2500.00),(9,'Watch',12,7000.00),(10,'Keyboard',1,1500.00),(11,'Mouse',1,700.00),(12,'Bag',12,1200.00),(13,'Camera',1,65000.00),(14,'Fan',14,3000.00),(15,'AC',14,40000.00),(16,'Mic',19,2000.00),(17,'Speaker',19,6000.00),(18,'Bed',7,20000.00),(19,'Bottle',11,300.00),(20,'Helmet',18,2500.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,5,'Excellent'),(2,2,4,'Good'),(3,3,3,'Average'),(4,4,5,'Nice'),(5,5,4,'Comfortable'),(6,6,5,'Strong'),(7,7,3,'Okay'),(8,8,4,'Stylish'),(9,9,5,'Premium'),(10,10,4,'Useful'),(11,11,5,'Smooth'),(12,12,3,'Normal'),(13,13,5,'Super'),(14,14,4,'Cool'),(15,15,5,'Powerful'),(16,16,4,'Clear'),(17,17,5,'Loud'),(18,18,5,'Comfort'),(19,19,4,'Good'),(20,20,5,'Safe');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `shipment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `shipment_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,1,'delivered'),(2,2,'shipped'),(3,3,'pending'),(4,4,'delivered'),(5,5,'delivered'),(6,6,'shipped'),(7,7,'pending'),(8,8,'delivered'),(9,9,'shipped'),(10,10,'delivered'),(11,11,'pending'),(12,12,'delivered'),(13,13,'shipped'),(14,14,'delivered'),(15,15,'delivered'),(16,16,'pending'),(17,17,'shipped'),(18,18,'delivered'),(19,19,'pending'),(20,20,'delivered');
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'ABC Traders','Bangalore'),(2,'XYZ Supply','Chennai'),(3,'Global Tech','Delhi'),(4,'Mega Store','Mumbai'),(5,'Prime Distributors','Pune'),(6,'South Supply','Hyderabad'),(7,'North Traders','Noida'),(8,'Elite Goods','Kolkata'),(9,'Quick Mart','Jaipur'),(10,'Urban Supply','Goa'),(11,'Digital Hub','Mysore'),(12,'Tech Zone','Bhopal'),(13,'Fashion Hub','Surat'),(14,'Book House','Patna'),(15,'Auto Supply','Vizag'),(16,'Kitchen World','Madurai'),(17,'Beauty Mart','Kochi'),(18,'Sporty','Lucknow'),(19,'Gaming Store','Nagpur'),(20,'Travel Shop','Delhi');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 19:34:50
