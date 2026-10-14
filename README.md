# 🛋️ Furniture - E-Commerce Platform

A complete, modern e-commerce solution customized and maintained by **IT Nayeem**.

- **Designed & Maintained By:** [IT Nayeem](https://itnayeem.com.bd/)
- **Website:** [https://itnayeem.com.bd/](https://itnayeem.com.bd/)
- **Support Email:** [support@itnayeem.com.bd](mailto:support@itnayeem.com.bd)
- **Contact Phone:** [+8801511777744](tel:+8801511777744)

---

## 📋 System Requirements

- **PHP:** 7.4.x - 8.x (with PDO, OpenSSL, Mbstring, Tokenizer, XML, Ctype, JSON, Fileinfo extensions)
- **Database:** MySQL 5.7+ / MariaDB 10.3+
- **Web Server:** Built-in PHP server, Apache, or Nginx

---

## 🚀 Quick Setup & Installation

### 1. Clone the Repository
```bash
git clone git@github.com:itnayeem/furniture-itnayeem.git
cd furniture-itnayeem
```

### 2. Database Setup & Import
Create a new database in MySQL / MariaDB:
```sql
CREATE DATABASE itnayeem_ecommerce2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Import the database dump included in the root directory:
```bash
mysql -u root -p itnayeem_ecommerce2 < itnayeem_ecommerce2.sql
```

### 3. Environment Configuration
The `.env` configuration file is already pre-configured in `project/.env` and `project/vendor/markury/src/.env`.
If needed, adjust your database credentials in `project/.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=itnayeem_ecommerce2
DB_USERNAME=root
DB_PASSWORD=root
```

### 4. Run the Development Server
From the root directory of the project, run:
```bash
php -d display_errors=0 -S 0.0.0.0:8002 server.php
```

Visit the website at: **[http://127.0.0.1:8002/](http://127.0.0.1:8002/)**

---

## 🔐 Admin Panel Access

- **Admin Login URL:** [http://127.0.0.1:8002/admin/login](http://127.0.0.1:8002/admin/login)
- **Admin Dashboard:** [http://127.0.0.1:8002/admin](http://127.0.0.1:8002/admin)
- **Admin Email:** `support@itnayeem.com.bd`
- **Admin Password:** `12345678`
- **Admin Phone:** `+8801511777744`

---

## 📄 Footer Copyright & Credit

```html
© 2026 Furniture. All rights reserved. | Website Designed by: IT Nayeem (https://itnayeem.com.bd/)
```

---

## 🛠️ Tech Stack & Key Modules

- **Framework:** Laravel 7 (PHP 8.x compatible)
- **Frontend:** Bootstrap, Blade Templating, jQuery, OwlCarousel
- **Payment Gateways:** Stripe, PayPal, Razorpay, Mollie, Authorize.net, 2Checkout, MercadoPago, Instamojo, Cash on Delivery
- **License System:** IT Nayeem Verified (`license.txt`)
