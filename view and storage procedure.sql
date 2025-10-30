-----------------------
🌟 VIEWS SECTION
-----------------------
--Shows total revenue and units sold across all records.
CREATE VIEW vw_total_sales AS
SELECT 
  SUM(Revenue) AS total_revenue,
  SUM(Units_Sold) AS total_units
FROM sales_data;

--Displays total revenue and units sold per region.
CREATE VIEW vw_sales_by_region AS
SELECT 
  Region,
  SUM(Revenue) AS total_revenue,
  SUM(Units_Sold) AS total_units
FROM sales_data
GROUP BY Region;

--Lists top products ranked by total revenue.
CREATE VIEW vw_top_products AS
SELECT 
  Product,
  SUM(Revenue) AS total_revenue,
  SUM(Units_Sold) AS total_units
FROM sales_data
GROUP BY Product
ORDER BY total_revenue DESC;
--------------------------------------
⚙️ STORED PROCEDURES SECTION
--------------------------------------
--Show total revenue and total units sold
DELIMITER $$

CREATE PROCEDURE sp_total_sales()
BEGIN
  SELECT 
    SUM(Revenue) AS total_revenue,
    SUM(Units_Sold) AS total_units
  FROM sales_data;
END$$

DELIMITER ;

--Display all sales records for a given region
DELIMITER $$

CREATE PROCEDURE sp_sales_by_region(IN p_region VARCHAR(50))
BEGIN
  SELECT *
  FROM sales_data
  WHERE Region = p_region;
END$$

DELIMITER ;

--Show each product with its total revenue
DELIMITER $$

CREATE PROCEDURE sp_revenue_by_product()
BEGIN
  SELECT 
    Product,
    SUM(Revenue) AS total_revenue
  FROM sales_data
  GROUP BY Product
  ORDER BY total_revenue DESC;
END$$

DELIMITER ;






