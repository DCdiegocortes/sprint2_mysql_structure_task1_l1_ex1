
# MySQL Structure – Optical Store "Bottle Bottom"

## 📌 Description  

This project consists of the design of a relational database for an optical store.  
The work focused on defining entities, attributes, and relationships to manage suppliers, customers, products (glasses), and sales.

The database uses **Primary Keys (PK)** to uniquely identify each entity and **Foreign Keys (FK)** to establish relationships between them.  
Different types of relationships were implemented:
Different types of relationships were implemented:

- One-to-many:
  - Supplier → Eyeglasses  
  - Client → Sales  
  - Employee → Sales  

- Many-to-many:
  - Sales ↔ Eyeglasses  
  (resolved using an intermediate table `sale_eyeglasses`, which stores quantity)

- Self-referencing:
  - Client → Client (Referal system)

The design follows normalization principles to ensure data consistency and avoid redundancy.

## 🛠 Technologies  
- MySQL  
- MySQL Workbench
- XAMPP
- MAMP
  
## 📂 Project Structure
- `BottleBottomOpticsSchema.png` >> Database model schema 
- `BottleBottomOpticsScript.sql` >> SQL script  
- `README.md` >> Documentation  

## 📸 Demo  
Open the `.mwb` file in MySQL Workbench to visualize the schema.

## 🚀 Installation  
1. Clone the repository  
   git clone https://github.com/your-username/mysql-estructura-optica.git

## 📚 References

- MySQL Workbench Official Site  
  https://www.mysql.com/products/workbench/  

- MySQL Documentation  
  https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/  

- ER Diagram Tutorial (Guru99)  
  https://www.guru99.com/er-diagram-tutorial-dbms.html  

- YouTube Tutorials  
  https://www.youtube.com/watch?v=7S_tz1z_5bA  
  https://www.youtube.com/watch?v=w-0IWyAeZ3M  

- MySQL Data Types Guide  
  https://disenowebakus.net/tipos-de-datos-mysql.php  
