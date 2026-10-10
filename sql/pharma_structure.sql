-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: pharma_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugs` (
  `drug_id` text,
  `drug_name` text,
  `generic_name` text,
  `category` text,
  `specification` text,
  `unit_price` double DEFAULT NULL,
  `storage_condition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` text,
  `equipment_name` text,
  `type_code` text,
  `model` text,
  `manufacturer` text,
  `purchase_date` text,
  `status` text,
  `last_maintenance_date` text,
  `workshop` text,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_lines`
--

DROP TABLE IF EXISTS `production_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_lines` (
  `line_id` text,
  `line_name` text,
  `product_type` text,
  `daily_capacity` int DEFAULT NULL,
  `status` text,
  `supervisor` text,
  `workshop` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_records`
--

DROP TABLE IF EXISTS `production_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_records` (
  `record_id` text,
  `batch_number` text,
  `drug_id` text,
  `drug_name` text,
  `line_id` text,
  `start_time` text,
  `end_time` text,
  `planned_qty` double DEFAULT NULL,
  `actual_qty` double DEFAULT NULL,
  `yield_rate` double DEFAULT NULL,
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quality_inspections`
--

DROP TABLE IF EXISTS `quality_inspections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality_inspections` (
  `inspection_id` text,
  `batch_number` text,
  `drug_id` text,
  `drug_name` text,
  `inspection_type` text,
  `result_value` double DEFAULT NULL,
  `specification_range` text,
  `result` text,
  `inspector` text,
  `inspection_date` text,
  `remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_batch_performance`
--

DROP TABLE IF EXISTS `v_batch_performance`;
/*!50001 DROP VIEW IF EXISTS `v_batch_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_batch_performance` AS SELECT 
 1 AS `record_id`,
 1 AS `batch_number`,
 1 AS `drug_name`,
 1 AS `dosage_form`,
 1 AS `line_name`,
 1 AS `workshop`,
 1 AS `planned_qty`,
 1 AS `actual_qty`,
 1 AS `yield_rate`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `duration_hours`,
 1 AS `batch_status`,
 1 AS `yield_alert_flag`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dim_workshop`
--

DROP TABLE IF EXISTS `v_dim_workshop`;
/*!50001 DROP VIEW IF EXISTS `v_dim_workshop`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dim_workshop` AS SELECT 
 1 AS `workshop`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_equipment_workshop_load`
--

DROP TABLE IF EXISTS `v_equipment_workshop_load`;
/*!50001 DROP VIEW IF EXISTS `v_equipment_workshop_load`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_equipment_workshop_load` AS SELECT 
 1 AS `equipment_id`,
 1 AS `equipment_name`,
 1 AS `model`,
 1 AS `equipment_status`,
 1 AS `workshop`,
 1 AS `line_name`,
 1 AS `line_status`,
 1 AS `active_equipment_in_workshop`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_quality_analysis`
--

DROP TABLE IF EXISTS `v_quality_analysis`;
/*!50001 DROP VIEW IF EXISTS `v_quality_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_quality_analysis` AS SELECT 
 1 AS `inspection_id`,
 1 AS `batch_number`,
 1 AS `drug_name`,
 1 AS `inspection_type`,
 1 AS `result_value`,
 1 AS `specification_range`,
 1 AS `inspection_result`,
 1 AS `inspector`,
 1 AS `inspection_date`,
 1 AS `remarks`,
 1 AS `oos_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_batch_performance`
--

/*!50001 DROP VIEW IF EXISTS `v_batch_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_batch_performance` AS select `pr`.`record_id` AS `record_id`,`pr`.`batch_number` AS `batch_number`,`d`.`drug_name` AS `drug_name`,`d`.`category` AS `dosage_form`,`pl`.`line_name` AS `line_name`,`pl`.`workshop` AS `workshop`,`pr`.`planned_qty` AS `planned_qty`,`pr`.`actual_qty` AS `actual_qty`,`pr`.`yield_rate` AS `yield_rate`,`pr`.`start_time` AS `start_time`,`pr`.`end_time` AS `end_time`,timestampdiff(HOUR,`pr`.`start_time`,`pr`.`end_time`) AS `duration_hours`,`pr`.`status` AS `batch_status`,(case when ((`pr`.`status` = '已完成') and (`pr`.`yield_rate` < 90.00)) then '收率偏低（触发 GMP 偏差调查）' else '正常' end) AS `yield_alert_flag` from ((`production_records` `pr` left join `drugs` `d` on((`pr`.`drug_id` = `d`.`drug_id`))) left join `production_lines` `pl` on((`pr`.`line_id` = `pl`.`line_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dim_workshop`
--

/*!50001 DROP VIEW IF EXISTS `v_dim_workshop`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dim_workshop` AS select distinct `production_lines`.`workshop` AS `workshop` from `production_lines` union select distinct `equipment`.`workshop` AS `workshop` from `equipment` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_equipment_workshop_load`
--

/*!50001 DROP VIEW IF EXISTS `v_equipment_workshop_load`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_equipment_workshop_load` AS select `eq`.`equipment_id` AS `equipment_id`,`eq`.`equipment_name` AS `equipment_name`,`eq`.`model` AS `model`,`eq`.`status` AS `equipment_status`,`eq`.`workshop` AS `workshop`,`pl`.`line_name` AS `line_name`,`pl`.`status` AS `line_status`,(select count(0) from `equipment` `e2` where ((`e2`.`workshop` = `eq`.`workshop`) and (`e2`.`status` = '运行中'))) AS `active_equipment_in_workshop` from (`equipment` `eq` left join `production_lines` `pl` on((`eq`.`workshop` = `pl`.`workshop`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_quality_analysis`
--

/*!50001 DROP VIEW IF EXISTS `v_quality_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_quality_analysis` AS select `qi`.`inspection_id` AS `inspection_id`,`qi`.`batch_number` AS `batch_number`,`qi`.`drug_name` AS `drug_name`,`qi`.`inspection_type` AS `inspection_type`,`qi`.`result_value` AS `result_value`,`qi`.`specification_range` AS `specification_range`,`qi`.`result` AS `inspection_result`,`qi`.`inspector` AS `inspector`,`qi`.`inspection_date` AS `inspection_date`,`qi`.`remarks` AS `remarks`,(case when (`qi`.`result` = '不合格') then '检验超标 OOS' else '合格 (Pass)' end) AS `oos_status` from `quality_inspections` `qi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-10 11:51:18
