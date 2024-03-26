# SonarQube Installation Script for Ubuntu Server on AWS

This repository contains a set of Bash scripts designed to facilitate the installation of SonarQube on a newly provisioned Ubuntu server instance on Amazon Web Services (AWS). This setup is ideal for users who want to quickly deploy SonarQube for code analysis and quality monitoring purposes.

## Requirements

-   **Minimum EC2 Instance Type:** The installation requires a minimum of t2 or t3 large instance type on AWS to ensure optimal performance.
-   **PostgreSQL Database Configuration:** The script sets up a PostgreSQL database for SonarQube with the database name set to "sonarqube" and both the username and password set to "sonar". Users can modify these credentials as needed.

### Installation Steps

1.  **Clone the Repository:** Clone this repository into your Ubuntu server instance.
    
2.  **Run the Installation Scripts:** The installation is divided into two parts due to the requirement of restarting the server after configuring Elasticsearch.
    
    -   **Part 1: sonarqube-install-one.sh** This script sets up the server environment, updates packages, and configures Elasticsearch. After running this script, the user needs to manually restart the server.
        
    -   **Part 2: sonarqube-install-two.sh** This script continues the installation process by setting up PostgreSQL, installing Java 17, downloading, and configuring SonarQube.
        
3.  **Access SonarQube:** Once the installation is complete, SonarQube can be accessed via the web browser using the URL: `http://your_server_ip:9000`.
    

### Usage

1.  Ensure that you have an Ubuntu server instance provisioned on AWS.
2.  Connect to your Ubuntu server instance via SSH.
3.  Clone this repository or download the individual scripts onto your server.
    
	    git clone https://github.com/chriscloudaz/sonarqube-installation-script/
    
4.  Run each script in sequence:

	    sudo bash sonarqube-install-one.sh
   
	   After the server restarts:

		sudo bash sonarqube-install-two.sh

5. Access SonarQube via the provided URL.

#### Note

-   It's recommended to review and customize the scripts according to your specific requirements before running them.
-   For security reasons, ensure that appropriate firewall rules and security groups are configured to allow access to SonarQube only from trusted sources.

Feel free to raise issues or contribute to enhance this installation script further!
