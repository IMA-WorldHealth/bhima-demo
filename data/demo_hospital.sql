-- set variables
SET names 'utf8';
SET character_set_database = 'utf8';
SET collation_database = 'utf8_unicode_ci';

USE bhima_production;

-- locations (enterprise location only)
INSERT INTO `country` VALUES (HUID('dbe330b6-5cde-4830-8c30-dc00eccd1a5f'),'République Démocratique du Congo'),(HUID('dbe330b6-5cde-4830-8c30-dc00eccd1a51'), 'Test Hook Country');
INSERT INTO `province` VALUES (HUID('f6fc7469-7e58-45cb-b87c-f08af93edade'),'Bas Congo', HUID('dbe330b6-5cde-4830-8c30-dc00eccd1a5f')), (HUID('dbe330b6-5cdf-4830-8c30-dc00eccd1a21'), 'Test Hook Province', HUID('dbe330b6-5cde-4830-8c30-dc00eccd1a51'));
INSERT INTO `sector` VALUES (HUID('0404e9ea-ebd6-4f20-b1f8-6dc9f9313450'),'Tshikapa',HUID('f6fc7469-7e58-45cb-b87c-f08af93edade')), (HUID('dbe330b6-5cdf-4830-8c30-dc00eccd1a22'), 'Test Hook Sector', HUID('dbe330b6-5cdf-4830-8c30-dc00eccd1a21'));
INSERT INTO `village` VALUES (HUID('1f162a10-9f67-4788-9eff-c1fea42fcc9b'),'KELE2',HUID('0404e9ea-ebd6-4f20-b1f8-6dc9f9313450')), (HUID('dbe330b6-5cdf-4830-8c30-dc00eccd1a22'), 'Test Hook Village',HUID('dbe330b6-5cdf-4830-8c30-dc00eccd1a22'));

-- Enterprise
-- TODO Gain and loss accounts currently go into gain/ loss on exchange
INSERT INTO `enterprise` VALUES (1,'Demo Hospital','ESE','243 81 00 00 000','info@enterprise.org',HUID('1f162a10-9f67-4788-9eff-c1fea42fcc9b'),NULL,2,NULL, NULL, NULL);

-- Project
INSERT INTO `project` VALUES (1,'Hospital','HSP',1,NULL,0),(2,'Clinique','CLQ',1,NULL,0), (3,'Guest House','GHO',1,NULL,0);

-- create super user
INSERT INTO `user` VALUES
  (1, 'admin', PASSWORD('admin'), 'Administrator', NULL, 0, 0, NULL),
  (2, 'receptionist', PASSWORD('receptionist'), 'Receptionist', NULL, 0, 0, NULL),
  (3, 'doctor', PASSWORD('doctor'), 'Doctor', NULL, 0, 0, NULL),
  (4, 'cashier', PASSWORD('cashier'), 'Cashier', NULL, 0, 0, NULL),
  (5, 'accountant', PASSWORD('accountant'), 'Accountant', NULL, 0, 0, NULL);

-- super user permissions to admin user permissions
INSERT INTO `permission` (unit_id, user_id) VALUES 
(1,1), 
(4,1), 
(2,1),
(3,1),
(5,1),
(9,1),
(16,1), 
(15,1),
(12,1), 
(14,1),
(134,1),
(137,1),
(147,1),
(145,1),
(144,1),
(18, 1);

-- @TODO Temporary - remove when repository is updated to correctly define voucher types
INSERT INTO `transaction_type` (`id`, `text`, `description`, `type`, `prefix`, `fixed`) VALUES
  (1, 'VOUCHERS.SIMPLE.GENERIC_INCOME', 'Generic income transaction type', 'income', 'REC. GEN', 1),
  (2, 'VOUCHERS.SIMPLE.CASH_PAYMENT', 'Cash payment transaction type', 'income', 'CASH', 1),
  (3, 'VOUCHERS.SIMPLE.CONVENTION_PAYMENT', 'Convention payment transaction type', 'income', 'CONV', 1),
  (4, 'VOUCHERS.SIMPLE.SUPPORT_INCOME', 'Support transaction type', 'income', 'PEC', 1),
  (5, 'VOUCHERS.SIMPLE.TRANSFER', 'Transfer transaction type', 'income', 'TRANSF', 1),
  (6, 'VOUCHERS.SIMPLE.GENERIC_EXPENSE', 'Generic expense transaction type', 'expense', 'DEP. GEN', 1),
  (7, 'VOUCHERS.SIMPLE.SALARY_PAYMENT', 'Salary payment transaction type', 'expense', 'SALAIRE', 1),
  (8, 'VOUCHERS.SIMPLE.CASH_RETURN', 'Cash return transaction type', 'expense', 'PAYBACK', 1),
  (9, 'VOUCHERS.SIMPLE.PURCHASES', 'Purchase transaction type', 'expense', 'ACHAT', 1),
  (10,'VOUCHERS.SIMPLE.CREDIT_NOTE', 'Credit note transaction type', 'other', 'CREDIT NOTE', 1);


INSERT INTO `exchange_rate` VALUES
  (1,1,1,900.0000, DATE('2016-01-01')),
  (2,1,1,930.0000, NOW());

-- super user permissions on projects
INSERT INTO `project_permission` VALUES (1,1,1),(2,1,2);

-- enterprise cashboxes
INSERT INTO `cash_box` (`id`, `label`, `project_id`, `is_auxiliary`) VALUES (1, 'Hospital Cash Window', 1, 1), (2, 'Hospital Primary Cashbox', 1, 0);

-- basic services for hospital
INSERT INTO `service` VALUES (1, 1, 'Administration', NULL, NULL), (2, 1, 'Pediatrie', NULL, NULL), (3, 1, 'Medecine Interne', NULL, NULL);

  -- Fiscal Year 2015
  SET @fiscalYear2015 = 0;
  CALL CreateFiscalYear(1, NULL, 1, 'Test Fiscal Year 2015', 12, DATE('2015-01-01'), DATE('2015-12-31'), 'Note for 2015', @fiscalYear2015);

  -- Fiscal Year 2016
  SET @fiscalYear2016 = 0;
  CALL CreateFiscalYear(1, @fiscalYear2015, 1, 'Test Fiscal Year 2016', 12, DATE('2016-01-01'), DATE('2016-12-31'), 'Note for 2016', @fiscalYear2016);

  -- Fiscal Year 2017
  SET @fiscalYear2017 = 0;
  CALL CreateFiscalYear(1, @fiscalYear2016, 1, 'Test Fiscal Year 2017', 12, DATE('2017-01-01'), DATE('2017-12-31'), 'Note for 2017', @fiscalYear2017);
