WITH latest_prices AS (
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS rn
    FROM products
    WHERE change_date <= '2019-08-16'
),
all_products AS (
    SELECT DISTINCT product_id FROM products
)

SELECT 
    p.product_id,
    ISNULL(lp.new_price, 10) AS price
FROM all_products p
LEFT JOIN latest_prices lp
    ON p.product_id = lp.product_id AND lp.rn = 1
