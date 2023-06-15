// metro vlan
resource "equinix_metal_vlan" "this" {
  metro      = var.metro
  project_id = var.project_id
  vxlan      = var.vxlan
}

// device network type
resource "equinix_metal_device_network_type" "this" {
  device_id = equinix_metal_device.this.id
  type      = "hybrid"
}

// attach vlan to the device
resource "equinix_metal_port_vlan_attachment" "this" {
  device_id = equinix_metal_device_network_type.this.id
  port_name = "bond0"
  vlan_vnid = equinix_metal_vlan.this.vxlan
}

// create the device
resource "equinix_metal_device" "this" {
  hostname         = random_pet.this.id
  plan             = var.plan
  metro            = var.metro
  operating_system = var.os
  billing_cycle    = "hourly"
  project_id       = var.project_id
  //project_ssh_key_ids = [equinix_network_ssh_key.this.name]
  user_data = templatefile("${path.module}/bootstrap/boot.sh", {
    vxlan      = var.vxlan,
    vxlan_net  = var.vxlan_net,
    vxlan_mask = var.vxlan_mask,
  })
}

// connection - virtual circuit
data "equinix_metal_connection" "this" {
  connection_id = var.connection_id
}

resource "equinix_metal_virtual_circuit" "this" {
  connection_id = data.equinix_metal_connection.this.id
  project_id    = var.project_id
  port_id       = data.equinix_metal_connection.this.ports[0].id
  vlan_id       = equinix_metal_vlan.this.id
  nni_vlan      = var.vxlan
  name          = random_pet.this.id
}
