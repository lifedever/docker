UPDATE pay_account a set a.service_id = null;

-- delete from fee_service_period_log;
-- delete from fee_store_contract_log;
-- DELETE from fee_transaction_item;
-- DELETE from fa_project_store_relation;
-- DELETE from fa_project_store_config;
-- DELETE FROM store_categories_ref;
-- DELETE from store_category;
-- DELETE from store_catalog;
-- DELETE from store;
-- DELETE from fee_store_contract;
-- DELETE from fee_transaction;
-- DELETE from fee_payment;
-- DELETE from fee_service_period;
-- DELETE from fee_service_quota;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE fee_invoice_address;
DROP TABLE fee_invoice_record;
DROP TABLE fee_invoice_rise;
DROP TABLE fee_product;
DROP TABLE fee_service_period_log;
DROP TABLE fee_store_contract_log;
DROP TABLE fee_transaction_item;
DROP TABLE fee_transaction;
DROP TABLE fee_store_contract;
DROP TABLE fee_payment;
DROP TABLE fee_service_period;
DROP TABLE fee_service_quota;

DROP TABLE fa_project_store_relation;
DROP TABLE fa_project_store_config;
DROP TABLE store_categories_ref;
DROP TABLE store_category;
DROP TABLE store_catalog;
DROP TABLE store;

SET FOREIGN_KEY_CHECKS=1;
