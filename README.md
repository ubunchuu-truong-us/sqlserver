# Ubunchuu Trường Ú - SQL Server

> :bulb: Cringe cực độ vì Microsoft không thiết kế SQL Management Studio cho Linux? Không sao vì đã có image `sqlserver`!

## :question: Dành cho ai
Dành cho những bạn không dùng Windows và muốn học SQL-Server, Repo này sẽ giúp các bạn sử dụng Image `sqlserver` trên **Docker** và host thông qua `localhost`. Từ đó, mọi người có thể connect trực tiếp thông qua SQL-Client như Azure Data Studio hay DBeaver.

## :feet: Step


1. Cài đặt docker và docker-compose, init sudo cho docker.

> Install Docker, Docker Compose: [Link](https://support.netfoundry.io/hc/en-us/articles/360057865692-Installing-Docker-and-docker-compose-for-Ubuntu-20-04)  
Install DBeaver: [Link](https://dbeaver.io/download/)  
Install Azure Data Studio: [Link](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16&tabs=redhat-install%2Credhat-uninstall)

2. Ctrl + Alt + T để mở Terminal lên và thực hiện:

```bash
git clone https://github.com/thangbuiq/sqlserver_docker.git
```
```bash
cd ./sqlserver_docker
```
```bash
make build
```
```bash
make up
```
Các bạn có thể thay đổi thông tin của mình trong file `docker-compose.yaml`:
- Username: không có khoảng cách, ký tự đặc biệt (Default: SA/sa)
- Password: 8 ký tự trở lên, có chữ hoa, số và ký tự đặc biệt. (Default: Ubunchuu@2022)
- Volume: thay đổi thông tin volume cần mount vào để chứa Database.
