# IBM-Db2-SQL

A sample/tutorial project to demonstrate the use of **IBM Db2** on Linux with SQL: creation of tables, relationships, and database schema scripts.

---

## Table of Contents
- [Overview](#overview)
- [Contents](#contents)
- [Prerequisites](#prerequisites)
- [Setup & Installation](#setup--installation)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
This repository contains DDL scripts and ER (Entity-Relationship) diagrams to design, create, and manage a sample database using IBM Db2. It includes:

- Table definitions  
- Relationships between tables  
- Transport and loading scripts  
- Visual schema representations  

The purpose is educational: to help students, beginners, or anyone interested in learning how to model a relational database schema using Db2 and verify integrity via SQL DDL.

---

## Contents

| File/Folder       | Description |
|-------------------|-------------|
| `script_t01.ddl`  | SQL DDL script to create the primary tables and constraints. |
| `transport.ddl`   | Script related to transport entities (business-domain specific). |
| `ER.png`          | Entity-Relationship diagram showing tables and their relationships. |
| `ERDesc.pdf`      | Documentation/description of the ER diagram. |
| `relation.pdf`    | Alternate schema/relationship diagram. |

---

## Prerequisites
Make sure you have the following installed:

- IBM Db2 (Linux/Unix/Windows version)  
- Db2 command line tools or compatible SQL client  
- Basic knowledge of SQL and relational database concepts  

---

## Setup & Installation

1. Create a database in Db2 (if not already created):
   ```bash
   db2 create database mydatabase
2. Connect to the database: 
   ```bash
   db2 connect to mydatabase 
3. Run the DDL scripts:
   ```bash
   db2 -tnf transport.ddl
