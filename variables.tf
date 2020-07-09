variable "location" {
  default = "australiaeast"
}

variable "prefix" {
  default = "cse"
}

variable "tags" {
  default     = { Environment = "Dev" }
}
variable vm_win_count{
  default = 1
}
variable vm_lnx_count{
  default = 0
}
variable vm_admin_password {
  default = "P@$$w0rd1234!"
}
variable vm_admin_username {
  default = "adminuser"
}
variable vm_lnx_size {
  default = "Standard_DS1_v2"
}
variable vm_win_size {
  default = "Standard_D4s_v3"
}
