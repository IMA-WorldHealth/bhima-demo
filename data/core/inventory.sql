-- Inventory and inventory  group dataset

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Contenu de la table `inventory_group`
--

INSERT INTO `inventory_group` (`uuid`, `name`, `code`, `sales_account`, `cogs_account`, `stock_account`, `donation_account`) VALUES
(0x08248ec3291c4eb8928cc96fa2ba40aa, 'Endodontie', '1', 0, NULL, NULL, NULL),
(0x08bfd50dc710407c973500f436769ee4, 'Produit dentaire', '2', 0, NULL, NULL, NULL),
(0x0944d1daf08645f287c512614cb50e07, 'Lunettes', '3', 0, NULL, NULL, NULL),
(0x0b156b95f8874cfbbd09e729e3e3642a, 'Sondes', '4', 0, NULL, NULL, NULL),
(0x124b8a66c0e347ab8e0a19c0019b6c43, 'Consultation', '5', 0, NULL, NULL, NULL),
(0x1c9937a33d2d48a882425941d3cca250, 'Medicaments en Poudre et Capsul', '6', 0, NULL, NULL, NULL),
(0x23e46f3b79824ec496ec3e0c76ee7f62, 'Suppositoires', '7', 0, NULL, NULL, NULL),
(0x26a06810c8684edc97200cb3ee20f8fa, 'Optique', '8', 0, NULL, NULL, NULL),
(0x294b756de054479a88b2d39df85a6de1, 'Visite speciale', '9', 0, NULL, NULL, NULL),
(0x2afc3b17dc1b4e5bbc8b5651486e4c87, 'Ophtamologie', '10', 0, NULL, NULL, NULL),
(0x2b0a1f2899f44d38aff2e09ef5aaf9d8, 'Hospitalization', '11', 0, NULL, NULL, NULL),
(0x30b1e2500355446991c8f0950206cca3, 'service preventif', '12', 0, NULL, NULL, NULL),
(0x45442fa27932490b867bafa853b864d8, 'Produits Radio', '13', 0, NULL, NULL, NULL),
(0x4b4dbc73bd18466aa8c4317af2c0a350, 'Petite chirurgie sutures', '14', 0, NULL, NULL, NULL),
(0x5bf8aae6225842aebec8aa852ff28108, 'Fourniture nursing(bistouris,sparadraps,...)', '15', 0, NULL, NULL, NULL),
(0x621dbba39f714d609cde727f87258260, 'Fournitures Papeterie', '16', 0, NULL, NULL, NULL),
(0x6d921ee8771d4471928fb098bba19fbf, 'IMA Subsidy', '17', 0, NULL, NULL, NULL),
(0x7a7b164e443d4229bc846c34007d8c04, 'Parodontie', '18', 0, NULL, NULL, NULL),
(0x827229e0feae428493510e68bd489915, 'Fournitures Electriques et Soudures', '19', 0, NULL, NULL, NULL),
(0x8337b0ed64a84b84b72196bb33e8d05a, 'Medicaments en Sirop', '20', 243, 210, 163, NULL),
(0x8d8ae9d7bafb482cafd27c6f23b361c2, 'Platre', '21', 0, NULL, NULL, NULL),
(0x8eddf5f5c1e24f15bd01530e6baca071, 'Chirurgie', '22', 0, NULL, NULL, NULL),
(0x8f7ad32b1c5944c88c19d9727896c218, 'Labo', '23', 0, NULL, NULL, NULL),
(0x92efe5164e99411282e0e86b30bfbc12, 'Administration', '24', 0, NULL, NULL, NULL),
(0x95c6d2bad6034c7a8ae24c24122277ad, 'Urgence', '25', 0, NULL, NULL, NULL),
(0x9616cddfd20447bc9871be0d8ddfc5ad, 'Accouchement', '26', 0, NULL, NULL, NULL),
(0xa219429f8da844608c3f01f81975da25, 'produit entretien nettoyage020', '27', 0, NULL, NULL, NULL),
(0xa5225915ed054e61b5164c52ef97a271, 'Reactifs Labo', '28', 0, NULL, NULL, NULL),
(0xb2c7ab4c575f45e1932ae458422ef84a, 'Equipements medicaux (gants,blouses, masques...)', '29', 0, NULL, NULL, NULL),
(0xb554ebf97a0f4fd2bddef902ebd96fee, 'Radiologie', '30', 0, NULL, NULL, NULL),
(0xbaa8ea294623445b9d4e04c76aaecf0f, 'Soins dentaire', '31', 0, NULL, NULL, NULL),
(0xc13da749a9cd4894b39bbe0c26919304, 'Injectable', '32', 0, NULL, NULL, NULL),
(0xc673e6d2a1fd4bcaaa0e92425fc099bb, 'Orl', '33', 0, NULL, NULL, NULL),
(0xd66a051867ce475cb1240bb78a65533f, 'Medicaments en comprimes', '34', 242, 209, 162, NULL),
(0xd9f8daaa22de4a33801e4c07317b1983, 'Externe', '35', 0, NULL, NULL, NULL),
(0xe4941f6527224fceb56488068e2d0795, 'Extration dentaire', '36', 0, NULL, NULL, NULL),
(0xe81eaa93e0bd4f9e893fb0d826bf2732, 'obturation provisoire', '37', 0, NULL, NULL, NULL),
(0xf0d2be9a39bc4a6cb5cbd56b7b25852e, 'Orthodontie', '38', 0, NULL, NULL, NULL),
(0xf24e732567a848f1aeb0b7c4c89f2884, 'Perfusion', '39', 0, NULL, NULL, NULL);

--
-- Contenu de la table `inventory`
--

INSERT INTO `inventory` (`enterprise_id`, `uuid`, `code`, `text`, `price`, `group_uuid`, `unit_id`, `unit_weight`, `unit_volume`, `stock`, `stock_max`, `stock_min`, `type_id`, `consumable`, `origin_stamp`) VALUES
(1, 0x00efb27b0d504561bf1394337c069c2a, '110001', 'ampicilline susp \'100 ml125mg/5ml', '0.6600', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x00f2e9564a754dc882dd1e8eca56fce7, '100029', 'cimetidine , tagamet,pintapro 200 mg', '0.0500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x0105ea85dfde4d48a434355b43a363fb, '100007', 'amoxycilline 250 mg', '0.0400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x032c9694d4d14ae795afbcc78bf91e00, '100125', 'Arinate', '0.4400', 0xd66a051867ce475cb1240bb78a65533f, 5, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x03e3a21a9985498e84de6d4ad3069668, '100030', 'ciprofloxacine (cifin ) 500 mg tab', '0.0900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x04333d8f14454a85b1300d3279e2264b, '100019', 'captopril 25 mg25mg', '0.3700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x04be44e3b04d4bcaaf6216850656f169, '1100210', 'Zidovudine (ZDV) 300mg+Lamivudine (3TC) 150mg, tab, 60', '0.2991', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x068f01caa6e14ead8eb9a8142946eae6, '100065', 'isosorbide dinitrate 5 mg blister', '0.0800', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x06d193f6d6094e39b23d34e3551a9b2b, '100108', 'spironolactone 25 mg', '0.0800', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x06e8d1f6ea3443109ea9bf8255f3ad8f, '100002', 'acide folique5 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x0753c89fdff4416f8e6d9d8b13c677a0, '1100208', 'Azithromycine,250mg,tab, 6', '0.1810', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x09bdb6ed56394779952b10950cd15c7e, '100064', 'isoniazide/thiacetazone100/50mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x0a9001006b1b469eb3a0a7c59e732b63, '005001', 'Cotrimoxazol 960 mg tab', '0.7930', 0xd66a051867ce475cb1240bb78a65533f, 9, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x0ca82c82081244ddbfb9be7d05d00018, '170449', 'Nevirapine (NVP) Sirop,10mg/ml,240ml, fl', '5.4534', 0x8337b0ed64a84b84b72196bb33e8d05a, 10, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1242e12c88ff405ca4b9ea7eda0e9f77, '100076', 'niclosamide500 mg', '0.0600', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x130768152132405faa0ed12a39c9698c, '100004', 'allopurinol 100 mg100 mg', '0.0300', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x156b70bb5e564365aeaf4ddc5694f872, '110014', 'salbutamol oral 0,5', '3.7000', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x15e6dde907e949929a73748cff5c4fbd, '100130', 'Glyciphage 850mg, tab', '0.2470', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1613e30bd7734bc4a7df08da335afc3e, '100096', 'prednisone 5 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x17e269b941ad4f07b2b99fc9eae9dfeb, '100079', 'norethisterone 5 mg tab', '0.1400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x17ea51ae53c446d892b4a10b9228b78d, '100022', 'cefaclor ( cifidine) , cefixine250 mg', '0.2700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1a5615d3f6494307b3f85a16b9676b14, '100078', 'nitrofurantoine(furadatin)100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1a670e2868fc4b80bfa274983a96c364, '100126', 'Aciclovir 200mg, tab 100 vrac', '0.0379', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1a6a1c3e9b3b42f2a8b3ea5f7c3bca94, '100119', 'vitamine C (acide ascorbic) 250 mg tab', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1b2a880da9a945df8dca328f0c9acc53, '100040', 'diazepam5 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1bbba4371166484fbd8be344a4c6b734, '100085', 'papaverine40mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1c018d0423874901b487a135a278f1fb, '100074', 'metronidazole , flagyl 250 mg tab', '0.0500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x1fb9c1c3531f4235a7ffef92ca7bf29e, '100801', 'Ibuprofen 200mg tab', '0.0153', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x21ef4a8fb26f4fcba63ec5c3223a0ca7, '100026', 'chloroquine phosph150 mg base tab', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x225453d54e0b48d4b7ebcf916d7e1c15, '1100207', 'Misoprostol, 0.2mg, tab, 100', '0.1690', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x2412f3cb748b4abbbcfdf11282fc8b88, '1100202', 'Phenobarbital, 100mg, 1000, vrac', '0.0227', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x248c675a70134b98930127c8277a3ce2, '100013', 'aspirine adulte 500 mg tab (EML)', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x24b7b3ab1b6843e0a541d17bc048f4be, '110010', 'multivitamine sirop500 ml', '1.9000', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x26c3c3c0fe91452a8d0007e5cdd2e566, '100098', 'promethazine 25 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x2765833ecdad4f3e9741bb85593d30ff, '110016', 'Tylenol sirop (cold multivit)', '5.1200', 0x8337b0ed64a84b84b72196bb33e8d05a, 8, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x28a501cd4261484598900c761aa8e8c2, '100084', 'ovidon (lo-femenal)', '0.3900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x293027e5f3ba4817883f9ecf91fcdf74, '100032', 'clarythromycine( biaxin)250 mg', '0.3200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x2a5c5a6e6192475f8fcc2c67b9f50aa1, '110018', 'Tinidazol 500mg, tab', '0.0520', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x2b39cb6e40e24fc5baae3154d423cff4, '100036', 'co trimoxazole100/20 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x2e5182cf4c414142aba415d854034edd, '100045', 'ephedrine HCL 30 mg', '0.2700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x2e98555f21744f1ca0c9275a91c5c3e4, '100140', 'Chlorpromazine HCL 100mg, tab', '0.0262', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x300634fa36aa486aa4afe434fbd59acd, '100131', 'Sulphate de Zinc', '0.7000', 0xd66a051867ce475cb1240bb78a65533f, 5, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x305eb49ae2a14c5192e6dfa2ac8ef5e7, '100009', 'ampicilline 250 mg caps', '0.0300', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x335d6b10505940c386d7b76f7ffa44a5, '100073', 'metoclopramide 10 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x342da0ca99c14d68a6782b536ba48f52, '100141', 'Na DCC 167mg tab, 200 Vrac', '0.1008', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x35d9bb5277f845b882d760f9e82792e6, '100049', 'ethambutol 400 mg', '0.0600', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x36e1033521334af488c6b29f3a116c38, '1100205', 'Artesinate+Amodiaquine,100mg+270mg base,tab, 6 adulte', '0.2048', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x375718ab966d4e9f88b4fe15071a16d5, '1100200', 'Amoxycilline 125mg/5ml, susp', '0.6600', 0x8337b0ed64a84b84b72196bb33e8d05a, 8, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x37dd78ded4cb49319c3b5a5e06b683c1, '100046', 'ergotamine 1 mg + caffeine 100 tab, blister', '0.6900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x3a95ff60ba1d4a9f8774826397f6737b, '100094', 'piracetam 400mg(nootropil)400 mg', '0.3400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x3b988564edef42bca788595589fe04d0, '100031', 'ciprofloxacin100mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x3c86ccfe051447bb95a779a4780f18c1, '100003', 'albendazole', '0.1300', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x3cdabceaeb1343f9b6ce10d737d29250, '100054', 'glibenclamide 5 mg, tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x3e96743a57f24c8fae355746c5d29938, '100018', 'calcium lactate 300 mg', '0.0300', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x3ebe8581c4e34fb78ecf330e0e529459, '100102', 'quinine sulphate 500 mg', '0.1500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x407935df78b246e3b9dc1f3bc92bb539, '120016', 'cyclophosphamide200 mg', '17.1900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x40b1e0046221428e856402aee03928aa, '100115', 'tribexfort(bte de 30 ces)', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x45b76a9fbcd74f209edeb3f79d75e652, '110004', 'barium sulphate susp. pde1 gr', '1.9200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x49de2c1174ae43908256c3cc74509085, '100124', 'Acide nalidixique 500mg tab', '0.0807', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x4bbc2837394e4fcf8d439a3b9bd086bd, '100048', 'erythromycine 500 mg tab', '0.1500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x4c7b53acc76e44248618b9c94b911d00, '100059', 'hyoscine tab 10 mg BP', '0.0500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x4d19c83a73fa4b2391406d790a59d0e1, '1100201', 'Griseofuvine 250mg, 1000, vrac', '0.0422', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x4e40ce17868e48e693eee870f0c40ad3, '100057', 'hydralazine25 mg', '0.0500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x4fcd69525e694385a867f7a1359d0617, '160002', 'Atropine 1%Flc 5cc', '0.9400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x50e1fdc4e24349b9abc1a0a98a318dda, '100028', 'chlorpromazine 25 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x511d9e4823eb4b82881bea63033fa9c5, '100060', 'ibuprofen 400 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x538c3edc853d48bf8d12367a8cb1ed84, '100023', 'chloroquine phosph100mgbase', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x54de8b92e58b4b2f9af1da4c1ccdbf8e, '100008', 'amoxycilline 500 mg500 mg', '0.0800', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x5fa843bb88a34bbfb8ca2806dcef598c, '100087', 'paracetamol 500mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6157f163ac5c425aa97388588bfa2593, '1100204', 'Artesinate+Amodiaquine, 100mg+270mg, base tab 3, 6-13ans', '0.2629', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x61ecf05460a849149ff93fd55734cb4e, '110020', 'Amoxycilline 250mg/5ml, 100ml, fl', '0.9148', 0x8337b0ed64a84b84b72196bb33e8d05a, 10, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x63fa317da0304f97b831e0399ad9b5ea, '100070', 'mefloquine250mg', '0.9600', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x64d05f5280b643e683e39b75e40f6430, '100106', 'rifampicine150 mg', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6798d6a5b7b64f64ba8191c2016ee666, '100033', 'clofazimine(lamprene)100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6850743abf2f47ffb98c447cb76e5039, '100129', 'Glycophage 500mg, tab', '0.1924', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6993e74b0e744901babbf89c90c86844, '100090', 'penicilline-phenoxymethyl) Pen VK250 mg', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6e1367b19e2241d69366bfc49a623fd7, '100120', 'vitamineB1 (thiamine)100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6e1e750546ec4b189dc70edc39d63a09, '100058', 'hydrochorthiazide 50 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x6f4ae92f57654526b66a1ec4d11bb3a7, '100041', 'Diclofenac sodium 25 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x70f7ea881370434c8655c68e43dc98ea, '110011', 'penicilline VK susp \'100 ml125mg/5ml', '1.3900', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x71dd0df539e444bdae295b2096ad8e41, '100100', 'propranolol40 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x758b352dc1f040b194b158e47aed270c, '100010', 'ampicilline 500 mg caps', '0.0900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x78569037828c427a9f88952d10ca8ee6, '100044', 'doxycyline100 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x7a0bf698cd0940589994755c0b043551, '160001', 'Amethocaine 0.5%Flc 5cc', '0.8100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x7b232c0eb2c041fab9c89aae3a6baf55, '100062', 'isoniazide (inh) 100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x7b45391752e04d7bbad090fa501d784c, '100069', 'mebendazole100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x7ce024fdc2ad4baea8d3b33fea76b914, '100095', 'praziquantel (biltricide) 600 mg', '0.2500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x7fee39d6422845e9abe6a7fa94f00ac6, '100118', 'vitamine B6(pyridoxine)50 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x8810ff545e3b4ee38350891be97f0b0e, '003001', 'ACT 50mg/135 mg 1 a 5 ans', '0.4838', 0xd66a051867ce475cb1240bb78a65533f, 9, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x8a8ab9e6140748f8878e66e6917c7e1e, '100075', 'multivitamine tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x8bc29fbcfe6b422d956b584fbfa58fb8, '110003', 'amoxicillin 125 mg/5ml, dry powder40/100ml', '0.6600', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x8c39eb76990645ec97656442fdeadc68, '100082', 'nystatin orale500,000iu tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x8c8162a9ec324f99985665b01a099726, '100037', 'colchicine', '0.1000', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x8e164aa75c704fe497475beed1a9ffdb, '100114', 'tolbutamide500 mg', '0.0400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x949102cb37dc41b686b4baf0156b52a5, '1100206', 'Clotrimazole,500mg,tab gynecologique,6,', '0.2935', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x9c125b5ae7084bc08606b58673a62f2e, '00010001', 'ACT 100mg/270mg adulte', '0.6451', 0xd66a051867ce475cb1240bb78a65533f, 9, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x9c496d6365a0485fbea927351bb99b7e, '100047', 'erythromycine 250 mg tab', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x9c6c2052a0a846b1827a0c32537ff485, '100086', 'paracetamol500 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x9df335f2c1fe44bc81e01a46fb55bbce, '170448', 'Nystatin,100.000UI/ml,suspension orale,30ml,fl', '1.5000', 0x8337b0ed64a84b84b72196bb33e8d05a, 10, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x9e6c439546bd42ca86a7e6b5a853805e, '100105', 'rifampicine300 mg', '0.1400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0x9efa6b7c577544948bf607861d7e9ef6, '100038', 'cyclophosphamide 50 mg', '0.3100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xa043c1b25b184418930b258410e3bff5, '100053', 'furosemide 40 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xa3184b19be3a439da69293602a006f54, '1100214', 'Artesinate+Amodiaquine,25mg+67.5mg base, tab, 3 2-11mois', '0.0251', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xa355ad04d5554c648036ec1f2a361061, '100011', 'ampicilline 875 mg875 mg', '0.1500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xa380565e260641dfad064c83abe6eb26, '100109', 'sulphamethoxypyridazine(fansidar)500 mg', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xac323348ebd24f9784ae598412c18d3e, '100063', 'isoniazide/thiacetazone300/150mg', '0.0300', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xaf8bcde417bb4d47b2eb465b4ebb5e39, '100016', 'bisacodyl5 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb0411c78c9d740bea7478a2c4c6d52e9, '120803', 'Promethazine Chlorhydrate 5mg/5ml sirop, 100ml', '0.7654', 0x8337b0ed64a84b84b72196bb33e8d05a, 10, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb08b9848180e45fdb65da799223f42af, '100001', 'acetazolamide250 mg', '0.8900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb0b911fcc82e48f79e53c3ab30285655, '100067', 'levamizole 50 mg tab', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb0f7517998ca4ae4bec5c4aa34e0e9e2, '100056', 'griseofulvine125 mg, tab', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb124af8adca9447890c95beed1c07e8d, '0004001', 'ACT 25 mg / 63.5 mg de 0 a 11 mois', '0.4838', 0xd66a051867ce475cb1240bb78a65533f, 9, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb1d4dd3773d84a1597f115306b42fa4b, '100113', 'thyroxine(levothyroxine)', '0.0900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb363681ff8674028bcf16ad42e97d985, '150061', 'tosylochloramine sodique500 mg', '0.9000', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb417651f58a9444cad7004a09cdb4bb2, '100071', 'methotrexate2.5 mg', '0.2600', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb51af15781f1462fb2441f0a6a84cadd, '100014', 'atenolol 100 mg tab', '0.2000', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb7167236f5be492eb4ef04386e826049, '140001', 'anti-snake vehum10 ml', '295.8900', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb79b3f7f5f864f7f9328d2265ab7407a, '120080', 'Coartem tab', '0.1397', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb9284d2dc567469fad0d754f965edb1b, '120066', 'Ceftriaxon 1 gr Fl', '5.0000', 0x8337b0ed64a84b84b72196bb33e8d05a, 10, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb94902f9686d455cb42d5bada27757d6, '100020', 'carbimazole 5mg5mg', '0.0400', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xb989dc760429434d9befbe83a8dcc7c9, '100093', 'phenytoin Sodium(dilatin)100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xba219eff242d4542ac239437662a29d4, '100092', 'phenobarbital 50 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xbb7d265582874ada992a1a03b895e935, '100104', 'reserpine0.25 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xbb9f388804af4d178a38cce7f737e6a2, '100088', 'paracetamol 100 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xbc13ef773b29475ea433332733ff4073, '110008', 'cotrimoxazole susp 100 ml200/40mg/5ml', '2.3200', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xbd90a2e4fb2340b7a5697548ee1b8131, '110002', 'Ampicillin susp250 mg', '2.0000', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xbdea2dc2fe354121888c11f30c63bc4a, '100089', 'penicilline-phenoxymethyl) Pen VK125 mg', '0.0300', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xc0179142ee8b484882719a64ea5a6521, '110007', 'chloramphenicol susp,\'60 ml125/5ml', '2.1000', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xc132d5d1748343a891d04ad0c2370771, '100039', 'dapson 5 mg (pt)', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xc319a305b4844f83abfd45e26fd20cd5, '100043', 'digoxine 0.25 mg tab blister', '0.1500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xc70f076845cc478995b3c8f59fa29ef0, '100061', 'indomethacine25 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xc7d6031de5174299a7bc1dec7120df97, '100077', 'nifedipine 10 mg10 mg', '0.3000', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xc8272ae0c10a49158afa04df16f3aa07, '100142', 'Mebendazol 500 mg, tab', '0.0136', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xcdedb90ce6c3423496d4aa0e278e7641, '1100209', 'Levonorgestrel,0.75mg,tab, 2', '0.3867', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xd63f6bf0cece40bd8479eedec5ef12a5, '1100203', 'Ranitidine,150mg, tab, 100', '0.4960', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xd67b76901a504e80bea0200d792362b1, '100128', 'Gliben M Plus en plaquette', '0.0425', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xd75b69763c89479398285101600de4ee, '100097', 'proguanil (paludrine)100 mg', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xd75d6d27a40044e9a2064a913774dfcc, '100099', 'propantheline bromide15 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xd9a635821b0f46cfb8c3ae9f896bce93, '100012', 'Anti acide, Maalox 400/500 mg/ tab', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xdb2f427466ef4a649e68b22045b364ec, '110017', 'Erythromycine 250mg/5ml, 100ml', '1.9000', 0x8337b0ed64a84b84b72196bb33e8d05a, 10, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe08af26c6ccc4e49865fd648f5d624db, '100081', 'noscapine15 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe095e87fc6b44f07beb713e6df044635, '100103', 'quinine sulphate 300 mg tab', '0.1600', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe2a7263262754f478821dc0bc2c1c2a6, '100024', 'chloramine 500 mg500mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe3236209b29443ccbe5271cec116d264, '100042', 'diethylcarbamazine citrate 50 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe4b59d1b42b34a778d49ee6d2dc8a7c2, '100800', 'cotrimoxazol 480mg tab', '0.0197', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe5e0b30c26f0410289f9b923d8ce3760, '120081', 'Artthefan tab', '0.1397', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe60c1eaf8f17478f8fc72932e39d1545, '100035', 'co trimoxazole 400/80mg tab', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe9900ff7cd7548878d018703f5c0817b, '002001', 'ACT 100mg/270ml 6 a 13 ans', '0.4838', 0xd66a051867ce475cb1240bb78a65533f, 9, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xe9b241ae528f4bf882d697b2e21a77d8, '100072', 'methyldopa250 mg', '0.0500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xeb3f6f9a924f4c799ba930abf4955043, '100117', 'vitamine B complex tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xec2f22e16e874adcac96bbf6354dc3d0, '110006', 'cefaclor suspension125/5ml', '1.6600', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xeedcad3e36f14f0a94f67c992328263c, '100055', 'griseofulvine 500 mg, tab', '0.1100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf104a3f28b214e76a0859db7db1c9ab0, '1100215', 'Artesinate+Amodiaquine, 50mg+135mg base, tab 3, 1-5ans', '0.1849', 0xd66a051867ce475cb1240bb78a65533f, 15, 0, 0, 0, 0, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf3331ac1d11d409384339ca50891c151, '100015', 'biperiden 2 mg2 mg', '0.1500', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf4c6eb38fb3944b985a5f11ab5df8fe9, '110013', 'metronidazole sirop 125mg / 5 ml100 ml', '1.3100', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf638bab2ce35470e899394f41370f309, '100101', 'pyrazinamide500 mg', '0.0700', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf6ee4a80f1524d07b8d1c6f2578b7cbe, '100050', 'ethinyloestradiol0.05 mg', '0.6100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf82ab5b7928a409d8edff922e8733001, '110009', 'erythromycine125 mg/5ml', '2.3100', 0x8337b0ed64a84b84b72196bb33e8d05a, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xf87f2b174ad2401c86eaef1a1e9a1392, '100006', 'Amitriptyline25 mg', '0.0200', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xfc7c58fcb32f490a9f4a21448cded8ea, '100107', 'salbutamol4 mg tab', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08'),
(1, 0xfd1c46c8f2764aa4bebc7de652ce6c45, '100005', 'Aminophyline100 mg', '0.0100', 0xd66a051867ce475cb1240bb78a65533f, 2, 0, 0, 1, 100000000, 0, 1, 1, '2016-10-23 09:35:08');

-- FIXME Temporarily resolve JS -> MySQL bot errors
/* UPDATE inventory SET price = 0.01 WHERE price < 0.01; */
