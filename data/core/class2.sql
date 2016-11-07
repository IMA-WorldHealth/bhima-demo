-- CLASS 2 ACCOUNTS 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

INSERT INTO `account` (`id`, `type_id`, `enterprise_id`, `number`, `label`, `parent`, `locked`, `cc_id`, `pc_id`, `created`, `classe`, `is_asset`, `reference_id`, `is_brut_link`, `is_title`, `is_charge`) VALUES
(150, 3, 1, 22321000, 'Batiment Hopital', 20, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL),
(151, 3, 1, 23131000, 'Batiment Hopital', 21, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL),
(152, 3, 1, 24480040, 'Mobiliers Hopital', 21, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL),
(156, 3, 1, 28310010, 'Amortissement Batiments', 24, 0, NULL, NULL, '2016-10-23 17:05:34', NULL, NULL, NULL, NULL, 0, NULL)
;