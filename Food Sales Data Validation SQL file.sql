SELECT * FROM
[Amazon Sales Data Table]


SELECT MAX([Total Sales Amount]), Item
FROM [Amazon Sales Data Table]
GROUP BY Item


SELECT round(sum([Total Sales Amount]),0)
FROM [Amazon Sales Data Table]-- 18618769

SELECT ROUND(SUM([Sales Margin Amount(Profit)]),0)
FROM [Amazon Sales Data Table] -- 77749723

SELECT DISTINCT([Item])
FROM [Amazon Sales Data Table]-- 657

SELECT DISTINCT([CustKey])
FROM [Amazon Sales Data Table]--615

SELECT AVG([Discount Amount(M-L)])
FROM [Amazon Sales Data Table]--1855.54025458864

SELECT SUM([Sales Quantity])
FROM [Amazon Sales Data Table] --2943195
 

--Bottom 10 Products in terms of Loss
select top 10 item,sum([Sales Margin Amount(Profit)])as tot_qty from [Amazon Sales Data Table]
group by item 
order by sum([Sales Margin Amount(Profit)])ASC;
-- Fast Lemon Cookies, Best Choice Fondue Mix, Just Right Chicken soup, Carlson Blueberry Ypgurt, Landslide Low Fat  Apple Butter,Good Chablis Wine, Blue Label Rice Soup, Landslide Salt,Carlson Mild Cheddae Cheese, Carlson Sharp Cheddar Cheese

--Top 10 Products in terms of profit
select top 10 item,sum([Sales Margin Amount(Profit)])as tot_qty from [Amazon Sales Data Table]
group by item 
order by sum([Sales Margin Amount(Profit)]) desc;
--Better Large Canned Shrimp,High Top Dried Mushrooms,Big Time Frozen Cheese Pizza,Fast Mini Donuts,Discover Manicotti, Ebony Squash,Better Fancy Canned Sardines,Landslide White Sugar,Tell Tale Red Delcious Apples,Better Canned Tuna in Oil  

--Top 5 Products in terms of Sales
select top 5 item,sum([sales quantity])as tot_qty from [Amazon Sales Data Table]
group by item 
order by sum([sales quantity]) desc;
--Better Large Canned Shrimp, High Top Dried Mushrooms, Better Canned Tuna in Oil, Walrus Chardonnay, Red Spade Pimento Loaf 

--TOP 10 MOST ORDERED ITEMS 
SELECT top 10 COUNT([Item]) AS NO_OF_ORDERS,ITEM
FROM [Amazon Sales Data Table]
GROUP BY  Item
ORDER BY COUNT([Item]) DESC;

--Better Fancy Canned Sardines, Ebony Prepared Salad, Moms Sliced Turkey,Imagine Popsicles, Discover Manicotti, Red Spade Foot-Long Hot Dogs, High Top Dried Mushrooms, Big Time Frozen Cheese Pizza, Cutting Edge Foot-Long Hot Dogs, Bravo Large Canned Shrimp, 










