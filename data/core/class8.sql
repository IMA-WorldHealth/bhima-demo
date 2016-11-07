-- CLASS 8 ACCOUNTS 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

INSERT INTO `account` (`id`, `type_id`, `enterprise_id`, `number`, `label`, `parent`, `locked`, `cc_id`, `pc_id`, `created`, `classe`, `is_asset`, `reference_id`, `is_brut_link`, `is_title`, `is_charge`) VALUES
(280, 3, 1, 81111010, 'Immobilisations incorporelles', 65, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL),
(281, 3, 1, 81211010, 'Immobilisations corporelles', 65, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL),
(282, 3, 1, 81611010, 'Immobilisations financières', 65, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL)
;