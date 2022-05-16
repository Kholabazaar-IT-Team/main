CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `uploads`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- Category Translation
CREATE TABLE `category_translations` (
`id` bigint(20) NOT NULL,
`category_id` bigint(20) NOT NULL,
`name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
`lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
`created_at` timestamp NOT NULL DEFAULT current_timestamp(),
`updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `category_translations`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `category_translations`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Sub Category Translation
CREATE TABLE `sub_category_translations` (
  `id` bigint(20) NOT NULL,
  `sub_category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `sub_category_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sub_category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Sub SubCategory Translation
CREATE TABLE `sub_sub_category_translations` (
    `id` bigint(20) NOT NULL,
    `sub_sub_category_id` bigint(20) NOT NULL,
    `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `sub_sub_category_translations`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `sub_sub_category_translations`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Brand Translation
CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `brand_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Product Translation
CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Attributes Translation
CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `attribute_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Customer Package Translation
CREATE TABLE `customer_package_translations` (
  `id` bigint(20) NOT NULL,
  `customer_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `customer_package_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `customer_package_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Flash Deal Translation
CREATE TABLE `flash_deal_translations` (
  `id` bigint(20) NOT NULL,
  `flash_deal_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `flash_deal_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `flash_deal_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- pick-up Point Translation
CREATE TABLE `pickup_point_translations` (
  `id` bigint(20) NOT NULL,
  `pickup_point_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `pickup_point_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pickup_point_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Role Translation
CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

-- Page Translation
CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


-- Customer Product Translation
CREATE TABLE `customer_product_translations` (
    `id` bigint(20) NOT NULL,
    `customer_product_id` bigint(20) NOT NULL,
    `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
    `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
    `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
    `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `customer_product_translations`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `customer_product_translations`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


ALTER TABLE `pages` ADD `type` VARCHAR(50) NOT NULL AFTER `id`;

INSERT INTO `pages` (`type`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
('home_page', 'Home Page', 'home', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:13:20', '2020-11-04 10:13:20'),
('seller_policy_page', 'Seller Policy Pages', 'sellerpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 12:19:30'),
('return_policy_page', 'Return Policy Page', 'returnpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 10:14:41'),
('support_policy_page', 'Support Policy Page', 'supportpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:59', '2020-11-04 10:14:59'),
('terms_conditions_page', 'Term Conditions Page', 'terms', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:15:29', '2020-11-04 10:15:29'),
('privacy_policy_page', 'Privacy Policy Page', 'privacypolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:15:55', '2020-11-04 10:15:55');


INSERT INTO `business_settings` (`type`, `value`, `created_at`, `updated_at`) VALUES

    ('header_logo', NULL, current_timestamp(), current_timestamp()),

    ('show_language_switcher', 'on', current_timestamp(), current_timestamp()),

    ('show_currency_switcher', 'on', current_timestamp(), current_timestamp()),

    ('header_stikcy', 'on', current_timestamp(), current_timestamp()),

    ('footer_logo', NULL, current_timestamp(), current_timestamp()),

    ('about_us_description', NULL, current_timestamp(), current_timestamp()),

    ('contact_address', NULL, current_timestamp(), current_timestamp()),

    ('contact_phone', NULL, current_timestamp(), current_timestamp()),

    ('contact_email', NULL, current_timestamp(), current_timestamp()),

    ('widget_one_labels', NULL, current_timestamp(), current_timestamp()),

    ('widget_one_links', NULL, current_timestamp(), current_timestamp()),

    ('widget_one', NULL, current_timestamp(), current_timestamp()),

    ('frontend_copyright_text', NULL, current_timestamp(), current_timestamp()),

    ('show_social_links', NULL, current_timestamp(), current_timestamp()),

    ('facebook_link', NULL, current_timestamp(), current_timestamp()),

    ('twitter_link', NULL, current_timestamp(), current_timestamp()),

    ('instagram_link', NULL, current_timestamp(), current_timestamp()),

    ('youtube_link', NULL, current_timestamp(), current_timestamp()),

    ('linkedin_link', NULL, current_timestamp(), current_timestamp()),

    ('payment_method_images', NULL, current_timestamp(), current_timestamp()),

    ('home_slider_images', '[]', current_timestamp(), current_timestamp()),

    ('home_slider_links', '[]', current_timestamp(), current_timestamp()),

    ('home_banner1_images', '[]', current_timestamp(), current_timestamp()),

    ('home_banner1_links', '[]', current_timestamp(), current_timestamp()),

    ('home_banner2_images', '[]', current_timestamp(), current_timestamp()),

    ('home_banner2_links', '[]', current_timestamp(), current_timestamp()),

    ('home_categories', '[]', current_timestamp(), current_timestamp()),

    ('top10_categories', '[]', current_timestamp(), current_timestamp()),

    ('top10_brands', '[]', current_timestamp(), current_timestamp()),

    ('website_name', NULL, current_timestamp(), current_timestamp()),

    ('site_motto', NULL, current_timestamp(), current_timestamp()),

    ('site_icon', NULL, current_timestamp(), current_timestamp()),

    ('base_color', '#e62e04', current_timestamp(), current_timestamp()),

    ('base_hov_color', '#e62e04', current_timestamp(), current_timestamp()),

    ('meta_title', NULL, current_timestamp(), current_timestamp()),

    ('meta_description', NULL, current_timestamp(), current_timestamp()),

    ('meta_keywords', NULL, current_timestamp(), current_timestamp()),

    ('meta_image', NULL, current_timestamp(), current_timestamp()),

    ('site_name', NULL, current_timestamp(), current_timestamp()),

    ('system_logo_white', NULL, current_timestamp(), current_timestamp()),

    ('system_logo_black', NULL, current_timestamp(), current_timestamp()),

    ('timezone', NULL, current_timestamp(), current_timestamp()),

    ('admin_login_background', NULL, current_timestamp(), current_timestamp());


    CREATE TABLE `translations` (
      `id` int(11) NOT NULL,
      `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
      `lang_key` text COLLATE utf8_unicode_ci,
      `lang_value` text COLLATE utf8_unicode_ci,
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

    --
    -- Indexes for dumped tables
    --

    INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
    (3, 'en', 'All Category', 'All Category', '2020-11-02 07:40:38', '2020-11-02 07:40:38'),
    (4, 'en', 'All', 'All', '2020-11-02 07:40:38', '2020-11-02 07:40:38'),
    (5, 'en', 'Flash Sale', 'Flash Sale', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (6, 'en', 'View More', 'View More', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (7, 'en', 'Add to wishlist', 'Add to wishlist', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (8, 'en', 'Add to compare', 'Add to compare', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (9, 'en', 'Add to cart', 'Add to cart', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (10, 'en', 'Club Point', 'Club Point', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (11, 'en', 'Classified Ads', 'Classified Ads', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (13, 'en', 'Used', 'Used', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (14, 'en', 'Top 10 Categories', 'Top 10 Categories', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (15, 'en', 'View All Categories', 'View All Categories', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (16, 'en', 'Top 10 Brands', 'Top 10 Brands', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (17, 'en', 'View All Brands', 'View All Brands', '2020-11-02 07:40:40', '2020-11-02 07:40:40'),
    (43, 'en', 'Terms & conditions', 'Terms & conditions', '2020-11-02 07:40:41', '2020-11-02 07:40:41'),
    (51, 'en', 'Best Selling', 'Best Selling', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
    (53, 'en', 'Top 20', 'Top 20', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
    (55, 'en', 'Featured Products', 'Featured Products', '2020-11-02 07:40:42', '2020-11-02 07:40:42'),
    (56, 'en', 'Best Sellers', 'Best Sellers', '2020-11-02 07:40:43', '2020-11-02 07:40:43'),
    (57, 'en', 'Visit Store', 'Visit Store', '2020-11-02 07:40:43', '2020-11-02 07:40:43'),
    (58, 'en', 'Popular Suggestions', 'Popular Suggestions', '2020-11-02 07:46:59', '2020-11-02 07:46:59'),
    (59, 'en', 'Category Suggestions', 'Category Suggestions', '2020-11-02 07:46:59', '2020-11-02 07:46:59'),
    (62, 'en', 'Automobile & Motorcycle', 'Automobile & Motorcycle', '2020-11-02 07:47:01', '2020-11-02 07:47:01'),
    (63, 'en', 'Price range', 'Price range', '2020-11-02 07:47:01', '2020-11-02 07:47:01'),
    (64, 'en', 'Filter by color', 'Filter by color', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (65, 'en', 'Home', 'Home', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (67, 'en', 'Newest', 'Newest', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (68, 'en', 'Oldest', 'Oldest', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (69, 'en', 'Price low to high', 'Price low to high', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (70, 'en', 'Price high to low', 'Price high to low', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (71, 'en', 'Brands', 'Brands', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (72, 'en', 'All Brands', 'All Brands', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (74, 'en', 'All Sellers', 'All Sellers', '2020-11-02 07:47:02', '2020-11-02 07:47:02'),
    (78, 'en', 'Inhouse product', 'Inhouse product', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (79, 'en', 'Message Seller', 'Message Seller', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (80, 'en', 'Price', 'Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (81, 'en', 'Discount Price', 'Discount Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (82, 'en', 'Color', 'Color', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (83, 'en', 'Quantity', 'Quantity', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (84, 'en', 'available', 'available', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (85, 'en', 'Total Price', 'Total Price', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (86, 'en', 'Out of Stock', 'Out of Stock', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (87, 'en', 'Refund', 'Refund', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (88, 'en', 'Share', 'Share', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (89, 'en', 'Sold By', 'Sold By', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (90, 'en', 'customer reviews', 'customer reviews', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (91, 'en', 'Top Selling Products', 'Top Selling Products', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (92, 'en', 'Description', 'Description', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (93, 'en', 'Video', 'Video', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (94, 'en', 'Reviews', 'Reviews', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (95, 'en', 'Download', 'Download', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (96, 'en', 'There have been no reviews for this product yet.', 'There have been no reviews for this product yet.', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (97, 'en', 'Related products', 'Related products', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (98, 'en', 'Any query about this product', 'Any query about this product', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (99, 'en', 'Product Name', 'Product Name', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (100, 'en', 'Your Question', 'Your Question', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (101, 'en', 'Send', 'Send', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (103, 'en', 'Use country code before number', 'Use country code before number', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (105, 'en', 'Remember Me', 'Remember Me', '2020-11-02 08:18:03', '2020-11-02 08:18:03'),
    (107, 'en', 'Dont have an account?', 'Dont have an account?', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
    (108, 'en', 'Register Now', 'Register Now', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
    (109, 'en', 'Or Login With', 'Or Login With', '2020-11-02 08:18:04', '2020-11-02 08:18:04'),
    (110, 'en', 'oops..', 'oops..', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
    (111, 'en', 'This item is out of stock!', 'This item is out of stock!', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
    (112, 'en', 'Back to shopping', 'Back to shopping', '2020-11-02 10:29:04', '2020-11-02 10:29:04'),
    (113, 'en', 'Login to your account.', 'Login to your account.', '2020-11-02 11:27:41', '2020-11-02 11:27:41'),
    (115, 'en', 'Purchase History', 'Purchase History', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (116, 'en', 'New', 'New', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (117, 'en', 'Downloads', 'Downloads', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (118, 'en', 'Sent Refund Request', 'Sent Refund Request', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (119, 'en', 'Product Bulk Upload', 'Product Bulk Upload', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (123, 'en', 'Orders', 'Orders', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (124, 'en', 'Recieved Refund Request', 'Recieved Refund Request', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (126, 'en', 'Shop Setting', 'Shop Setting', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (127, 'en', 'Payment History', 'Payment History', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (128, 'en', 'Money Withdraw', 'Money Withdraw', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (129, 'en', 'Conversations', 'Conversations', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (130, 'en', 'My Wallet', 'My Wallet', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (131, 'en', 'Earning Points', 'Earning Points', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (132, 'en', 'Support Ticket', 'Support Ticket', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (133, 'en', 'Manage Profile', 'Manage Profile', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (134, 'en', 'Sold Amount', 'Sold Amount', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (135, 'en', 'Your sold amount (current month)', 'Your sold amount (current month)', '2020-11-02 11:27:53', '2020-11-02 11:27:53'),
    (136, 'en', 'Total Sold', 'Total Sold', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (137, 'en', 'Last Month Sold', 'Last Month Sold', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (138, 'en', 'Total sale', 'Total sale', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (139, 'en', 'Total earnings', 'Total earnings', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (140, 'en', 'Successful orders', 'Successful orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (141, 'en', 'Total orders', 'Total orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (142, 'en', 'Pending orders', 'Pending orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (143, 'en', 'Cancelled orders', 'Cancelled orders', '2020-11-02 11:27:54', '2020-11-02 11:27:54'),
    (145, 'en', 'Product', 'Product', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (147, 'en', 'Purchased Package', 'Purchased Package', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (148, 'en', 'Package Not Found', 'Package Not Found', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (149, 'en', 'Upgrade Package', 'Upgrade Package', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (150, 'en', 'Shop', 'Shop', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (151, 'en', 'Manage & organize your shop', 'Manage & organize your shop', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (152, 'en', 'Go to setting', 'Go to setting', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (153, 'en', 'Payment', 'Payment', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (154, 'en', 'Configure your payment method', 'Configure your payment method', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (156, 'en', 'My Panel', 'My Panel', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (158, 'en', 'Item has been added to wishlist', 'Item has been added to wishlist', '2020-11-02 11:27:55', '2020-11-02 11:27:55'),
    (159, 'en', 'My Points', 'My Points', '2020-11-02 11:28:15', '2020-11-02 11:28:15'),
    (160, 'en', ' Points', ' Points', '2020-11-02 11:28:15', '2020-11-02 11:28:15'),
    (161, 'en', 'Wallet Money', 'Wallet Money', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (162, 'en', 'Exchange Rate', 'Exchange Rate', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (163, 'en', 'Point Earning history', 'Point Earning history', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (164, 'en', 'Date', 'Date', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (165, 'en', 'Points', 'Points', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (166, 'en', 'Converted', 'Converted', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (167, 'en', 'Action', 'Action', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (168, 'en', 'No history found.', 'No history found.', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (169, 'en', 'Convert has been done successfully Check your Wallets', 'Convert has been done successfully Check your Wallets', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (170, 'en', 'Something went wrong', 'Something went wrong', '2020-11-02 11:28:16', '2020-11-02 11:28:16'),
    (171, 'en', 'Remaining Uploads', 'Remaining Uploads', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (172, 'en', 'No Package Found', 'No Package Found', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (173, 'en', 'Search product', 'Search product', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (174, 'en', 'Name', 'Name', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (176, 'en', 'Current Qty', 'Current Qty', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (177, 'en', 'Base Price', 'Base Price', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (178, 'en', 'Published', 'Published', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (179, 'en', 'Featured', 'Featured', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (180, 'en', 'Options', 'Options', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (181, 'en', 'Edit', 'Edit', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (182, 'en', 'Duplicate', 'Duplicate', '2020-11-02 11:37:13', '2020-11-02 11:37:13'),
    (184, 'en', '1. Download the skeleton file and fill it with data.', '1. Download the skeleton file and fill it with data.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (185, 'en', '2. You can download the example file to understand how the data must be filled.', '2. You can download the example file to understand how the data must be filled.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (186, 'en', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (187, 'en', '4. After uploading products you need to edit them and set products images and choices.', '4. After uploading products you need to edit them and set products images and choices.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (188, 'en', 'Download CSV', 'Download CSV', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (189, 'en', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (190, 'en', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (191, 'en', 'Download Category', 'Download Category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (192, 'en', 'Download Sub category', 'Download Sub category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (193, 'en', 'Download Sub Sub category', 'Download Sub Sub category', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (194, 'en', 'Download Brand', 'Download Brand', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (195, 'en', 'Upload CSV File', 'Upload CSV File', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (196, 'en', 'CSV', 'CSV', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (197, 'en', 'Choose CSV File', 'Choose CSV File', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (198, 'en', 'Upload', 'Upload', '2020-11-02 11:37:20', '2020-11-02 11:37:20'),
    (199, 'en', 'Add New Digital Product', 'Add New Digital Product', '2020-11-02 11:37:25', '2020-11-02 11:37:25'),
    (200, 'en', 'Available Status', 'Available Status', '2020-11-02 11:37:29', '2020-11-02 11:37:29'),
    (201, 'en', 'Admin Status', 'Admin Status', '2020-11-02 11:37:29', '2020-11-02 11:37:29'),
    (202, 'en', 'Pending Balance', 'Pending Balance', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (203, 'en', 'Send Withdraw Request', 'Send Withdraw Request', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (204, 'en', 'Withdraw Request history', 'Withdraw Request history', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (205, 'en', 'Amount', 'Amount', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (206, 'en', 'Status', 'Status', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (207, 'en', 'Message', 'Message', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (208, 'en', 'Send A Withdraw Request', 'Send A Withdraw Request', '2020-11-02 11:38:07', '2020-11-02 11:38:07'),
    (209, 'en', 'Basic Info', 'Basic Info', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
    (211, 'en', 'Your Phone', 'Your Phone', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
    (212, 'en', 'Photo', 'Photo', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
    (213, 'en', 'Browse', 'Browse', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
    (215, 'en', 'Your Password', 'Your Password', '2020-11-02 11:38:13', '2020-11-02 11:38:13'),
    (216, 'en', 'New Password', 'New Password', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (217, 'en', 'Confirm Password', 'Confirm Password', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (218, 'en', 'Add New Address', 'Add New Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (219, 'en', 'Payment Setting', 'Payment Setting', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (220, 'en', 'Cash Payment', 'Cash Payment', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (221, 'en', 'Bank Payment', 'Bank Payment', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (222, 'en', 'Bank Name', 'Bank Name', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (223, 'en', 'Bank Account Name', 'Bank Account Name', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (224, 'en', 'Bank Account Number', 'Bank Account Number', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (225, 'en', 'Bank Routing Number', 'Bank Routing Number', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (226, 'en', 'Update Profile', 'Update Profile', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (227, 'en', 'Change your email', 'Change your email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (228, 'en', 'Your Email', 'Your Email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (229, 'en', 'Sending Email...', 'Sending Email...', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (230, 'en', 'Verify', 'Verify', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (231, 'en', 'Update Email', 'Update Email', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (232, 'en', 'New Address', 'New Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (233, 'en', 'Your Address', 'Your Address', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (234, 'en', 'Country', 'Country', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (235, 'en', 'Select your country', 'Select your country', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (236, 'en', 'City', 'City', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (237, 'en', 'Your City', 'Your City', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (239, 'en', 'Your Postal Code', 'Your Postal Code', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (240, 'en', '+880', '+880', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (241, 'en', 'Save', 'Save', '2020-11-02 11:38:14', '2020-11-02 11:38:14'),
    (242, 'en', 'Received Refund Request', 'Received Refund Request', '2020-11-02 11:56:20', '2020-11-02 11:56:20'),
    (244, 'en', 'Delete Confirmation', 'Delete Confirmation', '2020-11-02 11:56:20', '2020-11-02 11:56:20'),
    (245, 'en', 'Are you sure to delete this?', 'Are you sure to delete this?', '2020-11-02 11:56:21', '2020-11-02 11:56:21'),
    (246, 'en', 'Premium Packages for Sellers', 'Premium Packages for Sellers', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (247, 'en', 'Product Upload', 'Product Upload', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (248, 'en', 'Digital Product Upload', 'Digital Product Upload', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (250, 'en', 'Purchase Package', 'Purchase Package', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (251, 'en', 'Select Payment Type', 'Select Payment Type', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (252, 'en', 'Payment Type', 'Payment Type', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (253, 'en', 'Select One', 'Select One', '2020-11-02 11:57:36', '2020-11-02 11:57:36'),
    (254, 'en', 'Online payment', 'Online payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (255, 'en', 'Offline payment', 'Offline payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (256, 'en', 'Purchase Your Package', 'Purchase Your Package', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (258, 'en', 'Paypal', 'Paypal', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (259, 'en', 'Stripe', 'Stripe', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (260, 'en', 'sslcommerz', 'sslcommerz', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (265, 'en', 'Confirm', 'Confirm', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (266, 'en', 'Offline Package Payment', 'Offline Package Payment', '2020-11-02 11:57:37', '2020-11-02 11:57:37'),
    (267, 'en', 'Transaction ID', 'Transaction ID', '2020-11-02 12:30:12', '2020-11-02 12:30:12'),
    (268, 'en', 'Choose image', 'Choose image', '2020-11-02 12:30:12', '2020-11-02 12:30:12'),
    (269, 'en', 'Code', 'Code', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (270, 'en', 'Delivery Status', 'Delivery Status', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (271, 'en', 'Payment Status', 'Payment Status', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (272, 'en', 'Paid', 'Paid', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (273, 'en', 'Order Details', 'Order Details', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (274, 'en', 'Download Invoice', 'Download Invoice', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (275, 'en', 'Unpaid', 'Unpaid', '2020-11-02 12:42:00', '2020-11-02 12:42:00'),
    (277, 'en', 'Order placed', 'Order placed', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (278, 'en', 'Confirmed', 'Confirmed', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (279, 'en', 'On delivery', 'On delivery', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (280, 'en', 'Delivered', 'Delivered', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (281, 'en', 'Order Summary', 'Order Summary', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (282, 'en', 'Order Code', 'Order Code', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (283, 'en', 'Customer', 'Customer', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (287, 'en', 'Total order amount', 'Total order amount', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (288, 'en', 'Shipping metdod', 'Shipping metdod', '2020-11-02 12:43:59', '2020-11-02 12:43:59'),
    (289, 'en', 'Flat shipping rate', 'Flat shipping rate', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (290, 'en', 'Payment metdod', 'Payment metdod', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (291, 'en', 'Variation', 'Variation', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (292, 'en', 'Delivery Type', 'Delivery Type', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (293, 'en', 'Home Delivery', 'Home Delivery', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (294, 'en', 'Order Ammount', 'Order Ammount', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (295, 'en', 'Subtotal', 'Subtotal', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (296, 'en', 'Shipping', 'Shipping', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (298, 'en', 'Coupon Discount', 'Coupon Discount', '2020-11-02 12:44:00', '2020-11-02 12:44:00'),
    (300, 'en', 'N/A', 'N/A', '2020-11-02 12:44:20', '2020-11-02 12:44:20'),
    (301, 'en', 'In stock', 'In stock', '2020-11-02 12:54:52', '2020-11-02 12:54:52'),
    (302, 'en', 'Buy Now', 'Buy Now', '2020-11-02 12:54:52', '2020-11-02 12:54:52'),
    (303, 'en', 'Item added to your cart!', 'Item added to your cart!', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (304, 'en', 'Proceed to Checkout', 'Proceed to Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (305, 'en', 'Cart Items', 'Cart Items', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (306, 'en', '1. My Cart', '1. My Cart', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (307, 'en', 'View cart', 'View cart', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (308, 'en', '2. Shipping info', '2. Shipping info', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (309, 'en', 'Checkout', 'Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (310, 'en', '3. Delivery info', '3. Delivery info', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (311, 'en', '4. Payment', '4. Payment', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (312, 'en', '5. Confirmation', '5. Confirmation', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (313, 'en', 'Remove', 'Remove', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (314, 'en', 'Return to shop', 'Return to shop', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (315, 'en', 'Continue to Shipping', 'Continue to Shipping', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (316, 'en', 'Or', 'Or', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (317, 'en', 'Guest Checkout', 'Guest Checkout', '2020-11-02 12:56:46', '2020-11-02 12:56:46'),
    (318, 'en', 'Continue to Delivery Info', 'Continue to Delivery Info', '2020-11-02 12:57:44', '2020-11-02 12:57:44'),
    (319, 'en', 'Postal Code', 'Postal Code', '2020-11-02 13:01:01', '2020-11-02 13:01:01'),
    (320, 'en', 'Choose Delivery Type', 'Choose Delivery Type', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
    (321, 'en', 'Local Pickup', 'Local Pickup', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
    (322, 'en', 'Select your nearest pickup point', 'Select your nearest pickup point', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
    (323, 'en', 'Continue to Payment', 'Continue to Payment', '2020-11-02 13:01:04', '2020-11-02 13:01:04'),
    (324, 'en', 'Select a payment option', 'Select a payment option', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (325, 'en', 'Razorpay', 'Razorpay', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (326, 'en', 'Paystack', 'Paystack', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (327, 'en', 'VoguePay', 'VoguePay', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (328, 'en', 'payhere', 'payhere', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (329, 'en', 'ngenius', 'ngenius', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (330, 'en', 'Paytm', 'Paytm', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (331, 'en', 'Cash on Delivery', 'Cash on Delivery', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (332, 'en', 'Your wallet balance :', 'Your wallet balance :', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (333, 'en', 'Insufficient balance', 'Insufficient balance', '2020-11-02 13:01:13', '2020-11-02 13:01:13'),
    (334, 'en', 'I agree to the', 'I agree to the', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (338, 'en', 'Complete Order', 'Complete Order', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (339, 'en', 'Summary', 'Summary', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (340, 'en', 'Items', 'Items', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (341, 'en', 'Total Club point', 'Total Club point', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (342, 'en', 'Total Shipping', 'Total Shipping', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (343, 'en', 'Have coupon code? Enter here', 'Have coupon code? Enter here', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (344, 'en', 'Apply', 'Apply', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (345, 'en', 'You need to agree with our policies', 'You need to agree with our policies', '2020-11-02 13:01:14', '2020-11-02 13:01:14'),
    (346, 'en', 'Forgot password', 'Forgot password', '2020-11-02 13:01:25', '2020-11-02 13:01:25'),
    (469, 'en', 'SEO Setting', 'SEO Setting', '2020-11-02 13:01:33', '2020-11-02 13:01:33'),
    (474, 'en', 'System Update', 'System Update', '2020-11-02 13:01:34', '2020-11-02 13:01:34'),
    (480, 'en', 'Add New Payment Method', 'Add New Payment Method', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
    (481, 'en', 'Manual Payment Method', 'Manual Payment Method', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
    (482, 'en', 'Heading', 'Heading', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
    (483, 'en', 'Logo', 'Logo', '2020-11-02 13:01:38', '2020-11-02 13:01:38'),
    (484, 'en', 'Manual Payment Information', 'Manual Payment Information', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (485, 'en', 'Type', 'Type', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (486, 'en', 'Custom Payment', 'Custom Payment', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (487, 'en', 'Check Payment', 'Check Payment', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (488, 'en', 'Checkout Thumbnail', 'Checkout Thumbnail', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (489, 'en', 'Payment Instruction', 'Payment Instruction', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (490, 'en', 'Bank Information', 'Bank Information', '2020-11-02 13:01:42', '2020-11-02 13:01:42'),
    (491, 'en', 'Select File', 'Select File', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (492, 'en', 'Upload New', 'Upload New', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (493, 'en', 'Sort by newest', 'Sort by newest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (494, 'en', 'Sort by oldest', 'Sort by oldest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (495, 'en', 'Sort by smallest', 'Sort by smallest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (496, 'en', 'Sort by largest', 'Sort by largest', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (497, 'en', 'Selected Only', 'Selected Only', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (498, 'en', 'No files found', 'No files found', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (499, 'en', '0 File selected', '0 File selected', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (500, 'en', 'Clear', 'Clear', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (501, 'en', 'Prev', 'Prev', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (502, 'en', 'Next', 'Next', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (503, 'en', 'Add Files', 'Add Files', '2020-11-02 13:01:53', '2020-11-02 13:01:53'),
    (504, 'en', 'Method has been inserted successfully', 'Method has been inserted successfully', '2020-11-02 13:02:03', '2020-11-02 13:02:03'),
    (506, 'en', 'Order Date', 'Order Date', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
    (507, 'en', 'Bill to', 'Bill to', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
    (510, 'en', 'Sub Total', 'Sub Total', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
    (512, 'en', 'Total Tax', 'Total Tax', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
    (513, 'en', 'Grand Total', 'Grand Total', '2020-11-02 13:02:42', '2020-11-02 13:02:42'),
    (514, 'en', 'Your order has been placed successfully. Please submit payment information from purchase history', 'Your order has been placed successfully. Please submit payment information from purchase history', '2020-11-02 13:02:47', '2020-11-02 13:02:47'),
    (515, 'en', 'Thank You for Your Order!', 'Thank You for Your Order!', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
    (516, 'en', 'Order Code:', 'Order Code:', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
    (517, 'en', 'A copy or your order summary has been sent to', 'A copy or your order summary has been sent to', '2020-11-02 13:02:48', '2020-11-02 13:02:48'),
    (518, 'en', 'Make Payment', 'Make Payment', '2020-11-02 13:03:26', '2020-11-02 13:03:26'),
    (519, 'en', 'Payment screenshot', 'Payment screenshot', '2020-11-02 13:03:29', '2020-11-02 13:03:29'),
    (520, 'en', 'Paypal Credential', 'Paypal Credential', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
    (522, 'en', 'Paypal Client ID', 'Paypal Client ID', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
    (523, 'en', 'Paypal Client Secret', 'Paypal Client Secret', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
    (524, 'en', 'Paypal Sandbox Mode', 'Paypal Sandbox Mode', '2020-11-02 13:12:20', '2020-11-02 13:12:20'),
    (525, 'en', 'Sslcommerz Credential', 'Sslcommerz Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (526, 'en', 'Sslcz Store Id', 'Sslcz Store Id', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (527, 'en', 'Sslcz store password', 'Sslcz store password', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (528, 'en', 'Sslcommerz Sandbox Mode', 'Sslcommerz Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (529, 'en', 'Stripe Credential', 'Stripe Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (531, 'en', 'STRIPE KEY', 'STRIPE KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (533, 'en', 'STRIPE SECRET', 'STRIPE SECRET', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (534, 'en', 'RazorPay Credential', 'RazorPay Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (535, 'en', 'RAZOR KEY', 'RAZOR KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (536, 'en', 'RAZOR SECRET', 'RAZOR SECRET', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (537, 'en', 'Instamojo Credential', 'Instamojo Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (538, 'en', 'API KEY', 'API KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (539, 'en', 'IM API KEY', 'IM API KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (540, 'en', 'AUTH TOKEN', 'AUTH TOKEN', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (541, 'en', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (542, 'en', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (543, 'en', 'PayStack Credential', 'PayStack Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (544, 'en', 'PUBLIC KEY', 'PUBLIC KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (545, 'en', 'SECRET KEY', 'SECRET KEY', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (546, 'en', 'MERCHANT EMAIL', 'MERCHANT EMAIL', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (547, 'en', 'VoguePay Credential', 'VoguePay Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (548, 'en', 'MERCHANT ID', 'MERCHANT ID', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (549, 'en', 'Sandbox Mode', 'Sandbox Mode', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (550, 'en', 'Payhere Credential', 'Payhere Credential', '2020-11-02 13:12:21', '2020-11-02 13:12:21'),
    (551, 'en', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (552, 'en', 'PAYHERE SECRET', 'PAYHERE SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (553, 'en', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (554, 'en', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (555, 'en', 'Ngenius Credential', 'Ngenius Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (556, 'en', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (557, 'en', 'NGENIUS API KEY', 'NGENIUS API KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (558, 'en', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (559, 'en', 'Mpesa Credential', 'Mpesa Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (560, 'en', 'MPESA CONSUMER KEY', 'MPESA CONSUMER KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (561, 'en', 'MPESA_CONSUMER_KEY', 'MPESA_CONSUMER_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (562, 'en', 'MPESA CONSUMER SECRET', 'MPESA CONSUMER SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (563, 'en', 'MPESA_CONSUMER_SECRET', 'MPESA_CONSUMER_SECRET', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (564, 'en', 'MPESA SHORT CODE', 'MPESA SHORT CODE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (565, 'en', 'MPESA_SHORT_CODE', 'MPESA_SHORT_CODE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (566, 'en', 'MPESA SANDBOX ACTIVATION', 'MPESA SANDBOX ACTIVATION', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (567, 'en', 'Flutterwave Credential', 'Flutterwave Credential', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (568, 'en', 'RAVE_PUBLIC_KEY', 'RAVE_PUBLIC_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (569, 'en', 'RAVE_SECRET_KEY', 'RAVE_SECRET_KEY', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (570, 'en', 'RAVE_TITLE', 'RAVE_TITLE', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (571, 'en', 'STAGIN ACTIVATION', 'STAGIN ACTIVATION', '2020-11-02 13:12:22', '2020-11-02 13:12:22'),
    (573, 'en', 'All Product', 'All Product', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (574, 'en', 'Sort By', 'Sort By', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (575, 'en', 'Rating (High > Low)', 'Rating (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (576, 'en', 'Rating (Low > High)', 'Rating (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (577, 'en', 'Num of Sale (High > Low)', 'Num of Sale (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (578, 'en', 'Num of Sale (Low > High)', 'Num of Sale (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (579, 'en', 'Base Price (High > Low)', 'Base Price (High > Low)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (580, 'en', 'Base Price (Low > High)', 'Base Price (Low > High)', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (581, 'en', 'Type & Enter', 'Type & Enter', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (582, 'en', 'Added By', 'Added By', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (583, 'en', 'Num of Sale', 'Num of Sale', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (584, 'en', 'Total Stock', 'Total Stock', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (585, 'en', 'Todays Deal', 'Todays Deal', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (586, 'en', 'Rating', 'Rating', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (587, 'en', 'times', 'times', '2020-11-02 13:15:01', '2020-11-02 13:15:01'),
    (588, 'en', 'Add Nerw Product', 'Add Nerw Product', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
    (589, 'en', 'Product Information', 'Product Information', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
    (590, 'en', 'Unit', 'Unit', '2020-11-02 13:15:02', '2020-11-02 13:15:02'),
    (591, 'en', 'Unit (e.g. KG, Pc etc)', 'Unit (e.g. KG, Pc etc)', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (592, 'en', 'Minimum Qty', 'Minimum Qty', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (593, 'en', 'Tags', 'Tags', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (594, 'en', 'Type and hit enter to add a tag', 'Type and hit enter to add a tag', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (595, 'en', 'Barcode', 'Barcode', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (596, 'en', 'Refundable', 'Refundable', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (597, 'en', 'Product Images', 'Product Images', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (598, 'en', 'Gallery Images', 'Gallery Images', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (599, 'en', 'Todays Deal updated successfully', 'Todays Deal updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (600, 'en', 'Published products updated successfully', 'Published products updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (601, 'en', 'Thumbnail Image', 'Thumbnail Image', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (602, 'en', 'Featured products updated successfully', 'Featured products updated successfully', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (603, 'en', 'Product Videos', 'Product Videos', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (604, 'en', 'Video Provider', 'Video Provider', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (605, 'en', 'Youtube', 'Youtube', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (606, 'en', 'Dailymotion', 'Dailymotion', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (607, 'en', 'Vimeo', 'Vimeo', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (608, 'en', 'Video Link', 'Video Link', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (609, 'en', 'Product Variation', 'Product Variation', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (610, 'en', 'Colors', 'Colors', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (611, 'en', 'Attributes', 'Attributes', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (612, 'en', 'Choose Attributes', 'Choose Attributes', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (613, 'en', 'Choose the attributes of this product and then input values of each attribute', 'Choose the attributes of this product and then input values of each attribute', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (614, 'en', 'Product price + stock', 'Product price + stock', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (616, 'en', 'Unit price', 'Unit price', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (617, 'en', 'Purchase price', 'Purchase price', '2020-11-02 13:15:03', '2020-11-02 13:15:03'),
    (618, 'en', 'Flat', 'Flat', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (619, 'en', 'Percent', 'Percent', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (620, 'en', 'Discount', 'Discount', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (621, 'en', 'Product Description', 'Product Description', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (622, 'en', 'Product Shipping Cost', 'Product Shipping Cost', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (623, 'en', 'Free Shipping', 'Free Shipping', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (624, 'en', 'Flat Rate', 'Flat Rate', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (625, 'en', 'Shipping cost', 'Shipping cost', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (626, 'en', 'PDF Specification', 'PDF Specification', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (627, 'en', 'SEO Meta Tags', 'SEO Meta Tags', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (628, 'en', 'Meta Title', 'Meta Title', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (629, 'en', 'Meta Image', 'Meta Image', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (630, 'en', 'Choice Title', 'Choice Title', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (631, 'en', 'Enter choice values', 'Enter choice values', '2020-11-02 13:15:04', '2020-11-02 13:15:04'),
    (632, 'en', 'All categories', 'All categories', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
    (633, 'en', 'Add New category', 'Add New category', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
    (634, 'en', 'Type name & Enter', 'Type name & Enter', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
    (635, 'en', 'Banner', 'Banner', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
    (637, 'en', 'Commission', 'Commission', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
    (638, 'en', 'icon', 'icon', '2020-11-03 07:12:19', '2020-11-03 07:12:19'),
    (639, 'en', 'Featured categories updated successfully', 'Featured categories updated successfully', '2020-11-03 07:12:20', '2020-11-03 07:12:20'),
    (640, 'en', 'Hot', 'Hot', '2020-11-03 07:13:12', '2020-11-03 07:13:12'),
    (641, 'en', 'Filter by Payment Status', 'Filter by Payment Status', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
    (642, 'en', 'Un-Paid', 'Un-Paid', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
    (643, 'en', 'Filter by Deliver Status', 'Filter by Deliver Status', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
    (644, 'en', 'Pending', 'Pending', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
    (645, 'en', 'Type Order code & hit Enter', 'Type Order code & hit Enter', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
    (646, 'en', 'Num. of Products', 'Num. of Products', '2020-11-03 07:15:15', '2020-11-03 07:15:15'),
    (647, 'en', 'Walk In Customer', 'Walk In Customer', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (648, 'en', 'QTY', 'QTY', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (649, 'en', 'Without Shipping Charge', 'Without Shipping Charge', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (650, 'en', 'With Shipping Charge', 'With Shipping Charge', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (651, 'en', 'Pay With Cash', 'Pay With Cash', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (652, 'en', 'Shipping Address', 'Shipping Address', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (653, 'en', 'Close', 'Close', '2020-11-03 10:03:20', '2020-11-03 10:03:20'),
    (654, 'en', 'Select country', 'Select country', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
    (655, 'en', 'Order Confirmation', 'Order Confirmation', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
    (656, 'en', 'Are you sure to confirm this order?', 'Are you sure to confirm this order?', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
    (657, 'en', 'Comfirm Order', 'Comfirm Order', '2020-11-03 10:03:21', '2020-11-03 10:03:21'),
    (659, 'en', 'Personal Info', 'Personal Info', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
    (660, 'en', 'Repeat Password', 'Repeat Password', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
    (661, 'en', 'Shop Name', 'Shop Name', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
    (662, 'en', 'Register Your Shop', 'Register Your Shop', '2020-11-03 11:38:15', '2020-11-03 11:38:15'),
    (663, 'en', 'Affiliate Informations', 'Affiliate Informations', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
    (664, 'en', 'Affiliate', 'Affiliate', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
    (665, 'en', 'User Info', 'User Info', '2020-11-03 11:39:06', '2020-11-03 11:39:06'),
    (667, 'en', 'Installed Addon', 'Installed Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
    (668, 'en', 'Available Addon', 'Available Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
    (669, 'en', 'Install New Addon', 'Install New Addon', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
    (670, 'en', 'Version', 'Version', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
    (671, 'en', 'Activated', 'Activated', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
    (672, 'en', 'Deactivated', 'Deactivated', '2020-11-03 11:48:13', '2020-11-03 11:48:13'),
    (673, 'en', 'Activate OTP', 'Activate OTP', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
    (674, 'en', 'OTP will be Used For', 'OTP will be Used For', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
    (675, 'en', 'Settings updated successfully', 'Settings updated successfully', '2020-11-03 11:48:20', '2020-11-03 11:48:20'),
    (676, 'en', 'Product Owner', 'Product Owner', '2020-11-03 11:48:46', '2020-11-03 11:48:46'),
    (677, 'en', 'Point', 'Point', '2020-11-03 11:48:46', '2020-11-03 11:48:46'),
    (678, 'en', 'Set Point for Product Within a Range', 'Set Point for Product Within a Range', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
    (679, 'en', 'Set Point for multiple products', 'Set Point for multiple products', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
    (680, 'en', 'Min Price', 'Min Price', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
    (681, 'en', 'Max Price', 'Max Price', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
    (682, 'en', 'Set Point for all Products', 'Set Point for all Products', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
    (683, 'en', 'Set Point For ', 'Set Point For ', '2020-11-03 11:48:47', '2020-11-03 11:48:47'),
    (684, 'en', 'Convert Status', 'Convert Status', '2020-11-03 11:48:58', '2020-11-03 11:48:58'),
    (685, 'en', 'Earned At', 'Earned At', '2020-11-03 11:48:59', '2020-11-03 11:48:59'),
    (686, 'en', 'Seller Based Selling Report', 'Seller Based Selling Report', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
    (687, 'en', 'Sort by verificarion status', 'Sort by verificarion status', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
    (688, 'en', 'Approved', 'Approved', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
    (689, 'en', 'Non Approved', 'Non Approved', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
    (690, 'en', 'Filter', 'Filter', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
    (691, 'en', 'Seller Name', 'Seller Name', '2020-11-03 11:49:35', '2020-11-03 11:49:35'),
    (692, 'en', 'Number of Product Sale', 'Number of Product Sale', '2020-11-03 11:49:36', '2020-11-03 11:49:36'),
    (693, 'en', 'Order Amount', 'Order Amount', '2020-11-03 11:49:36', '2020-11-03 11:49:36'),
    (694, 'en', 'Facebook Chat Setting', 'Facebook Chat Setting', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (695, 'en', 'Facebook Page ID', 'Facebook Page ID', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (696, 'en', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (697, 'en', 'Login into your facebook page', 'Login into your facebook page', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (698, 'en', 'Find the About option of your facebook page', 'Find the About option of your facebook page', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (699, 'en', 'At the very bottom, you can find the \\“Facebook Page ID\\”', 'At the very bottom, you can find the \\“Facebook Page ID\\”', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (700, 'en', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (701, 'en', 'Scroll down that page and you will get \\\"white listed domain\\\"', 'Scroll down that page and you will get \\\"white listed domain\\\"', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (702, 'en', 'Set your website domain name', 'Set your website domain name', '2020-11-03 11:51:14', '2020-11-03 11:51:14'),
    (703, 'en', 'Google reCAPTCHA Setting', 'Google reCAPTCHA Setting', '2020-11-03 11:51:25', '2020-11-03 11:51:25'),
    (704, 'en', 'Site KEY', 'Site KEY', '2020-11-03 11:51:25', '2020-11-03 11:51:25'),
    (705, 'en', 'Select Shipping Method', 'Select Shipping Method', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (706, 'en', 'Product Wise Shipping Cost', 'Product Wise Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (707, 'en', 'Flat Rate Shipping Cost', 'Flat Rate Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (708, 'en', 'Seller Wise Flat Shipping Cost', 'Seller Wise Flat Shipping Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (709, 'en', 'Note', 'Note', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (710, 'en', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (711, 'en', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (712, 'en', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (713, 'en', 'Flat Rate Cost', 'Flat Rate Cost', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (714, 'en', 'Shipping Cost for Admin Products', 'Shipping Cost for Admin Products', '2020-11-03 11:51:32', '2020-11-03 11:51:32'),
    (715, 'en', 'Countries', 'Countries', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
    (716, 'en', 'Show/Hide', 'Show/Hide', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
    (717, 'en', 'Country status updated successfully', 'Country status updated successfully', '2020-11-03 11:52:02', '2020-11-03 11:52:02'),
    (718, 'en', 'All Subcategories', 'All Subcategories', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
    (719, 'en', 'Add New Subcategory', 'Add New Subcategory', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
    (720, 'en', 'Sub-Categories', 'Sub-Categories', '2020-11-03 12:27:55', '2020-11-03 12:27:55'),
    (721, 'en', 'Sub Category Information', 'Sub Category Information', '2020-11-03 12:28:07', '2020-11-03 12:28:07'),
    (723, 'en', 'Slug', 'Slug', '2020-11-03 12:28:07', '2020-11-03 12:28:07'),
    (724, 'en', 'All Sub Subcategories', 'All Sub Subcategories', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
    (725, 'en', 'Add New Sub Subcategory', 'Add New Sub Subcategory', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
    (726, 'en', 'Sub-Sub-categories', 'Sub-Sub-categories', '2020-11-03 12:29:12', '2020-11-03 12:29:12'),
    (727, 'en', 'Make This Default', 'Make This Default', '2020-11-04 08:24:24', '2020-11-04 08:24:24');
    INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
    (728, 'en', 'Shops', 'Shops', '2020-11-04 11:17:10', '2020-11-04 11:17:10'),
    (729, 'en', 'Women Clothing & Fashion', 'Women Clothing & Fashion', '2020-11-04 11:23:12', '2020-11-04 11:23:12'),
    (730, 'en', 'Cellphones & Tabs', 'Cellphones & Tabs', '2020-11-04 12:10:41', '2020-11-04 12:10:41'),
    (731, 'en', 'Welcome to', 'Welcome to', '2020-11-07 07:14:43', '2020-11-07 07:14:43'),
    (732, 'en', 'Create a New Account', 'Create a New Account', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (733, 'en', 'Full Name', 'Full Name', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (734, 'en', 'password', 'password', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (735, 'en', 'Confrim Password', 'Confrim Password', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (736, 'en', 'I agree with the', 'I agree with the', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (737, 'en', 'Terms and Conditions', 'Terms and Conditions', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (738, 'en', 'Register', 'Register', '2020-11-07 07:32:15', '2020-11-07 07:32:15'),
    (739, 'en', 'Already have an account', 'Already have an account', '2020-11-07 07:32:16', '2020-11-07 07:32:16'),
    (741, 'en', 'Sign Up with', 'Sign Up with', '2020-11-07 07:32:16', '2020-11-07 07:32:16'),
    (742, 'en', 'I agree with the Terms and Conditions', 'I agree with the Terms and Conditions', '2020-11-07 07:34:49', '2020-11-07 07:34:49'),
    (745, 'en', 'All Role', 'All Role', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
    (746, 'en', 'Add New Role', 'Add New Role', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
    (747, 'en', 'Roles', 'Roles', '2020-11-07 07:44:28', '2020-11-07 07:44:28'),
    (749, 'en', 'Add New Staffs', 'Add New Staffs', '2020-11-07 07:44:36', '2020-11-07 07:44:36'),
    (750, 'en', 'Role', 'Role', '2020-11-07 07:44:36', '2020-11-07 07:44:36'),
    (751, 'en', 'Frontend Website Name', 'Frontend Website Name', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (752, 'en', 'Website Name', 'Website Name', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (753, 'en', 'Site Motto', 'Site Motto', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (754, 'en', 'Best eCommerce Website', 'Best eCommerce Website', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (755, 'en', 'Site Icon', 'Site Icon', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (756, 'en', 'Website favicon. 32x32 .png', 'Website favicon. 32x32 .png', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (757, 'en', 'Website Base Color', 'Website Base Color', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (758, 'en', 'Hex Color Code', 'Hex Color Code', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (759, 'en', 'Website Base Hover Color', 'Website Base Hover Color', '2020-11-07 07:44:59', '2020-11-07 07:44:59'),
    (760, 'en', 'Update', 'Update', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
    (761, 'en', 'Global Seo', 'Global Seo', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
    (762, 'en', 'Meta description', 'Meta description', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
    (763, 'en', 'Keywords', 'Keywords', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
    (764, 'en', 'Separate with coma', 'Separate with coma', '2020-11-07 07:45:00', '2020-11-07 07:45:00'),
    (765, 'en', 'Website Pages', 'Website Pages', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
    (766, 'en', 'All Pages', 'All Pages', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
    (767, 'en', 'Add New Page', 'Add New Page', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
    (768, 'en', 'URL', 'URL', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
    (769, 'en', 'Actions', 'Actions', '2020-11-07 07:49:04', '2020-11-07 07:49:04'),
    (770, 'en', 'Edit Page Information', 'Edit Page Information', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (771, 'en', 'Page Content', 'Page Content', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (772, 'en', 'Title', 'Title', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (773, 'en', 'Link', 'Link', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (774, 'en', 'Use character, number, hypen only', 'Use character, number, hypen only', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (775, 'en', 'Add Content', 'Add Content', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (776, 'en', 'Seo Fields', 'Seo Fields', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (777, 'en', 'Update Page', 'Update Page', '2020-11-07 07:49:22', '2020-11-07 07:49:22'),
    (778, 'en', 'Default Language', 'Default Language', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
    (779, 'en', 'Add New Language', 'Add New Language', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
    (780, 'en', 'RTL', 'RTL', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
    (781, 'en', 'Translation', 'Translation', '2020-11-07 07:50:09', '2020-11-07 07:50:09'),
    (782, 'en', 'Language Information', 'Language Information', '2020-11-07 07:50:23', '2020-11-07 07:50:23'),
    (783, 'en', 'Save Page', 'Save Page', '2020-11-07 07:51:27', '2020-11-07 07:51:27'),
    (784, 'en', 'Home Page Settings', 'Home Page Settings', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (785, 'en', 'Home Slider', 'Home Slider', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (786, 'en', 'Photos & Links', 'Photos & Links', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (787, 'en', 'Add New', 'Add New', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (788, 'en', 'Home Categories', 'Home Categories', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (789, 'en', 'Home Banner 1 (Max 3)', 'Home Banner 1 (Max 3)', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (790, 'en', 'Banner & Links', 'Banner & Links', '2020-11-07 07:51:35', '2020-11-07 07:51:35'),
    (791, 'en', 'Home Banner 2 (Max 3)', 'Home Banner 2 (Max 3)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
    (792, 'en', 'Top 10', 'Top 10', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
    (793, 'en', 'Top Categories (Max 10)', 'Top Categories (Max 10)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
    (794, 'en', 'Top Brands (Max 10)', 'Top Brands (Max 10)', '2020-11-07 07:51:36', '2020-11-07 07:51:36'),
    (795, 'en', 'System Name', 'System Name', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
    (796, 'en', 'System Logo - White', 'System Logo - White', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
    (797, 'en', 'Choose Files', 'Choose Files', '2020-11-07 07:54:22', '2020-11-07 07:54:22'),
    (798, 'en', 'Will be used in admin panel side menu', 'Will be used in admin panel side menu', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
    (799, 'en', 'System Logo - Black', 'System Logo - Black', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
    (800, 'en', 'Will be used in admin panel topbar in mobile + Admin login page', 'Will be used in admin panel topbar in mobile + Admin login page', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
    (801, 'en', 'System Timezone', 'System Timezone', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
    (802, 'en', 'Admin login page background', 'Admin login page background', '2020-11-07 07:54:23', '2020-11-07 07:54:23'),
    (803, 'en', 'Website Header', 'Website Header', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
    (804, 'en', 'Header Setting', 'Header Setting', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
    (805, 'en', 'Header Logo', 'Header Logo', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
    (806, 'en', 'Show Language Switcher?', 'Show Language Switcher?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
    (807, 'en', 'Show Currency Switcher?', 'Show Currency Switcher?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
    (808, 'en', 'Enable stikcy header?', 'Enable stikcy header?', '2020-11-07 08:21:36', '2020-11-07 08:21:36'),
    (809, 'en', 'Website Footer', 'Website Footer', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (810, 'en', 'Footer Widget', 'Footer Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (811, 'en', 'About Widget', 'About Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (812, 'en', 'Footer Logo', 'Footer Logo', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (813, 'en', 'About description', 'About description', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (814, 'en', 'Contact Info Widget', 'Contact Info Widget', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (815, 'en', 'Footer contact address', 'Footer contact address', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (816, 'en', 'Footer contact phone', 'Footer contact phone', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (817, 'en', 'Footer contact email', 'Footer contact email', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (818, 'en', 'Link Widget One', 'Link Widget One', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (819, 'en', 'Links', 'Links', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (820, 'en', 'Footer Bottom', 'Footer Bottom', '2020-11-07 08:21:56', '2020-11-07 08:21:56'),
    (821, 'en', 'Copyright Widget ', 'Copyright Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
    (822, 'en', 'Copyright Text', 'Copyright Text', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
    (823, 'en', 'Social Link Widget ', 'Social Link Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
    (824, 'en', 'Show Social Links?', 'Show Social Links?', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
    (825, 'en', 'Social Links', 'Social Links', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
    (826, 'en', 'Payment Methods Widget ', 'Payment Methods Widget ', '2020-11-07 08:21:57', '2020-11-07 08:21:57'),
    (827, 'en', 'RTL status updated successfully', 'RTL status updated successfully', '2020-11-07 08:36:11', '2020-11-07 08:36:11'),
    (828, 'en', 'Language changed to ', 'Language changed to ', '2020-11-07 08:36:27', '2020-11-07 08:36:27'),
    (829, 'en', 'Inhouse Product sale report', 'Inhouse Product sale report', '2020-11-07 09:30:25', '2020-11-07 09:30:25'),
    (830, 'en', 'Sort by Category', 'Sort by Category', '2020-11-07 09:30:25', '2020-11-07 09:30:25'),
    (831, 'en', 'Product wise stock report', 'Product wise stock report', '2020-11-07 09:31:02', '2020-11-07 09:31:02'),
    (832, 'en', 'Currency changed to ', 'Currency changed to ', '2020-11-07 12:36:28', '2020-11-07 12:36:28'),
    (833, 'en', 'Avatar', 'Avatar', '2020-11-08 09:32:35', '2020-11-08 09:32:35'),
    (834, 'en', 'Copy', 'Copy', '2020-11-08 10:03:42', '2020-11-08 10:03:42'),
    (835, 'en', 'Variant', 'Variant', '2020-11-08 10:43:02', '2020-11-08 10:43:02'),
    (836, 'en', 'Variant Price', 'Variant Price', '2020-11-08 10:43:03', '2020-11-08 10:43:03'),
    (837, 'en', 'SKU', 'SKU', '2020-11-08 10:43:03', '2020-11-08 10:43:03'),
    (838, 'en', 'Key', 'Key', '2020-11-08 12:35:09', '2020-11-08 12:35:09'),
    (839, 'en', 'Value', 'Value', '2020-11-08 12:35:09', '2020-11-08 12:35:09'),
    (840, 'en', 'Copy Translations', 'Copy Translations', '2020-11-08 12:35:10', '2020-11-08 12:35:10'),
    (841, 'en', 'All Pick-up Points', 'All Pick-up Points', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
    (842, 'en', 'Add New Pick-up Point', 'Add New Pick-up Point', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
    (843, 'en', 'Manager', 'Manager', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
    (844, 'en', 'Location', 'Location', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
    (845, 'en', 'Pickup Station Contact', 'Pickup Station Contact', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
    (846, 'en', 'Open', 'Open', '2020-11-08 12:35:43', '2020-11-08 12:35:43'),
    (847, 'en', 'POS Activation for Seller', 'POS Activation for Seller', '2020-11-08 12:35:55', '2020-11-08 12:35:55'),
    (848, 'en', 'Order Completed Successfully.', 'Order Completed Successfully.', '2020-11-08 12:36:02', '2020-11-08 12:36:02'),
    (849, 'en', 'Text Input', 'Text Input', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
    (850, 'en', 'Select', 'Select', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
    (851, 'en', 'Multiple Select', 'Multiple Select', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
    (852, 'en', 'Radio', 'Radio', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
    (853, 'en', 'File', 'File', '2020-11-08 12:38:40', '2020-11-08 12:38:40'),
    (854, 'en', 'Email Address', 'Email Address', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
    (855, 'en', 'Verification Info', 'Verification Info', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
    (856, 'en', 'Approval', 'Approval', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
    (857, 'en', 'Due Amount', 'Due Amount', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
    (858, 'en', 'Show', 'Show', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
    (859, 'en', 'Pay Now', 'Pay Now', '2020-11-08 12:39:32', '2020-11-08 12:39:32'),
    (860, 'en', 'Affiliate User Verification', 'Affiliate User Verification', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
    (861, 'en', 'Reject', 'Reject', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
    (862, 'en', 'Accept', 'Accept', '2020-11-08 12:40:01', '2020-11-08 12:40:01'),
    (863, 'en', 'Beauty, Health & Hair', 'Beauty, Health & Hair', '2020-11-08 12:54:17', '2020-11-08 12:54:17'),
    (864, 'en', 'Comparison', 'Comparison', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
    (865, 'en', 'Reset Compare List', 'Reset Compare List', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
    (866, 'en', 'Your comparison list is empty', 'Your comparison list is empty', '2020-11-08 12:54:33', '2020-11-08 12:54:33'),
    (867, 'en', 'Convert Point To Wallet', 'Convert Point To Wallet', '2020-11-08 13:04:42', '2020-11-08 13:04:42'),
    (868, 'en', 'Note: You need to activate wallet option first before using club point addon.', 'Note: You need to activate wallet option first before using club point addon.', '2020-11-08 13:04:43', '2020-11-08 13:04:43'),
    (869, 'en', 'Create an account.', 'Create an account.', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (870, 'en', 'Use Email Instead', 'Use Email Instead', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (871, 'en', 'By signing up you agree to our terms and conditions.', 'By signing up you agree to our terms and conditions.', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (872, 'en', 'Create Account', 'Create Account', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (873, 'en', 'Or Join With', 'Or Join With', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (874, 'en', 'Already have an account?', 'Already have an account?', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (875, 'en', 'Log In', 'Log In', '2020-11-09 06:17:11', '2020-11-09 06:17:11'),
    (876, 'en', 'Computer & Accessories', 'Computer & Accessories', '2020-11-09 07:52:05', '2020-11-09 07:52:05'),
    (878, 'en', 'Product(s)', 'Product(s)', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
    (879, 'en', 'in your cart', 'in your cart', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
    (880, 'en', 'in your wishlist', 'in your wishlist', '2020-11-09 07:52:23', '2020-11-09 07:52:23'),
    (881, 'en', 'you ordered', 'you ordered', '2020-11-09 07:52:24', '2020-11-09 07:52:24'),
    (882, 'en', 'Default Shipping Address', 'Default Shipping Address', '2020-11-09 07:52:24', '2020-11-09 07:52:24'),
    (883, 'en', 'Sports & outdoor', 'Sports & outdoor', '2020-11-09 07:53:32', '2020-11-09 07:53:32'),
    (884, 'en', 'Copied', 'Copied', '2020-11-09 07:54:19', '2020-11-09 07:54:19'),
    (885, 'en', 'Copy the Promote Link', 'Copy the Promote Link', '2020-11-09 07:54:19', '2020-11-09 07:54:19'),
    (886, 'en', 'Write a review', 'Write a review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
    (887, 'en', 'Your name', 'Your name', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
    (888, 'en', 'Comment', 'Comment', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
    (889, 'en', 'Your review', 'Your review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
    (890, 'en', 'Submit review', 'Submit review', '2020-11-09 07:54:20', '2020-11-09 07:54:20'),
    (891, 'en', 'Claire Willis', 'Claire Willis', '2020-11-09 08:05:00', '2020-11-09 08:05:00'),
    (892, 'en', 'Germaine Greene', 'Germaine Greene', '2020-11-09 08:05:00', '2020-11-09 08:05:00'),
    (893, 'en', 'Product File', 'Product File', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
    (894, 'en', 'Choose file', 'Choose file', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
    (895, 'en', 'Type to add a tag', 'Type to add a tag', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
    (896, 'en', 'Images', 'Images', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
    (897, 'en', 'Main Images', 'Main Images', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
    (898, 'en', 'Meta Tags', 'Meta Tags', '2020-11-09 08:07:08', '2020-11-09 08:07:08'),
    (899, 'en', 'Digital Product has been inserted successfully', 'Digital Product has been inserted successfully', '2020-11-09 08:14:25', '2020-11-09 08:14:25'),
    (900, 'en', 'Edit Digital Product', 'Edit Digital Product', '2020-11-09 08:14:34', '2020-11-09 08:14:34'),
    (901, 'en', 'Select an option', 'Select an option', '2020-11-09 08:14:34', '2020-11-09 08:14:34'),
    (902, 'en', 'tax', 'tax', '2020-11-09 08:14:35', '2020-11-09 08:14:35'),
    (903, 'en', 'Any question about this product?', 'Any question about this product?', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
    (904, 'en', 'Sign in', 'Sign in', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
    (905, 'en', 'Login with Google', 'Login with Google', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
    (906, 'en', 'Login with Facebook', 'Login with Facebook', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
    (907, 'en', 'Login with Twitter', 'Login with Twitter', '2020-11-09 08:15:11', '2020-11-09 08:15:11'),
    (908, 'en', 'Click to show phone number', 'Click to show phone number', '2020-11-09 08:15:51', '2020-11-09 08:15:51'),
    (909, 'en', 'Other Ads of', 'Other Ads of', '2020-11-09 08:15:52', '2020-11-09 08:15:52'),
    (910, 'en', 'Store Home', 'Store Home', '2020-11-09 08:54:23', '2020-11-09 08:54:23'),
    (911, 'en', 'Top Selling', 'Top Selling', '2020-11-09 08:54:23', '2020-11-09 08:54:23'),
    (912, 'en', 'Shop Settings', 'Shop Settings', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
    (913, 'en', 'Visit Shop', 'Visit Shop', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
    (914, 'en', 'Pickup Points', 'Pickup Points', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
    (915, 'en', 'Select Pickup Point', 'Select Pickup Point', '2020-11-09 08:55:38', '2020-11-09 08:55:38'),
    (916, 'en', 'Slider Settings', 'Slider Settings', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
    (917, 'en', 'Social Media Link', 'Social Media Link', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
    (918, 'en', 'Facebook', 'Facebook', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
    (919, 'en', 'Twitter', 'Twitter', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
    (920, 'en', 'Google', 'Google', '2020-11-09 08:55:39', '2020-11-09 08:55:39'),
    (921, 'en', 'New Arrival Products', 'New Arrival Products', '2020-11-09 08:56:26', '2020-11-09 08:56:26'),
    (922, 'en', 'Check Your Order Status', 'Check Your Order Status', '2020-11-09 09:23:32', '2020-11-09 09:23:32'),
    (923, 'en', 'Shipping method', 'Shipping method', '2020-11-09 09:27:40', '2020-11-09 09:27:40'),
    (924, 'en', 'Shipped By', 'Shipped By', '2020-11-09 09:27:41', '2020-11-09 09:27:41'),
    (925, 'en', 'Image', 'Image', '2020-11-09 09:29:37', '2020-11-09 09:29:37'),
    (926, 'en', 'Sub Sub Category', 'Sub Sub Category', '2020-11-09 09:29:37', '2020-11-09 09:29:37'),
    (927, 'en', 'Inhouse Products', 'Inhouse Products', '2020-11-09 10:22:32', '2020-11-09 10:22:32'),
    (928, 'en', 'Forgot Password?', 'Forgot Password?', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
    (929, 'en', 'Enter your email address to recover your password.', 'Enter your email address to recover your password.', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
    (930, 'en', 'Email or Phone', 'Email or Phone', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
    (931, 'en', 'Send Password Reset Link', 'Send Password Reset Link', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
    (932, 'en', 'Back to Login', 'Back to Login', '2020-11-09 10:33:21', '2020-11-09 10:33:21'),
    (933, 'en', 'index', 'index', '2020-11-09 10:35:29', '2020-11-09 10:35:29'),
    (934, 'en', 'Download Your Product', 'Download Your Product', '2020-11-09 10:35:30', '2020-11-09 10:35:30'),
    (935, 'en', 'Option', 'Option', '2020-11-09 10:35:30', '2020-11-09 10:35:30'),
    (936, 'en', 'Applied Refund Request', 'Applied Refund Request', '2020-11-09 10:35:39', '2020-11-09 10:35:39'),
    (937, 'en', 'Item has been renoved from wishlist', 'Item has been renoved from wishlist', '2020-11-09 10:36:04', '2020-11-09 10:36:04'),
    (938, 'en', 'Bulk Products Upload', 'Bulk Products Upload', '2020-11-09 10:39:24', '2020-11-09 10:39:24'),
    (939, 'en', 'Upload CSV', 'Upload CSV', '2020-11-09 10:39:25', '2020-11-09 10:39:25'),
    (940, 'en', 'Create a Ticket', 'Create a Ticket', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
    (941, 'en', 'Tickets', 'Tickets', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
    (942, 'en', 'Ticket ID', 'Ticket ID', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
    (943, 'en', 'Sending Date', 'Sending Date', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
    (944, 'en', 'Subject', 'Subject', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
    (945, 'en', 'View Details', 'View Details', '2020-11-09 10:40:25', '2020-11-09 10:40:25'),
    (946, 'en', 'Provide a detailed description', 'Provide a detailed description', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
    (947, 'en', 'Type your reply', 'Type your reply', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
    (948, 'en', 'Send Ticket', 'Send Ticket', '2020-11-09 10:40:26', '2020-11-09 10:40:26'),
    (949, 'en', 'Load More', 'Load More', '2020-11-09 10:40:57', '2020-11-09 10:40:57'),
    (950, 'en', 'Jewelry & Watches', 'Jewelry & Watches', '2020-11-09 10:47:38', '2020-11-09 10:47:38'),
    (951, 'en', 'Filters', 'Filters', '2020-11-09 10:53:54', '2020-11-09 10:53:54'),
    (952, 'en', 'Contact address', 'Contact address', '2020-11-09 10:58:46', '2020-11-09 10:58:46'),
    (953, 'en', 'Contact phone', 'Contact phone', '2020-11-09 10:58:47', '2020-11-09 10:58:47'),
    (954, 'en', 'Contact email', 'Contact email', '2020-11-09 10:58:47', '2020-11-09 10:58:47'),
    (955, 'en', 'Filter by', 'Filter by', '2020-11-09 11:00:03', '2020-11-09 11:00:03'),
    (956, 'en', 'Condition', 'Condition', '2020-11-09 11:56:13', '2020-11-09 11:56:13'),
    (957, 'en', 'All Type', 'All Type', '2020-11-09 11:56:13', '2020-11-09 11:56:13'),
    (960, 'en', 'Pay with wallet', 'Pay with wallet', '2020-11-09 12:56:34', '2020-11-09 12:56:34'),
    (961, 'en', 'Select variation', 'Select variation', '2020-11-10 07:54:29', '2020-11-10 07:54:29'),
    (962, 'en', 'No Product Added', 'No Product Added', '2020-11-10 08:07:53', '2020-11-10 08:07:53'),
    (963, 'en', 'Status has been updated successfully', 'Status has been updated successfully', '2020-11-10 08:41:23', '2020-11-10 08:41:23'),
    (964, 'en', 'All Seller Packages', 'All Seller Packages', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
    (965, 'en', 'Add New Package', 'Add New Package', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
    (966, 'en', 'Package Logo', 'Package Logo', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
    (967, 'en', 'days', 'days', '2020-11-10 09:14:10', '2020-11-10 09:14:10'),
    (968, 'en', 'Create New Seller Package', 'Create New Seller Package', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
    (969, 'en', 'Package Name', 'Package Name', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
    (970, 'en', 'Duration', 'Duration', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
    (971, 'en', 'Validity in number of days', 'Validity in number of days', '2020-11-10 09:14:31', '2020-11-10 09:14:31'),
    (972, 'en', 'Update Package Information', 'Update Package Information', '2020-11-10 09:14:59', '2020-11-10 09:14:59'),
    (973, 'en', 'Package has been inserted successfully', 'Package has been inserted successfully', '2020-11-10 09:15:14', '2020-11-10 09:15:14'),
    (974, 'en', 'Refund Request', 'Refund Request', '2020-11-10 09:17:25', '2020-11-10 09:17:25'),
    (975, 'en', 'Reason', 'Reason', '2020-11-10 09:17:25', '2020-11-10 09:17:25'),
    (976, 'en', 'Label', 'Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
    (977, 'en', 'Select Label', 'Select Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
    (978, 'en', 'Multiple Select Label', 'Multiple Select Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
    (979, 'en', 'Radio Label', 'Radio Label', '2020-11-10 09:20:13', '2020-11-10 09:20:13'),
    (980, 'en', 'Pickup Point Orders', 'Pickup Point Orders', '2020-11-10 09:25:40', '2020-11-10 09:25:40'),
    (981, 'en', 'View', 'View', '2020-11-10 09:25:40', '2020-11-10 09:25:40'),
    (982, 'en', 'Order #', 'Order #', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
    (983, 'en', 'Order Status', 'Order Status', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
    (984, 'en', 'Total amount', 'Total amount', '2020-11-10 09:25:48', '2020-11-10 09:25:48'),
    (986, 'en', 'TOTAL', 'TOTAL', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
    (987, 'en', 'Delivery status has been updated', 'Delivery status has been updated', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
    (988, 'en', 'Payment status has been updated', 'Payment status has been updated', '2020-11-10 09:25:49', '2020-11-10 09:25:49'),
    (989, 'en', 'INVOICE', 'INVOICE', '2020-11-10 09:25:58', '2020-11-10 09:25:58'),
    (990, 'en', 'Set Refund Time', 'Set Refund Time', '2020-11-10 09:34:04', '2020-11-10 09:34:04'),
    (991, 'en', 'Set Time for sending Refund Request', 'Set Time for sending Refund Request', '2020-11-10 09:34:04', '2020-11-10 09:34:04'),
    (992, 'en', 'Set Refund Sticker', 'Set Refund Sticker', '2020-11-10 09:34:05', '2020-11-10 09:34:05'),
    (993, 'en', 'Sticker', 'Sticker', '2020-11-10 09:34:05', '2020-11-10 09:34:05'),
    (994, 'en', 'Refund Request All', 'Refund Request All', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
    (995, 'en', 'Order Id', 'Order Id', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
    (996, 'en', 'Seller Approval', 'Seller Approval', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
    (997, 'en', 'Admin Approval', 'Admin Approval', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
    (998, 'en', 'Refund Status', 'Refund Status', '2020-11-10 09:34:12', '2020-11-10 09:34:12'),
    (1000, 'en', 'No Refund', 'No Refund', '2020-11-10 09:35:27', '2020-11-10 09:35:27'),
    (1001, 'en', 'Status updated successfully', 'Status updated successfully', '2020-11-10 09:54:20', '2020-11-10 09:54:20'),
    (1002, 'en', 'User Search Report', 'User Search Report', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
    (1003, 'en', 'Search By', 'Search By', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
    (1004, 'en', 'Number searches', 'Number searches', '2020-11-11 06:43:24', '2020-11-11 06:43:24'),
    (1005, 'en', 'Sender', 'Sender', '2020-11-11 06:51:49', '2020-11-11 06:51:49'),
    (1006, 'en', 'Receiver', 'Receiver', '2020-11-11 06:51:49', '2020-11-11 06:51:49'),
    (1007, 'en', 'Verification form updated successfully', 'Verification form updated successfully', '2020-11-11 06:53:29', '2020-11-11 06:53:29'),
    (1008, 'en', 'Invalid email or password', 'Invalid email or password', '2020-11-11 07:07:49', '2020-11-11 07:07:49'),
    (1009, 'en', 'All Coupons', 'All Coupons', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
    (1010, 'en', 'Add New Coupon', 'Add New Coupon', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
    (1011, 'en', 'Coupon Information', 'Coupon Information', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
    (1012, 'en', 'Start Date', 'Start Date', '2020-11-11 07:14:04', '2020-11-11 07:14:04'),
    (1013, 'en', 'End Date', 'End Date', '2020-11-11 07:14:05', '2020-11-11 07:14:05'),
    (1014, 'en', 'Product Base', 'Product Base', '2020-11-11 07:14:05', '2020-11-11 07:14:05'),
    (1015, 'en', 'Send Newsletter', 'Send Newsletter', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
    (1016, 'en', 'Mobile Users', 'Mobile Users', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
    (1017, 'en', 'SMS subject', 'SMS subject', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
    (1018, 'en', 'SMS content', 'SMS content', '2020-11-11 07:14:10', '2020-11-11 07:14:10'),
    (1019, 'en', 'All Flash Delas', 'All Flash Delas', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
    (1020, 'en', 'Create New Flash Dela', 'Create New Flash Dela', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
    (1022, 'en', 'Page Link', 'Page Link', '2020-11-11 07:16:06', '2020-11-11 07:16:06'),
    (1023, 'en', 'Flash Deal Information', 'Flash Deal Information', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
    (1024, 'en', 'Background Color', 'Background Color', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
    (1025, 'en', '#0000ff', '#0000ff', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
    (1026, 'en', 'Text Color', 'Text Color', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
    (1027, 'en', 'White', 'White', '2020-11-11 07:16:14', '2020-11-11 07:16:14'),
    (1028, 'en', 'Dark', 'Dark', '2020-11-11 07:16:15', '2020-11-11 07:16:15'),
    (1029, 'en', 'Choose Products', 'Choose Products', '2020-11-11 07:16:15', '2020-11-11 07:16:15'),
    (1030, 'en', 'Discounts', 'Discounts', '2020-11-11 07:16:20', '2020-11-11 07:16:20'),
    (1031, 'en', 'Discount Type', 'Discount Type', '2020-11-11 07:16:20', '2020-11-11 07:16:20'),
    (1032, 'en', 'Twillo Credential', 'Twillo Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1033, 'en', 'TWILIO SID', 'TWILIO SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1034, 'en', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1035, 'en', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1036, 'en', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1037, 'en', 'Nexmo Credential', 'Nexmo Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1038, 'en', 'NEXMO KEY', 'NEXMO KEY', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1039, 'en', 'NEXMO SECRET', 'NEXMO SECRET', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1040, 'en', 'SSL Wireless Credential', 'SSL Wireless Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1041, 'en', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1042, 'en', 'SSL SMS SID', 'SSL SMS SID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1043, 'en', 'SSL SMS URL', 'SSL SMS URL', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1044, 'en', 'Fast2SMS Credential', 'Fast2SMS Credential', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1045, 'en', 'AUTH KEY', 'AUTH KEY', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1046, 'en', 'ROUTE', 'ROUTE', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1047, 'en', 'Promotional Use', 'Promotional Use', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1048, 'en', 'Transactional Use', 'Transactional Use', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1050, 'en', 'SENDER ID', 'SENDER ID', '2020-11-11 07:17:35', '2020-11-11 07:17:35'),
    (1051, 'en', 'Nexmo OTP', 'Nexmo OTP', '2020-11-11 07:17:42', '2020-11-11 07:17:42'),
    (1052, 'en', 'Twillo OTP', 'Twillo OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
    (1053, 'en', 'SSL Wireless OTP', 'SSL Wireless OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
    (1054, 'en', 'Fast2SMS OTP', 'Fast2SMS OTP', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
    (1055, 'en', 'Order Placement', 'Order Placement', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
    (1056, 'en', 'Delivery Status Changing Time', 'Delivery Status Changing Time', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
    (1057, 'en', 'Paid Status Changing Time', 'Paid Status Changing Time', '2020-11-11 07:17:43', '2020-11-11 07:17:43'),
    (1058, 'en', 'Send Bulk SMS', 'Send Bulk SMS', '2020-11-11 07:19:14', '2020-11-11 07:19:14'),
    (1059, 'en', 'All Subscribers', 'All Subscribers', '2020-11-11 07:21:51', '2020-11-11 07:21:51'),
    (1060, 'en', 'Coupon Information Adding', 'Coupon Information Adding', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
    (1061, 'en', 'Coupon Type', 'Coupon Type', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
    (1062, 'en', 'For Products', 'For Products', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
    (1063, 'en', 'For Total Orders', 'For Total Orders', '2020-11-11 07:22:25', '2020-11-11 07:22:25'),
    (1064, 'en', 'Add Your Product Base Coupon', 'Add Your Product Base Coupon', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
    (1065, 'en', 'Coupon code', 'Coupon code', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
    (1066, 'en', 'Sub Category', 'Sub Category', '2020-11-11 07:22:42', '2020-11-11 07:22:42'),
    (1067, 'en', 'Add More', 'Add More', '2020-11-11 07:22:43', '2020-11-11 07:22:43'),
    (1068, 'en', 'Add Your Cart Base Coupon', 'Add Your Cart Base Coupon', '2020-11-11 07:29:40', '2020-11-11 07:29:40'),
    (1069, 'en', 'Minimum Shopping', 'Minimum Shopping', '2020-11-11 07:29:40', '2020-11-11 07:29:40'),
    (1070, 'en', 'Maximum Discount Amount', 'Maximum Discount Amount', '2020-11-11 07:29:41', '2020-11-11 07:29:41'),
    (1071, 'en', 'Coupon Information Update', 'Coupon Information Update', '2020-11-11 08:18:34', '2020-11-11 08:18:34'),
    (1073, 'en', 'Please Configure SMTP Setting to work all email sending funtionality', 'Please Configure SMTP Setting to work all email sending funtionality', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1074, 'en', 'Configure Now', 'Configure Now', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1076, 'en', 'Total published products', 'Total published products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1077, 'en', 'Total sellers products', 'Total sellers products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1078, 'en', 'Total admin products', 'Total admin products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1079, 'en', 'Manage Products', 'Manage Products', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1080, 'en', 'Total product category', 'Total product category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1081, 'en', 'Create Category', 'Create Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1082, 'en', 'Total product sub sub category', 'Total product sub sub category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1083, 'en', 'Create Sub Sub Category', 'Create Sub Sub Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1084, 'en', 'Total product sub category', 'Total product sub category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1085, 'en', 'Create Sub Category', 'Create Sub Category', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1086, 'en', 'Total product brand', 'Total product brand', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1087, 'en', 'Create Brand', 'Create Brand', '2020-11-11 13:10:18', '2020-11-11 13:10:18'),
    (1089, 'en', 'Total sellers', 'Total sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1091, 'en', 'Total approved sellers', 'Total approved sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1093, 'en', 'Total pending sellers', 'Total pending sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1094, 'en', 'Manage Sellers', 'Manage Sellers', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1095, 'en', 'Category wise product sale', 'Category wise product sale', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1097, 'en', 'Sale', 'Sale', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1098, 'en', 'Category wise product stock', 'Category wise product stock', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1099, 'en', 'Category Name', 'Category Name', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1100, 'en', 'Stock', 'Stock', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1101, 'en', 'Frontend', 'Frontend', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1103, 'en', 'Home page', 'Home page', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1104, 'en', 'setting', 'setting', '2020-11-11 13:10:19', '2020-11-11 13:10:19'),
    (1106, 'en', 'Policy page', 'Policy page', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1107, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1109, 'en', 'General', 'General', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1110, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1111, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1112, 'en', 'Useful link', 'Useful link', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1113, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1114, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1115, 'en', 'Activation', 'Activation', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1116, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1117, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1118, 'en', 'SMTP', 'SMTP', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1119, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1120, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1121, 'en', 'Payment method', 'Payment method', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1122, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1123, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1124, 'en', 'Social media', 'Social media', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1125, 'en', 'setting', 'setting', '2020-11-11 13:10:20', '2020-11-11 13:10:20'),
    (1126, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1127, 'en', 'Business', 'Business', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1128, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1130, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1131, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1132, 'en', 'Seller verification', 'Seller verification', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1133, 'en', 'form setting', 'form setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1134, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1135, 'en', 'Language', 'Language', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1136, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1137, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1139, 'en', 'setting', 'setting', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1140, 'en', 'Click Here', 'Click Here', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1141, 'en', 'Dashboard', 'Dashboard', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1142, 'en', 'POS System', 'POS System', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1143, 'en', 'POS Manager', 'POS Manager', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1144, 'en', 'POS Configuration', 'POS Configuration', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1145, 'en', 'Products', 'Products', '2020-11-11 13:10:21', '2020-11-11 13:10:21'),
    (1146, 'en', 'Add New product', 'Add New product', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1147, 'en', 'All Products', 'All Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1148, 'en', 'In House Products', 'In House Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1149, 'en', 'Seller Products', 'Seller Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1150, 'en', 'Digital Products', 'Digital Products', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1151, 'en', 'Bulk Import', 'Bulk Import', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1152, 'en', 'Bulk Export', 'Bulk Export', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1153, 'en', 'Category', 'Category', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1154, 'en', 'Subcategory', 'Subcategory', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1155, 'en', 'Sub Subcategory', 'Sub Subcategory', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1156, 'en', 'Brand', 'Brand', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1157, 'en', 'Attribute', 'Attribute', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1158, 'en', 'Product Reviews', 'Product Reviews', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1159, 'en', 'Sales', 'Sales', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1160, 'en', 'All Orders', 'All Orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1161, 'en', 'Inhouse orders', 'Inhouse orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1162, 'en', 'Seller Orders', 'Seller Orders', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1163, 'en', 'Pick-up Point Order', 'Pick-up Point Order', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1164, 'en', 'Refunds', 'Refunds', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1165, 'en', 'Refund Requests', 'Refund Requests', '2020-11-11 13:10:22', '2020-11-11 13:10:22'),
    (1166, 'en', 'Approved Refund', 'Approved Refund', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1167, 'en', 'Refund Configuration', 'Refund Configuration', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1168, 'en', 'Customers', 'Customers', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1169, 'en', 'Customer list', 'Customer list', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1170, 'en', 'Classified Products', 'Classified Products', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1171, 'en', 'Classified Packages', 'Classified Packages', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1172, 'en', 'Sellers', 'Sellers', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1173, 'en', 'All Seller', 'All Seller', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1174, 'en', 'Payouts', 'Payouts', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1175, 'en', 'Payout Requests', 'Payout Requests', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1176, 'en', 'Seller Commission', 'Seller Commission', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1177, 'en', 'Seller Packages', 'Seller Packages', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1178, 'en', 'Seller Verification Form', 'Seller Verification Form', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1179, 'en', 'Reports', 'Reports', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1180, 'en', 'In House Product Sale', 'In House Product Sale', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1181, 'en', 'Seller Products Sale', 'Seller Products Sale', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1182, 'en', 'Products Stock', 'Products Stock', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1183, 'en', 'Products wishlist', 'Products wishlist', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1184, 'en', 'User Searches', 'User Searches', '2020-11-11 13:10:23', '2020-11-11 13:10:23'),
    (1185, 'en', 'Marketing', 'Marketing', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1186, 'en', 'Flash deals', 'Flash deals', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1187, 'en', 'Newsletters', 'Newsletters', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1188, 'en', 'Bulk SMS', 'Bulk SMS', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1189, 'en', 'Subscribers', 'Subscribers', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1190, 'en', 'Coupon', 'Coupon', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1191, 'en', 'Support', 'Support', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1192, 'en', 'Ticket', 'Ticket', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1193, 'en', 'Product Queries', 'Product Queries', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1194, 'en', 'Website Setup', 'Website Setup', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1195, 'en', 'Header', 'Header', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1196, 'en', 'Footer', 'Footer', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1197, 'en', 'Pages', 'Pages', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1198, 'en', 'Appearance', 'Appearance', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1199, 'en', 'Setup & Configurations', 'Setup & Configurations', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1200, 'en', 'General Settings', 'General Settings', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1201, 'en', 'Features activation', 'Features activation', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1202, 'en', 'Languages', 'Languages', '2020-11-11 13:10:24', '2020-11-11 13:10:24'),
    (1203, 'en', 'Currency', 'Currency', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1204, 'en', 'Pickup point', 'Pickup point', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1205, 'en', 'SMTP Settings', 'SMTP Settings', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1206, 'en', 'Payment Methods', 'Payment Methods', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1207, 'en', 'File System Configuration', 'File System Configuration', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1208, 'en', 'Social media Logins', 'Social media Logins', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1209, 'en', 'Analytics Tools', 'Analytics Tools', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1210, 'en', 'Facebook Chat', 'Facebook Chat', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1211, 'en', 'Google reCAPTCHA', 'Google reCAPTCHA', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1212, 'en', 'Shipping Configuration', 'Shipping Configuration', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1213, 'en', 'Shipping Countries', 'Shipping Countries', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1214, 'en', 'Affiliate System', 'Affiliate System', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1215, 'en', 'Affiliate Registration Form', 'Affiliate Registration Form', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1216, 'en', 'Affiliate Configurations', 'Affiliate Configurations', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1217, 'en', 'Affiliate Users', 'Affiliate Users', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1218, 'en', 'Referral Users', 'Referral Users', '2020-11-11 13:10:25', '2020-11-11 13:10:25'),
    (1219, 'en', 'Affiliate Withdraw Requests', 'Affiliate Withdraw Requests', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1220, 'en', 'Offline Payment System', 'Offline Payment System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1221, 'en', 'Manual Payment Methods', 'Manual Payment Methods', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1222, 'en', 'Offline Wallet Recharge', 'Offline Wallet Recharge', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1223, 'en', 'Offline Customer Package Payments', 'Offline Customer Package Payments', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1224, 'en', 'Offline Seller Package Payments', 'Offline Seller Package Payments', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1225, 'en', 'Paytm Payment Gateway', 'Paytm Payment Gateway', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1226, 'en', 'Set Paytm Credentials', 'Set Paytm Credentials', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1227, 'en', 'Club Point System', 'Club Point System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1228, 'en', 'Club Point Configurations', 'Club Point Configurations', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1229, 'en', 'Set Product Point', 'Set Product Point', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1230, 'en', 'User Points', 'User Points', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1231, 'en', 'OTP System', 'OTP System', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1232, 'en', 'OTP Configurations', 'OTP Configurations', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1233, 'en', 'Set OTP Credentials', 'Set OTP Credentials', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1234, 'en', 'Staffs', 'Staffs', '2020-11-11 13:10:26', '2020-11-11 13:10:26'),
    (1235, 'en', 'All staffs', 'All staffs', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1236, 'en', 'Staff permissions', 'Staff permissions', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1237, 'en', 'Addon Manager', 'Addon Manager', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1238, 'en', 'Browse Website', 'Browse Website', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1239, 'en', 'POS', 'POS', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1240, 'en', 'Notifications', 'Notifications', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1241, 'en', 'new orders', 'new orders', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1242, 'en', 'user-image', 'user-image', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1243, 'en', 'Profile', 'Profile', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1244, 'en', 'Logout', 'Logout', '2020-11-11 13:10:27', '2020-11-11 13:10:27'),
    (1247, 'en', 'Page Not Found!', 'Page Not Found!', '2020-11-11 13:10:28', '2020-11-11 13:10:28'),
    (1249, 'en', 'The page you are looking for has not been found on our server.', 'The page you are looking for has not been found on our server.', '2020-11-11 13:10:28', '2020-11-11 13:10:28'),
    (1253, 'en', 'Registration', 'Registration', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1255, 'en', 'I am shopping for...', 'I am shopping for...', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1257, 'en', 'Compare', 'Compare', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1259, 'en', 'Wishlist', 'Wishlist', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1261, 'en', 'Cart', 'Cart', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1263, 'en', 'Your Cart is empty', 'Your Cart is empty', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1265, 'en', 'Categories', 'Categories', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1267, 'en', 'See All', 'See All', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1269, 'en', 'Seller Policy', 'Seller Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1271, 'en', 'Return Policy', 'Return Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1273, 'en', 'Support Policy', 'Support Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1275, 'en', 'Privacy Policy', 'Privacy Policy', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1277, 'en', 'Your Email Address', 'Your Email Address', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1279, 'en', 'Subscribe', 'Subscribe', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1281, 'en', 'Contact Info', 'Contact Info', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1283, 'en', 'Address', 'Address', '2020-11-11 13:10:29', '2020-11-11 13:10:29'),
    (1285, 'en', 'Phone', 'Phone', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1287, 'en', 'Email', 'Email', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1288, 'en', 'Login', 'Login', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1289, 'en', 'My Account', 'My Account', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1291, 'en', 'Login', 'Login', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1293, 'en', 'Order History', 'Order History', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1295, 'en', 'My Wishlist', 'My Wishlist', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1297, 'en', 'Track Order', 'Track Order', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1299, 'en', 'Be an affiliate partner', 'Be an affiliate partner', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1301, 'en', 'Be a Seller', 'Be a Seller', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1303, 'en', 'Apply Now', 'Apply Now', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1305, 'en', 'Confirmation', 'Confirmation', '2020-11-11 13:10:30', '2020-11-11 13:10:30');
    INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
    (1307, 'en', 'Delete confirmation message', 'Delete confirmation message', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1309, 'en', 'Cancel', 'Cancel', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1312, 'en', 'Delete', 'Delete', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1313, 'en', 'Item has been added to compare list', 'Item has been added to compare list', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1314, 'en', 'Please login first', 'Please login first', '2020-11-11 13:10:30', '2020-11-11 13:10:30'),
    (1315, 'en', 'Total Earnings From', 'Total Earnings From', '2020-11-12 08:01:11', '2020-11-12 08:01:11'),
    (1316, 'en', 'Client Subscription', 'Client Subscription', '2020-11-12 08:01:12', '2020-11-12 08:01:12'),
    (1317, 'en', 'Product category', 'Product category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
    (1318, 'en', 'Product sub sub category', 'Product sub sub category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
    (1319, 'en', 'Product sub category', 'Product sub category', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
    (1320, 'en', 'Product brand', 'Product brand', '2020-11-12 08:03:46', '2020-11-12 08:03:46'),
    (1321, 'en', 'Top Client Packages', 'Top Client Packages', '2020-11-12 08:05:21', '2020-11-12 08:05:21'),
    (1322, 'en', 'Top Freelancer Packages', 'Top Freelancer Packages', '2020-11-12 08:05:21', '2020-11-12 08:05:21'),
    (1323, 'en', 'Number of sale', 'Number of sale', '2020-11-12 09:13:09', '2020-11-12 09:13:09'),
    (1324, 'en', 'Number of Stock', 'Number of Stock', '2020-11-12 09:16:02', '2020-11-12 09:16:02'),
    (1325, 'en', 'Top 10 Products', 'Top 10 Products', '2020-11-12 10:02:29', '2020-11-12 10:02:29'),
    (1326, 'en', 'Top 12 Products', 'Top 12 Products', '2020-11-12 10:02:39', '2020-11-12 10:02:39'),
    (1327, 'en', 'Admin can not be a seller', 'Admin can not be a seller', '2020-11-12 11:30:19', '2020-11-12 11:30:19'),
    (1328, 'en', 'Filter by Rating', 'Filter by Rating', '2020-11-15 08:01:15', '2020-11-15 08:01:15'),
    (1329, 'en', 'Published reviews updated successfully', 'Published reviews updated successfully', '2020-11-15 08:01:15', '2020-11-15 08:01:15'),
    (1330, 'en', 'Refund Sticker has been updated successfully', 'Refund Sticker has been updated successfully', '2020-11-15 08:17:12', '2020-11-15 08:17:12'),
    (1331, 'en', 'Edit Product', 'Edit Product', '2020-11-15 10:31:54', '2020-11-15 10:31:54'),
    (1332, 'en', 'Meta Images', 'Meta Images', '2020-11-15 10:32:12', '2020-11-15 10:32:12'),
    (1333, 'en', 'Update Product', 'Update Product', '2020-11-15 10:32:12', '2020-11-15 10:32:12'),
    (1334, 'en', 'Product has been deleted successfully', 'Product has been deleted successfully', '2020-11-15 10:32:57', '2020-11-15 10:32:57'),
    (1335, 'en', 'Your Profile has been updated successfully!', 'Your Profile has been updated successfully!', '2020-11-15 11:10:42', '2020-11-15 11:10:42'),
    (1336, 'en', 'Upload limit has been reached. Please upgrade your package.', 'Upload limit has been reached. Please upgrade your package.', '2020-11-15 11:13:45', '2020-11-15 11:13:45'),
    (1337, 'en', 'Add Your Product', 'Add Your Product', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1338, 'en', 'Select a category', 'Select a category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1339, 'en', 'Select a brand', 'Select a brand', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1340, 'en', 'Product Unit', 'Product Unit', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1341, 'en', 'Minimum Qty.', 'Minimum Qty.', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1342, 'en', 'Product Tag', 'Product Tag', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1343, 'en', 'Type & hit enter', 'Type & hit enter', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1344, 'en', 'Videos', 'Videos', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1345, 'en', 'Video From', 'Video From', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1346, 'en', 'Video URL', 'Video URL', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1347, 'en', 'Customer Choice', 'Customer Choice', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1348, 'en', 'PDF', 'PDF', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1349, 'en', 'Choose PDF', 'Choose PDF', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1350, 'en', 'Select Category', 'Select Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1351, 'en', 'Target Category', 'Target Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1352, 'en', 'subsubcategory', 'subsubcategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1353, 'en', 'Search Category', 'Search Category', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1354, 'en', 'Search SubCategory', 'Search SubCategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1355, 'en', 'Search SubSubCategory', 'Search SubSubCategory', '2020-11-15 11:17:56', '2020-11-15 11:17:56'),
    (1356, 'en', 'Update your product', 'Update your product', '2020-11-15 11:39:14', '2020-11-15 11:39:14'),
    (1357, 'en', 'Product has been updated successfully', 'Product has been updated successfully', '2020-11-15 11:51:36', '2020-11-15 11:51:36'),
    (1358, 'en', 'Add Your Digital Product', 'Add Your Digital Product', '2020-11-15 12:24:21', '2020-11-15 12:24:21'),
    (1359, 'en', 'Active eCommerce CMS Update Process', 'Active eCommerce CMS Update Process', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1360, 'en', 'You will need to know the following items before\r\n        proceeding', 'You will need to know the following items before\r\n        proceeding', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1361, 'en', 'Codecanyon purchase code', 'Codecanyon purchase code', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1362, 'en', 'Database Name', 'Database Name', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1363, 'en', 'Database Username', 'Database Username', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1364, 'en', 'Database Password', 'Database Password', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1365, 'en', 'Database Hostname', 'Database Hostname', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1366, 'en', 'Update Now', 'Update Now', '2020-11-16 07:53:31', '2020-11-16 07:53:31'),
    (1367, 'en', 'You will need to know the following items before\r\n                            proceeding', 'You will need to know the following items before\r\n                            proceeding', '2020-11-16 07:54:20', '2020-11-16 07:54:20'),
    (1368, 'en', 'Congratulations', 'Congratulations', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
    (1369, 'en', 'You have successfully completed the updating process. Please Login to continue', 'You have successfully completed the updating process. Please Login to continue', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
    (1370, 'en', 'Go to Home', 'Go to Home', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
    (1371, 'en', 'Login to Admin panel', 'Login to Admin panel', '2020-11-16 07:55:14', '2020-11-16 07:55:14'),
    (1372, 'en', 'S3 File System Credentials', 'S3 File System Credentials', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1373, 'en', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1374, 'en', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1375, 'en', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1376, 'en', 'AWS_BUCKET', 'AWS_BUCKET', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1377, 'en', 'AWS_URL', 'AWS_URL', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1378, 'en', 'S3 File System Activation', 'S3 File System Activation', '2020-11-16 12:59:57', '2020-11-16 12:59:57'),
    (1379, 'en', 'Your phone number', 'Your phone number', '2020-11-17 05:50:10', '2020-11-17 05:50:10'),
    (1380, 'en', 'Zip File', 'Zip File', '2020-11-17 06:58:45', '2020-11-17 06:58:45'),
    (1381, 'en', 'Install', 'Install', '2020-11-17 06:58:45', '2020-11-17 06:58:45'),
    (1382, 'en', 'This version is not capable of installing Addons, Please update.', 'This version is not capable of installing Addons, Please update.', '2020-11-17 06:59:11', '2020-11-17 06:59:11');


    --
    -- Indexes for table `translations`
    --
    ALTER TABLE `translations`
      ADD PRIMARY KEY (`id`);

    --
    -- AUTO_INCREMENT for dumped tables
    --

    --
    -- AUTO_INCREMENT for table `translations`
    --
    ALTER TABLE `translations`
      MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


    ALTER TABLE `wallets` CHANGE `payment_method` `payment_method` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

    UPDATE `business_settings` SET `value` = '3.6' WHERE `business_settings`.`type` = 'current_version';

COMMIT;
