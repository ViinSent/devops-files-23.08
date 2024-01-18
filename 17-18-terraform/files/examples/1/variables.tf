variable "mysql_port" {
    default = 3306
}
variable "wp_svc_port" {} #8080
variable "wp_container_port" {}  #80
variable "mysql_image" {} #mysql:8.0
variable "wp_image" {
    default = "wordpress"
}

variable "mysql_wp_db_password" {} #examplepass
variable "mysql_wp_db_name" {} #exampledb
variable "mysql_wp_db_user" {} #exampleuser
variable "env" {
    default = "dev"
}
variable "app_name" {
    default = "wordpress"
}