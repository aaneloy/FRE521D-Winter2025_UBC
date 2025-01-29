# FRE521D: SQL Server Setup Guide for Windows and Mac Users

This guide provides step-by-step instructions for installing **Azure Data Studio** and configuring **Microsoft SQL Server** on both **Windows and macOS**.

---

## 📥 Part 1: Install Azure Data Studio
Azure Data Studio is a **lightweight SQL management tool** that works on **Windows, macOS, and Linux**.

### 1️⃣ Download Azure Data Studio
- Official download link: [Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio)
- Select your operating system:
  - **Windows**: Download the `.zip` or `.exe` version.
  - **macOS**: Download the `.zip` version.

### 2️⃣ Install Azure Data Studio
#### **Windows Users**
1. **Extract the ZIP file** (if downloaded as `.zip`).
2. Open the extracted folder and **double-click `azuredatastudio.exe`** to launch the application.
3. (Optional) Create a desktop shortcut for easy access.

#### **Mac Users**
1. **Extract the ZIP file** (double-click to unzip).
2. Move `Azure Data Studio.app` to the **Applications folder**.
3. Open **Azure Data Studio** from **Launchpad** or **Finder**.

---

## 🖥️ Part 2: Configure SQL Server for Windows Users
Windows users will use **Microsoft SQL Server + SQL Server Management Studio (SSMS)**.

### 1️⃣ Install Microsoft SQL Server
1. Download **SQL Server Express** (free version) from:  
   👉 [SQL Server Downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
2. Choose **SQL Server Express** and install it.
3. During installation:
   - **Installation Type**: "Basic"
   - **Authentication Mode**: Mixed Mode (SQL + Windows Authentication)
   - Set a **strong password** for the `sa` user.

### 2️⃣ Install SQL Server Management Studio (SSMS)
1. Download SSMS from:  
   👉 [SSMS Download](https://aka.ms/ssmsfullsetup)
2. Install SSMS by following the setup instructions.

### 3️⃣ Enable Remote Connections (If Needed)
1. Open **SQL Server Configuration Manager**.
2. Go to **SQL Server Network Configuration** → **Protocols for SQLEXPRESS**.
3. Enable **TCP/IP** and restart the SQL Server service.

### 4️⃣ Connect Azure Data Studio to SQL Server
1. Open **Azure Data Studio**.
2. Click **New Connection**.
3. Enter the details:
   - **Server**: `localhost\SQLEXPRESS`
   - **Authentication**: SQL Login
   - **Username**: `sa`
   - **Password**: Your SQL Server password.
4. Click **Connect**.

✅ **Windows users are now ready to use SQL Server with Azure Data Studio!**

---

## 🍏 Part 3: Configure SQL Server for Mac Users
Since SQL Server does **not** run natively on macOS, Mac users need to install **Docker**.

### 1️⃣ Install Docker on macOS
1. Download **Docker Desktop** from:  
   👉 [Docker for Mac](https://www.docker.com/products/docker-desktop/)
2. Install and start Docker.
3. Verify installation:
   ```bash
   docker --version
   ```

### 2️⃣ Install SQL Server on Docker
1. Pull the SQL Server Docker image:
   ```bash
   docker pull mcr.microsoft.com/mssql/server:latest
   ```
2. Start the SQL Server container:
   ```bash
   docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=YourStrong!Passw0rd' -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server:latest
   ```
   - Replace `YourStrong!Passw0rd` with a **strong password**.

3. Verify the container is running:
   ```bash
   docker ps
   ```
   - You should see `mssql/server` running.

### 3️⃣ Connect Azure Data Studio to SQL Server on Mac
1. Open **Azure Data Studio**.
2. Click **New Connection**.
3. Enter the details:
   - **Server**: `localhost,1433`
   - **Authentication**: SQL Login
   - **Username**: `sa`
   - **Password**: The password you set in Docker.
4. Click **Connect**.

✅ **Mac users are now ready to use SQL Server with Azure Data Studio!**

---

## ⚠️ Common Issues & Fixes
| Issue | Fix |
|-----------------|------------------------------------------------|
| **Cannot connect to SQL Server on Mac** | Ensure Docker is running and SQL Server is started with `docker ps`. |
| **Wrong password for SQL Server** | Restart the container and reset the `sa` password. |
| **Azure Data Studio connection fails** | Ensure the correct server (`localhost,1433`) and SQL Authentication is used. |
| **Windows users can’t connect remotely** | Enable TCP/IP in SQL Server Configuration Manager. |

---

## 🔥 Final Notes
- **Windows users** use **SQL Server Express + SSMS + Azure Data Studio**.
- **Mac users** use **Docker + Azure Data Studio**.
- **Use `localhost,1433` for Mac** and **`localhost\SQLEXPRESS` for Windows**.
